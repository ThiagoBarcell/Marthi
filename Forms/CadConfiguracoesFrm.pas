unit CadConfiguracoesFrm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.Menus,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  Vcl.StdCtrls,
  cxButtons,
  dxGDIPlusClasses,
  Vcl.ExtCtrls,
  GeralDMFrm,
  dxBarBuiltInMenu,
  cxControls,
  cxPC,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  dxDateRanges,
  Data.DB,
  cxDBData,
  cxGridLevel,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxClasses,
  cxGridCustomView,
  cxGrid,
  cxContainer,
  cxTextEdit,
  cxDBEdit,
  cxMaskEdit;

type
  TfrmConfiguracoes = class(TForm)
    pnlFaixaTop: TPanel;
    Image1: TImage;
    lblTitulo: TLabel;
    btnFechar: TcxButton;
    pgeConfiguracoes: TcxPageControl;
    pagConfigura��es: TcxTabSheet;
    pnlButtons: TPanel;
    btnCancel: TcxButton;
    cxButton1: TcxButton;
    pagTabPrecos: TcxTabSheet;
    grdTabPreco: TcxGrid;
    grdTabPrecoDBTableView: TcxGridDBTableView;
    grdTpPrecoDBColumn: TcxGridDBColumn;
    grdTabPrecoLevel: TcxGridLevel;
    grdTabPrecoDBTableViewColumn1: TcxGridDBColumn;
    pgeConfigGeral: TcxPageControl;
    tabConfigWhatsApp: TcxTabSheet;
    tabConfigGeral: TcxTabSheet;
    Label1: TLabel;
    edtSENHA_ACESSO: TcxDBTextEdit;
    Label2: TLabel;
    edtAPI_KEY_WHATSAPP: TcxDBTextEdit;
    Label3: TLabel;
    edtCELL_RECEPTOR_WHATSAPP: TcxDBTextEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure pnlFaixaTopMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCancelClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracoes: TfrmConfiguracoes;

implementation

{$R *.dfm}

procedure TfrmConfiguracoes.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfiguracoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConfiguracoes.cxButton1Click(Sender: TObject);
begin
  frmGeralDM.qryConfiguracoes.Post;
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
