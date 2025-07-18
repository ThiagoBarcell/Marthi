unit untFuncoes;

interface

uses
  System.SysUtils,
  System.IniFiles,
  System.Variants,
  System.Math,
  System.Net.URLClient,
  System.Net.HttpClient,
  System.Net.HttpClientComponent,
  System.NetEncoding,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Phys.FB,
  REST.Types,
  REST.Client,
  Data.DB,
  FireDAC.Stan.Param;

type
  TFuncoesUteis = class
  private
    function IIF(ACondition: Boolean; const ATrue, AFalse: Variant): Variant;
public
  //Procedures
  procedure AbreQrysInfo( lQryArmazenamento, lQryCondicao, lQryCor, lQryTpPreco : TFDQuery );
  Procedure ConectaBD_Ini( lConexao : TFDConnection; lLinkFB : TFDPhysFBDriverLink );
  procedure EnviarMsgWhatsApp(sAPIKEYEMP, sTelefoneFrom, sTelefoneTo: String; sMensagem: WideString; sCaminhoAnexo: String; lEviarMensagemPDF: Boolean; out StatusCode: Integer);
  procedure ReplicaCelular(lQryCell: TFDQuery; lConnectionBD : TFDConnection );
  Procedure CriaParcelas( lConexao: TFDConnection; lCellID, lItemID, lTpPreco : Integer ; lValUnitario : Double);
  procedure PCDestroyQuery( oQuery : array of TFDQuery );
  Procedure PCUpdatePadrao( aTables, aFieldUpd, aFieldAnd : Array of string; aValueUpd, aValueAnd : Array of variant );
  Procedure PCUpdateOrInsertPadrao( aTables, aFieldIns : Array of string; aValueIns : Array of variant );
  procedure AtualizaPrecoItem( lConexao: TFDConnection; pCellID, pItemID: Integer;
  pValUnit, pValParc : double);

  //Functions
  function CriaQuery ( Conexao : TFDConnection ): TFDQuery;
  function NextID( lGenerator : string; lConexaoBD : TFDConnection ) : Integer;
  function CalculaParcela( lConexao: TFDConnection; lParcelas : Integer; lValorTot : Double ): Double;
  function FCCreateQuery: TFDQuery;

end;

var
  MarthiConection: TFDConnection;

implementation
{ TFuncoesUteis }

procedure TFuncoesUteis.AbreQrysInfo( lQryArmazenamento, lQryCondicao, lQryCor, lQryTpPreco : TFDQuery );
begin
  lQryArmazenamento.Close;
  lQryArmazenamento.Open;
  lQryCondicao.Close;
  lQryCondicao.Open;
  lQryCor.Close;
  lQryCor.Open;
  lQryTpPreco.Close;
  lQryTpPreco.Open;
end;

Procedure TFuncoesUteis.CriaParcelas( lConexao: TFDConnection; lCellID, lItemID, lTpPreco : Integer ;
  lValUnitario : Double);
var
  lQryConsultaParc : TFDQuery;
  lQryInsValParc : TFDQuery;
  lQryDelValParc : TFDQuery;
