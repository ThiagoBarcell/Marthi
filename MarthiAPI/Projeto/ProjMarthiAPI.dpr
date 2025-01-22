program ProjMarthiAPI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  frmModeloProdutos in '..\Forms\Model\frmModeloProdutos.pas',
  frmController in '..\Forms\Controller\frmController.pas',
  frmModeloConnection in '..\Forms\Model\frmModeloConnection.pas';

begin
  THorse.Use(Jhonson());

  frmController.Registry;

  THorse.Listen(9000);
end.
