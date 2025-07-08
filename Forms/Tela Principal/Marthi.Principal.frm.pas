unit Marthi.Principal.frm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts;

type
  TfrmPrincipal = class(TForm)
    lytClient: TLayout;
    pnlPrincipal: TRectangle;
    pnlTopo: TRectangle;
    pnlMenu: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle1: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Label2: TLabel;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Label3: TLabel;
    procedure Rectangle4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.Rectangle4Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
