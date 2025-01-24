unit frmController;

interface

uses Horse,
     System.JSON,
     System.SysUtils,
     FireDAC.Comp.Client,
     Data.DB,
     DataSet.Serialize,
     frmModeloProdutos;

procedure Registry;

implementation

procedure ListarProdutos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  lproduto : TProdutos;
  lQryRetorno : TFDQuery;
  erro : string;
  arrayProdutos : TJSONArray;
begin
  try
    lproduto := TProdutos.Create;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    lQryRetorno := lproduto.ListarProduto(erro);

    arrayProdutos := lQryRetorno.ToJSONArray();

    res.Send<TJSONArray>(arrayProdutos);

  finally
    lQryRetorno.Free;
    lproduto.Free;
  end;
end;

procedure ListarItensProdutos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  lItemproduto : TProdutos;
  lQryRetorno : TFDQuery;
  erro : string;
  arrayItemProdutos : TJSONArray;
begin
  try
    lItemproduto := TProdutos.Create;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    lQryRetorno := lItemproduto.ListarImagemProduto(erro, Req.Params.Field('IDProd').AsInteger );

    arrayImagemProdutos := lQryRetorno.ToJSONArray();

    res.Send<TJSONArray>(arrayImagemProdutos);

  finally
    lQryRetorno.Free;
    lImagemproduto.Free;
  end;
end;

procedure ListarImagensProdutos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  lImagemproduto : TProdutos;
  lQryRetorno : TFDQuery;
  erro : string;
  arrayImagemProdutos : TJSONArray;
begin
  try
    lImagemproduto := TProdutos.Create;
  except
    res.Send('Erro ao conectar com o banco').Status(500);
    exit;
  end;

  try
    lQryRetorno := lImagemproduto.ListarImagemProduto(erro, Req.Params.Field('IDProd').AsInteger );

    arrayImagemProdutos := lQryRetorno.ToJSONArray();

    res.Send<TJSONArray>(arrayImagemProdutos);

  finally
    lQryRetorno.Free;
    lImagemproduto.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/produtos', ListarProdutos);
  THorse.Get('/produtos/itens/:IDProd', ListarItensProdutos);
  THorse.Get('/produtos/imagens/:IDProd', ListarImagensProdutos)
end;

end.
