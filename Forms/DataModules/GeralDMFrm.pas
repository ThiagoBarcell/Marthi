unit GeralDMFrm;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  System.IniFiles,
  FireDAC.Phys.IBBase,
  untFuncoes,
  System.ImageList,
  Vcl.ImgList,
  Vcl.Controls;

type
  TfrmGeralDM = class(TDataModule)
    ConectMarthi: TFDConnection;
    qryCadCell: TFDQuery;
    qryCadCellCELL_ID: TIntegerField;
    qryCadCellCELL_MARCA: TIntegerField;
    qryCadCellCELL_DESC: TStringField;
    qryCadCellCELL_PROCESSAMENTO: TStringField;
    qryCadCellCELL_MEM_RAM: TStringField;
    qryCadCellCELL_CAM_PRINC: TStringField;
    qryCadCellCELL_CAM_FRONT: TStringField;
    qryCadCellCELL_OBS: TStringField;
    dtsCadCell: TDataSource;
    upsCadCell: TFDUpdateSQL;
    qryCadCellDAT_CAD: TDateField;
    qryCadCellDAT_ALT: TDateField;
    oInsIMG: TFDQuery;
    qryImagensCell: TFDQuery;
    qryImagensCellCELL_ID: TIntegerField;
    qryImagensCellSEQUENCIA: TIntegerField;
    qryImagensCellIMAGE: TBlobField;
    dtsImagensCell: TDataSource;
    delImgCell: TFDQuery;
    qryCellItens: TFDQuery;
    dtsCellItens: TDataSource;
    qryCellItensITEM_ID: TIntegerField;
    qryCellItensCELL_ID: TIntegerField;
    qryCellItensARMAZENAMENTO_ID: TIntegerField;
    qryCellItensCOR_ID: TIntegerField;
    qryCellItensCODICAO_ID: TIntegerField;
    qryCellItensCELL_VAL_UNIT: TFMTBCDField;
    qryCellItensCELL_VAL_PARC: TFMTBCDField;
    qryCellCor: TFDQuery;
    qryCellArmazenamento: TFDQuery;
    qryCellCondicao: TFDQuery;
    qryCellArmazenamentoARMAZENAMENTO_ID: TIntegerField;
    qryCellArmazenamentoARMAZENAMENTO_DESC: TStringField;
    qryCellCorCOR_ID: TIntegerField;
    dtsCellCor: TDataSource;
    dtsCellArmazenamento: TDataSource;
    dtsCellCondicao: TDataSource;
    upsCellCor: TFDUpdateSQL;
    upsCellArmazenamento: TFDUpdateSQL;
    upsCellCondicao: TFDUpdateSQL;
    upsCellItens: TFDUpdateSQL;
    qryCellCondicaoCONDICAO_ID: TIntegerField;
    qryCellCondicaoCONDICAO_DESC: TStringField;
    qryCellCorCOR_DESC: TStringField;
    FBLink: TFDPhysFBDriverLink;
    qryCadCellCELL_STATUS: TSmallintField;
    qryCadCellCELL_REFERENCIA: TStringField;
    qryCellItensCELL_PARCELAS: TStringField;
    qryCellTpPreco: TFDQuery;
    dtsCellTpPreco: TDataSource;
    upsCellTpPreco: TFDUpdateSQL;
    qryCellTpPrecoTP_PRECO_ID: TIntegerField;
    qryCellTpPrecoTP_PRECO_DESC: TStringField;
    qryCellItensTP_PRECO_ID: TIntegerField;
    qryCellTabPrecos: TFDQuery;
    qryCellTabPrecosCELL_PARCELAS: TIntegerField;
    qryCellTabPrecosCELL_VAL_PORC: TBCDField;
    dtsCellTabPrecos: TDataSource;
    upsCellTabPrecos: TFDUpdateSQL;
    qryCellTabPrecosCELL_TAB_PRECO_ID: TIntegerField;
    qryConfiguracoes: TFDQuery;
    qryConfiguracoesAPI_KEY_WHATSAPP: TStringField;
    qryConfiguracoesCELL_RECEPTOR_WHATSAPP: TStringField;
    qryConfiguracoesSENHA_ACESSO: TStringField;
    dtsConfiguracoes: TDataSource;
    upsConfiguracoes: TFDUpdateSQL;
    procedure qryCadCellNewRecord(DataSet: TDataSet);
    procedure qryCadCellAfterScroll(DataSet: TDataSet);
    procedure qryCellItensNewRecord(DataSet: TDataSet);
    procedure qryCellCorNewRecord(DataSet: TDataSet);
    procedure qryCellArmazenamentoNewRecord(DataSet: TDataSet);
    procedure qryCellCondicaoNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryCellTpPrecoNewRecord(DataSet: TDataSet);
    procedure qryCellTabPrecosNewRecord(DataSet: TDataSet);
  private
  lFuncoes: TFuncoesUteis;

    { Private declarations }
  public
    //Function
    function ProximoNumero( GENERATOR : String ) : integer;

    //Procedure
    procedure DuplicaCellItem;
    { Public declarations }
  end;

var
  frmGeralDM: TfrmGeralDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TfrmGeralDM.DataModuleCreate(Sender: TObject);
