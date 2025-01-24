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
  FireDAC.FMXUI.Wait,
  System.JSON,
  Soap.EncdDecd;

type
  TFuncoesMobile = Class
  private
    function LoadImageFromBase64(const JSONResponse: string): TMemoryStream;

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

function TFuncoesMobile.LoadImageFromBase64(const JSONResponse: string): TMemoryStream;
var
  JSONArr: TJSONArray;
  JSONObject: TJSONObject;
  Base64String: string;
  MemoryStream: TMemoryStream;
begin
  JSONArr := TJSONObject.ParseJSONValue(JSONResponse) as TJSONArray;
  try
    if (JSONArr <> nil) and (JSONArr.Count > 0) then
    begin
      // Acessa o primeiro objeto do JSON
      JSONObject := JSONArr.Items[0] as TJSONObject;
      Base64String := JSONObject.GetValue<string>('image');

      // Decodifica a string Base64 para um stream de memória
      MemoryStream := TMemoryStream.Create;
      try
        MemoryStream.LoadFromStream(TBytesStream.Create(DecodeBase64(Base64String)));
        MemoryStream.Position := 0;

        // Carrega a imagem no TImage
        //ImageComponent.Picture.LoadFromStream(MemoryStream);
      finally
        //MemoryStream.Free;
      end;
    end;
  finally
    JSONArr.Free;
  end;
end;


end.
