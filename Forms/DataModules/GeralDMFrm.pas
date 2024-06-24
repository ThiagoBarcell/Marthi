unit GeralDMFrm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, System.IniFiles;

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
    qryCellCorCOD_DESC: TStringField;
    procedure qryCadCellNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryCadCellAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    sCaminhoApp : String;
    function ProximoNumero( GENERATOR : String ) : integer;
    { Public declarations }
  end;

var
  frmGeralDM: TfrmGeralDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TfrmGeralDM.DataModuleCreate(Sender: TObject);
var
 oIniCaminhos : tinifile;
 sCaminhoIni  : string;
begin
  sCaminhoApp := ( ExtractFilePath( ParamStr(0) ) );
  sCaminhoIni := ( sCaminhoApp + 'caminhos.ini' );

  oIniCaminhos := TIniFile.Create(sCaminhoIni);

  if ( oIniCaminhos.ReadString( 'Caminhos','BD', '' ) <> '' ) then
  begin
    ConectMarthi.Params.Database := oIniCaminhos.ReadString( 'Caminhos','BD', '' );
  end
  else
    oIniCaminhos.WriteString( 'Caminhos','BD', '' );

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

  //Tabela com as informações dos celulares
  qryCellItens.Close;
  qryCellItens.ParamByName( 'CELL_ID' ).AsInteger := qryCadCellCELL_ID.AsInteger;
  qryCellItens.Open;
end;

procedure TfrmGeralDM.qryCadCellNewRecord(DataSet: TDataSet);
begin
  qryCadCellCELL_ID.AsInteger  := ProximoNumero( 'GEN_CAD_CELL_ID' );
  qryCadCellDAT_CAD.AsDateTime := Now;
  qryCadCellDAT_ALT.AsDateTime := Now;
end;

end.
