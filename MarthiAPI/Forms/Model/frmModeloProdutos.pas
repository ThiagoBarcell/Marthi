unit frmModeloProdutos;

interface

uses FireDAC.Comp.Client,
     Data.DB,
     System.SysUtils,
     frmModeloConnection;

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

      function ListarProduto( out erro: string ) : TFDQuery;
      function ListarImagemProduto(out erro: string; IDProduto : Integer): TFDQuery;
      function ListarITemProduto(out erro: string; IDProduto : Integer): TFDQuery;
    end;


implementation

{ TProdutos }

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
    lQryProdutos.SQL.Add('SELECT * FROM CAD_CELL WHERE CELL_STATUS = 1');
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
    lQryImagemProdutos.SQL.Add('select * from cell_images where cell_id = ' + IntToStr( IDProduto ) );
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
