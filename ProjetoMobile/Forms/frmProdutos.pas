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
  Data.FMTBcd;

type
  TProdutosFrm = class(TForm)
    pnlTop: TPanel;
    Brush: TBrushObject;
    memProdutos: TFDMemTable;
    memProdutosPROD_ID: TIntegerField;
    memProdutosPROD_DESC: TStringField;
    memProdutosPROD_VAL: TCurrencyField;
    btnConfiguracoes: TButton;
    tabPrincipal: TTabControl;
    tabProdutos: TTabItem;
    TabItem1: TTabItem;
    cntMarthi: TFDConnection;
    edtPathDB: TEdit;
    edtServerDB: TEdit;
    lblTitulo: TLabel;
    btnConnectar: TButton;
    rtgConfiguracoes: TRectangle;
    rtgProdutos: TRectangle;
    imgGerais: TImageList;
    Image1: TImage;
    RoundRect1: TRoundRect;
    RoundRect2: TRoundRect;
    Cad_cellTable: TSQLDataSet;
    procedure btnConnectarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
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

procedure TProdutosFrm.btnConnectarClick(Sender: TObject);
begin
  if not ( lFuncoes.ConectarBD( cntMarthi, edtServerDB.Text, edtPathDB.Text ) ) then
    ShowMessage( 'Não foi possível conectar no banco de dados' );
end;

procedure TProdutosFrm.FormCreate(Sender: TObject);
begin
  lFuncoes := TFuncoesMobile.Create;
end;

end.