begin
  lQryConsultaParc := CriaQuery( lConexao );
  lQryInsValParc := CriaQuery( lConexao );
  lQryDelValParc := CriaQuery( lConexao );
  try
    //Limpa a tabela do campo espec�fico primeiro
    lQryDelValParc.Close;
    lQryDelValParc.SQL.Clear;
    lQryDelValParc.SQL.Add( ' DELETE FROM CELL_VAL_ITENS_PARC ' +
      ' WHERE CELL_ID = ' + IntToStr( lCellID ) +
      ' AND ITEM_ID = ' + IntToStr( lItemID ) );
    lQryDelValParc.ExecSQL;

    lQryInsValParc.SQL.Clear;
    lQryInsValParc.SQL.Add( ' INSERT INTO CELL_VAL_ITENS_PARC (CELL_VAL_ITENS_PARC_ID, CELL_ID, ' +
      ' ITEM_ID, CELL_TP_PRECO, CELL_PARCELA, CELL_VAL_PARCELA) ' +
      ' VALUES ( :CELL_VAL_ITENS_PARC_ID , :CELL_ID, :ITEM_ID , :CELL_TP_PRECO, ' +
      ' :CELL_PARCELA, :CELL_VAL_PARCELA) ' );

    lQryConsultaParc.Close;
    lQryConsultaParc.SQL.Clear;
    lQryConsultaParc.SQL.Add( ' SELECT * FROM CELL_TAB_PRECOS ' );
    lQryConsultaParc.Open;

    //Se a tabela est� preenchida corretamente
    if not ( lQryConsultaParc.IsEmpty ) then
    begin
      //Seta o primeiro registro da tabela
      lQryConsultaParc.First;
      while not lQryConsultaParc.Eof do
      begin
        lQryInsValParc.Close;
        lQryInsValParc.ParamByName( 'CELL_VAL_ITENS_PARC_ID' ).AsInteger := NextID( 'GEN_CELL_VAL_ITENS_PARC_ID', lConexao );
        lQryInsValParc.ParamByName( 'CELL_ID' ).AsInteger := lCellID;
        lQryInsValParc.ParamByName( 'ITEM_ID' ).AsInteger := lItemID;
        lQryInsValParc.ParamByName( 'CELL_TP_PRECO' ).AsInteger := lTpPreco;
        lQryInsValParc.ParamByName( 'CELL_PARCELA' ).AsInteger := lQryConsultaParc.FieldByName( 'CELL_PARCELAS' ).AsInteger;
        lQryInsValParc.ParamByName( 'CELL_VAL_PARCELA' ).AsFloat := CalculaParcela( lConexao, lQryConsultaParc.FieldByName( 'CELL_PARCELAS' ).AsInteger, lValUnitario );
        lQryInsValParc.ExecSQL;

        lQryConsultaParc.Next;
      end;
    end;
  finally
    lQryConsultaParc.Free;
    lQryInsValParc.Free;
  end;
end;

function TFuncoesUteis.CalculaParcela( lConexao: TFDConnection; lParcelas : Integer;
  lValorTot : Double ): Double;
var
  lQryParcelas : TFDQuery;
  lValorParc : Double;
  lPorcentagem : Double;
  lValorGeralTotal : Double;
  lValorGetalParcela : Double;
begin
  lQryParcelas := CriaQuery( lConexao );
  try
    lQryParcelas.Close;
    lQryParcelas.SQL.Clear;
    lQryParcelas.SQL.Add( ' SELECT * FROM CELL_TAB_PRECOS ' +
      ' WHERE CELL_PARCELAS = ' + IntToStr( lParcelas ) );
    lQryParcelas.Open;

    if not( lQryParcelas.IsEmpty ) then
    begin
      lPorcentagem := lQryParcelas.FieldByName( 'CELL_VAL_PORC' ).AsFloat;
      lValorParc := lValorTot * ( lPorcentagem / 100 );
      lValorGeralTotal := lValorTot + lValorParc;
      lValorGetalParcela := Trunc( lValorGeralTotal / lParcelas );
    end
    else
    lValorGetalParcela := 0;

    Result := lValorGetalParcela;
  finally
    lQryParcelas.Free;
  end;
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

  MarthiConection := lConexao;

end;

function TFuncoesUteis.CriaQuery( Conexao : TFDConnection ): TFDQuery;
var
  lQry : TFDQuery;
begin
  lQry := TFDQuery.Create(nil);
  lQry.Connection := Conexao;
  Result := lQry;
end;

procedure TFuncoesUteis.EnviarMsgWhatsApp(sAPIKEYEMP, sTelefoneFrom, sTelefoneTo: String; sMensagem: WideString; sCaminhoAnexo: String; lEviarMensagemPDF: Boolean; out StatusCode: Integer);
var
  inStream       : TStream;
  outStream      : TStream;
  StringList     : TStringList;
  sNomeArquivo   : String;
  sExtArquivo    : String;
  sURLBase       : String;
  sCaminhoBase64 : String;
  sRESTClient    : TRESTClient;
  sRESTRequest   : TRESTRequest;
  sRESTResponse  : TRESTResponse;

