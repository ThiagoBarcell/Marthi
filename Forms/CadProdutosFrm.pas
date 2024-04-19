unit CadProdutosFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.Menus, dxBarBuiltInMenu, cxMemo, cxDBEdit, cxPC,
  Vcl.StdCtrls, cxButtons, dxCustomTileControl, dxTileControl, cxGroupBox,
  dximctrl, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxLabel, cxTextEdit,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, cxImageList, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  Data.DB, cxDBData, cxRadioGroup, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxBevel,
  GeralDMFrm;

type
  TfrmCadProdutos = class(TForm)
    pnlCadastroDeProduto: TPanel;
    PgeCadastroComp: TcxPageControl;
    tabCadastro: TcxTabSheet;
    memObsCell: TcxDBMemo;
    edtCellDesc: TcxDBTextEdit;
    edtCellMemoriaRAM: TcxDBTextEdit;
    edtCellProcessamento: TcxDBTextEdit;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel8: TcxLabel;
    imgFoto: TdxSpinImage;
    lblMemoria: TcxLabel;
    lblProcessamento: TcxLabel;
    imgMarcas: TcxImageList;
    tabConsulta: TcxTabSheet;
    pnlTop: TPanel;
    btnConsultaProdutos: TcxButton;
    grdConsultaProdDBTableView: TcxGridDBTableView;
    grdConsultaProdLevel: TcxGridLevel;
    grdConsultaProd: TcxGrid;
    cxDBImageComboBox1: TcxDBImageComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtCellColor: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    edtPrincCam: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    edtFrontCam: TcxDBTextEdit;
    OpenDialog: TOpenDialog;
    Panel1: TPanel;
    dxBevel1: TdxBevel;
    btnSalvar: TcxButton;
    btnInserir: TcxButton;
    btnEditar: TcxButton;
    btnPesqImagem: TcxButton;
    grdConsultaProdDBTableViewColumn1: TcxGridDBColumn;
    grdConsultaProdDBTableViewColumn2: TcxGridDBColumn;
    grdConsultaProdDBTableViewColumn3: TcxGridDBColumn;
    cxDBImageComboBox2: TcxDBImageComboBox;
    procedure btnConsultaProdutosClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

procedure TfrmCadProdutos.btnConsultaProdutosClick(Sender: TObject);
begin
  frmGeralDM.qryCadCell.Open;
end;

procedure TfrmCadProdutos.btnSalvarClick(Sender: TObject);
begin
  frmGeralDM.qryCadCell.Post;
end;

procedure TfrmCadProdutos.btnInserirClick(Sender: TObject);
begin
  frmGeralDM.qryCadCell.Append;
end;

procedure TfrmCadProdutos.btnEditarClick(Sender: TObject);
begin
  frmGeralDM.qryCadCell.Edit;
end;

end.
