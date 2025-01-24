program MarthiMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmProdutos in '..\Forms\frmProdutos.pas' {ProdutosFrm},
  untFuncoesMobile in '..\Forms\untFuncoesMobile.pas',
  Frame.MarthiGIT.Produto in '..\Frames\Frame.MarthiGIT.Produto.pas' {ProdutoFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TProdutosFrm, ProdutosFrm);
  Application.Run;
end.
