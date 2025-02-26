unit Frame.MarthiGIT.Produto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ExtCtrls,frmAtualizaProdutos,
  IdTCPConnection, IdTCPClient, IdHTTP,Datasnap.DBClient,System.JSON,
  System.Math,Soap.EncdDecd, System.NetEncoding, FMX.DialogService, System.Threading, Data.DB;

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
  fFrmAttprod := TAtualizaProdutosFrm.Create(nil);
  CarregarImagens( fFrmAttprod, StrToInt( lblID_CELL.Text ) );
  try
    fFrmAttprod.Show;
  finally
    fFrmAttprod.Free;
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

  ConfiguraCDSImagens;
  ExtrairDadosImagemProduto( lResponseImg.Text, cdsImagemProduto );

  Frame.rtgImageProd.BeginUpdate;
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
      Frame.rtgImageProd.Stroke.Assign(Frame.rtgImageProd.Stroke);
      Frame.rtgImageProd.Fill.Kind := TBrushKind.Bitmap;
      Frame.rtgImageProd.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
      Frame.rtgImageProd.SetBounds(Frame.rtgImageProd.Position.X, Frame.rtgImageProd.Position.Y, Frame.rtgImageProd.Width, Frame.rtgImageProd.Height);
      Frame.rtgImageProd.XRadius := 10;
      Frame.rtgImageProd.YRadius := 10;

      BlobField := cdsImagemProduto.FieldByName('IMAGE') as TBlobField;
      if not BlobField.IsNull then
      begin
        ImageStream := TMemoryStream.Create;
        try
          //BlobField.SaveToStream(ImageStream);
          if Frame.rtgImageProd.Fill.Bitmap.Bitmap = nil then
            Frame.rtgImageProd.Fill.Bitmap.Bitmap := TBitmap.Create;

          CarregarImagemFromBlob(BlobField,Frame.rtgImageProd.Fill.Bitmap.Bitmap);

          ImageStream.Position := 0;
        finally
          ImageStream.Free;
        end;
      end
      else
      begin
        Frame.rtgImageProd.Fill.Kind := TBrushKind.Solid;
        //Frame.rtgImageProd.Fill.Color := TAlphaColors.Gray;
      end;

      CurrentLeft := CurrentLeft + Frame.rtgImageProd.Width + 10;
      TotalWidth := CurrentLeft;

    //Frame.HorzScrollBoxImagens.Content.Width := TotalWidth;
    //Frame.lblTOT_WIDTH.Text := FloatToStr(TotalWidth);
    finally
      BlobField.Free;
    //  ImageQuery.Free;
    end;
  finally
    Frame.rtgImageProd.EndUpdate;
  end;
end;

end.
