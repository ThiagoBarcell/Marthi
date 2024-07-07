unit untFuncoes;

interface

uses
  GeralDMFrm;

type TFuncoesUteis = class

public
  procedure AbreQrysInfo;

private

end;

implementation

{ TFuncoesUteis }

procedure TFuncoesUteis.AbreQrysInfo;
begin
  frmGeralDM.qryCellArmazenamento.Close;
  frmGeralDM.qryCellArmazenamento.Open;
  frmGeralDM.qryCellCondicao.Close;
  frmGeralDM.qryCellCondicao.Open;
  frmGeralDM.qryCellCor.Close;
  frmGeralDM.qryCellCor.Open;
end;

end.
