unit CadInformarcoesFrm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  dxBarBuiltInMenu,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxPC,
  GeralDMFrm,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  dxDateRanges,
  Data.DB,
  cxDBData,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  cxTextEdit;

type
  TfrmCadInformacoes = class(TForm)
    PgeCadastroComp: TcxPageControl;
    tabArmazenamento: TcxTabSheet;
    tabCondicao: TcxTabSheet;
    tabCor: TcxTabSheet;
    grdCadastroArmazenamentoDBTableView: TcxGridDBTableView;
    grdCadastroArmazenamentoLevel: TcxGridLevel;
    grdCadastroArmazenamento: TcxGrid;
    grdCadastroCondicao: TcxGrid;
    grdCadastroCondicaoDBTableView: TcxGridDBTableView;
    grdCadastroCondicaoLevel: TcxGridLevel;
    grdCadastroCor: TcxGrid;
    grdCadastroCorDBTableView: TcxGridDBTableView;
    grdCadastroCorLevel: TcxGridLevel;
    grdCadastroCondicaoDBTableViewColumn1: TcxGridDBColumn;
    grdCadastroArmazenamentoDBTableViewColumn2: TcxGridDBColumn;
    grdCadastroCorDBTableViewColumn1: TcxGridDBColumn;
    tabTpPreco: TcxTabSheet;
    grdTpPreco: TcxGrid;
    grdTpPrecoDBTableView: TcxGridDBTableView;
    grdTpPrecoDBColumn: TcxGridDBColumn;
    grdTpPrecoLevel: TcxGridLevel;
  private
    { Private declarations }
  public
    { Public declarations }

  constructor Create( AOwner: TComponent; iInformacao : Integer );
  end;

var
  frmCadInformacoes: TfrmCadInformacoes;

implementation

{$R *.dfm}

{ TfrmCadInformacoes }

constructor TfrmCadInformacoes.Create(AOwner: TComponent; iInformacao: Integer);
begin
  inherited Create( AOwner );
  case iInformacao of
    0 : begin
          PgeCadastroComp.ActivePageIndex := iInformacao;
          frmGeralDM.qryCellArmazenamento.Close;
          frmGeralDM.qryCellArmazenamento.Open;
        end;

    1 : begin
          PgeCadastroComp.ActivePageIndex := iInformacao;
          frmGeralDM.qryCellCondicao.Close;
          frmGeralDM.qryCellCondicao.Open;
        end;

    2 : begin
          PgeCadastroComp.ActivePageIndex := iInformacao;
          frmGeralDM.qryCellCor.Close;
          frmGeralDM.qryCellCor.Open;
        end;

    3 : begin
          PgeCadastroComp.ActivePageIndex := iInformacao;
          frmGeralDM.qryCellTpPreco.Close;
          frmGeralDM.qryCellTpPreco.Open;
        end;
  end;
end;

end.
