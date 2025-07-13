program MarthiMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmProdutos in '..\Forms\frmProdutos.pas' {ProdutosFrm},
  untFuncoesMobile in '..\Forms\untFuncoesMobile.pas',
  Frame.MarthiGIT.Produto in '..\Frames\Frame.MarthiGIT.Produto.pas' {ProdutoFrame: TFrame},
  frmAtualizaProdutos in '..\Forms\frmAtualizaProdutos.pas' {AtualizaProdutosFrm},
  untModeloItemProduto in '..\Classes\untModeloItemProduto.pas',
  GeraisDMFrm in '..\Forms\DataModule\GeraisDMFrm.pas' {frmGeraisDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TProdutosFrm, ProdutosFrm);
  Application.CreateForm(TfrmGeraisDM, frmGeraisDM);
  Application.Run;
end.
