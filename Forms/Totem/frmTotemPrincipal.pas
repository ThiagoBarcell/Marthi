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
  Frame.MarthiGIT.Totem, Winapi.Windows;

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
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    lytGlobal: TLayout;
    lytToten: TLayout;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Layout8: TLayout;
    lstCelulares: TListBox;
    ListCelularItem: TListBoxItem;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField1: TLinkFillControlToField;
    BindSourceDB3: TBindSourceDB;
    qryCadCellCELL_ID: TIntegerField;
    qryCadCellCELL_DESC: TStringField;
    qryCadCellCOR_DESC: TStringField;
    qryCadCellARMAZENAMENTO_DESC: TStringField;
    qryCadCellIMAGE: TBlobField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarDados;
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
  Rectangle: TRectangle;
  BlobField: TBlobField;
begin
  // Limpa os componentes existentes no VertScrollBox
  while VertScrollBox1.Content.ControlsCount > 0 do
    VertScrollBox1.Content.Controls[0].Free;

  // Percorre os dados da query
  BindSourceDB3.DataSet.First;
  while not BindSourceDB3.DataSet.Eof do
  begin
    // Cria uma instância do frame
    Frame := TFrameTotem.Create(VertScrollBox1);
    Frame.Parent := VertScrollBox1;
    Frame.Align := TAlignLayout.Top;
    Frame.Margins.Top := 5;
    Frame.Margins.Bottom := 5;

    // Cria um TRectangle para exibir a imagem
    Rectangle := TRectangle.Create(Frame);
    Rectangle.Parent := Frame;
    Rectangle.Align := TAlignLayout.Top;
    Rectangle.Height := 100; // Ajuste conforme necessário

    // Acessa o campo BLOB
    BlobField := BindSourceDB3.DataSet.FieldByName('IMAGE') as TBlobField;

    // Cria o stream e carrega o BLOB
    LStream := TMemoryStream.Create;
    try
      // Carrega os dados do BLOB para o stream
      BlobField.GetData(LStream);
      LStream.Position := 0;

      // Aplica o stream ao Bitmap do TRectangle
      Rectangle.Fill.Bitmap.Bitmap.LoadFromStream(LStream);
    finally
      LStream.Free;
    end;

    // Passa para o próximo registro
    BindSourceDB3.DataSet.Next;
  end;
end;

procedure TTotemPrincipalfrm.FormCreate(Sender: TObject);
begin
  CarregarDados;
end;

end.
