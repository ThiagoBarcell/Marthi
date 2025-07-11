unit frmModeloProdutos;

interface

uses FireDAC.Comp.Client,
     Data.DB,
     System.SysUtils,
     frmModeloConnection, untFuncoes;

type
  TProdutos = class
    private
      FPRODUTO_ID : Integer;
      FPRODUTO_MARCA : Integer;
      FPRODUTO_DESC : string;
      FPRODUTO_PROCESSAMENTO : string;
      FPRODUTO_MEM_RAM: string;
      FPRODUTO_CAM_PRINC: string;
      FPRODUTO_CAM_FRONT: string;
      FPRODUTO_OBS: string;
      FPRODUTO_DAT_CAD: TDate;
      FPRODUTO_DAT_ALT: TDate;
      FPRODUTO_STATUS: Integer;
      FPRODUTO_REFERENCIA: string;
    FPRODUTO_ITEM_ID: Integer;
    FPRODUTO_TP_PRECO: Integer;
    FPRODUTO_VAL_UNIT: Double;
    public

      constructor Create;
      destructor Destroy; override;

      property PRODUTO_ID: Integer read FPRODUTO_ID write FPRODUTO_ID;
      property PRODUTO_MARCA: Integer read FPRODUTO_MARCA write FPRODUTO_MARCA;
      property PRODUTO_DESC: string read FPRODUTO_DESC write FPRODUTO_DESC;
      property PRODUTO_PROCESSAMENTO: string read FPRODUTO_PROCESSAMENTO write FPRODUTO_PROCESSAMENTO;
      property PRODUTO_MEM_RAM: string read FPRODUTO_MEM_RAM write FPRODUTO_MEM_RAM;
      property PRODUTO_CAM_PRINC: string read FPRODUTO_CAM_PRINC write FPRODUTO_CAM_PRINC;
      property PRODUTO_CAM_FRONT: string read FPRODUTO_CAM_FRONT write FPRODUTO_CAM_FRONT;
      property PRODUTO_OBS: string read FPRODUTO_OBS write FPRODUTO_OBS;
      property PRODUTO_DAT_CAD: TDate read FPRODUTO_DAT_CAD write FPRODUTO_DAT_CAD;
      property PRODUTO_DAT_ALT: TDate read FPRODUTO_DAT_ALT write FPRODUTO_DAT_ALT;
      property PRODUTO_STATUS: Integer read FPRODUTO_STATUS write FPRODUTO_STATUS;
      property PRODUTO_REFERENCIA: string read FPRODUTO_REFERENCIA write FPRODUTO_REFERENCIA;
      property PRODUTO_ITEM_ID: Integer read FPRODUTO_ITEM_ID write FPRODUTO_ITEM_ID;
      property PRODUTO_TP_PRECO: Integer read FPRODUTO_TP_PRECO write FPRODUTO_TP_PRECO;
      property PRODUTO_VAL_UNIT: Double read FPRODUTO_VAL_UNIT write FPRODUTO_VAL_UNIT;

      procedure AtualizarPrecoParcela(out pErro : boolean; pCellId, pItemID, pParcela, pTPPreco : Integer;
  pValUnit : Double);

      function ListarProduto( out erro: string ) : TFDQuery;
      function ListarImagemProduto(out erro: string; IDProduto : Integer): TFDQuery;
      function ListarITemProduto(out erro: string; IDProduto : Integer): TFDQuery;
    end;


implementation

{ TProdutos }

procedure TProdutos.AtualizarPrecoParcela(out pErro : boolean; pCellId, pItemID, pParcela, pTPPreco : Integer;
  pValUnit : Double);
var
  lFuncoes : TFuncoesUteis;
begin
  try
    //Atualiza os dados cadastrais do produto
    lFuncoes.AtualizaPrecoItem(
      frmModeloConnection.FConnection,
      pCellId,
      pItemID,
      pValUnit,
      lFuncoes.CalculaParcela( frmModeloConnection.FConnection, pParcela, pValUnit ));

    //Cria as parcelas de pre�o do produto
    lFuncoes.CriaParcelas( frmModeloConnection.FConnection, pCellId, pItemID, pTPPreco, pValUnit );
    pErro := True;
  except on ex:exception do
    begin
      pErro := False;// + ex.Message;
    end;
  end;
end;

constructor TProdutos.Create;
begin
  frmModeloConnection.Connect;
end;

destructor TProdutos.Destroy;
begin
  frmModeloConnection.Disconect;
  inherited;
