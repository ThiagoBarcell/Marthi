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
    Label1: TLabel;
    rtgConfigInfo: TRectangle;
    lblInfoArmazenamento: TLabel;
    Label3: TLabel;
    lblInfoCondicao: TLabel;
    lblInfoCor: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblInfoTPPreco: TLabel;
    procedure FormShow(Sender: TObject);
    procedure cbxConfigChange(Sender: TObject);
  private

    lListaInfoProdutos : TObjectList<TModeloProduto>;
    procedure MostraLabels(Mostra: boolean);

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

procedure TAtualizaProdutosFrm.cbxConfigChange(Sender: TObject);
begin
  lblInfoArmazenamento.Text := lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].ArmazenamentoDesc;
  lblInfoCondicao.Text := lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].CondicaoDesc;
  lblInfoCor.Text := lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].CorDesc;
  lblInfoTPPreco.Text := lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].TP_Preco_Desc;

  MostraLabels(True);
end;

constructor TAtualizaProdutosFrm.create(
  lListProd: TObjectList<TModeloProduto>);
begin
  inherited Create(nil); // Sempre chame o construtor da classe pai

  if Assigned(lListProd) then
    lListaInfoProdutos := lListProd;
end;

procedure TAtualizaProdutosFrm.FormShow(Sender: TObject);
var
  lModelProduto : TModeloProduto;
begin
  for lModelProduto in lListaInfoProdutos do
  begin
    cbxConfig.Items.Add( 'Info : ' + lModelProduto.ID.ToString )
  end;

  MostraLabels(False);
end;

procedure TAtualizaProdutosFrm.MostraLabels( Mostra : boolean );
begin
  lblInfoArmazenamento.Visible := Mostra;
  lblInfoCondicao.Visible := Mostra;
  lblInfoCor.Visible := Mostra;
  lblInfoTPPreco.Visible := Mostra;
end;

end.