begin

  //sTelefoneFrom := StrSuprime( Trim( sTelefoneFrom ), ' <>:?,.;/^~{}[]"!@#$%�&*()_-+=|\QWERTYUIOPASDFGHJKL�ZXCVBNM' );
  //sTelefoneTo   := StrSuprime( Trim( sTelefoneTo ), ' <>:?,.;/^~{}[]"!@#$%�&*()_-+=|\QWERTYUIOPASDFGHJKL�ZXCVBNM' );

  if( Trim( sTelefoneFrom ) <> '' ) and
    ( Trim( sTelefoneTo ) <> ''   )then
  try

    sURLBase := 'https://app.whatsgw.com.br/api/WhatsGw/Send';

    sRESTClient   := TRESTClient.Create( sURLBase );
    sRESTRequest  := TRESTRequest.Create( sRESTClient );
    sRESTResponse := TRESTResponse.Create( sRESTClient );
    StringList    := TStringList.Create;

    if( Trim( sCaminhoAnexo ) <> '' )then
    begin

      sExtArquivo    := ExtractFileExt( sCaminhoAnexo );
      sCaminhoBase64 := ExtractFilePath( sCaminhoAnexo ) + ChangeFileExt( ExtractFileName( sCaminhoAnexo ), EmptyStr ) + '.txt';

      try

        inStream := TFileStream.Create( sCaminhoAnexo, fmOpenRead);

        try

          outStream := TFileStream.Create( sCaminhoBase64, fmCreate );

          TNetEncoding.Base64.Encode( inStream, outStream );

        finally

          FreeAndNil( outStream );

        end;

      finally

        FreeAndNil( inStream );

      end;

      sNomeArquivo := ChangeFileExt( ExtractFileName( sCaminhoAnexo ), EmptyStr );
      StringList.LoadFromFile( sCaminhoBase64 );

    end;

    //Parametros RestRequest
    sRESTRequest.Client   := sRESTClient;
    sRESTRequest.Response := sRESTResponse;
    sRESTRequest.Accept   := 'application/json;q=0.9,text/plain;q=0.9,text/html';
    sRESTRequest.Method   := rmPOST;

    //Parametros RestClient
    sRESTClient.AcceptCharset       := 'UTF-8';
    sRESTClient.Accept              := 'application/json;q=0.9,text/plain;q=0.9,text/html';
    sRESTClient.RaiseExceptionOn500 := False;
    sRESTRequest.Params.Clear;

    sRESTRequest.Params.Add;
    sRESTRequest.Params.Items[0].Name  := 'apikey';
    sRESTRequest.Params.Items[0].Value := sAPIKEYEMP;

    sRESTRequest.Params.Add;
    sRESTRequest.Params.Items[1].Name  := 'phone_number';
    sRESTRequest.Params.Items[1].Value := '55' + sTelefoneFrom;

    sRESTRequest.Params.Add;
    sRESTRequest.Params.Items[2].Name  := 'contact_phone_number';
    sRESTRequest.Params.Items[2].Value := '55' + sTelefoneTo;

    sRESTRequest.Params.Add;
    sRESTRequest.Params.Items[3].Name  := 'message_custom_id';
    sRESTRequest.Params.Items[3].Value := 'yowsoftwareid';

    sRESTRequest.Params.Add;
    sRESTRequest.Params.Items[4].Name  := 'message_type';

    if( Trim( sExtArquivo ) = '' )then
    begin
     sRESTRequest.Params.Items[4].Value := 'text';
     StringList.Text := sMensagem;
    end
    else
      sRESTRequest.Params.Items[4].Value := 'image';

    sRESTRequest.Params.Add;
    sRESTRequest.Params.Items[5].Name  := 'message_caption';
    sRESTRequest.Params.Items[5].Value := sMensagem;

    sRESTRequest.Params.Add;
    sRESTRequest.Params.Items[6].Name  := 'message_body_mimetype';
    sRESTRequest.Params.Items[6].Value := 'image/jpeg';

    sRESTRequest.Params.Add;
    sRESTRequest.Params.Items[7].Name  := 'message_body_filename';
    sRESTRequest.Params.Items[7].Value := sNomeArquivo + sExtArquivo;

    sRESTRequest.Params.Add;
    sRESTRequest.Params.Items[8].Name  := 'message_body';
    sRESTRequest.Params.Items[8].Value := StringList.Text;

    sRESTRequest.Execute;
    StatusCode := sRESTResponse.StatusCode;

  finally

    DeleteFile( sCaminhoBase64 );

    FreeAndNil( sRESTClient );
    FreeAndNil( StringList );

    if( lEviarMensagemPDF )then
      EnviarMsgWhatsApp( sAPIKEYEMP, sTelefoneFrom, sTelefoneTo, sMensagem, '', False, StatusCode );

  end;

end;

function TFuncoesUteis.FCCreateQuery: TFDQuery;
var oQuery : TFDQuery;
begin
  oQuery := TFDQuery.Create( Nil );

  oQuery.Connection := MarthiConection;

  Result := oQuery;

end;

function TFuncoesUteis.NextID(lGenerator: string;
  lConexaoBD: TFDConnection): Integer;
var
  oqryNovoNum : TFDQuery;
