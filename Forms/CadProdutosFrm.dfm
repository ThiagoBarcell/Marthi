object frmCadProdutos: TfrmCadProdutos
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 644
  ClientWidth = 1113
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
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
    ClientRectTop = 0
    object tabConsulta: TcxTabSheet
      Caption = 'Consultar Produtos'
      ImageIndex = 0
      TabVisible = False
      object pnlTop: TPanel
        Left = 0
        Top = 0
        Width = 1113
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 32
          Top = 11
          Width = 108
          Height = 16
          Caption = 'Data de Cadastro :'
        end
        object Label2: TLabel
          Left = 232
          Top = 33
          Width = 7
          Height = 16
          Caption = 'a'
        end
        object btnConsultaProdutos: TcxButton
          AlignWithMargins = True
          Left = 681
          Top = 10
          Width = 205
          Height = 45
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alRight
          Caption = 'Pesquisar'
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000000473424954080808087C0864880000000970485973000000A6000000
            A601DD7DFF380000001974455874536F667477617265007777772E696E6B7363
            6170652E6F72679BEE3C1A0000026F494441544889ADD54D6894571406E0E70E
            66531004B18B54EBCFC6715102F9511743AD356E142976EB0FB810AC68110A42
            411752742D314DA1505C48A1E046A20B4390AADD149CB41841A3054D74E5AE28
            2254CAEDE29EE038F9268925173E868F39F77DDF73CE7BCE9772CEDA4F4A692D
            76A11F03F8080FD0C41D8CE69C5FCEB958716A6DC029A5741C37D18DABD88D8D
            381C040DFC9152DAB1180239679145377EC565ACC629DCC0733CC6335CC141F4
            E04F8CA06B16A3EA99054F017E24144EE13CFAD0853AD6633BC6703DDE2FE1CC
            62088E87F2069E625B4B66B5F8EF1FFC8ECF43C80CD6E0117A3B12602D9E4459
            A65AC1DB0257607F94AB1FA72383CF7017B54E045FE1BBA8F9F9F9D28D0B5BF1
            101FB634FD376CAA8A4FF809A3F81A2773CE130B1923A57408ABF02F3EC04A4C
            E49C2F55C54F462D9F2FE488B64C6AF834C4EDC750555C4D19A2D77895737EB3
            90FA96730CD358A7F4704355504D99D055E84A292D5F2C7ACE79089FE05E804F
            7722682A7E9F50DCF13E67B3B23AEA8A5D2BCF3EFCA04CE8D87BF460A5529ABA
            52857AA71E8C6250F1724E291D59A4FAEFF16364713FE73C5519156A7628BB65
            BD32A1A7B16C1EE5BFE09632A44F7160DE5511174794C95C13BF4D7CA358F163
            65AB9E89B27C1BE07FE182B208372F44D015008F94F16F4426A3CAACFC8C1351
            F383A1FC42DCDD83BF31306792DB3F3829A55E5CC40BC5594D6F7D5EC797B8AF
            ACEE73388AB3B88D2FB037E7DC7CA7071DA674130E6008D730ACAC937A4BDC96
            503E1CEFB3DBB86F4E89FEEF132E7A86461B49EF921004E84005C90C7A968420
            40FB43F92CC920C6978C2040FB42F960186272490982A407E361ED9DFF017569
            09E8BC4308980000000049454E44AE426082}
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnConsultaProdutosClick
        end
        object edtStartDate: TDateTimePicker
          Left = 32
          Top = 30
          Width = 186
          Height = 24
          Date = 45406.000000000000000000
          Time = 0.609326111109112400
          TabOrder = 1
        end
        object edtEndDate: TDateTimePicker
          Left = 251
          Top = 30
          Width = 186
          Height = 24
          Date = 45406.000000000000000000
          Time = 0.609326111109112400
          TabOrder = 2
        end
        object btnInserir: TcxButton
          AlignWithMargins = True
          Left = 899
          Top = 10
          Width = 204
          Height = 45
          Margins.Top = 10
          Margins.Right = 10
          Margins.Bottom = 10
          Align = alRight
          Caption = 'Inserir'
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000000970485973000000B1000000B101C62D498D0000001974455874536F
            667477617265007777772E696E6B73636170652E6F72679BEE3C1A000000E149
            4441544889ED94AD0EC23014853F081612D4905814128BE20150282C028D2428
            9E610FC053A048780834C90C18FE42086E8895A56976BB6E30C1CF499AB627F7
            9EB39EA6834F47C9D8AF53EA97C05CDBB7001FD8010317C330652C8CFA8EE2B7
            926045E047C039811785249811856A6E007BA1A70DCCD4BA0E74811B517C0057
            6028193EA3F02C1FD5C31EE3512F9622B261038CD5BA094C80033055DCDDD6EC
            72021DA9975C7614CA8D3C11E90888A239B936648D484795E8D1F94519785A7F
            8CC2EFE06FF00306D243EB03978C5AB52452FA5DBF8A58D73CC1EA4D065F8407
            753D36911D63348B0000000049454E44AE426082}
          TabOrder = 3
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = btnInserirClick
        end
      end
      object grdConsultaProd: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 68
        Width = 1107
        Height = 573
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
          OnCellDblClick = grdConsultaProdDBTableViewCellDblClick
          DataController.DataSource = frmGeralDM.dtsCadCell
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsData.Appending = True
          OptionsSelection.CellSelect = False
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
            Properties.Alignment.Horz = taLeftJustify
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
    object tabCadastro: TcxTabSheet
      Hint = 'Endere'#231'o'
      Caption = 'Cadastro de Produtos'
      ImageIndex = 0
      TabVisible = False
      OnShow = tabCadastroShow
      object pnlCadastroDeProduto: TPanel
        Left = 0
        Top = 0
        Width = 1113
        Height = 644
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          1113
          644)
        object dxBevel1: TdxBevel
          Left = 0
          Top = 565
          Width = 1113
          Height = 3
          Align = alBottom
          ExplicitTop = 540
        end
        object ImageCell: TImage
          Left = 767
          Top = 31
          Width = 298
          Height = 292
          Anchors = [akTop, akRight]
          Stretch = True
        end
        object memObsCell: TcxDBMemo
          Left = 138
          Top = 192
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CELL_OBS'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 0
          Height = 79
          Width = 494
        end
        object edtCellDesc: TcxDBTextEdit
          Left = 138
          Top = 56
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CELL_DESC'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 1
          Width = 494
        end
        object edtCellMemoriaRAM: TcxDBTextEdit
          Left = 138
          Top = 110
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CELL_MEM_RAM'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 2
          Width = 494
        end
        object edtCellProcessamento: TcxDBTextEdit
          Left = 138
          Top = 83
          Anchors = [akLeft, akTop, akRight]
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
          Top = 31
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
          Left = 64
          Top = 192
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
          Top = 59
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
          Top = 29
          Anchors = [akTop, akRight]
          Caption = 'Imagem :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
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
        object cxLabel3: TcxLabel
          Left = 37
          Top = 140
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
          Top = 137
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CELL_CAM_PRINC'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 12
          Width = 494
        end
        object cxLabel4: TcxLabel
          Left = 47
          Top = 167
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
          Top = 164
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CELL_CAM_FRONT'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 14
          Width = 494
        end
        object Panel1: TPanel
          Left = 0
          Top = 568
          Width = 1113
          Height = 76
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 15
          object btnSalvar: TcxButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 559
            Height = 70
            Align = alLeft
            Anchors = [akTop, akRight, akBottom]
            Caption = 'Salvar'
            OptionsImage.Glyph.SourceDPI = 96
            OptionsImage.Glyph.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
              F80000000473424954080808087C086488000000097048597300000B1500000B
              15018099D8830000001974455874536F667477617265007777772E696E6B7363
              6170652E6F72679BEE3C1A0000010B494441544889EDD4B12E444114C6F1DFAC
              151295621385627B215148741A22A1D4A9B40A9528C433A8BC8257506925649F
              424221B6169160143BC5BAEEDE3B7657219CE42BCEDCF9BEFF2DCE1C314675C2
              0A5E11FBB496E36DC8AB194C14CE66738CB980A1EB1FF0070021CDF9D70F214C
              E1486F3CDBD82B5CB9C23D5EB01F637C2E0DAA7960E73E3FAE329D5566D400A6
              7153117E8DC9A101093287BB92F047CCD7FA3377D1329EFAC2DFB09EE5CDB994
              203B784F80935CDFC0291A3059C758C26ECC34061C603BF59731C6D36C62F94F
              1C6223B5174D2C60331D3C8C129E6AB12FEFF6F7AF8A1F07340B7D2B84B03A62
              66AB0AB09534B66AA03BCEC04275E9ADE28EFAADF95D75D0FE00B82B822B6955
              A9E20000000049454E44AE426082}
            TabOrder = 0
            OnClick = btnSalvarClick
          end
          object btnVoltar: TcxButton
            AlignWithMargins = True
            Left = 568
            Top = 3
            Width = 542
            Height = 70
            Align = alRight
            Anchors = [akLeft, akTop, akBottom]
            Caption = 'Voltar'
            OptionsImage.Glyph.SourceDPI = 96
            OptionsImage.Glyph.Data = {
              89504E470D0A1A0A0000000D4948445200000018000000180803000000D7A9CD
              CA0000000373424954080808DBE14FE000000009704859730000018400000184
              01971E7CA60000001974455874536F667477617265007777772E696E6B736361
              70652E6F72679BEE3C1A00000066504C5445FFFFFF0000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000004EE8365300000021
              74524E530002040F12162328292A2D484B5C5E767D7F90B2B3C1C6CAD0D6E6E8
              EAF3F7F8FAB8FD42A2000000B249444154289175925D1B82200C850F14A18682
              999094C2FEFF9FECC28FF4B1ED6EEF78CEC6D980399469BB18BBD628EC43BA4C
              34F6FD48949DFCF12290AFB50084AE3D8562E5CD94AC581361D3D42CEFA7A1DC
              EB96C35400800CE9C081320509C0915DF2DB5AB1E40095FDAC7F4F8FAD8FCF0A
              86EA857FAA4DAC268396F48943538B6E14270E3176883D802AD1FBB5C4F302A0
              8F7C8195629BB3E3B21FFC59A2AE074B781359DBF945F1ABE58F017FCEE70B8F
              7713357219E2DF0000000049454E44AE426082}
            TabOrder = 1
            OnClick = btnVoltarClick
          end
        end
        object cbxMarcaCell: TcxDBImageComboBox
          Left = 138
          Top = 29
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CELL_MARCA'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          Properties.Alignment.Horz = taLeftJustify
          Properties.Images = imgMarcas
          Properties.Items = <
            item
              Description = 'IPhone'
              ImageIndex = 0
              Value = 0
            end>
          TabOrder = 16
          Width = 494
        end
        object cxGridImages: TcxGrid
          Left = 767
          Top = 387
          Width = 302
          Height = 67
          TabOrder = 17
          LookAndFeel.SkinName = 'UserSkin'
          object cxGridImagesDBTableViewImage: TcxGridDBTableView
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
            OnCellClick = cxGridImagesDBTableViewImageCellClick
            DataController.DataSource = frmGeralDM.dtsImagensCell
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsData.Appending = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.Header = False
            OptionsView.HeaderHeight = 30
            object cxgrdbclmnGridImagesDBTableViewImageColumnSEQUENCIA: TcxGridDBColumn
              Caption = 'Imagem'
              DataBinding.FieldName = 'SEQUENCIA'
              PropertiesClassName = 'TcxLabelProperties'
              Properties.Alignment.Horz = taCenter
              HeaderAlignmentHorz = taCenter
            end
          end
          object cxGridImagesLevelImage: TcxGridLevel
            GridView = cxGridImagesDBTableViewImage
          end
        end
        object btnAddImage: TcxButton
          Left = 767
          Top = 324
          Width = 148
          Height = 57
          Anchors = [akTop, akRight]
          Caption = 'Adicionar'
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000000473424954080808087C086488000000097048597300000B1500000B
            15018099D8830000001974455874536F667477617265007777772E696E6B7363
            6170652E6F72679BEE3C1A0000010B494441544889EDD4B12E444114C6F1DFAC
            151295621385627B215148741A22A1D4A9B40A9528C433A8BC8257506925649F
            424221B6169160143BC5BAEEDE3B7657219CE42BCEDCF9BEFF2DCE1C314675C2
            0A5E11FBB496E36DC8AB194C14CE66738CB980A1EB1FF0070021CDF9D70F214C
            E1486F3CDBD82B5CB9C23D5EB01F637C2E0DAA7960E73E3FAE329D5566D400A6
            7153117E8DC9A101093287BB92F047CCD7FA3377D1329EFAC2DFB09EE5CDB994
            203B784F80935CDFC0291A3059C758C26ECC34061C603BF59731C6D36C62F94F
            1C6223B5174D2C60331D3C8C129E6AB12FEFF6F7AF8A1F07340B7D2B84B03A62
            66AB0AB09534B66AA03BCEC04275E9ADE28EFAADF95D75D0FE00B82B822B6955
            A9E20000000049454E44AE426082}
          TabOrder = 18
          OnClick = btnAddImageClick
        end
        object btnExcluiImg: TcxButton
          Left = 915
          Top = 324
          Width = 148
          Height = 57
          Anchors = [akTop, akRight]
          Caption = 'Excluir'
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000000473424954080808087C0864880000000970485973000000B1000000
            B101C62D498D0000001974455874536F667477617265007777772E696E6B7363
            6170652E6F72679BEE3C1A000001B0494441544889BDD5B96E14411006E0CF18
            091B4B1C9285CD2688CC2101208E9077E01170C233E00824520202725202528E
            0410214204E420BC876141205F0201C1546BC6B3333B6D4B5052AB6BA6AAFAAF
            FABBBA9B7F2C331DF613B886432DF6DF7882EF074DE036FE748C5BD31638DC01
            B010F3757CADD94EE161C5A713E0288E602E061C8BF90BC62DB1C77136F49DCA
            D8AE3A5FC4AE6E3A72C70ECEC16C05790E43AC60840FF811F6DD5A76D52CD723
            6E265878A4D8F8C7E1B347CE440677EB860CB917B14BD59FF5F6EB87532FBEAF
            E2BEB29D6F6235F4593C50D02B627E61A32B930D3C0DFD4E00A64D7C8F37A1AF
            846D2DBE5FE1637DB1A603D4AF5490B2596AF05B8E7954A9A09F03B08ED3A10F
            6A8B35010C14142E476C27405F71452C28BA83E60AD2BF214E2ABA30BB829461
            2E40A2340B2039F594144D03182829CDA648048DF1730AC0668C7D5590B2E829
            DA70A47D93538507AE8082E3B60A8635DF890A9AAEEBFA697E81F3A1BF55DE2F
            43BC0C3DFB1427F98C67B9CE01F4A9C9D0F6E0BCC365DC30F9D0D4651117F07C
            1F09B9826FF2EFFFB192C63D32EDD15FC425CC7724B385D7265FBCFF237F01AF
            BD8C981C734D460000000049454E44AE426082}
          TabOrder = 19
          OnClick = btnExcluiImgClick
        end
        object grdCell_Itens: TcxGrid
          Left = 138
          Top = 350
          Width = 494
          Height = 196
          TabOrder = 20
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = False
          LookAndFeel.SkinName = 'UserSkin'
          object cxGridDBTableViewCell_Itens: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            Navigator.Buttons.First.Visible = True
            Navigator.Buttons.PriorPage.Visible = False
            Navigator.Buttons.Prior.Visible = True
            Navigator.Buttons.Next.Visible = True
            Navigator.Buttons.NextPage.Visible = False
            Navigator.Buttons.Last.Visible = True
            Navigator.Buttons.Insert.Visible = True
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
            Navigator.Visible = True
            OnCellClick = cxGridImagesDBTableViewImageCellClick
            DataController.DataSource = frmGeralDM.dtsCellItens
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsData.Appending = True
            OptionsView.ColumnAutoWidth = True
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 30
            object cxGridDBTableViewCell_ItensColumnARMAZENAMENTO_ID: TcxGridDBColumn
              Caption = 'Armazenamento'
              DataBinding.FieldName = 'ARMAZENAMENTO_ID'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <>
              HeaderAlignmentHorz = taCenter
              Width = 105
            end
            object cxGridDBTableViewCell_ItensColumnCOR_ID: TcxGridDBColumn
              Caption = 'Cor'
              DataBinding.FieldName = 'COR_ID'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <>
              HeaderAlignmentHorz = taCenter
              Width = 88
            end
            object cxGridDBTableViewCell_ItensColumnCODICAO_ID: TcxGridDBColumn
              Caption = 'Condi'#231#227'o'
              DataBinding.FieldName = 'CODICAO_ID'
              PropertiesClassName = 'TcxImageComboBoxProperties'
              Properties.Items = <>
              HeaderAlignmentHorz = taCenter
              Width = 111
            end
            object cxGridDBTableViewCell_ItensColumnCELL_VAL_UNIT: TcxGridDBColumn
              Caption = 'Valor Unit'#225'rio'
              DataBinding.FieldName = 'CELL_VAL_UNIT'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 91
            end
            object cxGridDBTableViewCell_ItensColumnCELL_VAL_PARC: TcxGridDBColumn
              Caption = 'Valor Parcelado'
              DataBinding.FieldName = 'CELL_VAL_PARC'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Properties.Alignment.Horz = taRightJustify
              HeaderAlignmentHorz = taCenter
              Width = 97
            end
          end
          object grdLevelCell_Itens: TcxGridLevel
            GridView = cxGridDBTableViewCell_Itens
          end
        end
        object cxLabel1: TcxLabel
          Left = 51
          Top = 287
          Caption = 'Especifica'#231#245'es :'
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
        end
        object btnCadArmazenamento: TcxButton
          Left = 138
          Top = 287
          Width = 160
          Height = 57
          Anchors = [akTop, akRight]
          Caption = 'Cadastro de '#13' Armazenamento'
          LookAndFeel.NativeStyle = True
          LookAndFeel.SkinName = ''
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000000970485973000000B1000000B101C62D498D0000001974455874536F
            667477617265007777772E696E6B73636170652E6F72679BEE3C1A0000018449
            4441544889EDD6BF4B56511CC7F197693F70949E2192A6240437211E1CA3A13F
            A031C83FE001215A8236977050707274566A796AE8295A1B82A62CA867482A5A
            224A07A5041DCEB97ABC9C9B57AF631F389CC3F71CDE9F73B8F7FB3D876A8DE1
            3576B05BB3FDC54BB4FEC105D7F00D1FD1C13656F1308216B014C7F7F00C3F31
            13FBF93AF00FB814639BB88FAB117A13B7E3F82266F125AE7D8A6E011BCAC05F
            610337F03DC6DFE1137EE033BEE2778C6DC67E2DAEDDADDAF995CCCE4FA26E7A
            8233C9C4030C9676DE58A9C128DE9C26BC6C403841531D62A406DBB885F106F0
            F1C8D8CA4D4E097F40BB81413B32A68A407A820B0DC0659DCF059FE08F904C27
            D598502E1E178134D1CEA2873EEE60E298F0B758C1739CCB197090858B71FCAB
            267C44C8E815A54C2E1B141AC01C1ED53498C5746EA29C07A7AEFF0647AAEA23
            C3654CD6E45496F72A830DE1AAECD43480F7750C06627F5D28DFC7D17AC2D8CF
            85D4A08FBBC2C59DAD86476812C342A15BCE2D68E185504BEA3E5372CF969EE4
            D9B2075A746663A04FF9E00000000049454E44AE426082}
          TabOrder = 22
        end
        object btnCadCor: TcxButton
          Left = 306
          Top = 287
          Width = 160
          Height = 57
          Anchors = [akTop, akRight]
          Caption = 'Cadastro de Cor'
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000000473424954080808087C0864880000000970485973000000A6000000
            A601DD7DFF380000001974455874536F667477617265007777772E696E6B7363
            6170652E6F72679BEE3C1A0000030C4944415448898DD54D8896551407F0DF75
            5E261DFB92026D48E98389628C2467A2458BCA301AC416D5540415D5C2DA448B
            2041C73EEC6355649BCA905C147D6D42A50FB185A43591A4A6B4A888A8260922
            2D26DF99626E8B7B1E7C7AE67DB30B97E739F79E73FEE7FCEFB9E7A69CB36E23
            A574168671457C87D1836F627E812D39E7A3A1DF8737F15CCEF92390739E35D1
            C218FE42C6116CC306ACC356ECC1148EE1199C8F5DA13F896B73CEB30170313E
            C334D66371A72042F71C3C85DF6A8E5705D0242E6D1ADC89E33888658DBD6B70
            37E675005A15007784DC87EFB1B3AE744938DF8CDE8683B170F037F67700D810
            54B56A6B4FE25825F4603C22EFEDE0E030DEC7BD01B4B4B17F5FAC0FD5D63EC6
            C14A581B9C2FAB290CE0B4F8DF8419FC1AA9F73400E6E3DBC8E245EC0BC05138
            3BAA61AC66F05628FC81D538150F54D5D2E5C09F0F0A8FC6014FA3176E0867FD
            A13818F27A7C8EDDDDAAA801F02A3E8DFFDBC2C7992D0CE148CE7942193FE14F
            8CE022BCE32423A574356E463BA5F4069604A5D3F02E7634A2B945B90BAFE1BC
            9344BE3202FA2AA2DE8D091CA8BAC48F78FCFFD0D0C1F908DA7819B706C0E9D8
            823D39677394B630534BF7C294D2C694D23DD15BBAD1D2522AE603AC51EE10CC
            8B795C38DF87E561D41329CEC719CAE57BB80BC628166324E73C93526A02B461
            4E000CC5E620FAF1203E542AACDB588DBD39E7432177CCA002589452EAC797F8
            5AE174A5D27ABB8D01E58657A36B06E34A39DD9FCBC90DE3215C8F8D29A5C194
            D2E694D2D329A58535870BF14B4D6E77CAA0AA86754AEF5FDEA892A43C2C134A
            29BE5EDBDB816D35F902A58AAEC3216CAAAA88D202F6636B4AE9945A54FD61F8
            02DEC355B5BD4F70E57F507422835A8B686BB46BE522E6986B6BEB2B626D20E4
            054E34B8093C3AEB4553DAEE9472D897D7685A81CB1ABA1525B7873C37E4BB94
            17EE913A455536AF2877620AE329A5279426B82BE77CC0BFC792F8FE1EB6ED00
            E84C5123BA9672F05361F433B6E331A5C29E550EFD30FA6A763F6067D8DC348B
            A20E408B706338DE1EDC4EE23BBC84731BFAA3CA83F4B6783EFF01AB8D8E7B9C
            C436730000000049454E44AE426082}
          TabOrder = 23
        end
        object btnCadCondicao: TcxButton
          Left = 472
          Top = 287
          Width = 160
          Height = 57
          Anchors = [akTop, akRight]
          Caption = 'Cadastro de'#13'Condi'#231#227'o'
          OptionsImage.Glyph.SourceDPI = 96
          OptionsImage.Glyph.Data = {
            89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
            F80000000473424954080808087C0864880000000970485973000000A6000000
            A601DD7DFF380000001974455874536F667477617265007777772E696E6B7363
            6170652E6F72679BEE3C1A00000290494441544889ADD549C856551807F0DFE3
            F07DBA300AC40690425CB8093F0A052B2C23C4120A0A8B2828B4852D4431A245
            8B72114444426D0269000BDA24D552852252A8504AC3A201CA0635332A1AD486
            A7C57DBEBCEFEBBDAF251D389CE1FECFFFFF4CE75C99A9AF630176E120D68EC2
            F672F410DF8027F109BEC54EFC8967B011B3FF9300C6B01013D880C467781B97
            621C2FE03D9CC4EEC24EE0820E03A7B5E66EC4E1229DEC0731DEE3DDA621ECEF
            D852DFA6E231FC818F3137F03E7E2DD71357E3517C889F9CDE16E203ACABF50A
            3C84CBEAEC13781CB7635714E9BD99F9F4244344DC5C07C73A043EC2739979A4
            B033F01BEEC783783933EF89883DD8AF04CEAA422A2C338AE3688D6B705BCDAF
            FF3F0512EFD6781CDB33D394B6EF11B13222CE8B883911B13F2236778468B82D
            ADF1A9CC5C84473455B72C226E19F0005F622F0EE06BCC3F83F5D335C5B00763
            B5F73AF6E1557C3EE0016EC2253817CB32F3D33358BF1E17E1D6CC3C191113B8
            A64275BEE6CE0CE60073755C9E0EEB2FD494F19AD6DEF34EE5E31B4DD90E8468
            0EA694EB5BB06184C0D60AE9F496E0F1E2BBAB15B20181EFF1225E29F0753DE4
            1375EEBED6DE6BB5F7DD107640E00ECD353F819523ACDF8C1F30ABD66B8B6777
            8D333B056A6339968E209F8A4378A9C2B900BF6007AED03C3BB37B05FE4572AF
            6C25F21D4D5927EE9ECC451B3FAD5D7311B10FCFE21C2CCFCCAB9CDE16979577
            625B85F39F969987DAEBE17BB0B3E2BB09DB3BC86111BED23C6C3F63550F0E06
            3DC08FAD79D7533D29301F4734757E6094C0B007ABF1B0C68BD5C3E08818C73C
            CDCF644966EE1D45CE290F0232F3E251E0CC3C51FF8AB732F358FBAC26D19D02
            6FE08188E80575B45585876BF117DEEC035FAE7901F32CFB1758D757D67F03FF
            DAA6321D9AA7EA0000000049454E44AE426082}
          TabOrder = 24
        end
      end
    end
  end
  object imgMarcas: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 8389600
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
    Left = 992
    Top = 192
  end
end
