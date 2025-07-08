program Marthi.Principal.prj;

uses
  System.StartUpCopy,
  FMX.Forms,
  Marthi.Principal.frm in 'Marthi.Principal.frm.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
