unit Frame.MarthiGIT.Produto;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Objects,
  FMX.Layouts,
  FMX.ExtCtrls,
  frmAtualizaProdutos,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  Datasnap.DBClient,
  System.JSON,
  System.Math,
  Soap.EncdDecd,
  System.NetEncoding,
  FMX.DialogService,
  System.Threading,
  Data.DB,
  untModeloItemProduto,
  System.Generics.Collections,
  REST.Json;

type
  TProdutoFrame = class(TFrame)
    lytProduto: TLayout;
    rtgProduto: TRectangle;
    lblNomeItem: TLabel;
    lblID_CELL: TLabel;
    Label1: TLabel;
    lblReferencia: TLabel;
    cdsImagemProduto: TClientDataSet;
    dtsImagemProduto: TDataSource;
    procedure rtgProdutoClick(Sender: TObject);
  private
    lListaInfoItens : TObjectList<TModeloProduto>;
    lModelProduto : TModeloProduto;

    procedure ConfiguraCDSImagens;
    procedure ExtrairDadosImagemProduto(lJSon: string;
      lClientDataSet: TClientDataSet);
    procedure CarregarImagemFromBlob(BlobField: TBlobField; Bitmap: TBitmap);
    procedure ConfiguraClasseProd( IDCell: Integer );
    procedure PreencherItemCDS(const JSONStr: string);
    { Private declarations }
  public
    { Public declarations }
    IpAPI : string;
    procedure CarregarImagens( frmProd : TAtualizaProdutosFrm; IDCell: Integer);
  end;

implementation

{$R *.fmx}

procedure TProdutoFrame.rtgProdutoClick(Sender: TObject);
var
  fFrmAttprod : TAtualizaProdutosFrm;
begin
  CarregarImagens( fFrmAttprod, StrToInt( lblID_CELL.Text ) );
  ConfiguraClasseProd( StrToInt( lblID_CELL.Text ) );
  fFrmAttprod := TAtualizaProdutosFrm.Create(lListaInfoItens);
  fFrmAttprod.Show;
end;

procedure TProdutoFrame.ConfiguraClasseProd(IDCell: Integer);
var
  lConsultaItem : TIdHTTP;
  lResponseItem : TStringList;
begin

  lResponseItem := TStringList.Create;
  lConsultaItem := TIdHTTP.Create( nil );
  lResponseItem.Text := lConsultaItem.Get( 'http://' + IpAPI + '/produtos/itens/' + IntToStr( IDCell ) );
  PreencherItemCDS( lResponseItem.Text )
end;

procedure TProdutoFrame.PreencherItemCDS( const JSONStr: string);
var
  JSONArray: TJSONArray;
  JSONObject: TJSONObject;
  I: Integer;
begin
  // Carregar JSON
  JSONArray := TJSONObject.ParseJSONValue(JSONStr) as TJSONArray;
  lListaInfoItens := TObjectList<TModeloProduto>.Create;

  try

 // Percorre cada item no JSON
    for I := 0 to JSONArray.Count - 1 do
    begin
      JSONObject := JSONArray.Items[I] as TJSONObject;

      // Criando e preenchendo objeto
      lModelProduto := TModeloProduto.Create;
      lModelProduto.ID := JSONObject.GetValue<Integer>('itemId');
      lModelProduto.CellId := JSONObject.GetValue<Integer>('cellId');
      lModelProduto.ArmazenamentoId := JSONObject.GetValue<Integer>('armazenamentoId');
      lModelProduto.ArmazenamentoDesc := JSONObject.GetValue<string>('armazenamentoDesc');
      lModelProduto.CorId := JSONObject.GetValue<Integer>('corId');
      lModelProduto.CorDesc := JSONObject.GetValue<string>('corDesc');
      lModelProduto.CondicaoId := JSONObject.GetValue<Integer>('codicaoId');
      lModelProduto.CondicaoDesc := JSONObject.GetValue<string>('condicaoDesc');
      lModelProduto.Cell_Val_Unit := JSONObject.GetValue<Double>('cellValUnit');
      lModelProduto.Cell_Val_Parc := JSONObject.GetValue<Double>('cellValParc');
      lModelProduto.Cell_Parcelas := JSONObject.GetValue<string>('cellParcelas');
      lModelProduto.TP_Preco_ID := JSONObject.GetValue<Integer>('tpPrecoId');
      lModelProduto.TP_Preco_Desc := JSONObject.GetValue<string>('tpPrecoDesc');

      // Adiciona à lista
      lListaInfoItens.Add(lModelProduto);
    end;
  finally
    JSONArray.Free;
  end;
