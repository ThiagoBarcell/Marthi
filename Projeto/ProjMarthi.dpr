program ProjMarthi;

uses
  Vcl.Forms,
  CadProdutosFrm in '..\Forms\CadProdutosFrm.pas' {frmCadProdutos},
  GeralDMFrm in '..\Forms\DataModules\GeralDMFrm.pas' {frmGeralDM: TDataModule},
  untFuncoes in '..\Forms\untFuncoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGeralDM, frmGeralDM);
  Application.CreateForm(TfrmCadProdutos, frmCadProdutos);
  Application.Run;
end.
