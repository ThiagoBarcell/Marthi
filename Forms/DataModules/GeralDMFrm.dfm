object frmGeralDM: TfrmGeralDM
  OldCreateOrder = False
  Height = 334
  Width = 546
  object ConectMarthi: TFDConnection
    Params.Strings = (
      'Database=T:\Marthi\DataBase\MARTHIDB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=LocalHost'
      'Port=3050'
      'DriverID=FB')
    Left = 56
    Top = 16
  end
  object qryCadCell: TFDQuery
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
      '  CELL_ARMAZENAMENTO,'
      '  CELL_CAM_PRINC,'
      '  CELL_CAM_FRONT,'
      '  CELL_COR,'
      '  CELL_VALOR_UNITARIO,'
      '  CELL_VALOR_PARCELADO,'
      '  CELL_OBS,'
      '  DAT_CAD,'
      '  DAT_ALT'
      'FROM CAD_CELL'
      ''
      'WHERE DAT_CAD BETWEEN :START_DATE AND :END_DATE')
    Left = 56
    Top = 80
    ParamData = <
      item
        Name = 'START_DATE'
        DataType = ftDate
        ParamType = ptInput
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
    object qryCadCellCELL_ARMAZENAMENTO: TIntegerField
      FieldName = 'CELL_ARMAZENAMENTO'
      Origin = 'CELL_ARMAZENAMENTO'
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
    object qryCadCellCELL_COR: TStringField
      FieldName = 'CELL_COR'
      Origin = 'CELL_COR'
      Size = 100
    end
    object qryCadCellCELL_OBS: TStringField
      FieldName = 'CELL_OBS'
      Origin = 'CELL_OBS'
      Size = 255
    end
    object qryCadCellCELL_VALOR_UNITARIO: TFMTBCDField
      FieldName = 'CELL_VALOR_UNITARIO'
      Origin = 'CELL_VALOR_UNITARIO'
      Precision = 18
      Size = 2
    end
    object qryCadCellCELL_VALOR_PARCELADO: TFMTBCDField
      FieldName = 'CELL_VALOR_PARCELADO'
      Origin = 'CELL_VALOR_PARCELADO'
      Precision = 18
      Size = 2
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
    Left = 58
    Top = 136
  end
  object upsCadCell: TFDUpdateSQL
    Connection = ConectMarthi
    InsertSQL.Strings = (
      
        'INSERT INTO CAD_CELL (CELL_ID, CELL_MARCA, CELL_DESC, CELL_PROCE' +
        'SSAMENTO, CELL_MEM_RAM, CELL_ARMAZENAMENTO,'
      
        '                      CELL_CAM_PRINC, CELL_CAM_FRONT, CELL_COR, ' +
        'CELL_OBS, CELL_VALOR_UNITARIO, CELL_VALOR_PARCELADO,'
      '                      DAT_ALT, DAT_CAD)'
      
        'VALUES (:CELL_ID, :CELL_MARCA, :CELL_DESC, :CELL_PROCESSAMENTO, ' +
        ':CELL_MEM_RAM, :CELL_ARMAZENAMENTO, :CELL_CAM_PRINC,'
      
        '        :CELL_CAM_FRONT, :CELL_COR, :CELL_OBS, :CELL_VALOR_UNITA' +
        'RIO, :CELL_VALOR_PARCELADO, :DAT_ALT, :DAT_CAD);')
    ModifySQL.Strings = (
      'UPDATE CAD_CELL'
      'SET CELL_ID = :CELL_ID,'
      'CELL_MARCA = :CELL_MARCA,'
      'CELL_DESC = :CELL_DESC,'
      'CELL_PROCESSAMENTO = :CELL_PROCESSAMENTO,'
      'CELL_MEM_RAM = :CELL_MEM_RAM,'
      'CELL_ARMAZENAMENTO = :CELL_ARMAZENAMENTO,'
      'CELL_CAM_PRINC = :CELL_CAM_PRINC,'
      'CELL_CAM_FRONT = :CELL_CAM_FRONT,'
      'CELL_COR = :CELL_COR,'
      'CELL_OBS = :CELL_OBS,'
      'CELL_VALOR_UNITARIO = :CELL_VALOR_UNITARIO,'
      'CELL_VALOR_PARCELADO = :CELL_VALOR_PARCELADO ,'
      'DAT_ALT = :DAT_ALT,'
      'DAT_CAD = :DAT_CAD'
      'WHERE CELL_ID = :OLD_CELL_ID')
    DeleteSQL.Strings = (
      'DELETE FROM CAD_CELL'
      'WHERE CELL_ID = :OLD_CELL_ID')
    Left = 56
    Top = 200
  end
end
