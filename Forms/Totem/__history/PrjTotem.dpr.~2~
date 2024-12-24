program PrjTotem;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmTotemPrincipal in 'frmTotemPrincipal.pas' {TotemPrincipalfrm},
  GeralDMFrm in '..\DataModules\GeralDMFrm.pas' {frmGeralDM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTotemPrincipalfrm, TotemPrincipalfrm);
  Application.CreateForm(TfrmGeralDM, frmGeralDM);
  Application.Run;
end.
