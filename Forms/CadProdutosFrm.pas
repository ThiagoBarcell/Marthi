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
  GeralDMFrm, Vcl.ComCtrls;

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
    lblMemoria: TcxLabel;
    lblProcessamento: TcxLabel;
    imgMarcas: TcxImageList;
    tabConsulta: TcxTabSheet;
    pnlTop: TPanel;
    btnConsultaProdutos: TcxButton;
    grdConsultaProdDBTableView: TcxGridDBTableView;
    grdConsultaProdLevel: TcxGridLevel;
    grdConsultaProd: TcxGrid;
    cbxArmazenamentoCell: TcxDBImageComboBox;
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
    btnPesqImagem: TcxButton;
    grdConsultaProdDBTableViewColumn1: TcxGridDBColumn;
    grdConsultaProdDBTableViewColumn2: TcxGridDBColumn;
    grdConsultaProdDBTableViewColumn3: TcxGridDBColumn;
    cbxMarcaCell: TcxDBImageComboBox;
    Label1: TLabel;
    edtStartDate: TDateTimePicker;
    Label2: TLabel;
    edtEndDate: TDateTimePicker;
    btnInserir: TcxButton;
    btnVoltar: TcxButton;
    Image1: TImage;
    edtPathImageCell: TcxTextEdit;
    cxGridImagesDBTableViewImage: TcxGridDBTableView;
    cxGridImagesLevelImage: TcxGridLevel;
    cxGridImages: TcxGrid;
    cxGridImagesDBTableViewImageColumn1: TcxGridDBColumn;
    procedure btnConsultaProdutosClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnPesqImagemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure grdConsultaProdDBTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
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
  frmGeralDM.qryCadCell.Close;
  frmGeralDM.qryCadCell.ParamByName( 'START_DATE' ).AsDate := edtStartDate.Date;
  frmGeralDM.qryCadCell.ParamByName( 'END_DATE' ).AsDate := edtEndDate.Date;
  frmGeralDM.qryCadCell.Open;
end;

procedure TfrmCadProdutos.btnSalvarClick(Sender: TObject);
var
  FileStream: TFileStream;
  BlobStream: TStream;

begin
  //Salva a imagem na tabela de imagem do celular
  frmGeralDM.oInsIMG.Close;
  frmGeralDM.oInsIMG.ParamByName('CELL_ID').AsInteger   := frmGeralDM.qryCadCellCELL_ID.AsInteger;
  frmGeralDM.oInsIMG.ParamByName('SEQUENCIA').AsInteger := 1;
  frmGeralDM.oInsIMG.ParamByName('IMAGE').LoadFromFile( edtPathImageCell.Text ,TFieldType.ftBlob );
  frmGeralDM.oInsIMG.ExecSQL;

  frmGeralDM.qryCadCell.Post;
end;

procedure TfrmCadProdutos.btnVoltarClick(Sender: TObject);
begin
  PgeCadastroComp.ActivePageIndex := 0;
end;

procedure TfrmCadProdutos.FormCreate(Sender: TObject);
begin
  PgeCadastroComp.ActivePageIndex := 0;

  edtStartDate.Date := Now;
  edtEndDate.Date   := Now;

  //Traz os dados de Hoje para não precisar iniciar pesquisando
  frmGeralDM.qryCadCell.Close;
  frmGeralDM.qryCadCell.ParamByName( 'START_DATE' ).AsDate := now;
  frmGeralDM.qryCadCell.ParamByName( 'END_DATE' ).AsDate   := now;
  frmGeralDM.qryCadCell.Open;
end;

procedure TfrmCadProdutos.grdConsultaProdDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  PgeCadastroComp.ActivePageIndex := 1;
end;

procedure TfrmCadProdutos.btnInserirClick(Sender: TObject);
begin
  PgeCadastroComp.ActivePageIndex := 1;
  frmGeralDM.qryCadCell.Insert;
  Caption := 'Cadastro de Produtos';
end;

procedure TfrmCadProdutos.btnPesqImagemClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
    edtPathImageCell.Text := OpenDialog.FileName;
    Image1.Picture.LoadFromFile(OpenDialog.FileName);
  end;
end;

procedure TfrmCadProdutos.btnEditarClick(Sender: TObject);
begin
  frmGeralDM.qryCadCell.Edit;
end;

end.
