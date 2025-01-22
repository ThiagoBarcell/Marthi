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

procedure Registry;
begin
    THorse.Get('/produtos', ListarProdutos);
end;

end.
