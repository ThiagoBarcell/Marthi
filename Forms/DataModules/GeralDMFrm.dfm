object frmGeralDM: TfrmGeralDM
  OldCreateOrder = False
  Height = 334
  Width = 546
  object ConectMarthi: TFDConnection
    Params.Strings = (
      'Database=D:\Projeto Toten-MM\DataBase\MARTHIDB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=LocalHost'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    Left = 56
    Top = 16
  end
  object qryCadCell: TFDQuery
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
      '  CELL_OBS'
      'FROM CAD_CELL')
    Left = 56
    Top = 80
    object qryCadCellCELL_ID: TIntegerField
      AutoGenerateValue = arAutoInc
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
  end
  object dtsCadCell: TDataSource
    DataSet = qryCadCell
    Left = 58
    Top = 136
  end
  object upsCadCell: TFDUpdateSQL
    Connection = ConectMarthi
    Left = 56
    Top = 200
  end
end
