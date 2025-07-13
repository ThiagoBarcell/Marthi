unit GeraisDMFrm;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, FMX.ImgList;

type
  TfrmGeraisDM = class(TDataModule)
    imgGerais: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraisDM: TfrmGeraisDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
