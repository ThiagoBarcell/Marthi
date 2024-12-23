unit frmTotemPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects, FMX.Layouts, FMX.Edit,
  FMX.ListBox, FMX.TabControl, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Frame.MarthiGIT.Totem, Winapi.Windows, System.Math, System.IniFiles, Untfuncoes,
  FireDAC.Phys.IBBase;

type
  TTotemPrincipalfrm = class(TForm)
    Rectangle1: TRectangle;
    RoundRect2: TRoundRect;
    Label1: TLabel;
    Image1: TImage;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    RoundRect1: TRoundRect;
    Label2: TLabel;
    Image2: TImage;
    ShadowEffect5: TShadowEffect;
    ShadowEffect6: TShadowEffect;
    VertScrollBox1: TVertScrollBox;
    lytTop: TLayout;
    lytModelo: TLayout;
    lytCenter: TLayout;
    RoundRect3: TRoundRect;
    ShadowEffect9: TShadowEffect;
    Image3: TImage;
    Layout1: TLayout;
    Layout3: TLayout;
    StyleBook1: TStyleBook;
    lytRodape: TLayout;
    Rectangle2: TRectangle;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Layout2: TLayout;
    ConectMarthi: TFDConnection;
    qryCadCell: TFDQuery;
    qryImagensCell: TFDQuery;
    qryImagensCellCELL_ID: TIntegerField;
    qryImagensCellSEQUENCIA: TIntegerField;
    qryImagensCellIMAGE: TBlobField;
    dtsImagensCell: TBindSourceDB;
    BindingsList1: TBindingsList;
    lytGlobal: TLayout;
    lytToten: TLayout;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Layout8: TLayout;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    dtsCadCell: TBindSourceDB;
    qryCadCellCELL_ID: TIntegerField;
    qryCadCellCELL_DESC: TStringField;
    qryCadCellCOR_DESC: TStringField;
    qryCadCellARMAZENAMENTO_DESC: TStringField;
    qryCadCellCELL_VAL_UNIT: TFMTBCDField;
    qryCadCellCELL_VAL_PARC: TFMTBCDField;
    Rectangle3: TRectangle;
    Layout4: TLayout;
    FBLink: TFDPhysFBDriverLink;
    procedure FormCreate(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarDados;
    procedure AjustarAlturaScrollBox(ScrollBox: TVertScrollBox);
    procedure CarregarImagensHorizontais(Frame: TFrameTotem; CellID: Integer);
  public
    { Public declarations }
  end;

var
  TotemPrincipalfrm: TTotemPrincipalfrm;

implementation

{$R *.fmx}
{$R *.Surface.fmx MSWINDOWS}
{$R *.Moto360.fmx ANDROID}
{$R *.iPhone55in.fmx IOS}
{$R *.iPad.fmx IOS}
{$R *.Windows.fmx MSWINDOWS}

{ TTotemPrincipalfrm }

procedure TTotemPrincipalfrm.CarregarDados;
var
  Frame: TFrameTotem;
  LStream: TMemoryStream;
  BlobField: TBlobField;
  Cont, CellID: Integer;
begin
  //Atualiza a qry principal
  qryCadCell.Close;
  qryCadCell.Open;

  Cont := 0;
  // Limpa os componentes existentes no VertScrollBox
  while VertScrollBox1.Content.ControlsCount > 0 do
    VertScrollBox1.Content.Controls[0].Free;

  // Percorre os dados da query
  dtsCadCell.DataSet.First;
  while not dtsCadCell.DataSet.Eof do
  begin
    Inc(Cont);
    // Cria uma inst�ncia do frame
    Frame := TFrameTotem.Create(VertScrollBox1);
    Frame.Name := 'Frame' + IntToStr(Cont); // Define um nome �nico
    Frame.Parent := VertScrollBox1;
    Frame.Align := TAlignLayout.Top;

    Frame.Margins.Top := 5;
    Frame.Margins.Bottom := 5;

    // Atualiza o texto do label
    Frame.lblNomeItem.Text := dtsCadCell.DataSet.FieldByName('CELL_DESC').AsString;
    try
      Frame.lblValorAVista.Text := 'R$ ' + FloatToStrF(dtsCadCell.DataSet.FieldByName('CELL_VAL_UNIT').AsFloat, ffFixed, 15, 2);
    except
      Frame.lblValorAVista.Text := 'R$ 0,00';
    end;

    try
      Frame.lblValorAPrazo.Text := FloatToStrF(dtsCadCell.DataSet.FieldByName('CELL_VAL_PARC').AsFloat, ffFixed, 15, 2);
    except
      Frame.lblValorAPrazo.Text := '';
    end;
    // Acessa o campo BLOB
//    BlobField := dtsCadCell.DataSet.FieldByName('IMAGE') as TBlobField;

    // Obtem o CELL_ID e carrega imagens horizontais
    CellID := dtsCadCell.DataSet.FieldByName('CELL_ID').AsInteger;
    CarregarImagensHorizontais(Frame, CellID);

    // Verifica se o campo possui dados
//    if not BlobField.IsNull then
//    begin
//      // Cria o stream e carrega o BLOB
//      LStream := TMemoryStream.Create;
//      try
//        // Carrega os dados do BLOB para o stream
//        BlobField.SaveToStream(LStream);
//        LStream.Position := 0;
//
//        // Aplica o stream ao Bitmap do TRectangle
//        Frame.imgCell.Fill.Kind := TBrushKind.Bitmap; // Define o tipo de preenchimento como bitmap
//        Frame.imgCell.Fill.Bitmap.Bitmap.LoadFromStream(LStream);
//      finally
//        LStream.Free;
//      end;
//    end
//    else
//    begin
//      // Caso o campo esteja vazio, pode definir uma imagem padr�o ou limpar o preenchimento
//      Frame.imgCell.Fill.Kind := TBrushKind.Solid; // Define o preenchimento s�lido (sem imagem)
//      Frame.imgCell.Fill.Color := TAlphaColors.Gray; // Cor de fundo para imagens ausentes
//    end;

    // Passa para o pr�ximo registro
    dtsCadCell.DataSet.Next;
  end;

  // Ajusta a altura do ScrollBox
  AjustarAlturaScrollBox(VertScrollBox1);
end;

procedure TTotemPrincipalfrm.CarregarImagensHorizontais(Frame: TFrameTotem; CellID: Integer);
var
  ImageQuery: TFDQuery; // Ajuste para o componente de banco que voc� usa
  ImageStream: TMemoryStream;
  BlobField: TBlobField;
  CloneRect: TRectangle;
  CurrentLeft: Single;
  imgWidth, imgHeight : double;
begin
  Frame.HorzScrollBoxImagens.BeginUpdate; // Evita flickering
  try
    //Frame.HorzScrollBoxImagens.Content.DeleteChildren; // Remove conte�dos antigos
    CurrentLeft := 0;

    ImageQuery := TFDQuery.Create(nil);
    try
      ImageQuery.Connection := ConectMarthi; // Substitua pela sua conex�o
      ImageQuery.SQL.Text := 'SELECT IMAGE FROM CELL_IMAGES WHERE CELL_ID = :CELL_ID';
      ImageQuery.ParamByName('CELL_ID').AsInteger := CellID;
      ImageQuery.Open;

      while not ImageQuery.Eof do
      begin
        // Clona o ret�ngulo `imgCell` existente no Frame
        CloneRect := TRectangle.Create(Frame.HorzScrollBoxImagens);
        CloneRect.Parent := Frame.HorzScrollBoxImagens;
        CloneRect.Width := Frame.imgCell.Width;
        CloneRect.Height := Frame.imgCell.Height;
        CloneRect.Margins.Top := 0;
        CloneRect.Margins.Left := 0;
        CloneRect.Margins.Right := 3;
        CloneRect.Margins.Bottom := 0;
        CloneRect.Position.X := CurrentLeft; // Posi��o horizontal
        CloneRect.Position.Y := 0; // Centralizado verticalmente
        CloneRect.Stroke.Kind := Frame.imgCell.Stroke.Kind;
        CloneRect.Stroke.Color := Frame.imgCell.Stroke.Color;
        CloneRect.Stroke.Thickness := 0;
        CloneRect.Fill.Kind := TBrushKind.Bitmap; // Define o preenchimento como bitmap
        CloneRect.Fill.Bitmap.WrapMode := TWrapMode.TileStretch; // Define o preenchimento como bitmap
        CloneRect.XRadius := 10;
        CloneRect.YRadius := 10;
        CloneRect.Corners := [TCorner.TopLeft, TCorner.BottomLeft];
        CloneRect.SendToBack;

        // Carrega a imagem do banco
        BlobField := ImageQuery.FieldByName('IMAGE') as TBlobField;
        if not BlobField.IsNull then
        begin
          ImageStream := TMemoryStream.Create;
          try
            BlobField.SaveToStream(ImageStream);
            ImageStream.Position := 0;
            CloneRect.Fill.Bitmap.Bitmap.LoadFromStream(ImageStream); // Aplica a imagem
          finally
            ImageStream.Free;
          end;
        end
        else
        begin
          // Caso n�o haja imagem, usa cor padr�o
          CloneRect.Fill.Kind := TBrushKind.Solid;
          CloneRect.Fill.Color := TAlphaColors.Gray;
        end;

        // Ajusta a posi��o para a pr�xima imagem
        CurrentLeft := CurrentLeft + CloneRect.Width + 10; // Margem entre imagens

        ImageQuery.Next;
      end;
    finally
      ImageQuery.Free;
    end;
  finally
    Frame.HorzScrollBoxImagens.EndUpdate; // Atualiza interface
  end;
end;

procedure TTotemPrincipalfrm.AjustarAlturaScrollBox(ScrollBox: TVertScrollBox);
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

  // Ajusta a altura do conte�do para incluir todos os elementos
  ScrollBox.Content.Height := AlturaTotal;
end;

procedure TTotemPrincipalfrm.FormCreate(Sender: TObject);
var
 oIniCaminhos : tinifile;
 lFuncoes : TFuncoesUteis;
 sCaminhoIni, sCaminhoApp  : string;
begin
//  sCaminhoApp := ( ExtractFilePath( ParamStr(0) ) );
//  sCaminhoIni := ( sCaminhoApp + 'caminhos.ini' );
//
//  oIniCaminhos := TIniFile.Create(sCaminhoIni);
//
//  if ( oIniCaminhos.ReadString( 'Caminhos','BD', '' ) <> '' ) then
//  begin
//    ConectMarthi.Params.Database := oIniCaminhos.ReadString( 'Caminhos','BD', '' );
//  end
//  else
//    oIniCaminhos.WriteString( 'Caminhos','BD', '' );

  lFuncoes.ConectaBD_Ini( ConectMarthi, FBLink );

  CarregarDados;
end;

procedure TTotemPrincipalfrm.Rectangle3Click(Sender: TObject);
begin
  Close;
end;

end.
