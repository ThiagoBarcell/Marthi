program PrjTotem;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmTotemPrincipal in 'frmTotemPrincipal.pas' {TotemPrincipalfrm},
  GeralDMFrm in '..\DataModules\GeralDMFrm.pas' {frmGeralDM: TDataModule},
  Frame.MarthiGIT.Totem in 'Frame.MarthiGIT.Totem.pas' {FrameTotem: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTotemPrincipalfrm, TotemPrincipalfrm);
  Application.CreateForm(TfrmGeralDM, frmGeralDM);
  Application.Run;
end.
