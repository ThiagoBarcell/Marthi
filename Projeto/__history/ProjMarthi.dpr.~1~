program ProjTotem;

uses
  Vcl.Forms,
  CadProdutosFrm in '..\Forms\CadProdutosFrm.pas' {frmCadProdutos},
  GeralDMFrm in '..\Forms\DataModules\GeralDMFrm.pas' {frmGeralDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
  Application.CreateForm(TfrmGeralDM, frmGeralDM);
  Application.Run;
end.
