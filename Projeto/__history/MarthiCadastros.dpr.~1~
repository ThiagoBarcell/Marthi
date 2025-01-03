program ProjMarthi;

uses
  Vcl.Forms,
  CadProdutosFrm in '..\Forms\CadProdutosFrm.pas' {frmCadProdutos},
  GeralDMFrm in '..\Forms\DataModules\GeralDMFrm.pas' {frmGeralDM: TDataModule},
  untFuncoes in '..\Forms\untFuncoes.pas',
  CadInformarcoesFrm in '..\Forms\CadInformarcoesFrm.pas' {frmCadInformacoes},
  CadConfiguracoesFrm in '..\Forms\CadConfiguracoesFrm.pas' {frmConfiguracoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGeralDM, frmGeralDM);
  Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
  Application.Run;
end.
