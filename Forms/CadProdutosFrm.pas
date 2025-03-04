unit CadProdutosFrm;

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
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  Vcl.Menus,
  dxBarBuiltInMenu,
  cxMemo,
  cxDBEdit,
  cxPC,
  Vcl.StdCtrls,
  cxButtons,
  dxCustomTileControl,
  dxTileControl,
  cxGroupBox,
  dximctrl,
  cxMaskEdit,
  cxDropDownEdit,
  cxImageComboBox,
  cxLabel,
  cxTextEdit,
  Vcl.ExtCtrls,
  System.ImageList,
  Vcl.ImgList,
  cxImageList,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  dxDateRanges,
  Data.DB,
  cxDBData,
  cxRadioGroup,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  dxBevel,
  GeralDMFrm,
  Vcl.ComCtrls,
  Jpeg,
  untFuncoes,
  cxCurrencyEdit,
  CadInformarcoesFrm,
  cxDBLookupComboBox,
  dxGDIPlusClasses,
  FireDAC.Stan.Param,
  CadConfiguracoesFrm,
  dxNumericWheelPicker,
  cxCalc,
  cxEditRepositoryItems;

const
  OffsetMemoryStream : Int64 = 0;

type
  TfrmCadProdutos = class(TForm)
    pnlCadastroDeProduto: TPanel;
    PgeCadastroComp: TcxPageControl;
    tabCadastro: TcxTabSheet;
    edtCellDesc: TcxDBTextEdit;
    edtCellMemoriaRAM: TcxDBTextEdit;
    edtCellProcessamento: TcxDBTextEdit;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel6: TcxLabel;
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
    btnInserir: TcxButton;
    btnVoltar: TcxButton;
    ImageCell: TImage;
    cxGridImagesDBTableViewImage: TcxGridDBTableView;
    cxGridImagesLevelImage: TcxGridLevel;
    cxGridImages: TcxGrid;
    cxgrdbclmnGridImagesDBTableViewImageColumnSEQUENCIA: TcxGridDBColumn;
    btnAddImage: TcxButton;
    btnExcluiImg: TcxButton;
    grdCell_Itens: TcxGrid;
    cxGridDBTableViewCell_Itens: TcxGridDBTableView;
    grdLevelCell_Itens: TcxGridLevel;
    cxLabel1: TcxLabel;
    cxGridDBTableViewCell_ItensColumnARMAZENAMENTO_ID: TcxGridDBColumn;
    cxGridDBTableViewCell_ItensColumnCOR_ID: TcxGridDBColumn;
    cxGridDBTableViewCell_ItensColumnCODICAO_ID: TcxGridDBColumn;
    cxGridDBTableViewCell_ItensColumnCELL_VAL_UNIT: TcxGridDBColumn;
    cxGridDBTableViewCell_ItensColumnCELL_VAL_PARC: TcxGridDBColumn;
    btnCadArmazenamento: TcxButton;
    btnCadCor: TcxButton;
    btnCadCondicao: TcxButton;
    pnlFiltros: TPanel;
    Label1: TLabel;
    cbxFiltros: TcxImageComboBox;
    pgeFiltros: TcxPageControl;
    tabFiltroCadastro: TcxTabSheet;
    edtStartDate: TDateTimePicker;
    Label2: TLabel;
    edtEndDate: TDateTimePicker;
    tabFiltroDesc: TcxTabSheet;
    edtFiltroDesc: TcxTextEdit;
    cxLabel2: TcxLabel;
    pnlFaixaTop: TPanel;
    btnFechar: TcxButton;
    Image1: TImage;
    pnlCentralGeral: TPanel;
    lblTitulo: TLabel;
    ImgUteis: TcxImageCollection;
    imgNO_IMAGE: TcxImageCollectionItem;
    btnExcluir: TcxButton;
    cbxStatusCell: TcxDBImageComboBox;
    cxLabel7: TcxLabel;
    grdConsultaProdDBTableViewColumn4: TcxGridDBColumn;
    grdConsultaProdDBTableViewColumn5: TcxGridDBColumn;
    cxLabel8: TcxLabel;
    edtReferencia: TcxDBTextEdit;
    cxLabel5: TcxLabel;
    memObsCell: TcxDBMemo;
    tabFiltroReferencia: TcxTabSheet;
    edtFiltroReferencia: TcxTextEdit;
    imgStatus: TcxImageList;
    btnConfiguracao: TcxButton;
    ppmGridCadastro: TPopupMenu;
    Duplicarregistro1: TMenuItem;
    cxGridDBTableViewCell_ItensColumnCELL_PARCELAS: TcxGridDBColumn;
    btnCadTpPreco: TcxButton;
    cxGridDBTableViewCell_ItensColumnTP_PRECO_ID: TcxGridDBColumn;
    btnTabPrecos: TcxButton;
    cxGridDBTableViewCell_ItensColumn1: TcxGridDBColumn;
    RepositoryMarcas: TcxEditRepository;
    RepositoryMarcasImgCbx: TcxEditRepositoryImageComboBoxItem;
    imgGerais: TcxImageList;
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
    procedure btnCadArmazenamentoClick(Sender: TObject);
    procedure btnCadCorClick(Sender: TObject);
    procedure btnCadCondicaoClick(Sender: TObject);
    procedure cbxFiltrosPropertiesChange(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tabConsultaShow(Sender: TObject);
    procedure pnlFaixaTopMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblTituloMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnExcluirClick(Sender: TObject);
    procedure Duplicarregistro1Click(Sender: TObject);
    procedure btnCadTpPrecoClick(Sender: TObject);
    procedure btnConfiguracaoClick(Sender: TObject);
    procedure btnTabPrecosClick(Sender: TObject);
    procedure cxGridDBTableViewCell_ItensColumnCELL_PARCELASPropertiesValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxGridDBTableViewCell_ItensNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
  private
    procedure AbreTelaInfo( iCod : Integer ) ;
    procedure AbreConfTabelaPrecos( lCod : Integer );
    { Private declarations }
  public
  Funcoes : TFuncoesUteis;
  sSqlOriginal : string;
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
    //Application.MessageBox( 'N�o foi poss�vel concluir o insert, por favor verifique !', 'Aviso', 0 )
  end;
end;

procedure TfrmCadProdutos.btnCadArmazenamentoClick(Sender: TObject);
begin
  AbreTelaInfo( 0 )
end;

procedure TfrmCadProdutos.AbreTelaInfo( iCod : Integer ) ;
var
  CadInformacoes : TfrmCadInformacoes;
begin
  CadInformacoes := TfrmCadInformacoes.Create( Self,iCod );
  try
    CadInformacoes.ShowModal;
  finally
    Funcoes.AbreQrysInfo( frmGeralDM.qryCellArmazenamento,
      frmGeralDM.qryCellCondicao, frmGeralDM.qryCellCor, frmGeralDM.qryCellTpPreco );
    FreeAndNil( CadInformacoes );
  end;
end;

procedure TfrmCadProdutos.AbreConfTabelaPrecos( lCod : Integer );
var
  lConfig : TfrmConfiguracoes;
begin
  lConfig := TfrmConfiguracoes.Create( Self );
  try
    case lCod of
      0 :
      begin
        lConfig.pgeConfiguracoes.ActivePageIndex := 0;
        lConfig.pnlButtons.Visible := True;
        frmGeralDM.qryConfiguracoes.Close;
        frmGeralDM.qryConfiguracoes.Open;
      end;

      1 :
      begin //Tabela de pre�os
        lConfig.pgeConfiguracoes.ActivePageIndex := 1;
        lConfig.pnlButtons.Visible := False;
        frmGeralDM.qryCellTabPrecos.Close;
        frmGeralDM.qryCellTabPrecos.Open;
      end;

    end;
  finally
    lConfig.Show;
  end;
end;

procedure TfrmCadProdutos.btnCadCondicaoClick(Sender: TObject);
begin
  AbreTelaInfo( 1 )
end;

procedure TfrmCadProdutos.btnCadCorClick(Sender: TObject);
begin
  AbreTelaInfo( 2 );
end;

procedure TfrmCadProdutos.btnCadTpPrecoClick(Sender: TObject);
begin
  AbreTelaInfo( 3 )
end;

procedure TfrmCadProdutos.btnConfiguracaoClick(Sender: TObject);
begin
  AbreConfTabelaPrecos( 0 );
end;

procedure TfrmCadProdutos.btnConsultaProdutosClick(Sender: TObject);
begin
  frmGeralDM.qryCadCell.SQL.Text := sSqlOriginal;

  frmGeralDM.qryCadCell.Close;
  case pgeFiltros.ActivePageIndex of
    0 : begin
          frmGeralDM.qryCadCell.SQL.Add( ' WHERE DAT_CAD BETWEEN ' + QuotedStr( StringReplace( DateToStr( edtStartDate.Date ), '/', '.', [rfReplaceAll] ) ) +
                                         ' AND ' + QuotedStr( StringReplace( DateToStr( edtEndDate.Date ), '/', '.', [rfReplaceAll] ) ) )
        end;

    1 : begin
          frmGeralDM.qryCadCell.SQL.Add( ' WHERE CELL_DESC LIKE ' + QuotedStr( '%' + edtFiltroDesc.Text + '%' )  )
        end;

    2 : begin
          frmGeralDM.qryCadCell.SQL.Add( ' WHERE CELL_REFERENCIA LIKE ' + QuotedStr( '%' + edtFiltroReferencia.Text + '%' )  )
        end;
  end;
  frmGeralDM.qryCadCell.Open;
end;

procedure TfrmCadProdutos.btnSalvarClick(Sender: TObject);
begin
  if not ( frmGeralDM.qryCadCell.State in dsEditModes ) then
    frmGeralDM.qryCadCell.Edit;

  frmGeralDM.qryCadCell.Post;

  Application.MessageBox( 'Salvo com sucesso', 'Aviso', MB_ICONEXCLAMATION + MB_OK );

  btnVoltar.Click;
end;

procedure TfrmCadProdutos.btnTabPrecosClick(Sender: TObject);
begin
  AbreConfTabelaPrecos( 1 );
end;

procedure TfrmCadProdutos.btnVoltarClick(Sender: TObject);
begin
  PgeCadastroComp.ActivePageIndex := 0;
  frmGeralDM.qryCadCell.Refresh;
end;

procedure TfrmCadProdutos.cbxFiltrosPropertiesChange(Sender: TObject);
begin
  pgeFiltros.ActivePageIndex := cbxFiltros.ItemIndex;
end;

procedure TfrmCadProdutos.cxGridDBTableViewCell_ItensColumnCELL_PARCELASPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  if Application.MessageBox( 'Deseja Atualizar a coluna de valor parcelado,' + #13 +
    'baseado na porcentagem da tabela de pre�o ?' , 'Aviso', mb_yesno + mb_iconquestion ) = ID_YES
  then
  begin
    frmGeralDM.qryCellItensCELL_VAL_PARC.AsFloat := Funcoes.CalculaParcela( frmGeralDM.ConectMarthi, DisplayValue, frmGeralDM.qryCellItensCELL_VAL_UNIT.AsFloat );
    frmGeralDM.qryCellItensCELL_PARCELAS.AsInteger := DisplayValue;
  end;

  //Sempre ser� criado os valores na tabela para termos baseado no calculo
  Funcoes.CriaParcelas( frmGeralDM.ConectMarthi, frmGeralDM.qryCellItensCELL_ID.AsInteger ,
    frmGeralDM.qryCellItensITEM_ID.AsInteger, frmGeralDM.qryCellItensTP_PRECO_ID.AsInteger,
    frmGeralDM.qryCellItensCELL_VAL_UNIT.AsFloat );
end;

procedure TfrmCadProdutos.cxGridDBTableViewCell_ItensNavigatorButtonsButtonClick(Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  //Btn de insert
  if AButtonIndex = 6 then
  begin
    //Entra em modo de edi��o caso necess�rio para sempre atualizar o produto
    if not ( frmGeralDM.qryCadCell.State in dsEditModes ) then
      frmGeralDM.qryCadCell.Edit;

    frmGeralDM.qryCadCell.Post;
  end;

  //Duplicar Registro
  if AButtonIndex = 16 then
  begin
    //Duplicando itens
    frmGeralDM.DuplicaCellItem;
    frmGeralDM.qryCellItens.Refresh;
  end;
end;

procedure TfrmCadProdutos.cxGridImagesDBTableViewImageCellClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
 MemoryStream : TMemoryStream;
 Jpg : TJpegImage;
begin
  Jpg := nil;
  MemoryStream := nil;

  if not(frmGeralDM.qryImagensCell.IsEmpty) and
     not((frmGeralDM.qryImagensCell.FieldByName( 'IMAGE' ) as TBlobField).IsNull)
  then
  begin
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
  end
end;

procedure TfrmCadProdutos.Duplicarregistro1Click(Sender: TObject);
begin
  Funcoes.ReplicaCelular( frmGeralDM.qryCadCell, frmGeralDM.ConectMarthi );
  frmGeralDM.qryCadCell.Refresh;
end;

procedure TfrmCadProdutos.FormCreate(Sender: TObject);
begin
  PgeCadastroComp.ActivePageIndex := 0;

  edtStartDate.Date := Now;
  edtEndDate.Date   := Now;

  Funcoes := TFuncoesUteis.Create;

  pgeFiltros.ActivePageIndex := 0;

  sSqlOriginal := frmGeralDM.qryCadCell.SQL.Text;
end;

procedure TfrmCadProdutos.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmCadProdutos.grdConsultaProdDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  PgeCadastroComp.ActivePageIndex := 1;
end;

procedure TfrmCadProdutos.lblTituloMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmCadProdutos.pnlFaixaTopMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  sc_DragMove = $f012;
begin
  ReleaseCapture;
  Perform(wm_SysCommand, sc_DragMove, 0);
end;

procedure TfrmCadProdutos.tabCadastroShow(Sender: TObject);
begin
  //ImageCell.Picture := NIL;
  lblTitulo.Caption := 'Cadastro de Celulares';
  Funcoes.AbreQrysInfo( frmGeralDM.qryCellArmazenamento, frmGeralDM.qryCellCondicao, frmGeralDM.qryCellCor, frmGeralDM.qryCellTpPreco);

  ImageCell.Picture.Assign( ImgUteis.Items[0].Picture);
end;

procedure TfrmCadProdutos.tabConsultaShow(Sender: TObject);
begin
 lblTitulo.Caption := 'Consulta de Celulares';
end;

procedure TfrmCadProdutos.btnInserirClick(Sender: TObject);
begin

  PgeCadastroComp.ActivePageIndex := 1;
  frmGeralDM.qryCadCell.Open;
  frmGeralDM.qryCadCell.Insert;
end;

procedure TfrmCadProdutos.btnEditarClick(Sender: TObject);
begin
  frmGeralDM.qryCadCell.Edit;
end;

procedure TfrmCadProdutos.btnExcluiImgClick(Sender: TObject);
begin
  //Faz a exclus�o das imagens se necess�rio
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

procedure TfrmCadProdutos.btnExcluirClick(Sender: TObject);
begin
  if( Application.MessageBox( 'Deseja realmente excluir o registro selecionado ?', 'Aviso', MB_YESNO + MB_ICONQUESTION ) = IDYES )then
    grdConsultaProdDBTableView.DataController.DeleteSelection;
end;

procedure TfrmCadProdutos.btnFecharClick(Sender: TObject);
begin
  CLOSE;
end;

end.
