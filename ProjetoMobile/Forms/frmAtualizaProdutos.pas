unit frmAtualizaProdutos;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects,
  Data.DB,
  Datasnap.DBClient,
  untModeloItemProduto,
  System.Generics.Collections,
  FMX.ListBox;

type
  TAtualizaProdutosFrm = class(TForm)
    rtgPrincipal: TRectangle;
    rtgButtons: TRectangle;
    rtgBtnAtualizarValores: TRectangle;
    Rectangle1: TRectangle;
    rtgImageProd: TRectangle;
    Rectangle2: TRectangle;
    lblConf: TLabel;
    rtgConfiguracoes: TRectangle;
    cbxConfig: TComboBox;
    procedure FormShow(Sender: TObject);
  private
    lListaInfoProdutos : TObjectList<TModeloProduto>;

    { Private declarations }
  public
    { Public declarations }
    constructor create( lListProd : TObjectList<TModeloProduto> );
  end;

var
  AtualizaProdutosFrm: TAtualizaProdutosFrm;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}

{ TAtualizaProdutosFrm }

constructor TAtualizaProdutosFrm.create(
  lListProd: TObjectList<TModeloProduto>);
begin
  inherited Create(nil); // Sempre chame o construtor da classe pai

  if Assigned(lListProd) then
    lListaInfoProdutos := lListProd
end;

procedure TAtualizaProdutosFrm.FormShow(Sender: TObject);
var
  lModelProduto : TModeloProduto;
begin
  for lModelProduto in lListaInfoProdutos do
  begin
    cbxConfig.Items.Add( lModelProduto.CorDesc )
  end;
end;

end.
