unit Marthi.TipoRetirada;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  untFuncoes;

type
  TtipoRetirada = record
    TipoRetirada : Integer;
  end;

  TfrmTipoRetirada = class(TForm)
    Layout1: TLayout;
    btnProntaEntrega: TRectangle;
    btnPorEncomenda: TRectangle;
    ShadowEffect9: TShadowEffect;
    ShadowEffect1: TShadowEffect;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Label1: TLabel;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Label2: TLabel;
    procedure btnProntaEntregaClick(Sender: TObject);
    procedure btnPorEncomendaClick(Sender: TObject);
  private
    { Private declarations }
  public
    Tipo : TtipoRetirada;
    { Public declarations }
  end;

var
  frmTipoRetirada: TfrmTipoRetirada;

implementation

{$R *.fmx}

procedure TfrmTipoRetirada.btnPorEncomendaClick(Sender: TObject);
begin
  Tipo.TipoRetirada := 1;
  close;
end;

procedure TfrmTipoRetirada.btnProntaEntregaClick(Sender: TObject);
begin
  Tipo.TipoRetirada := 0;
  Close;
end;

end.
