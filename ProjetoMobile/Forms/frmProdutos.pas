unit frmProdutos;

interface

uses

  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  System.Rtti,
  FMX.Grid.Style,
  FMX.ScrollBox,
  FMX.Grid,
  FMX.Layouts,
  FMX.ExtCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.FMXUI.Wait,
  FMX.Edit,
  FMX.TabControl,
  System.Classes,
  untFuncoesMobile,
  FMX.Objects,
  System.ImageList,
  FMX.ImgList,
  Data.SqlExpr,
  Data.FMTBcd,
  FMX.Memo,
  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  Frame.MarthiGIT.Produto,
  Datasnap.DBClient,
  System.JSON,
  System.SysUtils,
  System.Math,
  Soap.EncdDecd,
  System.NetEncoding,
  FMX.DialogService,
  System.Threading;

type
  TProdutosFrm = class(TForm)
    pnlTop: TPanel;
    Brush: TBrushObject;
    btnConfiguracoes: TButton;
    lblTitulo: TLabel;
    imgGerais: TImageList;
    Image1: TImage;
    rctPrincipal: TRectangle;
    lytPrincipal: TLayout;
    vsbPrincipal: TVertScrollBox;
    cdsProdutos: TClientDataSet;
    dtsProdutos: TDataSource;
    cdsImagemProduto: TClientDataSet;
    cdsItemProduto: TClientDataSet;
    dtsItemProduto: TDataSource;
    dtsImagemProduto: TDataSource;
    TabControl1: TTabControl;
    tabListaProdutos: TTabItem;
    tabConfiguracoes: TTabItem;
    edtIPServidor: TEdit;
    btnAttIP: TButton;
    lblLoading: TLabel;
    procedure btnConnectarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Rectangle8Click(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure btnAttIPClick(Sender: TObject);
  private
    { Private declarations }
    //Procedures
    procedure CarregaDados;
    procedure AjustarAlturaScrollBox( ScrollBox : TVertScrollBox );
    //procedure CarregarImagens(Frame: TProdutoFrame; IDCell: Integer);
    procedure LoadImageFromBase64(const JSONResponse: string;
      ImageComponent: TImage);
    procedure ExtrairDadosImagemProduto(lJSon: string;
      lClientDataSet: TClientDataSet);


    //Functions
    function ExtrairDadosJSonProduto( Json: string; cdsProduto : TClientDataSet ): string;
    function ExtrairDadosJSonItemProduto( Json: string; cdsItemProd : TClientDataSet ): string;
    procedure ConfiguraCDSImagens;
  public
    lFuncoes : TFuncoesMobile;
    { Public declarations }
  end;

var
  ProdutosFrm: TProdutosFrm;

implementation

{$R *.fmx}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TProdutosFrm.AjustarAlturaScrollBox( ScrollBox : TVertScrollBox );
var
  I: Integer;
  AlturaTotal: Single;
begin
  AlturaTotal := 0;

  // Calcula a altura total dos componentes dentro do Content
  for I := 0 to ScrollBox.Content.ControlsCount - 1 do
  begin
    AlturaTotal := Max(AlturaTotal, ScrollBox.Content.Controls[I].Position.Y + ScrollBox.Content.Controls[I].Height);
  end;

  // Ajusta a altura do conteúdo para incluir todos os elementos
  ScrollBox.Content.Height := AlturaTotal;
end;

procedure TProdutosFrm.btnAttIPClick(Sender: TObject);
begin
  lFuncoes.lIPServer := edtIPServidor.Text;
end;

procedure TProdutosFrm.btnConfiguracoesClick(Sender: TObject);
begin
//  TTask.Run(
//    CarregaDados
//  );

  CarregaDados;
end;

procedure TProdutosFrm.btnConnectarClick(Sender: TObject);
begin
  //if not ( lFuncoes.ConectarBD( cntMarthi, edtServerDB.Text, edtPathDB.Text ) ) then
  //  ShowMessage( 'Não foi possível conectar no banco de dados' );
end;

procedure TProdutosFrm.ConfiguraCDSImagens;
begin
  cdsImagemProduto.Close;
  cdsImagemProduto.FieldDefs.Clear;
  cdsImagemProduto.FieldDefs.Add('CELL_ID', ftInteger );
  cdsImagemProduto.FieldDefs.Add('SEQUENCIA', ftInteger );
  cdsImagemProduto.FieldDefs.Add('IMAGE', ftBlob );

  cdsImagemProduto.CreateDataSet;
  cdsImagemProduto.Close;
  dtsImagemProduto.DataSet := cdsImagemProduto;
  cdsImagemProduto.Open;
end;

procedure TProdutosFrm.CarregaDados;
var
  Frame: TProdutoFrame;
  lConsultCell: TIdHTTP;
  lConsultImagem: TIdHTTP;
  lConsultItem: TIdHTTP;
  lRetorno: string;
  lTotalReg: string;
  Cont, CellID: Integer;
  CorID, CapacidadeID, RetiradaID: Integer;
begin
  Cont := 0;
  while vsbPrincipal.Content.ControlsCount > 0 do
    vsbPrincipal.Content.Controls[0].Free;

  lConsultCell := TIdHTTP.Create( nil );
  try
    lRetorno := lConsultCell.Get( 'http://' + lFuncoes.lIPServer + '/produtos' );
    ExtrairDadosJSonProduto( lRetorno, cdsProdutos );
  finally
    lConsultCell.Free;
  end;

  lblLoading.Visible := True;

  lTotalReg := IntToStr( cdsProdutos.RecordCount );

  cdsProdutos.First;

  while not( cdsProdutos.Eof ) do
  begin
    Inc(Cont);

    lblLoading.Text := 'Atualizando :' + IntToStr( cont ) + ' de ' + lTotalReg;

    Frame := TProdutoFrame.Create(vsbPrincipal);
    Frame.Name := 'Frame' + IntToStr(Cont);
    Frame.Parent := vsbPrincipal;
    Frame.Align := TAlignLayout.MostTop;
    Frame.Width := 210;
    Frame.Height := 230;
    //Frame.tbcTotem.ActiveTab := Frame.TabTotemPrincipal;

    Frame.Margins.Top := 5;
    Frame.Margins.Bottom := 5;

    Frame.lblNomeItem.Text := cdsProdutos.FieldByName('cellDesc').AsString;
    Frame.lblValorAPrazo.Text := '10';//cdsProdutos.FieldByName('cellDesc').AsString;
    Frame.lblValorAVista.Text := '10';//cdsProdutos.FieldByName('cellDesc').AsString;
    Frame.lblID_CELL.Text := cdsProdutos.FieldByName('cellId').AsString;

    //Por questoes de performace não vou carregar as imagens aqui
    try
      //CarregarImagens( Frame, cdsProdutos.FieldByName( 'cellId' ).AsInteger );
    except

    end;

    //CellID := cdsProdutos.FieldByName('cellId').AsInteger;
    //CarregarImagensHorizontais(Frame, CellID);
    // Preenche Combobox de cor
    //CarregaComboBox(Frame, CellID, 'cbbCor', 'COR_ID', 'COR_DESC', qryCores);
    // Preenche Combobox de Capacidade
    //CarregaComboBox(Frame, CellID, 'cbbCapacidade', 'ARMAZENAMENTO_ID', 'ARMAZENAMENTO_DESC', qryCapacidades);
    // Preenche Combobox de Retirada
    //CarregaComboBox(Frame, CellID, 'cbbRetirada', 'TP_PRECO_ID', 'TP_PRECO_DESC', qryRetirada);

    //Frame.CELL_MARCA.Text := dtsCadCell.DataSet.FieldByName('CELL_MARCA').AsString;
    //Frame.CELL_ID.Text := dtsCadCell.DataSet.FieldByName('CELL_ID').AsString;

    // Obtém o ID dos itens selecionados
//    if Frame.cbbCor.ItemIndex >= 0 then
//      CorID := Integer(Frame.cbbCor.Items.Objects[Frame.cbbCor.ItemIndex])
//    else
//      Exit;

//    if Frame.cbbCapacidade.ItemIndex >= 0 then
//      CapacidadeID := Integer(Frame.cbbCapacidade.Items.Objects[Frame.cbbCapacidade.ItemIndex])
//    else
//      Exit;

//    if Frame.cbbRetirada.ItemIndex >= 0 then
//      RetiradaID := Integer(Frame.cbbRetirada.Items.Objects[Frame.cbbRetirada.ItemIndex])
//    else
//      Exit;

//    try
//      qryDadosCor.ParamByName('COR_ID').AsInteger := CorID;
//      qryDadosCor.ParamByName('CELL_ID').AsInteger := qryCadCellCELL_ID.AsInteger;
//      qryDadosCor.Open;
//
//      // Preenche o ComboBox de Parcelas
//      PreencherParcelas(Frame.cbbParcelas,
//                        qryCadCellCELL_ID.AsInteger,
//                        qryDadosCor.FieldByName('ITEM_ID').AsInteger,
//                        RetiradaID,
//                        qryDadosCor.FieldByName('CELL_VAL_UNIT').AsFloat);
//
//      // Atualiza os labels e o ComboBox de capacidade
//      if not qryDadosCor.IsEmpty then
//      begin
//        Frame.lblValorAVista.Text := Format('R$ %.2f', [qryDadosCor.FieldByName('CELL_VAL_UNIT').AsFloat]);
//        Frame.lblValorAPrazo.Text := qryDadosCor.FieldByName('CELL_PARCELAS').AsString + ' X ' + Format('R$ %.2f', [qryDadosCor.FieldByName('CELL_VAL_PARC').AsFloat]);
//      end
//      else
//      begin
//        Frame.lblValorAVista.Text := 'R$ 0,00';
//        Frame.lblValorAPrazo.Text := 'R$ 0,00';
//      end;
//    finally
//      qryDadosCor.Close;
//    end;

    // Atribuir os eventos OnChange
//    Frame.cbbCor.OnChange := CorChange;
//    Frame.cbbCapacidade.OnChange := CapacidadeChange;
//    Frame.cbbRetirada.OnChange := RetiradaChange;
//    Frame.cbbParcelas.OnChange := ParcelasChange;

    // Atribuir o evento OnClick
//    Frame.btnEnviaWhatsapp.OnClick := EnviaWhatsapp;

    // Atribuir o evento OnEnter
//    Frame.edtNomeCli.OnClick := OnClickNomeCli;
//    Frame.edtTelCli.OnClick := OnClickTelCli;
    Application.ProcessMessages;
    cdsProdutos.Next;
  end;
  lblLoading.Visible := False;
  AjustarAlturaScrollBox(vsbPrincipal);
end;

procedure CarregarImagemFromBlob(BlobField: TBlobField; Bitmap: TBitmap);
var
  Base64Stream: TStringStream;
  ImageStream: TMemoryStream;
  Base64Data: string;
begin
  if BlobField.IsNull then
    Exit;

  // Obtém o conteúdo do campo BLOB como string Base64
  Base64Data := BlobField.AsString;

  // Stream para decodificar a Base64
  Base64Stream := TStringStream.Create(Base64Data, TEncoding.UTF8);
  ImageStream := TMemoryStream.Create;
  try
    // Decodifica a string Base64 para o stream binário
    TNetEncoding.Base64.Decode(Base64Stream, ImageStream);

    // Volta para o início do stream
    ImageStream.Position := 0;

    // Carrega a imagem no Bitmap
    Bitmap.LoadFromStream(ImageStream);
  finally
    Base64Stream.Free;
    ImageStream.Free;
  end;
end;

//procedure TProdutosFrm.CarregarImagens(Frame: TProdutoFrame; IDCell: Integer);
//var
//  ImageStream: TMemoryStream;
//  BlobField: TBlobField;
//  CloneRect: TRectangle;
//  CurrentLeft: Single;
//  TotalWidth: Single;
//  lConsultaImg : TIdHTTP;
//  lResponseImg : TStringList;
//begin
//  //TDialogService.ShowMessage( '1' );
//  // Verifica se o HorzScrollBoxImagens está inicializado
//  if not Assigned(Frame.rtgImageProd) then
//  begin
//    raise Exception.Create('HorzScrollBoxImagens não está inicializado.');
//  end;
//  lResponseImg := TStringList.Create;
//  lConsultaImg := TIdHTTP.Create( nil );
//  lResponseImg.Text := lConsultaImg.Get( 'http://' + lFuncoes.lIPServer + '/produtos/imagens/' + IntToStr( IDCell ) );
//
//  ConfiguraCDSImagens;
//  ExtrairDadosImagemProduto( lResponseImg.Text, cdsImagemProduto );
//
//  Frame.rtgImageProd.BeginUpdate;
//  try
//    CurrentLeft := 0;
//    TotalWidth := 0;
//
//    try
////      Frame.rtgImageProd.Margins.Top := 5;
////      Frame.rtgImageProd.Margins.Left := 30;
////      Frame.rtgImageProd.Margins.Right := 30;
////      Frame.rtgImageProd.Margins.Bottom := 5;
////      Frame.rtgImageProd.Position.X := CurrentLeft;
////      Frame.rtgImageProd.Position.Y := 0;
//      Frame.rtgImageProd.Stroke.Assign(Frame.rtgImageProd.Stroke);
//      Frame.rtgImageProd.Fill.Kind := TBrushKind.Bitmap;
//      Frame.rtgImageProd.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
//      Frame.rtgImageProd.SetBounds(Frame.rtgImageProd.Position.X, Frame.rtgImageProd.Position.Y, Frame.rtgImageProd.Width, Frame.rtgImageProd.Height);
//      Frame.rtgImageProd.XRadius := 10;
//      Frame.rtgImageProd.YRadius := 10;
//
//      BlobField := cdsImagemProduto.FieldByName('IMAGE') as TBlobField;
//      if not BlobField.IsNull then
//      begin
//        ImageStream := TMemoryStream.Create;
//        try
//          //BlobField.SaveToStream(ImageStream);
//          if Frame.rtgImageProd.Fill.Bitmap.Bitmap = nil then
//            Frame.rtgImageProd.Fill.Bitmap.Bitmap := TBitmap.Create;
//
//          CarregarImagemFromBlob(BlobField,Frame.rtgImageProd.Fill.Bitmap.Bitmap);
//
//          ImageStream.Position := 0;
//        finally
//          ImageStream.Free;
//        end;
//      end
//      else
//      begin
//        Frame.rtgImageProd.Fill.Kind := TBrushKind.Solid;
//        //Frame.rtgImageProd.Fill.Color := TAlphaColors.Gray;
//      end;
//
//      CurrentLeft := CurrentLeft + Frame.rtgImageProd.Width + 10;
//      TotalWidth := CurrentLeft;
//
//    //Frame.HorzScrollBoxImagens.Content.Width := TotalWidth;
//    //Frame.lblTOT_WIDTH.Text := FloatToStr(TotalWidth);
//    finally
//      BlobField.Free;
//    //  ImageQuery.Free;
//    end;
//  finally
//    Frame.rtgImageProd.EndUpdate;
//  end;
//end;

function TProdutosFrm.ExtrairDadosJSonItemProduto(Json: string;
  cdsItemProd: TClientDataSet): string;
begin
  //
end;

function TProdutosFrm.ExtrairDadosJSonProduto( Json: string; cdsProduto : TClientDataSet ): string;
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  I: Integer;
  CellId, CellMarca: Integer;
  CellDesc, CellProcessamento, CellMemRam, CellCamPrinc, CellCamFront: string;
  CellObs, CellReferencia: string;
  DatCad, DatAlt: string;
  CellStatus: Integer;
begin
  JSONArray := TJSONObject.ParseJSONValue(Json) as TJSONArray;

  if JSONArray = nil then
  begin
    ShowMessage('JSON inválido!');
    Exit;
  end;

  cdsProduto.Close;
  cdsProduto.FieldDefs.Clear;
  cdsProduto.FieldDefs.Add('cellId', ftInteger );
  cdsProduto.FieldDefs.Add('cellMarca', ftInteger );
  cdsProduto.FieldDefs.Add('cellDesc', ftString, 255 );
  cdsProduto.FieldDefs.Add('cellProcessamento', ftString, 30 );
  cdsProduto.FieldDefs.Add('cellMemRam', ftString, 30 );
  cdsProduto.FieldDefs.Add('cellCamPrinc', ftString, 30 );
  cdsProduto.FieldDefs.Add('cellCamFront', ftString, 50 );
  cdsProduto.FieldDefs.Add('cellObs', ftBlob );
  cdsProduto.FieldDefs.Add('datCad', ftString, 50 );
  cdsProduto.FieldDefs.Add('datAlt', ftString, 50 );
  cdsProduto.FieldDefs.Add('cellStatus', ftInteger );
  cdsProduto.FieldDefs.Add('cellReferencia', ftString, 50 );

  cdsProduto.CreateDataSet;
  cdsProduto.Close;
  dtsProdutos.DataSet := cdsProduto;
  cdsProduto.Open;

  try
    // Iterando por todos os itens no array
    for I := 0 to JSONArray.Count - 1 do
    begin
      JSONObject := JSONArray.Items[I] as TJSONObject;

      cdsProduto.Append;

      // Extraindo valores do objeto
      cdsProduto.FieldByName( 'CellId' ).AsInteger := JSONObject.GetValue<Integer>('cellId');
      cdsProduto.FieldByName( 'CellMarca' ).AsInteger := JSONObject.GetValue<Integer>('cellMarca');
      cdsProduto.FieldByName( 'CellDesc' ).AsString := JSONObject.GetValue<string>('cellDesc');
      cdsProduto.FieldByName( 'CellProcessamento' ).AsString := JSONObject.GetValue<string>('cellProcessamento');
      cdsProduto.FieldByName( 'CellMemRam' ).AsString := JSONObject.GetValue<string>('cellMemRam');
      cdsProduto.FieldByName( 'CellCamPrinc' ).AsString := JSONObject.GetValue<string>('cellCamPrinc');
      cdsProduto.FieldByName( 'CellCamFront' ).AsString := JSONObject.GetValue<string>('cellCamFront');
      cdsProduto.FieldByName( 'CellObs' ).AsString := JSONObject.GetValue<string>('cellObs');
      cdsProduto.FieldByName( 'DatCad' ).AsString := JSONObject.GetValue<string>('datCad');
      cdsProduto.FieldByName( 'DatAlt' ).AsString := JSONObject.GetValue<string>('datAlt');
      cdsProduto.FieldByName( 'CellStatus' ).AsInteger := JSONObject.GetValue<Integer>('cellStatus');
      cdsProduto.FieldByName( 'CellReferencia' ).AsString := JSONObject.GetValue<string>('cellReferencia');
      cdsProduto.Post;
    end;
  finally
    JSONArray.Free;
  end;
end;

procedure TProdutosFrm.ExtrairDadosImagemProduto( lJSon : string; lClientDataSet : TClientDataSet );
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  i: Integer;
  CellId, Sequencia: Integer;
  Image: string;
begin
  try
    // Carrega o JSON recebido em um JSONArray
    JSONArray := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(lJSon), 0) as TJSONArray;
    try
      // Itera pelos objetos no array
      for i := 0 to JSONArray.Count - 1 do
      begin
        JSONObject := JSONArray.Items[i] as TJSONObject;
        lClientDataSet.Append;
        // Lê os valores do objeto
        lClientDataSet.FieldByName( 'CELL_ID' ).AsInteger := JSONObject.GetValue<Integer>('cellId');
        lClientDataSet.FieldByName( 'SEQUENCIA' ).AsInteger := JSONObject.GetValue<Integer>('sequencia');
        lClientDataSet.FieldByName( 'IMAGE' ).AsBytes := TEncoding.UTF8.GetBytes( JSONObject.GetValue<string>('image') );
        lClientDataSet.Post;
        // Exibe as informações (ou faça o que for necessário)
        //Writeln(Format('CellId: %d, Sequencia: %d, Image: %s', [CellId, Sequencia, Image]));
      end;
    finally
      JSONArray.Free;
    end;
  except
    on E: Exception do
      Writeln('Erro: ' + E.Message);
  end;
end;

procedure TProdutosFrm.FormCreate(Sender: TObject);
begin
  lFuncoes := TFuncoesMobile.Create;
end;

procedure TProdutosFrm.LoadImageFromBase64(const JSONResponse: string;
  ImageComponent: TImage);
begin

end;

procedure TProdutosFrm.Rectangle8Click(Sender: TObject);
var
  lConulta : tidhttp;
  lReturn : string;
begin
  lConulta := TIdHTTP.Create(nil);

  try
    lReturn := lConulta.Get( 'http://' + lFuncoes.lIPServer + '/produtos' );
    //Memo1.Lines.Text := lReturn;
  finally
    lConulta.Free;
  end;

end;

end.
