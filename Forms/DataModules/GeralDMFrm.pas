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
    qryCadCellCELL_ARMAZENAMENTO: TIntegerField;
    qryCadCellCELL_CAM_PRINC: TStringField;
    qryCadCellCELL_CAM_FRONT: TStringField;
    qryCadCellCELL_COR: TStringField;
    qryCadCellCELL_OBS: TStringField;
    dtsCadCell: TDataSource;
    upsCadCell: TFDUpdateSQL;
    qryCadCellCELL_VALOR_UNITARIO: TFMTBCDField;
    qryCadCellCELL_VALOR_PARCELADO: TFMTBCDField;
    qryCadCellDAT_CAD: TDateField;
    qryCadCellDAT_ALT: TDateField;
    oInsIMG: TFDQuery;
    qryImagensCell: TFDQuery;
    qryImagensCellCELL_ID: TIntegerField;
    qryImagensCellSEQUENCIA: TIntegerField;
    qryImagensCellIMAGE: TBlobField;
    procedure qryCadCellNewRecord(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
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

procedure TfrmGeralDM.qryCadCellNewRecord(DataSet: TDataSet);
begin
  qryCadCellCELL_ID.AsInteger  := ProximoNumero( 'GEN_CAD_CELL_ID' );
  qryCadCellDAT_CAD.AsDateTime := Now;
  qryCadCellDAT_ALT.AsDateTime := Now;
end;

end.