begin
  //Configura a conex�o com o banco
  lFuncoes.ConectaBD_Ini( ConectMarthi, FBLink );
end;

function TfrmGeralDM.ProximoNumero(GENERATOR: String): integer;
var
  oqryNovoNum : TFDQuery;
begin
  oqryNovoNum := TFDQuery.Create(nil);
  oqryNovoNum.Connection := ConectMarthi;
  try
    oqryNovoNum.Close;
    oqryNovoNum.SQL.Clear;
    oqryNovoNum.SQL.Add( 'SELECT GEN_ID(' + GENERATOR + ',1) AS ID_ATUAL FROM RDB$DATABASE' );
    oqryNovoNum.Open;
  finally
    Result := oqryNovoNum.FieldByName( 'ID_ATUAL' ).AsInteger;
    FreeAndNil(oqryNovoNum);
  end;
end;

procedure TfrmGeralDM.qryCadCellAfterScroll(DataSet: TDataSet);
begin
  //Tabela com as Imagens dos produtos
  qryImagensCell.Close;
  qryImagensCell.ParamByName( 'CELL_ID' ).AsInteger := qryCadCellCELL_ID.AsInteger;
  qryImagensCell.Open;

  //Tabela com as informa��es dos celulares
  qryCellItens.Close;
  qryCellItens.ParamByName( 'CELL_ID' ).AsInteger := qryCadCellCELL_ID.AsInteger;
  qryCellItens.Open;
end;

procedure TfrmGeralDM.qryCadCellNewRecord(DataSet: TDataSet);
begin
  qryCadCellCELL_ID.AsInteger := ProximoNumero( 'GEN_CAD_CELL_ID' );
  qryCadCellCELL_MARCA.AsInteger := 0;
  qryCadCellDAT_CAD.AsDateTime := Now;
  qryCadCellDAT_ALT.AsDateTime := Now;
  qryCadCellCELL_STATUS.AsInteger := 1; //Status ativo
end;

procedure TfrmGeralDM.qryCellArmazenamentoNewRecord(DataSet: TDataSet);
begin
  qryCellArmazenamentoARMAZENAMENTO_ID.AsInteger := ProximoNumero( 'GEN_CELL_ARMAZENAMENTO_ID' );
end;

procedure TfrmGeralDM.qryCellCondicaoNewRecord(DataSet: TDataSet);
begin
  qryCellCondicaoCONDICAO_ID.AsInteger := ProximoNumero( 'GEN_CELL_CONDICOES_ID' );
end;

procedure TfrmGeralDM.qryCellCorNewRecord(DataSet: TDataSet);
begin
  qryCellCorCOR_ID.AsInteger := ProximoNumero( 'GEN_CELL_CORES_ID' );
end;

procedure TfrmGeralDM.qryCellItensNewRecord(DataSet: TDataSet);
begin
  qryCellItensITEM_ID.AsInteger := ProximoNumero( 'GEN_CELL_ITENS_ID' );
  qryCellItensCELL_ID.AsInteger := qryCadCellCELL_ID.AsInteger;

end;

procedure TfrmGeralDM.qryCellTabPrecosNewRecord(DataSet: TDataSet);
begin
  qryCellTabPrecosCELL_TAB_PRECO_ID.AsInteger := ProximoNumero( 'GEN_CELL_TAB_PRECOS_ID' );
end;

procedure TfrmGeralDM.qryCellTpPrecoNewRecord(DataSet: TDataSet);
begin
  qryCellTpPrecoTP_PRECO_ID.AsInteger := ProximoNumero( 'GEN_CELL_TP_PRECOS_ID' );
end;

procedure TfrmGeralDM.DuplicaCellItem;
var
  lQryInsCellItem : tfdquery;
begin
  //Duplicando itens
  lQryInsCellItem := lFuncoes.CriaQuery( ConectMarthi );
  try
    lQryInsCellItem.Close;
    lQryInsCellItem.SQL.Clear;
    lQryInsCellItem.SQL.Add( 'INSERT INTO CELL_ITENS (ITEM_ID, CELL_ID, ARMAZENAMENTO_ID, COR_ID, CODICAO_ID ) ' +
      'VALUES ( :ITEM_ID, :CELL_ID, :ARMAZENAMENTO_ID, :COR_ID, :CODICAO_ID);' );
    lQryInsCellItem.ParamByName( 'ITEM_ID' ).AsInteger := ProximoNumero( 'GEN_CELL_ITENS_ID' );
    lQryInsCellItem.ParamByName( 'CELL_ID' ).AsInteger := qryCadCellCELL_ID.AsInteger;
    lQryInsCellItem.ParamByName( 'ARMAZENAMENTO_ID' ).AsInteger := qryCellItensARMAZENAMENTO_ID.AsInteger;
    lQryInsCellItem.ParamByName( 'COR_ID' ).AsInteger := qryCellItensCOR_ID.AsInteger;
    lQryInsCellItem.ParamByName( 'CODICAO_ID' ).AsInteger := qryCellItensCODICAO_ID.AsInteger;
    lQryInsCellItem.ExecSQL;
  finally
    lQryInsCellItem.Free;
  end;
end;

end.
