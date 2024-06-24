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
  GeralDMFrm, Vcl.ComCtrls, Jpeg, untFuncoes;

const
  OffsetMemoryStream : Int64 = 0;

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
    cxLabel3: TcxLabel;
    edtPrincCam: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    edtFrontCam: TcxDBTextEdit;
    OpenDialog: TOpenDialog;
    Panel1: TPanel;
    dxBevel1: TdxBevel;
    btnSalvar: TcxButton;
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
    ImageCell: TImage;
    cxGridImagesDBTableViewImage: TcxGridDBTableView;
    cxGridImagesLevelImage: TcxGridLevel;
    cxGridImages: TcxGrid;
    cxgrdbclmnGridImagesDBTableViewImageColumnSEQUENCIA: TcxGridDBColumn;
    btnAddImage: TcxButton;
    btnExcluiImg: TcxButton;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxLabel1: TcxLabel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    procedure btnConsultaProdutosClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure grdConsultaProdDBTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnAddImageClick(Sender: TObject);
    procedure cxGridImagesDBTableViewImageCellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure btnExcluiImgClick(Sender: TObject);
    procedure tabCadastroShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

procedure TfrmCadProdutos.btnAddImageClick(Sender: TObject);
begin
  try
    if OpenDialog.Execute then
    begin
      if ( OpenDialog.FileName <> '' ) then
      begin
        //Salva a imagem na tabela de imagem do celular
        frmGeralDM.qryImagensCell.Last;
        frmGeralDM.oInsIMG.Close;
        frmGeralDM.oInsIMG.ParamByName('CELL_ID').AsInteger   := frmGeralDM.qryCadCellCELL_ID.AsInteger;
        frmGeralDM.oInsIMG.ParamByName('SEQUENCIA').AsInteger := frmGeralDM.qryImagensCellSEQUENCIA.AsInteger + 1 ;
        frmGeralDM.oInsIMG.ParamByName('IMAGE').LoadFromFile( OpenDialog.FileName ,TFieldType.ftBlob );
        frmGeralDM.oInsIMG.ExecSQL;

        ImageCell.Picture.LoadFromFile(OpenDialog.FileName);

        frmGeralDM.qryImagensCell.Refresh;

      end;
      //edtPathImageCell.Text := OpenDialog.FileName;
    end;
  finally
    //Application.MessageBox( 'Não foi possível concluir o insert, por favor verifique !', 'Aviso', 0 )
  end;
end;

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
  frmGeralDM.qryCadCell.Post;
end;

procedure TfrmCadProdutos.btnVoltarClick(Sender: TObject);
begin
  PgeCadastroComp.ActivePageIndex := 0;
end;

procedure TfrmCadProdutos.cxGridImagesDBTableViewImageCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
 MemoryStream : TMemoryStream;
 Jpg : TJpegImage;
begin
  if not(frmGeralDM.qryImagensCell.IsEmpty) and
  not((frmGeralDM.qryImagensCell.FieldByName( 'IMAGE' ) as TBlobField).IsNull) then
    try
      MemoryStream := TMemoryStream.Create;
      Jpg := TJpegImage.Create;
      (frmGeralDM.qryImagensCell.FieldByName( 'IMAGE' ) as TBlobField).SaveToStream(MemoryStream);
      MemoryStream.Position := OffsetMemoryStream;
      Jpg.LoadFromStream(MemoryStream);
      ImageCell.Picture.Assign(Jpg);
    finally
      Jpg.Free;
      MemoryStream.Free;
    end
  else
  // o Else faz com que, caso o campo esteja Null, o TImage seja limpado
    ImageCell.Picture := Nil;
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

  frmGeralDM.qryImagensCell.Close;
  frmGeralDM.qryImagensCell.ParamByName( 'CELL_ID' ).AsInteger := frmGeralDM.qryCadCellCELL_ID.AsInteger;
  frmGeralDM.qryImagensCell.Open;
end;

procedure TfrmCadProdutos.grdConsultaProdDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  PgeCadastroComp.ActivePageIndex := 1;
end;

procedure TfrmCadProdutos.tabCadastroShow(Sender: TObject);
begin
  ImageCell.Picture := NIL;
end;

procedure TfrmCadProdutos.btnInserirClick(Sender: TObject);
begin
  PgeCadastroComp.ActivePageIndex := 1;
  frmGeralDM.qryCadCell.Insert;
  Caption := 'Cadastro de Produtos';
end;

procedure TfrmCadProdutos.btnEditarClick(Sender: TObject);
begin
  frmGeralDM.qryCadCell.Edit;
end;

procedure TfrmCadProdutos.btnExcluiImgClick(Sender: TObject);
begin
  //Faz a exclusão das imagens se necessário
  with frmGeralDM do
  begin
    delImgCell.Close;
    delImgCell.ParamByName( 'CELL_ID'   ).AsInteger := qryCadCellCELL_ID.AsInteger;
    delImgCell.ParamByName( 'SEQUENCIA' ).AsInteger := qryImagensCellSEQUENCIA.AsInteger;
    delImgCell.ExecSQL;

    //Faz o refresh na qry
    qryImagensCell.Refresh;
  end;
end;

end.
