object frmGeralDM: TfrmGeralDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 266
  Width = 752
  object ConectMarthi: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'Database=C:\MarthiGIT\Marthi DataBase\DataBase\MARTHIDB.FDB'
      'Protocol=TCPIP'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
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
      '  DAT_ALT,'
      '  CELL_STATUS'
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
        'DAT_ALT, DAT_CAD, CELL_STATUS)'
      
        'VALUES (:CELL_ID, :CELL_MARCA, :CELL_DESC, :CELL_PROCESSAMENTO, ' +
        ':CELL_MEM_RAM, :CELL_CAM_PRINC,'
      
        '        :CELL_CAM_FRONT, :CELL_OBS, :DAT_ALT, :DAT_CAD, :CELL_ST' +
        'ATUS);')
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
      'CELL_STATUS = :CELL_STATUS'
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
    Top = 136
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
    OnNewRecord = qryCellCorNewRecord
    Connection = ConectMarthi
    UpdateObject = upsCellCor
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
    Left = 578
    Top = 133
  end
  object upsCellItens: TFDUpdateSQL
    Connection = ConectMarthi
    InsertSQL.Strings = (
      
        'INSERT INTO CELL_ITENS ( ITEM_ID, CELL_ID, ARMAZENAMENTO_ID, COR' +
        '_ID, CODICAO_ID, CELL_VAL_UNIT, CELL_VAL_PARC )'
      
        'VALUES ( :ITEM_ID, :CELL_ID, :ARMAZENAMENTO_ID, :COR_ID, :CODICA' +
        'O_ID, :CELL_VAL_UNIT, :CELL_VAL_PARC );')
    ModifySQL.Strings = (
      'UPDATE CELL_ITENS'
      'SET ITEM_ID = :ITEM_ID,'
      '    CELL_ID = :CELL_ID,'
      '    ARMAZENAMENTO_ID = :ARMAZENAMENTO_ID,'
      '    COR_ID = :COR_ID,'
      '    CODICAO_ID = :CODICAO_ID,'
      '    CELL_VAL_UNIT = :CELL_VAL_UNIT,'
      '    CELL_VAL_PARC = :CELL_VAL_PARC'
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
  object imgStatus: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 1180304
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C086488000000097048597300000076000000
          76014E7B26080000001974455874536F667477617265007777772E696E6B7363
          6170652E6F72679BEE3C1A000002A149444154388D7593D94B547114C73FF7F7
          9BDFBDCE8C364E96A5D70C43A4CC9836CAA0A090C8B2B7EA35E8C5A220A182FE
          835E5A5F82CAEA21DA440B8236880ACC0D2C2852DA6E1A8EA3A645D99DED8EDE
          991E5A703D4FE7E17CCEF7AC30DD56A880AAD70346BF3464421A32A1078C7E15
          5097808AA9C1DA045FD773F54B9A92BB96D585FC0555459ABF281B32108B4419
          7C1ACEBC3BF72696194F37A57EA6F603A989097415D05BCCEAE2E5AB4F6CF009
          5DCE5018A4532EAF8EB7C5079E84BBC646539B809404D073F5AB6675F1E6B5A7
          36FA3429668401342930AB172BDB1A0DC623D192B4E3DED3801559F9DED61DED
          BB736653060837F510B36C961C588AC7E7E14165A3ED8C24374815304E941F09
          ADCF5B93AFCD067F38F996B1C7092AE654F0BEB39BFCAA42A412EAFBAB6125B4
          0CDB0BAB166900AEE3D273E323231D439360D999A1A9F11EDF7E8CA02FC802A0
          606BB1D084A8F1B8CE78D05BE807C03ADB4D9E15C4BADC4DBC364AB23F81ECCC
          D070FB2E87EB0EF245F511AA5D0780CFF4E326C7E74E9B98699ADCBFFF84A1FA
          F024F8B3E82574661D9A9CD0A9061E69787E2406625E5F5136A575E534EF6BC6
          7BDEC7B3E72D08213874A8961ED94BE8F464381E89210DCF7729B2C452EF42FF
          AAB92BE76B42090A6A8A7871E1199F5E7FE0E6ADEB7FCA9EAA0CF4DDB1D2C3AD
          5F6F6B4085313FABADA663CFFF35BA49979EFAF7C86C0F257BCBA6C1AEE3F2B0
          B2D176BE252B25302C755166F7DA65E6B66205203C82BCF5F90457CD4313D3B7
          FBF2586BDCB67E35A41DF78AFCABF8281E89EEB4ADD160C11653CD768DAEE3F2
          F2684B7CF0697FD7D8686A37E0FE3B3D37EDB8D7E291688975F55DA934A432E6
          79357D8E0E402C6CD377E773BABDF679D4B67E35FC855333AA00CB558EBAA807
          8CF0FF77CE35FA548E7101289F1AFC1B067806D4EE88C2D80000000049454E44
          AE426082}
      end
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000000473424954080808087C086488000000097048597300000076000000
          76014E7B26080000001974455874536F667477617265007777772E696E6B7363
          6170652E6F72679BEE3C1A000002AC49444154388D8D934D48546114869FFB7D
          DE6FA699709C114272828C4ACA91D9C4808B2070D5BF4D519BCA88400829D045
          3F548B7EA01625C8205694A54108D19F4A9BDA44442D5A0CCE105789D1BCB6AA
          C9A6B9A3CE70EF6D510E51099DD5E19CF7BCBCE7E51CF83B1A03BA7E33A894E9
          9572D62BE56C502933A0EB3780C89F60EDB75C8594BAA184D87DB6B1D1BFA5B6
          565BE9F7E3029396C58869BA175229ABE4380FB2C5621B50FC9D405529F52A1E
          0E37F4C4623E8F94FF1006F3B64DDBDBB78527A6999A2995360245091054EA76
          3C1CDE74ABA9C95721C43F87012A84A065C50ADDC8E5821396553767DB4F04D0
          E81162574F2CE603B83C3646CDF03027D2695CC0054EA4D3D40C0F73657C1C80
          DE58CCE711620FD020AA74FDF8994864E982EC2EC3E0E18BE7BCABACA43D99A4
          3D99E45D65250F5F3CA7CB3000F048C9E948C41FD0F56342D3B4CDDBC2E1B299
          8756ADE25C47273DF706180B8518AFAEA6E7DE00E73A3A395457575E677B6DAD
          109AB655F34A59B0F6ED5B22B49F1C2ED09E4C325E5DCDDDC78F0068DD1567CD
          E7CF24A2D1B2EB8EEBE21F1C9C5DDCB1FF080D104BA4FC3A5528948B27D3698C
          5088C4403F0777B67070670B89FEBB18A110A7D2E9326ED2B2F04AF94538AE3B
          32649ACE42A3EFC307CE5FBBCAD1FD07589BCDB2369BE5E8FE039CBF76953B99
          4C9960687ADA715C77447C2B95BA2FA652D6BC6D03D0B96E1DF1E66636E47224
          A25112D1281B7239E2CDCD74D4D7033067DB5C1A1DB5BE954ADD1A4048A9BE1D
          E1F0DEBEA626DFFFECDEFAFA75E1E9A74FF767E6E78F488059DB7E3691CF6F33
          72B9E0E6E5CBF5C5AE71CEB639FCE64D61C8345333C5E21EC05E387A7BCE71FA
          272CABAEDB30567BA5D49779BD5A95520064F27906321927FEF265FEFDF7EF83
          BF868B8B296C08E8FAF5A05253E577F6783E0674BD1758FF27F807379007F37F
          DD3BA30000000049454E44AE426082}
      end>
  end
end
