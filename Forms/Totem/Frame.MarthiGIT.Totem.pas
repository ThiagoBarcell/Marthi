unit Frame.MarthiGIT.Totem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.ListBox, FMX.Layouts, FMX.TabControl, FMX.Effects,
  FireDAC.Comp.Client, FMX.Colors, FMX.ComboEdit, FMX.Filter.Effects;

type
  TFrameTotem = class(TFrame)
    RecFrame: TRectangle;
    tbcTotem: TTabControl;
    TabTotemPrincipal: TTabItem;
    Layout6: TLayout;
    Layout7: TLayout;
    lytCapacidade: TLayout;
    Rectangle5: TRectangle;
    cbbCapacidade: TComboBox;
    Label5: TLabel;
    lytCor: TLayout;
    Rectangle6: TRectangle;
    cbbCor: TComboBox;
    Label3: TLabel;
    lblNomeItem: TLabel;
    TabTotemCliente: TTabItem;
    Layout9: TLayout;
    lblTITULOCEL: TLabel;
    edtNomeCli: TEdit;
    lbl3: TLabel;
    edtTelCli: TEdit;
    lbl4: TLabel;
    lbl6: TLabel;
    imgCell: TRectangle;
    HorzScrollBoxImagens: THorzScrollBox;
    edtValorTel: TEdit;
    edtCorTel: TEdit;
    Label1: TLabel;
    edtCapacidadeTel: TEdit;
    Label2: TLabel;
    btnComprar: TRectangle;
    Label8: TLabel;
    Rectangle1: TRectangle;
    Label6: TLabel;
    Layout1: TLayout;
    lytRetirada: TLayout;
    Rectangle2: TRectangle;
    cbbRetirada: TComboBox;
    Label4: TLabel;
    lblValorAPrazo: TLabel;
    lblValorAVista: TLabel;
    Label7: TLabel;
    ShadowEffect1: TShadowEffect;
    Rectangle3: TRectangle;
    btnEnviaWhatsapp: TRectangle;
    img1: TImage;
    lbl1: TLabel;
    StyleBook1: TStyleBook;
    Layout2: TLayout;
    Rectangle7: TRectangle;
    Label9: TLabel;
    cbbMododePagamento: TComboBox;
    Layout3: TLayout;
    Rectangle8: TRectangle;
    Layout4: TLayout;
    Label10: TLabel;
    cbbParcelas: TComboBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    CELL_ID: TLabel;
    CELL_MARCA: TLabel;
    CircDireita: TCircle;
    CircEsquerda: TCircle;
    TOT_IMAGEM: TLabel;
    lblTOT_WIDTH: TLabel;
    procedure btnComprarClick(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure cbbMododePagamentoChange(Sender: TObject);
  private
    { Private declarations }
  public
    procedure PreencherDados(const Nome: string; Imagem: TImage);
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TFrameTotem }

procedure TFrameTotem.cbbMododePagamentoChange(Sender: TObject);
begin
  if cbbMododePagamento.ItemIndex = 0 then
  begin
    // À Vista
    cbbParcelas.Enabled := False;
    edtValorTel.Text := lblValorAVista.Text;
  end
  else if cbbMododePagamento.ItemIndex = 1 then
  begin
    // Parcelado
    cbbParcelas.Enabled := True;
    cbbParcelas.ItemIndex := 0;
    edtValorTel.Text := '1 X ' + lblValorAVista.Text;
  end;
end;

procedure TFrameTotem.PreencherDados(const Nome: string; Imagem: TImage);
begin
  lblNomeItem.Text := Nome;
  imgCell.Fill.Bitmap.Bitmap.Assign(Imagem);  
end;

procedure TFrameTotem.Rectangle1Click(Sender: TObject);
begin
  tbcTotem.ActiveTab := TabTotemPrincipal;
end;

procedure TFrameTotem.btnComprarClick(Sender: TObject);
begin
  try
    edtCorTel.Text := cbbCor.Items[cbbCor.ItemIndex];
    edtValorTel.Text := lblValorAVista.Text;
    edtCapacidadeTel.Text := cbbCapacidade.Items[cbbCapacidade.ItemIndex];
    lblTITULOCEL.Text := lblNomeItem.Text;
    tbcTotem.ActiveTab := TabTotemCliente;
  except
    on E: Exception do
    MessageDlg('Falha no envio dos dados!', TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
  end;
end;

end.