begin
  oqryNovoNum := TFDQuery.Create(nil);
  oqryNovoNum.Connection := lConexaoBD;
  try
    oqryNovoNum.Close;
    oqryNovoNum.SQL.Clear;
    oqryNovoNum.SQL.Add( 'SELECT GEN_ID(' + lGenerator + ',1) AS ID_ATUAL FROM RDB$DATABASE' );
    oqryNovoNum.Open;
  finally
    Result := oqryNovoNum.FieldByName( 'ID_ATUAL' ).AsInteger;
    FreeAndNil(oqryNovoNum);
  end;
end;

procedure TFuncoesUteis.AtualizaPrecoItem( lConexao: TFDConnection; pCellID, pItemID: Integer;
  pValUnit, pValParc : double);
var
  oqryUdtItem : TFDQuery;
begin
  oqryUdtItem := CriaQuery( lConexao );
  try
    oqryUdtItem.Close;
    oqryUdtItem.SQL.Clear;
    oqryUdtItem.SQL.Add( ' UPDATE CELL_ITENS ' +
      ' SET CELL_VAL_UNIT = :CELL_VAL_UNIT, ' +
      ' CELL_VAL_PARC = :CELL_VAL_PARC ' +
      ' WHERE( ITEM_ID = :ITEM_ID ) ' +
      ' AND( CELL_ID = :CELL_ID )' );
    oqryUdtItem.ParamByName( 'CELL_VAL_UNIT' ).AsFloat := pValUnit;
    oqryUdtItem.ParamByName( 'CELL_VAL_PARC' ).AsFloat := pValParc;
    oqryUdtItem.ParamByName( 'ITEM_ID' ).AsInteger := pItemID;
    oqryUdtItem.ParamByName( 'CELL_ID' ).AsInteger := pCellID;

    oqryUdtItem.ExecSQL;
  finally
    FreeAndNil(oqryUdtItem);
  end;
end;

procedure TFuncoesUteis.PCDestroyQuery(oQuery: array of TFDQuery);
var
  iX : Integer;
begin
  for iX := Low( oQuery ) to High( oQuery ) do
  begin

    if ( oQuery[ iX ] <> Nil ) then
    begin
      oQuery[ iX ].Close;
      oQuery[ iX ].SQL.Clear;
      FreeAndNil( oQuery[ iX ] );
    end;

  end;

end;

procedure TFuncoesUteis.PCUpdateOrInsertPadrao(aTables, aFieldIns: array of string; aValueIns: array of variant);
var idxTables, idxFields : integer;
    oScript : TStringList;
    sDelimiter : string;
    oQueryIns : TFDQuery;
begin

  // cria stringlist que ira receber o script
  oScript := TstringList.Create;
  oQueryIns := FCCreateQuery;
  try

    for idxTables := Low( aTables ) to High( aTables ) do
    begin

      // limpa a stringlist
      oScript.Clear;

      // passa script de uptade
      oScript.Add( 'UPDATE OR INSERT INTO ' + aTables[ idxTables ] + ' (' );

      // passa os campos
      for idxFields := Low( aFieldIns ) to High( aFieldIns ) do
      begin
        sDelimiter := IIF( idxFields < High( aFieldIns ), ',', '' );
        oScript.Add( aFieldIns[ idxFields ] + sDelimiter );
      end;

      oScript.Add( ') VALUES ( ' );

      // passa os parametros nos values
      for idxFields := Low( aFieldIns ) to High( aFieldIns ) do
      begin
        sDelimiter := IIF( idxFields < High( aFieldIns ), ',', '' );
        oScript.Add( IIF( aValueIns[ idxFields ] = null, ' null', ' :FIELDUPD' + IntToStr( idxFields ) ) + sDelimiter );

        //  se o valor passado nao for nulo
        if not( aValueIns[ idxFields ] = null ) then
        begin
          oQueryIns.Params.CreateParam( ftUnknown, 'FIELDUPD' + IntToStr( idxFields ), ptInputOutput );
          oQueryIns.Params.ParamByName( 'FIELDUPD' + IntToStr( idxFields ) ).Value := aValueIns[ idxFields ];
        end;

      end;

      oScript.Add( ')' );

      oQueryIns.SQL.Clear;
      oQueryIns.SQL.AddStrings( oScript );
      oQueryIns.ExecSQL;

    end;

  finally
    PCDestroyQuery( oQueryIns );
    FreeAndNil( oScript );
  end;

end;

function TFuncoesUteis.IIF(ACondition: Boolean; const ATrue, AFalse: Variant): Variant;
begin
  if ACondition then
    Result := ATrue
  else
    Result := AFalse;
end;

