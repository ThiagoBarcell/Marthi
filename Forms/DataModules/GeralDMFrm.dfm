object frmGeralDM: TfrmGeralDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 633
  Width = 954
  object ConectMarthi: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'Protocol=TCPIP'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 16
  end
  object qryCadCell: TFDQuery
    AfterScroll = qryCadCellAfterScroll
    OnNewRecord = qryCadCellNewRecord
    Connection = ConectMarthi
    UpdateObject = upsCadCell
    SQL.Strings = (
      'SELECT'
      '  CELL_ID,'
      '  CELL_MARCA,'
      '  CELL_DESC,'
      '  CELL_PROCESSAMENTO,'
      '  CELL_MEM_RAM,'
      '  CELL_CAM_PRINC,'
      '  CELL_CAM_FRONT,'
      '  CELL_OBS,'
      '  DAT_CAD,'
      '  DAT_ALT,'
      '  CELL_STATUS,'
      '  CELL_REFERENCIA'
      'FROM CAD_CELL'
      ''
      '--WHERE DAT_CAD BETWEEN :START_DATE AND :END_DATE')
    Left = 127
    Top = 16
    object qryCadCellCELL_ID: TIntegerField
      FieldName = 'CELL_ID'
      Origin = 'CELL_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCadCellCELL_MARCA: TIntegerField
      FieldName = 'CELL_MARCA'
      Origin = 'CELL_MARCA'
    end
    object qryCadCellCELL_DESC: TStringField
      FieldName = 'CELL_DESC'
      Origin = 'CELL_DESC'
      Size = 255
    end
    object qryCadCellCELL_PROCESSAMENTO: TStringField
      FieldName = 'CELL_PROCESSAMENTO'
      Origin = 'CELL_PROCESSAMENTO'
      Size = 50
    end
    object qryCadCellCELL_MEM_RAM: TStringField
      FieldName = 'CELL_MEM_RAM'
      Origin = 'CELL_MEM_RAM'
      Size = 50
    end
    object qryCadCellCELL_CAM_PRINC: TStringField
      FieldName = 'CELL_CAM_PRINC'
      Origin = 'CELL_CAM_PRINC'
      Size = 100
    end
    object qryCadCellCELL_CAM_FRONT: TStringField
      FieldName = 'CELL_CAM_FRONT'
      Origin = 'CELL_CAM_FRONT'
      Size = 100
    end
    object qryCadCellCELL_OBS: TStringField
      FieldName = 'CELL_OBS'
      Origin = 'CELL_OBS'
      Size = 255
    end
    object qryCadCellDAT_CAD: TDateField
      FieldName = 'DAT_CAD'
      Origin = 'DAT_CAD'
    end
    object qryCadCellDAT_ALT: TDateField
      FieldName = 'DAT_ALT'
      Origin = 'DAT_ALT'
    end
    object qryCadCellCELL_STATUS: TSmallintField
      FieldName = 'CELL_STATUS'
      Origin = 'CELL_STATUS'
    end
    object qryCadCellCELL_REFERENCIA: TStringField
      FieldName = 'CELL_REFERENCIA'
      Origin = 'CELL_REFERENCIA'
      Size = 50
    end
  end
  object dtsCadCell: TDataSource
    DataSet = qryCadCell
    Left = 129
    Top = 72
  end
  object upsCadCell: TFDUpdateSQL
    Connection = ConectMarthi
    InsertSQL.Strings = (
      
        'INSERT INTO CAD_CELL (CELL_ID, CELL_MARCA, CELL_DESC, CELL_PROCE' +
        'SSAMENTO, CELL_MEM_RAM, '
      
        '                      CELL_CAM_PRINC, CELL_CAM_FRONT, CELL_OBS, ' +
        'DAT_ALT, DAT_CAD, CELL_STATUS, CELL_REFERENCIA)'
      
        'VALUES (:CELL_ID, :CELL_MARCA, :CELL_DESC, :CELL_PROCESSAMENTO, ' +
        ':CELL_MEM_RAM, :CELL_CAM_PRINC,'
      
        '        :CELL_CAM_FRONT, :CELL_OBS, :DAT_ALT, :DAT_CAD, :CELL_ST' +
        'ATUS, :CELL_REFERENCIA);')
    ModifySQL.Strings = (
      'UPDATE CAD_CELL'
      'SET CELL_ID = :CELL_ID,'
      'CELL_MARCA = :CELL_MARCA,'
      'CELL_DESC = :CELL_DESC,'
      'CELL_PROCESSAMENTO = :CELL_PROCESSAMENTO,'
      'CELL_MEM_RAM = :CELL_MEM_RAM,'
      'CELL_CAM_PRINC = :CELL_CAM_PRINC,'
      'CELL_CAM_FRONT = :CELL_CAM_FRONT,'
      'CELL_OBS = :CELL_OBS,'
      'DAT_ALT = :DAT_ALT,'
      'DAT_CAD = :DAT_CAD,'
      'CELL_STATUS = :CELL_STATUS,'
      'CELL_REFERENCIA = :CELL_REFERENCIA'
      'WHERE CELL_ID = :OLD_CELL_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CAD_CELL'
      'WHERE CELL_ID = :OLD_CELL_ID')
    Left = 127
    Top = 136
  end
  object oInsIMG: TFDQuery
    Connection = ConectMarthi
    SQL.Strings = (
      
        'INSERT INTO CELL_IMAGES ( CELL_IMAGES.CELL_ID, CELL_IMAGES.SEQUE' +
        'NCIA, CELL_IMAGES.IMAGE ) VALUES ( :CELL_ID, :SEQUENCIA, :IMAGE ' +
        ')')
    Left = 728
    Top = 80
    ParamData = <
      item
        Name = 'CELL_ID'
        ParamType = ptInput
      end
      item
        Name = 'SEQUENCIA'
        ParamType = ptInput
      end
      item
        Name = 'IMAGE'
        ParamType = ptInput
      end>
  end
  object qryImagensCell: TFDQuery
    Connection = ConectMarthi
    SQL.Strings = (
      'SELECT * FROM CELL_IMAGES'
      'WHERE CELL_ID = :CELL_ID')
    Left = 215
    Top = 16
    ParamData = <
      item
        Name = 'CELL_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryImagensCellCELL_ID: TIntegerField
      FieldName = 'CELL_ID'
      Origin = 'CELL_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryImagensCellSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryImagensCellIMAGE: TBlobField
      FieldName = 'IMAGE'
      Origin = 'IMAGE'
    end
  end
  object dtsImagensCell: TDataSource
    DataSet = qryImagensCell
    Left = 215
    Top = 71
  end
  object delImgCell: TFDQuery
    Connection = ConectMarthi
    SQL.Strings = (
      'DELETE FROM CELL_IMAGES'
      'WHERE( CELL_ID = :CELL_ID )'
      '  AND( SEQUENCIA = :SEQUENCIA )')
    Left = 736
    Top = 16
    ParamData = <
      item
        Name = 'CELL_ID'
        ParamType = ptInput
      end
      item
        Name = 'SEQUENCIA'
        ParamType = ptInput
      end>
  end
  object qryCellItens: TFDQuery
    OnNewRecord = qryCellItensNewRecord
    Connection = ConectMarthi
    UpdateObject = upsCellItens
    SQL.Strings = (
      'SELECT'
      '  CELL_ITENS.ITEM_ID,'
      '  CELL_ID,'
      '  ARMAZENAMENTO_ID,'
      '  COR_ID,'
      '  CODICAO_ID,'
      '  CELL_VAL_UNIT,'
      '  CELL_VAL_PARC,'
      '  CELL_PARCELAS,'
      '  TP_PRECO_ID'
      ''
      'FROM CELL_ITENS'
      ''
      '  WHERE( CELL_ID = :CELL_ID )')
    Left = 298
    Top = 15
    ParamData = <
      item
        Name = 'CELL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryCellItensITEM_ID: TIntegerField
      FieldName = 'ITEM_ID'
      Origin = 'ITEM_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCellItensCELL_ID: TIntegerField
      FieldName = 'CELL_ID'
      Origin = 'CELL_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCellItensARMAZENAMENTO_ID: TIntegerField
      FieldName = 'ARMAZENAMENTO_ID'
      Origin = 'ARMAZENAMENTO_ID'
    end
    object qryCellItensCOR_ID: TIntegerField
      FieldName = 'COR_ID'
      Origin = 'COR_ID'
    end
    object qryCellItensCODICAO_ID: TIntegerField
      FieldName = 'CODICAO_ID'
      Origin = 'CODICAO_ID'
    end
    object qryCellItensCELL_VAL_UNIT: TFMTBCDField
      FieldName = 'CELL_VAL_UNIT'
      Origin = 'CELL_VAL_UNIT'
      Precision = 18
      Size = 2
    end
    object qryCellItensCELL_VAL_PARC: TFMTBCDField
      FieldName = 'CELL_VAL_PARC'
      Origin = 'CELL_VAL_PARC'
      Precision = 18
      Size = 2
    end
    object qryCellItensCELL_PARCELAS: TStringField
      FieldName = 'CELL_PARCELAS'
      Origin = 'CELL_PARCELAS'
      FixedChar = True
      Size = 25
    end
    object qryCellItensTP_PRECO_ID: TIntegerField
      FieldName = 'TP_PRECO_ID'
      Origin = 'TP_PRECO_ID'
    end
  end
  object dtsCellItens: TDataSource
    DataSet = qryCellItens
    Left = 295
    Top = 71
  end
  object qryCellCor: TFDQuery
    OnNewRecord = qryCellCorNewRecord
    Connection = ConectMarthi
    SQL.Strings = (
      'SELECT * FROM CELL_CORES')
    Left = 377
    Top = 15
    object qryCellCorCOR_ID: TIntegerField
      FieldName = 'COR_ID'
      Origin = 'COR_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCellCorCOR_DESC: TStringField
      FieldName = 'COR_DESC'
      Origin = 'COR_DESC'
      Required = True
    end
  end
  object qryCellArmazenamento: TFDQuery
    OnNewRecord = qryCellArmazenamentoNewRecord
    Connection = ConectMarthi
    UpdateObject = upsCellArmazenamento
    SQL.Strings = (
      'SELECT * FROM CELL_ARMAZENAMENTO')
    Left = 470
    Top = 15
    object qryCellArmazenamentoARMAZENAMENTO_ID: TIntegerField
      FieldName = 'ARMAZENAMENTO_ID'
      Origin = 'ARMAZENAMENTO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCellArmazenamentoARMAZENAMENTO_DESC: TStringField
      FieldName = 'ARMAZENAMENTO_DESC'
      Origin = 'ARMAZENAMENTO_DESC'
    end
  end
  object qryCellCondicao: TFDQuery
    OnNewRecord = qryCellCondicaoNewRecord
    Connection = ConectMarthi
    UpdateObject = upsCellCondicao
    SQL.Strings = (
      'SELECT * FROM CELL_CONDICOES')
    Left = 569
    Top = 15
    object qryCellCondicaoCONDICAO_ID: TIntegerField
      FieldName = 'CONDICAO_ID'
      Origin = 'CONDICAO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCellCondicaoCONDICAO_DESC: TStringField
      FieldName = 'CONDICAO_DESC'
      Origin = 'CONDICAO_DESC'
      Size = 50
    end
  end
  object dtsCellCor: TDataSource
    DataSet = qryCellCor
    Left = 376
    Top = 72
  end
  object dtsCellArmazenamento: TDataSource
    DataSet = qryCellArmazenamento
    Left = 472
    Top = 72
  end
  object dtsCellCondicao: TDataSource
    DataSet = qryCellCondicao
    Left = 568
    Top = 72
  end
  object upsCellCor: TFDUpdateSQL
    Connection = ConectMarthi
    InsertSQL.Strings = (
      'INSERT INTO CELL_CORES ( COR_ID, COR_DESC )'
      'VALUES ( :COR_ID, :COR_DESC );')
    ModifySQL.Strings = (
      'UPDATE CELL_CORES'
      'SET COR_ID = :COR_ID,'
      '    COR_DESC = :COR_DESC'
      'WHERE COR_ID = :OLD_COR_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CELL_CORES'
      'WHERE COR_ID = :OLD_COR_ID')
    Left = 382
    Top = 134
  end
  object upsCellArmazenamento: TFDUpdateSQL
    Connection = ConectMarthi
    InsertSQL.Strings = (
      
        'INSERT INTO CELL_ARMAZENAMENTO ( ARMAZENAMENTO_ID, ARMAZENAMENTO' +
        '_DESC )'
      'VALUES ( :ARMAZENAMENTO_ID, :ARMAZENAMENTO_DESC );')
    ModifySQL.Strings = (
      'UPDATE CELL_ARMAZENAMENTO'
      'SET ARMAZENAMENTO_ID = :ARMAZENAMENTO_ID,'
      '    ARMAZENAMENTO_DESC = :ARMAZENAMENTO_DESC'
      'WHERE ARMAZENAMENTO_ID = :OLD_ARMAZENAMENTO_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CELL_ARMAZENAMENTO'
      'WHERE ARMAZENAMENTO_ID = :OLD_ARMAZENAMENTO_ID')
    Left = 473
    Top = 133
  end
  object upsCellCondicao: TFDUpdateSQL
    Connection = ConectMarthi
    InsertSQL.Strings = (
      'INSERT INTO CELL_CONDICOES ( CONDICAO_ID, CONDICAO_DESC )'
      'VALUES ( :CONDICAO_ID, :CONDICAO_DESC );')
    ModifySQL.Strings = (
      'UPDATE CELL_CONDICOES'
      'SET CONDICAO_ID = :CONDICAO_ID,'
      '    CONDICAO_DESC = :CONDICAO_DESC'
      'WHERE CONDICAO_ID = :OLD_CONDICAO_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CELL_CONDICOES'
      'WHERE CONDICAO_ID = :OLD_CONDICAO_ID')
    Left = 570
    Top = 133
  end
  object upsCellItens: TFDUpdateSQL
    Connection = ConectMarthi
    InsertSQL.Strings = (
      
        'INSERT INTO CELL_ITENS ( ITEM_ID, CELL_ID, ARMAZENAMENTO_ID, COR' +
        '_ID, CODICAO_ID, CELL_VAL_UNIT, CELL_VAL_PARC, CELL_PARCELAS,TP_' +
        'PRECO_ID )'
      
        'VALUES ( :ITEM_ID, :CELL_ID, :ARMAZENAMENTO_ID, :COR_ID, :CODICA' +
        'O_ID, :CELL_VAL_UNIT, :CELL_VAL_PARC, :CELL_PARCELAS, :TP_PRECO_' +
        'ID );')
    ModifySQL.Strings = (
      'UPDATE CELL_ITENS'
      'SET ITEM_ID = :ITEM_ID,'
      '    CELL_ID = :CELL_ID,'
      '    ARMAZENAMENTO_ID = :ARMAZENAMENTO_ID,'
      '    COR_ID = :COR_ID,'
      '    CODICAO_ID = :CODICAO_ID,'
      '    CELL_VAL_UNIT = :CELL_VAL_UNIT,'
      '    CELL_VAL_PARC = :CELL_VAL_PARC,'
      '    CELL_PARCELAS = :CELL_PARCELAS,'
      '    TP_PRECO_ID = :TP_PRECO_ID'
      'WHERE ITEM_ID = :OLD_ITEM_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CELL_ITENS'
      'WHERE ITEM_ID = :OLD_ITEM_ID')
    Left = 300
    Top = 134
  end
  object FBLink: TFDPhysFBDriverLink
    Left = 56
    Top = 72
  end
  object qryCellTpPreco: TFDQuery
    OnNewRecord = qryCellTpPrecoNewRecord
    Connection = ConectMarthi
    UpdateObject = upsCellTpPreco
    SQL.Strings = (
      'SELECT * FROM CELL_TP_PRECOS')
    Left = 649
    Top = 15
    object qryCellTpPrecoTP_PRECO_ID: TIntegerField
      FieldName = 'TP_PRECO_ID'
      Origin = 'TP_PRECO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCellTpPrecoTP_PRECO_DESC: TStringField
      FieldName = 'TP_PRECO_DESC'
      Origin = 'TP_PRECO_DESC'
      Size = 50
    end
  end
  object dtsCellTpPreco: TDataSource
    DataSet = qryCellTpPreco
    Left = 648
    Top = 72
  end
  object upsCellTpPreco: TFDUpdateSQL
    Connection = ConectMarthi
    InsertSQL.Strings = (
      
        'INSERT INTO CELL_TP_PRECOS (TP_PRECO_ID, TP_PRECO_DESC) VALUES (' +
        ':TP_PRECO_ID, :TP_PRECO_DESC);')
    ModifySQL.Strings = (
      'UPDATE CELL_TP_PRECOS'
      'SET TP_PRECO_ID = :TP_PRECO_ID,'
      '    TP_PRECO_DESC = :TP_PRECO_DESC'
      'WHERE TP_PRECO_ID = :OLD_TP_PRECO_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CELL_TP_PRECOS'
      'WHERE TP_PRECO_ID = :OLD_TP_PRECO_ID')
    Left = 648
    Top = 133
  end
  object qryCellTabPrecos: TFDQuery
    OnNewRecord = qryCellTabPrecosNewRecord
    Connection = ConectMarthi
    UpdateObject = upsCellTabPrecos
    SQL.Strings = (
      'SELECT'
      '  CELL_TAB_PRECO_ID,'
      '  CELL_PARCELAS,'
      '  CELL_VAL_PORC'
      'FROM CELL_TAB_PRECOS')
    Left = 48
    Top = 208
    object qryCellTabPrecosCELL_PARCELAS: TIntegerField
      FieldName = 'CELL_PARCELAS'
      Origin = 'CELL_PARCELAS'
    end
    object qryCellTabPrecosCELL_VAL_PORC: TBCDField
      FieldName = 'CELL_VAL_PORC'
      Origin = 'CELL_VAL_PORC'
      Precision = 18
    end
    object qryCellTabPrecosCELL_TAB_PRECO_ID: TIntegerField
      FieldName = 'CELL_TAB_PRECO_ID'
      Origin = 'CELL_TAB_PRECO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object dtsCellTabPrecos: TDataSource
    DataSet = qryCellTabPrecos
    Left = 48
    Top = 264
  end
  object upsCellTabPrecos: TFDUpdateSQL
    Connection = ConectMarthi
    InsertSQL.Strings = (
      
        'INSERT INTO CELL_TAB_PRECOS (CELL_TAB_PRECO_ID, CELL_PARCELAS, C' +
        'ELL_VAL_PORC)'
      '  VALUES ( :CELL_TAB_PRECO_ID, :CELL_PARCELAS, :CELL_VAL_PORC);')
    ModifySQL.Strings = (
      'UPDATE CELL_TAB_PRECOS'
      'SET CELL_PARCELAS = :CELL_PARCELAS,'
      '    CELL_VAL_PORC = :CELL_VAL_PORC'
      'WHERE (CELL_TAB_PRECO_ID = :OLD_CELL_TAB_PRECO_ID);')
    DeleteSQL.Strings = (
      'DELETE FROM CELL_TAB_PRECOS'
      'WHERE (CELL_TAB_PRECO_ID = :OLD_CELL_TAB_PRECO_ID);')
    Left = 46
    Top = 326
  end
  object qryConfiguracoes: TFDQuery
    Connection = ConectMarthi
    UpdateObject = upsConfiguracoes
    SQL.Strings = (
      'SELECT'
      '  API_KEY_WHATSAPP,'
      '  CELL_RECEPTOR_WHATSAPP,'
      '  SENHA_ACESSO'
      '  FROM CELL_CONFIG')
    Left = 160
    Top = 208
    object qryConfiguracoesAPI_KEY_WHATSAPP: TStringField
      FieldName = 'API_KEY_WHATSAPP'
      Origin = 'API_KEY_WHATSAPP'
      Size = 255
    end
    object qryConfiguracoesCELL_RECEPTOR_WHATSAPP: TStringField
      FieldName = 'CELL_RECEPTOR_WHATSAPP'
      Origin = 'CELL_RECEPTOR_WHATSAPP'
    end
    object qryConfiguracoesSENHA_ACESSO: TStringField
      FieldName = 'SENHA_ACESSO'
      Origin = 'SENHA_ACESSO'
      Size = 50
    end
  end
  object dtsConfiguracoes: TDataSource
    DataSet = qryConfiguracoes
    Left = 160
    Top = 264
  end
  object upsConfiguracoes: TFDUpdateSQL
    Connection = ConectMarthi
    InsertSQL.Strings = (
      
        'INSERT INTO CELL_CONFIG (API_KEY_WHATSAPP, CELL_RECEPTOR_WHATSAP' +
        'P, SENHA_ACESSO)'
      
        'VALUES (:API_KEY_WHATSAPP, :CELL_RECEPTOR_WHATSAPP, :SENHA_ACESS' +
        'O);')
    ModifySQL.Strings = (
      'UPDATE CELL_CONFIG'
      'SET API_KEY_WHATSAPP = :API_KEY_WHATSAPP,'
      '  CELL_RECEPTOR_WHATSAPP = :CELL_RECEPTOR_WHATSAPP,'
      '  SENHA_ACESSO = :SENHA_ACESSO')
    Left = 160
    Top = 328
  end
end
