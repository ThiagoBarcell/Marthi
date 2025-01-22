program MarthiMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmProdutos in '..\Forms\frmProdutos.pas' {ProdutosFrm},
  untFuncoesMobile in '..\Forms\untFuncoesMobile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TProdutosFrm, ProdutosFrm);
  Application.Run;
end.
