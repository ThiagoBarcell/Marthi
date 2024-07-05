unit CadInformarcoesFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinsDefaultPainters,
  dxBarBuiltInMenu, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPC, GeralDMFrm, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit;

type
  TfrmCadInformacoes = class(TForm)
    PgeCadastroComp: TcxPageControl;
    tabArmazenamento: TcxTabSheet;
    tabCondicao: TcxTabSheet;
    tabCor: TcxTabSheet;
    grdCadastroArmazenamentoDBTableView: TcxGridDBTableView;
    grdCadastroArmazenamentoLevel: TcxGridLevel;
    grdCadastroArmazenamento: TcxGrid;
    grdCadastroCondicao: TcxGrid;
    grdCadastroCondicaoDBTableView: TcxGridDBTableView;
    grdCadastroCondicaoLevel: TcxGridLevel;
    grdCadastroCor: TcxGrid;
    grdCadastroCorDBTableView: TcxGridDBTableView;
    grdCadastroCorLevel: TcxGridLevel;
    grdCadastroCondicaoDBTableViewColumn1: TcxGridDBColumn;
    grdCadastroCondicaoDBTableViewColumn2: TcxGridDBColumn;
    grdCadastroArmazenamentoDBTableViewColumn2: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadInformacoes: TfrmCadInformacoes;

implementation

{$R *.dfm}

end.
