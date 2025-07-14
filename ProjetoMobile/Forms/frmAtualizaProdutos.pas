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
  FMX.ListBox,
  FMX.Edit,
  FMX.EditBox,
  FMX.NumberBox,
  IdHTTP,
  System.JSON,
  System.Messaging,
  FMX.DialogService;

type
  TAtualizaProdutosFrm = class(TForm)
    rtgPrincipal: TRectangle;
    rtgButtons: TRectangle;
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
    lblTituloProd: TLabel;
    btnFechar: TSpeedButton;
    btnSalvar: TSpeedButton;
    Label2: TLabel;
    cbxValUnit: TNumberBox;
    procedure FormShow(Sender: TObject);
    procedure cbxConfigChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private

    lListaInfoProdutos : TObjectList<TModeloProduto>;
    procedure MostraLabels(Mostra: boolean);
    procedure EnviarAtualizacaoPreco;
    procedure SalvarInfo;

    { Private declarations }
  public
    { Public declarations }
    fIP_Atual : string;

    constructor create( lListProd : TObjectList<TModeloProduto> );
  end;

var
  AtualizaProdutosFrm: TAtualizaProdutosFrm;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}
{$R *.XLgXhdpiTb.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}

{ TAtualizaProdutosFrm }

procedure TAtualizaProdutosFrm.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TAtualizaProdutosFrm.btnSalvarClick(Sender: TObject);
begin
  EnviarAtualizacaoPreco;
end;

procedure TAtualizaProdutosFrm.SalvarInfo;
var
  lAtualizaProd : TIdHTTP;
  lJSONObject : TJSONObject;
  JsonStr: TStringStream;
  Response: string;
begin
  lJSONObject := TJSONObject.Create;
  try
    lJSONObject.AddPair( 'cell_id', TJSONNumber.Create( lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].CellID ) );
    lJSONObject.AddPair( 'item_id',TJSONNumber.Create( lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].ID ) );
    lJSONObject.AddPair( 'item_parcela',TJSONNumber.Create(lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].Cell_Parcelas ) );
    lJSONObject.AddPair( 'tp_preco', TJSONNumber.Create( lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].TP_Preco_ID ) );
    lJSONObject.AddPair( 'val_unit', TJSONNumber.Create( StrToFloat( cbxValUnit.Text ) ) );

     // Converte para string stream com encoding UTF-8
    JsonStr := TStringStream.Create(lJSONObject.ToJSON, TEncoding.UTF8);

    try
      lAtualizaProd := TIdHTTP.Create(nil);
      try
        lAtualizaProd.Request.ContentType := 'application/json';
        Response := lAtualizaProd.Post('http://' + fIP_Atual + '/produtos/atualizapreco', JsonStr) ;
      finally
        lAtualizaProd.Free;
      end;
    finally
      JsonStr.Free;
    end;
  finally
    lJSONObject.Free;
    ModalResult := mrOk;
    TDialogService.ShowMessage( 'Produto atualizado com sucesso!' );
    Close;
  end;
end;


procedure TAtualizaProdutosFrm.cbxConfigChange(Sender: TObject);
begin
  lblInfoArmazenamento.Text := lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].ArmazenamentoDesc;
  lblInfoCondicao.Text := lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].CondicaoDesc;
  lblInfoCor.Text := lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].CorDesc;
  lblInfoTPPreco.Text := lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].TP_Preco_Desc;
  cbxValUnit.Text := lListaInfoProdutos.Items[ cbxConfig.ItemIndex ].Cell_Val_Unit.ToString;

  MostraLabels(True);
end;

procedure TAtualizaProdutosFrm.EnviarAtualizacaoPreco;
begin
  TDialogService.MessageDialog(
    'Deseja realmente atualizar o preço do produto?',
    TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
    TMsgDlgBtn.mbNo,        // Botão padrão
    procedure(const AResult: TModalResult)
    begin
      if AResult = mrYes then
      begin
        // Executa seu código de envio
        SalvarInfo;
      end;
    end
  );
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
    cbxConfig.Items.Add( lModelProduto.ArmazenamentoDesc + ' - ' +
      lModelProduto.CorDesc + ' - ' + lModelProduto.TP_Preco_Desc )
  end;

  lblTituloProd.Text := lModelProduto.ProdDesc;

  cbxValUnit.Value := 0;

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
