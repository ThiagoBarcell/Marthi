unit untFuncoesMobile;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.UI.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.FMXUI.Wait;

type
  TFuncoesMobile = Class

  public

  //Procedures


  //Functions
  function ConectarBD ( lConexao : TFDConnection; lServer, lDataBase : string ): boolean;

  End;

implementation

{ TFuncoesMobile }

function TFuncoesMobile.ConectarBD( lConexao : TFDConnection; lServer, lDataBase : string ): boolean;
var
  lParams : string;
begin
  Result := False;
  try
    lParams := ( 'User_Name=SYSDBA' + sLineBreak +
    'Password=masterkey' + sLineBreak +
    'Server=' + lServer + sLineBreak +
    'Port=3050' + sLineBreak +
    'Database=' + lDataBase + sLineBreak +
    'Protocol=TCPIP'+ sLineBreak +
    'DriverID=FB' );

    lConexao.Params.Text := lParams;
    lConexao.Connected := True;
    Result := True;
  except
    Result := False;
  end;
end;


end.
