unit CadProdutosFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.Menus, dxBarBuiltInMenu, cxMemo, cxDBEdit, cxPC,
  Vcl.StdCtrls, cxButtons, dxCustomTileControl, dxTileControl, cxGroupBox,
  dximctrl, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxLabel, cxTextEdit,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, cxImageList;

type
  TfrmCadProdutos = class(TForm)
    pnlCadastroDeProduto: TPanel;
    PgeCadastroComp: TcxPageControl;
    tabCadastro: TcxTabSheet;
    cxDBMemo1: TcxDBMemo;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxImageComboBox1: TcxImageComboBox;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel8: TcxLabel;
    imgFoto: TdxSpinImage;
    lblArmazenamento: TcxLabel;
    lblMemoria: TcxLabel;
    lblProcessamento: TcxLabel;
    imgMarcas: TcxImageList;
    tabConsulta: TcxTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProdutos: TfrmCadProdutos;

implementation

{$R *.dfm}

end.
