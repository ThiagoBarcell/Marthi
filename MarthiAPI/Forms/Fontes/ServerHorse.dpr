program ServerHorse;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.Jhonson,
  Controller.Cliente in 'Controller\Controller.Cliente.pas',
  Model.Connection in 'Model\Model.Connection.pas',
  Model.Cliente in 'Model\Model.Cliente.pas';

begin
    THorse.Use(Jhonson());

    Controller.Cliente.Registry;
    //Controller.Produto.Registry;
    //Controller.Usuario.Registry;

    THorse.Listen(9000);
end.
