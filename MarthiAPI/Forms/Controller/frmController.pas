unit frmController;

interface

uses Horse,
     System.JSON,
     System.SysUtils,
     FireDAC.Comp.Client,
     Data.DB,
     DataSet.Serialize,
     frmModeloProdutos,
     MarthiConstantes;

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
    lQryRetorno := lItemproduto.ListarITemProduto(erro, Req.Params.Field('IDProd').AsInteger );

    arrayItemProdutos := lQryRetorno.ToJSONArray();

    res.Send<TJSONArray>(arrayItemProdutos);

  finally
    lQryRetorno.Free;
    lItemproduto.Free

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

procedure AtualizarPrecoParcela(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  lJsonBody: TJSONObject;
  lProduto : TProdutos;
  lErro : Boolean;
begin
  try
    try
      lProduto := TProdutos.Create;
    except
      res.Send('Erro ao conectar com o banco').Status(500);
      exit;
    end;
    lJsonBody := Req.Body<TJSONObject>;

    //frmGeralDM.qryCellItensCELL_VAL_PARC.AsFloat := Funcoes.CalculaParcela( frmGeralDM.ConectMarthi, DisplayValue, frmGeralDM.qryCellItensCELL_VAL_UNIT.AsFloat );

    lProduto.AtualizarPrecoParcela( lErro, //Extrai os dados do JSon
      LJsonBody.GetValue<Integer>('cell_id'),
      LJsonBody.GetValue<Integer>('item_id'),
      LJsonBody.GetValue<Integer>('item_parcela'),
      LJsonBody.GetValue<Integer>('tp_preco'),
      LJsonBody.GetValue<Double>('val_unit') );
    if lErro then
      res.Send(ITEM_SUCESSO_ATUALIZACAO).Status(201)
    else
      res.Send(ITEM_ERRO_ATUALIZACAO).Status(403)

  finally
    lProduto.Free;
  end;

end;

procedure Registry;
begin
  THorse.Get('/produtos', ListarProdutos);
  THorse.Get('/produtos/itens/:IDProd', ListarItensProdutos);
  THorse.Get('/produtos/imagens/:IDProd', ListarImagensProdutos);
  THorse.Post('/produtos/atualizapreco', AtualizarPrecoParcela);
end;

end.
