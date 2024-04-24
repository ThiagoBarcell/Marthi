object frmCadProdutos: TfrmCadProdutos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 644
  ClientWidth = 1113
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PgeCadastroComp: TcxPageControl
    Left = 0
    Top = 0
    Width = 1113
    Height = 644
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tabCadastro
    Properties.CustomButtons.Buttons = <>
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 644
    ClientRectRight = 1113
    ClientRectTop = 24
    object tabCadastro: TcxTabSheet
      Hint = 'Endere'#231'o'
      Caption = 'Cadastro de Produtos'
      ImageIndex = 0
      object pnlCadastroDeProduto: TPanel
        Left = 0
        Top = 0
        Width = 1113
        Height = 620
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          1113
          620)
        object dxBevel1: TdxBevel
          Left = 0
          Top = 541
          Width = 1113
          Height = 3
          Align = alBottom
          ExplicitTop = 540
        end
        object memObsCell: TcxDBMemo
          Left = 25
          Top = 273
          DataBinding.DataField = 'CELL_OBS'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 0
          Height = 240
          Width = 607
        end
        object edtCellDesc: TcxDBTextEdit
          Left = 138
          Top = 61
          DataBinding.DataField = 'CELL_DESC'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 1
          Width = 494
        end
        object edtCellMemoriaRAM: TcxDBTextEdit
          Left = 138
          Top = 112
          DataBinding.DataField = 'CELL_MEM_RAM'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 2
          Width = 494
        end
        object edtCellProcessamento: TcxDBTextEdit
          Left = 140
          Top = 85
          DataBinding.DataField = 'CELL_PROCESSAMENTO'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 3
          Width = 494
        end
        object cxLabel15: TcxLabel
          Left = 0
          Top = 0
          Align = alTop
          Caption = 'Dados Principais do Aparelho'
          ParentColor = False
          ParentFont = False
          Style.Color = clSilver
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = 12615680
          Style.Font.Height = -16
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel16: TcxLabel
          Left = 92
          Top = 34
          Caption = 'Marca :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel5: TcxLabel
          Left = 25
          Top = 250
          Caption = 'Observa'#231#227'o :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel6: TcxLabel
          Left = 19
          Top = 62
          Caption = 'Descri'#231#227'o do Celular :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel8: TcxLabel
          Left = 709
          Top = 34
          Anchors = [akRight, akBottom]
          Caption = 'Imagem :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object imgFoto: TdxSpinImage
          Left = 767
          Top = 34
          Width = 298
          Height = 290
          Anchors = [akRight, akBottom]
          AutoSize = False
          BorderStyle = bsSingle
          DefaultImages = True
          ImageHAlign = hsiCenter
          ImageVAlign = vsiCenter
          Items = <>
          ItemIndex = 0
          ReadOnly = False
          Stretch = True
          UpDownAlign = udaRight
          UpDownOrientation = siVertical
          UpDownWidth = 0
          UseDblClick = True
          Ctl3D = False
          ParentColor = True
          ParentCtl3D = False
          TabOrder = 9
        end
        object lblMemoria: TcxLabel
          Left = 48
          Top = 113
          Caption = 'Memoria RAM :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object lblProcessamento: TcxLabel
          Left = 45
          Top = 86
          Caption = 'Processamento :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxDBImageComboBox1: TcxDBImageComboBox
          Left = 138
          Top = 139
          DataBinding.DataField = 'CELL_ARMAZENAMENTO'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          Properties.Items = <
            item
              Description = '32 Gigas'
              ImageIndex = 0
              Value = 0
            end
            item
              Description = '64 Gigas'
              Value = 1
            end
            item
              Description = '128 Gigas'
              Value = 2
            end
            item
              Description = '256 Gigas'
              Value = 3
            end
            item
              Description = '512 Gigas'
              Value = 4
            end
            item
              Description = '1 Tera'
              Value = 5
            end>
          TabOrder = 12
          Width = 133
        end
        object cxLabel1: TcxLabel
          Left = 38
          Top = 141
          Caption = 'Armazenamento :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object cxLabel2: TcxLabel
          Left = 106
          Top = 222
          Caption = 'Cor :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object edtCellColor: TcxDBTextEdit
          Left = 138
          Top = 221
          DataBinding.DataField = 'CELL_COR'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 15
          Width = 494
        end
        object cxLabel3: TcxLabel
          Left = 37
          Top = 168
          Caption = 'C'#226'mera Principal :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object edtPrincCam: TcxDBTextEdit
          Left = 138
          Top = 167
          DataBinding.DataField = 'CELL_CAM_PRINC'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 17
          Width = 494
        end
        object cxLabel4: TcxLabel
          Left = 47
          Top = 195
          Caption = 'C'#226'mera frontal :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object edtFrontCam: TcxDBTextEdit
          Left = 138
          Top = 194
          DataBinding.DataField = 'CELL_CAM_FRONT'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 19
          Width = 494
        end
        object Panel1: TPanel
          Left = 0
          Top = 544
          Width = 1113
          Height = 76
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 20
          object btnSalvar: TcxButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 365
            Height = 70
            Align = alLeft
            Caption = 'Salvar'
            TabOrder = 0
            OnClick = btnSalvarClick
          end
          object btnInserir: TcxButton
            AlignWithMargins = True
            Left = 374
            Top = 3
            Width = 365
            Height = 70
            Align = alLeft
            Caption = 'Inserir'
            TabOrder = 1
            OnClick = btnInserirClick
          end
          object btnEditar: TcxButton
            AlignWithMargins = True
            Left = 745
            Top = 3
            Width = 365
            Height = 70
            Align = alLeft
            Caption = 'editar'
            TabOrder = 2
            OnClick = btnEditarClick
          end
        end
        object btnPesqImagem: TcxButton
          Left = 767
          Top = 336
          Width = 298
          Height = 57
          Caption = 'Pesquisar'
          TabOrder = 21
        end
        object cxDBImageComboBox2: TcxDBImageComboBox
          Left = 140
          Top = 32
          DataBinding.DataField = 'CELL_MARCA'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          Properties.Images = imgMarcas
          Properties.Items = <
            item
              Description = 'IPhone'
              ImageIndex = 0
              Value = 0
            end>
          TabOrder = 22
          Width = 131
        end
      end
    end
    object tabConsulta: TcxTabSheet
      Caption = 'Consultar Produtos'
      ImageIndex = 0
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 1113
        Height = 81
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 32
          Top = 11
          Width = 92
          Height = 13
          Caption = 'Data de Cadastro :'
        end
        object btnConsultaProdutos: TcxButton
          AlignWithMargins = True
          Left = 897
          Top = 11
          Width = 205
          Height = 59
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alRight
          Caption = 'Pesquisar'
          TabOrder = 0
          OnClick = btnConsultaProdutosClick
        end
      end
      object grdConsultaProd: TcxGrid
        Left = 0
        Top = 81
        Width = 1113
        Height = 539
        Align = alClient
        TabOrder = 1
        object grdConsultaProdDBTableView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = True
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Next.Visible = True
          Navigator.Buttons.NextPage.Visible = True
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = False
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Visible = False
          Navigator.Buttons.Edit.Enabled = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = True
          Navigator.Buttons.Refresh.Enabled = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Enabled = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Enabled = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Enabled = False
          Navigator.Buttons.Filter.Visible = False
          DataController.DataSource = frmGeralDM.dtsCadCell
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsData.Appending = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          object grdConsultaProdDBTableViewColumn1: TcxGridDBColumn
            Caption = 'C'#243'digo'
            DataBinding.FieldName = 'CELL_ID'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 136
          end
          object grdConsultaProdDBTableViewColumn2: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'CELL_DESC'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 822
          end
          object grdConsultaProdDBTableViewColumn3: TcxGridDBColumn
            Caption = 'Marca'
            DataBinding.FieldName = 'CELL_MARCA'
            PropertiesClassName = 'TcxLabelProperties'
            Properties.Alignment.Horz = taCenter
            HeaderAlignmentHorz = taCenter
            Width = 153
          end
        end
        object grdConsultaProdLevel: TcxGridLevel
          GridView = grdConsultaProdDBTableView
        end
      end
    end
  end
  object imgMarcas: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 5767856
    ImageInfo = <
      item
        ImageClass = 'TdxPNGImage'
        Image.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
          00097048597300000EC400000EC401952B0E1B00000002624B474400FF878FCC
          BF0000010449444154384F8D923D0E445010C7D956A1A0178903A89CC00D5C40
          AD528846A210B544E2244ABD52E5040AA1526A67BD316B7DBC5D7EC9DF7C64FE
          E38527C043B22CA3EC88C81EC21FE679162449C29C37FAA2F813CBB230264982
          F1023BC13FD8481445545D392C08C3100D4C866140100450140598A6B9F56559
          86BEEFC9B15B90A6E9367427DBB6C9B55BC01BE449D77572ACE082A669B8C33C
          956589C60FF817C67164E1119AA651B6820B5455C5E209755D53B6B25D245114
          B1F104B220DB45521485B27BD8CB8661580B7602469EE7878F75A70FDF6C8137
          C893EFFBE4382D68DB966B386BCFB15AE8BA0E1CC781388E619A26EC555505AE
          EB82E779587F0178031FFEB3E348A57A910000000049454E44AE426082}
      end>
  end
  object OpenDialog: TOpenDialog
    Left = 680
    Top = 160
  end
end
