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
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    Rectangle4: TRectangle;
    ShadowEffect7: TShadowEffect;
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
    TabControl2: TTabControl;
    TabItem1: TTabItem;
    TabItem4: TTabItem;
    imgCell: TImage;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Layout4: TLayout;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Layout5: TLayout;
    ComboBox2: TComboBox;
    Label5: TLabel;
    Rectangle3: TRectangle;
    Image5: TImage;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Layout6: TLayout;
    ConectMarthi: TFDConnection;
    qryCadCell: TFDQuery;
    qryCadCellCELL_ID: TIntegerField;
    qryCadCellCELL_MARCA: TIntegerField;
    qryCadCellCELL_DESC: TStringField;
    qryCadCellCELL_PROCESSAMENTO: TStringField;
    qryCadCellCELL_MEM_RAM: TStringField;
    qryCadCellCELL_ARMAZENAMENTO: TIntegerField;
    qryCadCellCELL_CAM_PRINC: TStringField;
    qryCadCellCELL_CAM_FRONT: TStringField;
    qryCadCellCELL_COR: TStringField;
    qryCadCellCELL_OBS: TStringField;
    qryCadCellCELL_VALOR_UNITARIO: TFMTBCDField;
    qryCadCellCELL_VALOR_PARCELADO: TFMTBCDField;
    qryCadCellDAT_CAD: TDateField;
    qryCadCellDAT_ALT: TDateField;
    qryImagensCell: TFDQuery;
    qryImagensCellCELL_ID: TIntegerField;
    qryImagensCellSEQUENCIA: TIntegerField;
    qryImagensCellIMAGE: TBlobField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldBitmap: TLinkPropertyToField;
    lytGlobal: TLayout;
    lytToten: TLayout;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Layout7: TLayout;
    Layout8: TLayout;
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
  private
    { Private declarations }
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

end.
