unit CadConfiguracoesFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinsDefaultPainters,
  Vcl.StdCtrls, cxButtons, dxGDIPlusClasses, Vcl.ExtCtrls, GeralDMFrm;

type
  TfrmConfigura��es = class(TForm)
    pnlFaixaTop: TPanel;
    Image1: TImage;
    lblTitulo: TLabel;
    btnFechar: TcxButton;
    pnlCentral: TPanel;
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfigura��es: TfrmConfigura��es;

implementation

{$R *.dfm}

procedure TfrmConfigura��es.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.