end;

procedure TProdutoFrame.CarregarImagens( frmProd : TAtualizaProdutosFrm; IDCell: Integer);
var
  ImageStream: TMemoryStream;
  BlobField: TBlobField;
  CloneRect: TRectangle;
  CurrentLeft: Single;
  TotalWidth: Single;
  lConsultaImg : TIdHTTP;
  lResponseImg : TStringList;
begin
  //TDialogService.ShowMessage( '1' );
  // Verifica se o HorzScrollBoxImagens está inicializado
  if not Assigned( frmProd.rtgImageProd ) then
  begin
    raise Exception.Create('HorzScrollBoxImagens não está inicializado.');
  end;
  lResponseImg := TStringList.Create;
  lConsultaImg := TIdHTTP.Create( nil );
  lResponseImg.Text := lConsultaImg.Get( 'http://' + IpAPI + '/produtos/imagens/' + IntToStr( IDCell ) );
  try
    ConfiguraCDSImagens;
    ExtrairDadosImagemProduto( lResponseImg.Text, cdsImagemProduto );

    frmProd.rtgImageProd.BeginUpdate;
    try
      CurrentLeft := 0;
      TotalWidth := 0;

      try
  //      Frame.rtgImageProd.Margins.Top := 5;
  //      Frame.rtgImageProd.Margins.Left := 30;
  //      Frame.rtgImageProd.Margins.Right := 30;
  //      Frame.rtgImageProd.Margins.Bottom := 5;
  //      Frame.rtgImageProd.Position.X := CurrentLeft;
  //      Frame.rtgImageProd.Position.Y := 0;
        frmProd.rtgImageProd.Stroke.Assign(frmProd.rtgImageProd.Stroke);
        frmProd.rtgImageProd.Fill.Kind := TBrushKind.Bitmap;
        frmProd.rtgImageProd.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
        frmProd.rtgImageProd.SetBounds(frmProd.rtgImageProd.Position.X, frmProd.rtgImageProd.Position.Y, frmProd.rtgImageProd.Width, frmProd.rtgImageProd.Height);
        frmProd.rtgImageProd.XRadius := 10;
        frmProd.rtgImageProd.YRadius := 10;

        BlobField := cdsImagemProduto.FieldByName('IMAGE') as TBlobField;
        if not BlobField.IsNull then
        begin
          ImageStream := TMemoryStream.Create;
          try
            //BlobField.SaveToStream(ImageStream);
            if frmProd.rtgImageProd.Fill.Bitmap.Bitmap = nil then
              frmProd.rtgImageProd.Fill.Bitmap.Bitmap := TBitmap.Create;

            CarregarImagemFromBlob(BlobField,frmProd.rtgImageProd.Fill.Bitmap.Bitmap);

            ImageStream.Position := 0;
          finally
            ImageStream.Free;
          end;
        end
        else
        begin
          frmProd.rtgImageProd.Fill.Kind := TBrushKind.Solid;
          //Frame.rtgImageProd.Fill.Color := TAlphaColors.Gray;
        end;

        CurrentLeft := CurrentLeft + frmProd.rtgImageProd.Width + 10;
        TotalWidth := CurrentLeft;

      //Frame.HorzScrollBoxImagens.Content.Width := TotalWidth;
      //Frame.lblTOT_WIDTH.Text := FloatToStr(TotalWidth);
      finally
        try
          BlobField.Free;
        except
        end;
      //  ImageQuery.Free;
      end;
    finally
      frmProd.rtgImageProd.EndUpdate;
    end;
  except
  end;
end;

procedure TProdutoFrame.ConfiguraCDSImagens;
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

procedure TProdutoFrame.ExtrairDadosImagemProduto( lJSon : string; lClientDataSet : TClientDataSet );
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

procedure TProdutoFrame.CarregarImagemFromBlob(BlobField: TBlobField; Bitmap: TBitmap);
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

end.