procedure TFuncoesUteis.PCUpdatePadrao(aTables, aFieldUpd, aFieldAnd: array of string; aValueUpd, aValueAnd: array of variant);
var idxTables, idxFields : integer;
    oScript : TStringList;
    sDelimiter : string;
    oQueryUpdate : TFDQuery;
begin

  // cria stringlist que ira receber o script
  oScript := TstringList.Create;
  oQueryUpdate := FCCreateQuery;
  try

    for idxTables := Low( aTables ) to High( aTables ) do
    begin

      // limpa a stringlist
      oScript.Clear;

      // passa script de uptade
      oScript.Add( 'UPDATE ' + aTables[ idxTables ] + ' SET ' );

      // passa os campos a serem atualizados para sql
      for idxFields := Low( aFieldUpd ) to High( aFieldUpd ) do
      begin
        sDelimiter := IIF( idxFields < High( aFieldUpd ), ',', '' );
        oScript.Add( aFieldUpd[ idxFields ] + IIF( aValueUpd[ idxFields ] = null, ' = null', ' = :FIELDUPD' + IntToStr( idxFields ) ) + sDelimiter );

        //  se o valor passado nao for nulo
        if not( aValueUpd[ idxFields ] = null ) then
        begin
          oQueryUpdate.Params.CreateParam( ftUnknown, 'FIELDUPD' + IntToStr( idxFields ), ptInputOutput );
          oQueryUpdate.Params.ParamByName( 'FIELDUPD' + IntToStr( idxFields ) ).Value := aValueUpd[ idxFields ];
        end;
      end;

      // passa as condicoes
      for idxFields := Low( aFieldAnd ) to High( aFieldAnd ) do
      begin
        sDelimiter := IIF( idxFields = low( aFieldAnd ), 'WHERE ', 'AND ' );
        oScript.Add( sDelimiter + aFieldAnd[ idxFields ] + ' = :VALUEAND' + IntToStr( idxFields ) );

        oQueryUpdate.Params.CreateParam( ftUnknown, 'VALUEAND' + IntToStr( idxFields ), ptInputOutput );
        oQueryUpdate.Params.ParamByName( 'VALUEAND' + IntToStr( idxFields ) ).Value := aValueAnd[ idxFields ];
      end;

      oQueryUpdate.SQL.Clear;
      oQueryUpdate.SQL.AddStrings( oScript );
      oQueryUpdate.ExecSQL;

    end;

  finally
    PCDestroyQuery( oQueryUpdate );
    FreeAndNil( oScript );
  end;

end;

procedure TFuncoesUteis.ReplicaCelular(lQryCell: TFDQuery; lConnectionBD : TFDConnection );
var
  lQryReplicacao : TFDQuery;
begin
  lQryReplicacao := CriaQuery( lConnectionBD );
  try
    lQryReplicacao.Close;
    lQryReplicacao.SQL.Clear;
    lQryReplicacao.SQL.Add( 'INSERT INTO CAD_CELL (CELL_ID, CELL_MARCA, CELL_DESC, CELL_PROCESSAMENTO,' +
      'CELL_MEM_RAM, CELL_CAM_PRINC, CELL_CAM_FRONT, CELL_OBS, DAT_CAD, ' +
      ' DAT_ALT, CELL_STATUS, CELL_REFERENCIA) ' +
      ' VALUES (' + IntToStr( NextID( 'GEN_CAD_CELL_ID', lConnectionBD ) ) + ' , ' + lQryCell.FieldByName( 'CELL_MARCA' ).AsString +
      ', ' + QuotedStr( lQryCell.FieldByName( 'CELL_DESC' ).AsString + ' - Duplicado ' ) + ', ' + QuotedStr( lQryCell.FieldByName( 'CELL_PROCESSAMENTO' ).AsString ) +
      ', ' + QuotedStr( lQryCell.FieldByName( 'CELL_MEM_RAM' ).AsString ) + ' , ' + QuotedStr( lQryCell.FieldByName( 'CELL_CAM_PRINC' ).AsString ) +
      ', ' + QuotedStr( lQryCell.FieldByName( 'CELL_CAM_FRONT' ).AsString ) + ' , ' + QuotedStr( lQryCell.FieldByName( 'CELL_OBS' ).AsString ) + ' , ' +
      'CURRENT_DATE, CURRENT_DATE, 1, ' + QuotedStr( 'REPLICADO' ) + ');' );
    lQryReplicacao.ExecSQL;
  finally
    lQryReplicacao.Free;
  end;
end;

end.
