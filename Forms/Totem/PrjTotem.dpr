program PrjTotem;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmTotemPrincipal in 'frmTotemPrincipal.pas' {TotemPrincipalfrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTotemPrincipalfrm, TotemPrincipalfrm);
  Application.Run;
end.
