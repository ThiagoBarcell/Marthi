unit untFuncoes;

interface

uses
  System.IniFiles,
  System.SysUtils,
  FireDAC.Comp.Client, FireDAC.Phys.FB;

type TFuncoesUteis = class

public
  //Procedures
  procedure AbreQrysInfo( lQryArmazenamento, lQryCondicao, lQryCor : TFDQuery );
  Procedure ConectaBD_Ini( lConexao : TFDConnection; lLinkFB : TFDPhysFBDriverLink );

private

end;

implementation
{ TFuncoesUteis }

procedure TFuncoesUteis.AbreQrysInfo( lQryArmazenamento, lQryCondicao, lQryCor : TFDQuery );
begin
  lQryArmazenamento.Close;
  lQryArmazenamento.Open;
  lQryCondicao.Close;
  lQryCondicao.Open;
  lQryCor.Close;
  lQryCor.Open;
end;

Procedure TFuncoesUteis.ConectaBD_Ini( lConexao : TFDConnection; lLinkFB : TFDPhysFBDriverLink );
var
 oIniCaminhos: tinifile;
 sCaminhoIni: string;
 sCaminhoApp: string;

 lDataBase: string;
 lServer: string;
 lPorta: string;
 lParams : string;

begin
  sCaminhoApp := ( ExtractFilePath( ParamStr(0) ) );
  sCaminhoIni := ( sCaminhoApp + 'caminhos.ini' );

  oIniCaminhos := TIniFile.Create(sCaminhoIni);

  //Verifica o caminho do banco
  if ( oIniCaminhos.ReadString( 'Caminhos','BD', '' ) <> '' ) then
  begin
    lDataBase := oIniCaminhos.ReadString( 'Caminhos','BD', '' );
  end
  else
    oIniCaminhos.WriteString( 'Caminhos','BD', '' );

  //Verifica o caminho do banco
  if ( oIniCaminhos.ReadString( 'Caminhos','Server', '' ) <> '' ) then
  begin
    lServer := oIniCaminhos.ReadString( 'Caminhos','Server', '' );
  end
  else
    oIniCaminhos.WriteString( 'Caminhos','Server', '' );

  //Verifica o caminho do banco
  if ( oIniCaminhos.ReadString( 'Caminhos','Porta', '' ) <> '' ) then
  begin
    lPorta := oIniCaminhos.ReadString( 'Caminhos','Porta', '' );
  end
  else
    oIniCaminhos.WriteString( 'Caminhos','Porta', '' );

  if ( oIniCaminhos.ReadString( 'Caminhos','DLL', '' ) <> '' ) then
  begin
    lLinkFB.VendorLib := oIniCaminhos.ReadString( 'Caminhos','DLL', '' );
  end
  else
    oIniCaminhos.WriteString( 'Caminhos','DLL', '' );

  lParams := ( 'User_Name=SYSDBA' + sLineBreak +
  'Password=masterkey' + sLineBreak +
  'Server=' + lServer + sLineBreak +
  'Port='+ lPorta + sLineBreak +
  'Database=' + lDataBase + sLineBreak +
  'Protocol=TCPIP'+ sLineBreak +
  'DriverID=FB' );

  lConexao.Params.Text := lParams;

end;

end.
