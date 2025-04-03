unit untModeloItemProduto;

interface

type
  TModeloProduto = class
  private
    FID: Integer;
    FCellID: Integer;
    FArmazenamentoID: Integer;
    FArmazenamentoDesc: string;
    FCorID: Integer;
    FCorDesc: string;
    FCondicaoID: integer;
    FCondicaoDesc: string;
    FCell_Val_Unit: Double;
    FCell_Val_Parc: Double;
    FCell_Parcelas: string;
    FTP_Preco_ID: Integer;
    FTP_Preco_Desc: string;

  public
    property ID: Integer read FID write FID;
    property CellID: Integer read FCellID write FCellID;
    property ArmazenamentoID: Integer read FArmazenamentoID write FArmazenamentoID;
    property ArmazenamentoDesc: string read FArmazenamentoDesc write FArmazenamentoDesc;
    property CorID: Integer read FCorID write FCorID;
    property CorDesc: string read FCorDesc write FCorDesc;
    property CondicaoID: integer read FCondicaoID write FCondicaoID;
    property CondicaoDesc: string read FCondicaoDesc write FCondicaoDesc;
    property Cell_Val_Unit: Double read FCell_Val_Unit write FCell_Val_Unit;
    property Cell_Val_Parc: Double read FCell_Val_Parc write FCell_Val_Parc;
    property Cell_Parcelas: string read FCell_Parcelas write FCell_Parcelas;
    property TP_Preco_ID: Integer read FTP_Preco_ID write FTP_Preco_ID;
    property TP_Preco_Desc: string read FTP_Preco_Desc write FTP_Preco_Desc;
  end;

implementation

end.
