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
    object tabCadastro: TcxTabSheet
      Hint = 'Endere'#231'o'
      Caption = 'Cadastro de Produtos'
      ImageIndex = 0
      TabVisible = False
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
        object Image1: TImage
          Left = 767
          Top = 31
          Width = 298
          Height = 292
          Anchors = [akTop, akRight]
          Stretch = True
        end
        object memObsCell: TcxDBMemo
          Left = 25
          Top = 273
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CELL_OBS'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 0
          Height = 240
          Width = 607
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
        object cbxArmazenamentoCell: TcxDBImageComboBox
          Left = 138
          Top = 137
          Anchors = [akLeft, akTop, akRight]
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
          TabOrder = 11
          Width = 494
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
          Top = 219
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CELL_COR'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 14
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
          Top = 165
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CELL_CAM_PRINC'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 16
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
          Top = 192
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CELL_CAM_FRONT'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          TabOrder = 18
          Width = 494
        end
        object Panel1: TPanel
          Left = 0
          Top = 568
          Width = 1113
          Height = 76
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 19
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
        object btnPesqImagem: TcxButton
          Left = 767
          Top = 329
          Width = 298
          Height = 57
          Anchors = [akTop, akRight]
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
          TabOrder = 20
          OnClick = btnPesqImagemClick
        end
        object cbxMarcaCell: TcxDBImageComboBox
          Left = 138
          Top = 29
          Anchors = [akLeft, akTop, akRight]
          DataBinding.DataField = 'CELL_MARCA'
          DataBinding.DataSource = frmGeralDM.dtsCadCell
          Properties.Images = imgMarcas
          Properties.Items = <
            item
              Description = 'IPhone'
              ImageIndex = 0
              Value = 0
            end>
          TabOrder = 21
          Width = 494
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
