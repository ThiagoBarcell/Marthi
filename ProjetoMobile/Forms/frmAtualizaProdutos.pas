unit frmAtualizaProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TAtualizaProdutosFrm = class(TForm)
    rtgPrincipal: TRectangle;
    rtgButtons: TRectangle;
    rtgBtnAtualizarValores: TRectangle;
    Rectangle1: TRectangle;
    rtgImageProd: TRectangle;
    Rectangle2: TRectangle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AtualizaProdutosFrm: TAtualizaProdutosFrm;

implementation

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}

end.
