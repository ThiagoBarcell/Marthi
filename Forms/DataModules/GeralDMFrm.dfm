object frmGeralDM: TfrmGeralDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 266
  Width = 752
  object ConectMarthi: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=LocalHost'
      'Port=3050'
      'Database=D:\Marthi GIT\DataBase\MARTHIDB.FDB'
      'DriverID=FB')
    Connected = True
    Left = 56
    Top = 16
  end
  object qryCadCell: TFDQuery
    Active = True
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
      '  DAT_ALT'
      'FROM CAD_CELL'
      ''
      'WHERE DAT_CAD BETWEEN :START_DATE AND :END_DATE')
    Left = 127
    Top = 16
    ParamData = <
      item
        Name = 'START_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'END_DATE'
        DataType = ftDate
        ParamType = ptInput
      end>
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
        'DAT_ALT, DAT_CAD)'
      
        'VALUES (:CELL_ID, :CELL_MARCA, :CELL_DESC, :CELL_PROCESSAMENTO, ' +
        ':CELL_MEM_RAM, :CELL_CAM_PRINC,'
      '        :CELL_CAM_FRONT, :CELL_OBS, :DAT_ALT, :DAT_CAD);')
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
      'DAT_CAD = :DAT_CAD'
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
    Left = 216
    Top = 128
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
    Left = 216
    Top = 184
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
    Connection = ConectMarthi
    SQL.Strings = (
      'SELECT'
      '  CELL_ITENS.ITEM_ID,'
      '  CELL_ID,'
      '  ARMAZENAMENTO_ID,'
      '  COR_ID,'
      '  CODICAO_ID,'
      '  CELL_VAL_UNIT,'
      '  CELL_VAL_PARC'
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
  end
  object dtsCellItens: TDataSource
    DataSet = qryCellItens
    Left = 295
    Top = 71
  end
  object qryCellCor: TFDQuery
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
    object qryCellCorCOD_DESC: TStringField
      FieldName = 'COD_DESC'
      Origin = 'COD_DESC'
      Required = True
    end
  end
  object qryCellArmazenamento: TFDQuery
    Connection = ConectMarthi
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
    Connection = ConectMarthi
    SQL.Strings = (
      'SELECT * FROM CELL_CONDICOES')
    Left = 569
    Top = 15
  end
end
