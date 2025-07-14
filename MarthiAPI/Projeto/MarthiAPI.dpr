program MarthiAPI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  Horse.Logger,
  Horse.Logger.Provider.Console,
  frmModeloProdutos in '..\Forms\Model\frmModeloProdutos.pas',
  frmController in '..\Forms\Controller\frmController.pas',
  frmModeloConnection in '..\Forms\Model\frmModeloConnection.pas',
  untFuncoes in '..\..\Forms\untFuncoes.pas',
  MarthiConstantes in '..\..\Forms\MarthiConstantes.pas';

begin
  Writeln( 'API Marthi Tec' );

  THorse.Use(Jhonson());

  THorseLoggerManager.RegisterProvider(THorseLoggerProviderConsole.New());

  THorse.Use(THorseLoggerManager.HorseCallback);

  frmController.Registry;

  THorse.Listen(9000);
end.
