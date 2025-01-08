unit CadConfiguracoesFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinsDefaultPainters,
  Vcl.StdCtrls, cxButtons, dxGDIPlusClasses, Vcl.ExtCtrls, GeralDMFrm,
  dxBarBuiltInMenu, cxControls, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, dxDateRanges, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfrmConfiguracoes = class(TForm)
    pnlFaixaTop: TPanel;
    Image1: TImage;
    lblTitulo: TLabel;
    btnFechar: TcxButton;
    pgeConfiguracoes: TcxPageControl;
    pagConfigurações: TcxTabSheet;
    pagWhatsApp: TcxTabSheet;
    pnlButtons: TPanel;
    btnCancel: TcxButton;
    cxButton1: TcxButton;
    Label1: TLabel;
    pagTabPrecos: TcxTabSheet;
    grdTabPreco: TcxGrid;
    grdTabPrecoDBTableView: TcxGridDBTableView;
    grdTpPrecoDBColumn: TcxGridDBColumn;
    grdTabPrecoLevel: TcxGridLevel;
    grdTabPrecoDBTableViewColumn1: TcxGridDBColumn;
    procedure btnFecharClick(Sender: TObject);
    procedure pnlFaixaTopMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

procedure TfrmConfiguracoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfiguracoes.pnlFaixaTopMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

end.