end;

function TProdutos.ListarProduto(out erro: string): TFDQuery;
var
  lQryProdutos : TFDQuery;
begin
  try
    lQryProdutos := TFDQuery.Create(nil);
    lQryProdutos.Connection := frmModeloConnection.FConnection;

    lQryProdutos.Close;
    lQryProdutos.SQL.Clear;
    //Retorna apenas os celulares ativos
    lQryProdutos.SQL.Add('SELECT * FROM CAD_CELL WHERE CELL_STATUS = 1 ORDER BY CELL_ID');
    lQryProdutos.Open;

    erro := '';
    Result := lQryProdutos;
  except on ex:exception do
    begin
      erro := 'Erro ao consultar os produtos: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

function TProdutos.ListarITemProduto(out erro: string;
  IDProduto: Integer): TFDQuery;
var
  lQryItemProduto : TFDQuery;
begin
  try
    lQryItemProduto := TFDQuery.Create(nil);
    lQryItemProduto.Connection := frmModeloConnection.FConnection;

    lQryItemProduto.Close;
    lQryItemProduto.SQL.Clear;
    //Retorna apenas os celulares ativos
    lQryItemProduto.SQL.Add(' SELECT ' +
      ' CELL_ITENS.ITEM_ID, ' +
      ' CAD_CELL.CELL_DESC, ' +
      ' CELL_ITENS.CELL_ID, ' +
      ' CELL_ITENS.ARMAZENAMENTO_ID, ' +
      ' CELL_ARMAZENAMENTO.ARMAZENAMENTO_DESC, ' +
      ' CELL_ITENS.COR_ID, ' +
      ' CELL_CORES.COR_DESC, ' +
      ' CELL_ITENS.CODICAO_ID, ' +
      ' CELL_CONDICOES.CONDICAO_DESC, ' +
      ' CELL_ITENS.CELL_VAL_UNIT, ' +
      ' CELL_ITENS.CELL_VAL_PARC, ' +
      ' CELL_ITENS.CELL_PARCELAS, ' +
      ' CELL_ITENS.TP_PRECO_ID, ' +
      ' CELL_TP_PRECOS.TP_PRECO_DESC ' +
      ' FROM CELL_ITENS ' +
      ' LEFT OUTER JOIN CAD_CELL ' +
      '  ON CAD_CELL.CELL_ID = CELL_ITENS.CELL_ID ' +
      ' LEFT OUTER JOIN CELL_ARMAZENAMENTO ' +
      '  ON CELL_ARMAZENAMENTO.ARMAZENAMENTO_ID = CELL_ITENS.ARMAZENAMENTO_ID ' +
      ' LEFT OUTER JOIN CELL_TP_PRECOS ' +
      '  ON CELL_TP_PRECOS.TP_PRECO_ID = CELL_ITENS.TP_PRECO_ID ' +
      ' LEFT OUTER JOIN CELL_CONDICOES ' +
      '  ON CELL_CONDICOES.CONDICAO_ID = CELL_ITENS.CODICAO_ID ' +
      ' LEFT OUTER JOIN CELL_CORES ' +
      '  ON CELL_CORES.COR_ID = CELL_ITENS.COR_ID ' +
      ' WHERE CELL_ITENS.CELL_ID = ' + IntToStr( IDProduto ) +
      ' ORDER BY CELL_ID' );
    lQryItemProduto.Open;
    erro := '';
    Result := lQryItemProduto;
  except on ex:exception do
    begin
      erro := 'Erro ao consultar os itens produtos: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

function TProdutos.ListarImagemProduto(out erro: string; IDProduto : Integer): TFDQuery;
var
  lQryImagemProdutos : TFDQuery;
begin
  try
    lQryImagemProdutos := TFDQuery.Create(nil);
    lQryImagemProdutos.Connection := frmModeloConnection.FConnection;

    lQryImagemProdutos.Close;
    lQryImagemProdutos.SQL.Clear;
    //Retorna apenas os celulares ativos
    lQryImagemProdutos.SQL.Add('SELECT FIRST 1 * FROM CELL_IMAGES WHERE CELL_ID = ' + IntToStr( IDProduto ) );
    lQryImagemProdutos.Open;
    erro := '';
    Result := lQryImagemProdutos;
  except on ex:exception do
    begin
      erro := 'Erro ao consultar a imagem produtos: ' + ex.Message;
      Result := nil;
    end;
  end;
end;

end.
