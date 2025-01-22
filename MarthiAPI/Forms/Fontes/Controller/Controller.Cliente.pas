unit Controller.Cliente;

interface

uses Horse, System.JSON, System.SysUtils, Model.Cliente,
     FireDAC.Comp.Client, Data.DB, DataSet.Serialize;

procedure Registry;

implementation

procedure ListarClientes(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    cli : TCliente;
    qry : TFDQuery;
    erro : string;
    arrayClientes : TJSONArray;
begin
    try
        cli := TCliente.Create;
    except
        res.Send('Erro ao conectar com o banco').Status(500);
        exit;
    end;

    try
        qry := cli.ListarCliente('', erro);

        arrayClientes := qry.ToJSONArray();

        res.Send<TJSONArray>(arrayClientes);

    finally
        qry.Free;
        cli.Free;
    end;
end;

procedure ListarClienteID(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    cli : TCliente;
    objClientes: TJSONObject;
    qry : TFDQuery;
    erro : string;
begin
    try
        cli := TCliente.Create;
        cli.ID_CLIENTE := Req.Params['id'].ToInteger;
    except
        res.Send('Erro ao conectar com o banco').Status(500);
        exit;
    end;

    try
        qry := cli.ListarCliente('', erro);

        if qry.RecordCount > 0 then
        begin
            objClientes := qry.ToJSONObject;
            res.Send<TJSONObject>(objClientes)
        end
        else
            res.Send('Cliente não encontrado').Status(404);
    finally
        qry.Free;
        cli.Free;
    end;
end;

procedure AddCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    cli : TCliente;
    objCliente: TJSONObject;
    erro : string;
    body  : TJsonValue;
begin
    // Conexao com o banco...
    try
        cli := TCliente.Create;
    except
        res.Send('Erro ao conectar com o banco').Status(500);
        exit;
    end;


    try
        try
            body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(req.Body), 0) as TJsonValue;

            cli.NOME := body.GetValue<string>('nome', '');
            cli.EMAIL := body.GetValue<string>('email', '');
            cli.FONE := body.GetValue<string>('fone', '');
            cli.Inserir(erro);

            body.Free;

            if erro <> '' then
                raise Exception.Create(erro);

        except on ex:exception do
            begin
                res.Send(ex.Message).Status(400);
                exit;
            end;
        end;


        objCliente := TJSONObject.Create;
        objCliente.AddPair('id_cliente', cli.ID_CLIENTE.ToString);

        res.Send<TJSONObject>(objCliente).Status(201);
    finally
        cli.Free;
    end;
end;

procedure DeleteCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    cli : TCliente;
    objCliente: TJSONObject;
    erro : string;
begin
    // Conexao com o banco...
    try
        cli := TCliente.Create;
    except
        res.Send('Erro ao conectar com o banco').Status(500);
        exit;
    end;

    try
        try
            cli.ID_CLIENTE := Req.Params['id'].ToInteger;

            if NOT cli.Excluir(erro) then
                raise Exception.Create(erro);

        except on ex:exception do
            begin
                res.Send(ex.Message).Status(400);
                exit;
            end;
        end;


        objCliente := TJSONObject.Create;
        objCliente.AddPair('id_cliente', cli.ID_CLIENTE.ToString);

        res.Send<TJSONObject>(objCliente);
    finally
        cli.Free;
    end;
end;

procedure EditarCliente(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
    cli : TCliente;
    objCliente: TJSONObject;
    erro : string;
    body : TJsonValue;
begin
    // Conexao com o banco...
    try
        cli := TCliente.Create;
    except
        res.Send('Erro ao conectar com o banco').Status(500);
        exit;
    end;

    try
        try
            body := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(req.Body), 0) as TJsonValue;

            cli.ID_CLIENTE := body.GetValue<integer>('id_cliente', 0);
            cli.NOME := body.GetValue<string>('nome', '');
            cli.EMAIL := body.GetValue<string>('email', '');
            cli.FONE := body.GetValue<string>('fone', '');
            cli.Editar(erro);

            body.Free;

            if erro <> '' then
                raise Exception.Create(erro);

        except on ex:exception do
            begin
                res.Send(ex.Message).Status(400);
                exit;
            end;
        end;


        objCliente := TJSONObject.Create;
        objCliente.AddPair('id_cliente', cli.ID_CLIENTE.ToString);

        res.Send<TJSONObject>(objCliente).Status(200);
    finally
        cli.Free;
    end;
end;

procedure Registry;
begin
    THorse.Get('/cliente', ListarClientes);
    THorse.Get('/cliente/:id', ListarClienteID);
    THorse.Post('/cliente', AddCliente);
    THorse.Put('/cliente', EditarCliente);
    THorse.Delete('/cliente/:id', DeleteCliente);
end;

end.
