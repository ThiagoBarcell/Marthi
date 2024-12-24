unit Frame.MarthiGIT.Totem;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.ListBox, FMX.Layouts, FMX.TabControl, FMX.Effects;

type
  TFrameTotem = class(TFrame)
    Rectangle4: TRectangle;
    ShadowEffect7: TShadowEffect;
    tbc1: TTabControl;
    TabItem1: TTabItem;
    Layout6: TLayout;
    lst1: TListBox;
    ListBoxImagens: TListBoxItem;
    Layout7: TLayout;
    Layout5: TLayout;
    Rectangle5: TRectangle;
    cbbCapacidade: TComboBox;
    Label5: TLabel;
    Layout4: TLayout;
    Rectangle6: TRectangle;
    cbbCor: TComboBox;
    Label3: TLabel;
    lblNomeItem: TLabel;
    lblValorAVista: TLabel;
    Label7: TLabel;
    lblValorAPrazo: TLabel;
    Rectangle3: TRectangle;
    img2: TImage;
    TabItem4: TTabItem;
    Layout9: TLayout;
    lbl2: TLabel;
    edt1: TEdit;
    lbl3: TLabel;
    edt2: TEdit;
    lbl4: TLabel;
    cbb1: TComboBox;
    lbl5: TLabel;
    cbb2: TComboBox;
    lbl6: TLabel;
    cbb3: TComboBox;
    lbl7: TLabel;
    RoundRect4: TRoundRect;
    ShadowEffect1: TShadowEffect;
    img1: TImage;
    ShadowEffect8: TShadowEffect;
    lbl1: TLabel;
    imgCell: TRectangle;
  private
    { Private declarations }
  public
    procedure PreencherDados(const Nome: string; Imagem: TImage);
    { Public declarations }
  end;

implementation

{$R *.fmx}

{ TFrameTotem }

procedure TFrameTotem.PreencherDados(const Nome: string; Imagem: TImage);
begin
  lblNomeItem.Text := Nome;

  // Se imgCell for um TImage, você pode continuar usando Assign
  // Se for um TRectangle, você deve usar Fill.Bitmap.Assign
  imgCell.Fill.Bitmap.Bitmap.Assign(Imagem);  // imgCell aqui assume que é um TImage

  // Ou se estiver usando um TRectangle:
  // imgCell.Fill.Bitmap.Assign(Imagem); // imgCell sendo um TRectangle
end;

end.
