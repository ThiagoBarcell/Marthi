unit GeralDMFrm;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeralDM: TfrmGeralDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
