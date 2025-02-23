unit Frame.MarthiGIT.Produto;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ExtCtrls;

type
  TProdutoFrame = class(TFrame)
    lytProduto: TLayout;
    rtgProduto: TRectangle;
    lblNomeItem: TLabel;
    lblValorAPrazo: TLabel;
    lblValorAVista: TLabel;
    Label7: TLabel;
    lblID_CELL: TLabel;
    Label1: TLabel;
    btnAtualizarPro: TRectangle;
    Label2: TLabel;
    lblReferencia: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
