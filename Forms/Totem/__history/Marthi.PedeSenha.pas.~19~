unit Marthi.PedeSenha;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.ListBox,
  FMX.StdCtrls,
  FMX.Controls.Presentation,
  FMX.Edit,
  FMX.Layouts,
  FMX.Effects,
  FMX.Objects,
  MyVirtualKeyboard,
  Marthi.TecladoVirtual;

type
  TfrmPedeSenhaMarthi = class(TForm)
    Rectangle4: TRectangle;
    ShadowEffect1: TShadowEffect;
    Principal: TLayout;
    edtSenha: TEdit;
    lbl3: TLabel;
    btnCancelar: TRectangle;
    lbl12: TLabel;
    btnConfirmar: TRectangle;
    lbl15: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl16: TLabel;
    Rectangle2: TRectangle;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure edtSenhaEnter(Sender: TObject);
    procedure edtSenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    Senha : string;
    Autenticacao : Boolean;
    { Public declarations }
  end;

var
  frmPedeSenhaMarthi: TfrmPedeSenhaMarthi;
  IsKeyboardShown: Boolean = False;

implementation

{$R *.fmx}

procedure TfrmPedeSenhaMarthi.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPedeSenhaMarthi.btnConfirmarClick(Sender: TObject);
begin
  if Senha = edtSenha.Text then
  begin
    Autenticacao := True;
    Close;
  end
  else
    MessageDlg('Senha Invalida !', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
end;

procedure TfrmPedeSenhaMarthi.edtSenhaClick(Sender: TObject);
begin
  if not Assigned(TecladoVirtualfrm) then
    TecladoVirtualfrm := TTecladoVirtualfrm.Create(Self);

  // Posiciona o teclado próximo ao TEdit
  TecladoVirtualfrm.Left := Round(TEdit(Sender).AbsoluteRect.Left);
  TecladoVirtualfrm.Top := Round(TEdit(Sender).AbsoluteRect.Bottom);

  // Associa explicitamente o TEdit ao teclado virtual
  TecladoVirtualfrm.SetTargetEdit(TEdit(Sender));

  // Exibe o teclado
  TecladoVirtualfrm.Show;
end;

procedure TfrmPedeSenhaMarthi.edtSenhaEnter(Sender: TObject);
begin
  
//  if not IsKeyboardShown then
//  begin
//    ShowKeyboardOn(TEdit(Sender));
//    IsKeyboardShown := True; // Marca como exibido
//  end
//  else
//    IsKeyboardShown := False;
end;

procedure TfrmPedeSenhaMarthi.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  // Verifica se tecla digitada foi < Enter >
  if ( Key = vkReturn ) then
  begin
    btnConfirmarClick(Sender);
  end;
end;

end.
