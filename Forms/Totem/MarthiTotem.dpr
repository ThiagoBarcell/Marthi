program MarthiTotem;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmTotemPrincipal in 'frmTotemPrincipal.pas' {TotemPrincipalfrm},
  GeralDMFrm in '..\DataModules\GeralDMFrm.pas' {frmGeralDM: TDataModule},
  Frame.MarthiGIT.Totem in 'Frame.MarthiGIT.Totem.pas' {FrameTotem: TFrame},
  untFuncoes in '..\untFuncoes.pas',
  MyVirtualKeyboard in 'MyVirtualKeyboard.pas',
  Marthi.PedeSenha in 'Marthi.PedeSenha.pas' {frmPedeSenhaMarthi};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmGeralDM, frmGeralDM);
  Application.CreateForm(TTotemPrincipalfrm, TotemPrincipalfrm);
  Application.Run;
end.
