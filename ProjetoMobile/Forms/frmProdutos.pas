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
  System.IOUtils,
  System.IniFiles,
  {$IFDEF ANDROID}
  Androidapi.Helpers,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  FMX.Helpers.Android,
  {$ENDIF}
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
  System.Types,
  System.Threading,
  GeraisDMFrm;

type
  TProdutosFrm = class(TForm)
    pnlTop: TPanel;
    Brush: TBrushObject;
    btnConfiguracoes: TButton;
    lblTitulo: TLabel;
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
    tabProdutos: TTabControl;
    tabListaProdutos: TTabItem;
    tabConfiguracoes: TTabItem;
    edtIPServidor: TEdit;
    btnAttIP: TButton;
    lblLoading: TLabel;
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
    procedure ConfiguraCDSImagens;
    procedure SalvarIP(const AIP: string);
    function LerIP: string;
    function GetAndroidFilesDir: string;
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
  SalvarIP( edtIPServidor.Text );
end;

procedure TProdutosFrm.SalvarIP(const AIP: string);
var
  Ini: TIniFile;
  CaminhoArquivo: string;
begin
  CaminhoArquivo := GetAndroidFilesDir + PathDelim + 'config.ini';
  Ini := TIniFile.Create(CaminhoArquivo);
  try
    Ini.WriteString('INFORMACOES', 'IP', AIP);
  finally
    Ini.Free;
  end;
end;

function TProdutosFrm.GetAndroidFilesDir: string;
begin
  {$IFDEF ANDROID}
  Result := JStringToString(TAndroidHelper.Context.getFilesDir.getAbsolutePath);
  {$ENDIF};
end;

function TProdutosFrm.LerIP: string;
var
  Ini: TIniFile;
  CaminhoArquivo: string;
begin
  CaminhoArquivo := GetAndroidFilesDir + PathDelim + 'config.ini';
  if TFile.Exists(CaminhoArquivo) then
  begin
    Ini := TIniFile.Create(CaminhoArquivo);
    try
      Result := Ini.ReadString('INFORMACOES', 'IP', '');
    finally
      Ini.Free;
    end;
  end
  else
    Result := '';
end;

procedure TProdutosFrm.btnConfiguracoesClick(Sender: TObject);
begin
  CarregaDados;
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
    Frame.IpAPI := lFuncoes.lIPServer;

    Frame.Margins.Top := 5;
    Frame.Margins.Bottom := 5;

    Frame.lblNomeItem.Text := cdsProdutos.FieldByName('cellDesc').AsString;
    Frame.lblID_CELL.Text := cdsProdutos.FieldByName('cellId').AsString;
    Frame.lblReferencia.Text := cdsProdutos.FieldByName('cellReferencia').AsString;
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
    JSONObject.Free;
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
var
  lIpAtual : string;
begin
  lFuncoes := TFuncoesMobile.Create;
  lIpAtual := LerIP;
  edtIPServidor.Text := lIpAtual;
  lFuncoes.lIPServer := lIpAtual;
  tabProdutos.TabIndex := 0;
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
