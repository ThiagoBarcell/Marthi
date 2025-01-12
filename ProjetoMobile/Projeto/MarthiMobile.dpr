program MarthiMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmProdutos in '..\Forms\frmProdutos.pas' {ProdutosFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TProdutosFrm, ProdutosFrm);
  Application.Run;
end.
