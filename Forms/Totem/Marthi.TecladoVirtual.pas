﻿unit Marthi.TecladoVirtual;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.TabControl,
  FMX.Edit, FMX.Platform, FMX.VirtualKeyboard, FMX.Layouts;

type
  TTecladoVirtualfrm = class(TForm)
    Rectangle11: TRectangle;
    RecBotoesLetras: TRectangle;
    RecTeclado: TRectangle;
    Rectangle2: TRectangle;
    Rectangle12: TRectangle;
    KeyQ: TRectangle;
    lblQ: TLabel;
    Rectangle4: TRectangle;
    KeyW: TRectangle;
    lblW: TLabel;
    Rectangle6: TRectangle;
    KeyO: TRectangle;
    lblO: TLabel;
    Rectangle10: TRectangle;
    KeyY: TRectangle;
    lblY: TLabel;
    Rectangle13: TRectangle;
    KeyI: TRectangle;
    lblI: TLabel;
    Rectangle8: TRectangle;
    KeyR: TRectangle;
    lblR: TLabel;
    Rectangle15: TRectangle;
    KeyU: TRectangle;
    lblU: TLabel;
    Rectangle17: TRectangle;
    KeyE: TRectangle;
    lblE: TLabel;
    Rectangle19: TRectangle;
    KeyT: TRectangle;
    lblT: TLabel;
    Rectangle21: TRectangle;
    KeyP: TRectangle;
    lblP: TLabel;
    Rectangle23: TRectangle;
    Rectangle24: TRectangle;
    KeyZ: TRectangle;
    lblZ: TLabel;
    Rectangle28: TRectangle;
    KeyX: TRectangle;
    lblX: TLabel;
    Rectangle30: TRectangle;
    KeyPonto: TRectangle;
    lblPonto: TLabel;
    Rectangle32: TRectangle;
    KeyN: TRectangle;
    lblN: TLabel;
    Rectangle34: TRectangle;
    KeyVirgula: TRectangle;
    lblVirgula: TLabel;
    Rectangle36: TRectangle;
    KeyV: TRectangle;
    lblV: TLabel;
    Rectangle38: TRectangle;
    KeyM: TRectangle;
    lblM: TLabel;
    Rectangle40: TRectangle;
    KeyC: TRectangle;
    lblC: TLabel;
    Rectangle42: TRectangle;
    KeyB: TRectangle;
    lblB: TLabel;
    Rectangle48: TRectangle;
    Rectangle49: TRectangle;
    KeyA: TRectangle;
    lblA: TLabel;
    Rectangle51: TRectangle;
    KeyS: TRectangle;
    lblS: TLabel;
    Rectangle53: TRectangle;
    KeyL: TRectangle;
    lblL: TLabel;
    Rectangle55: TRectangle;
    KeyH: TRectangle;
    lblH: TLabel;
    Rectangle57: TRectangle;
    KeyK: TRectangle;
    lblK: TLabel;
    Rectangle59: TRectangle;
    KeyF: TRectangle;
    lblF: TLabel;
    Rectangle61: TRectangle;
    KeyJ: TRectangle;
    lblJ: TLabel;
    Rectangle63: TRectangle;
    KeyD: TRectangle;
    lblD: TLabel;
    Rectangle65: TRectangle;
    KeyG: TRectangle;
    lblG: TLabel;
    Rectangle67: TRectangle;
    KeyÇ: TRectangle;
    lblÇ: TLabel;
    RecBotoesFixos: TRectangle;
    Rectangle72: TRectangle;
    KeyDelete: TRectangle;
    lblDelete: TLabel;
    KeySpace: TRectangle;
    lblSpace: TLabel;
    Rectangle74: TRectangle;
    KeyQBackSpace: TRectangle;
    lblBackSpace: TLabel;
    RecBotoesNumericos: TRectangle;
    Rectangle5: TRectangle;
    Key7: TRectangle;
    lbl7: TLabel;
    Rectangle9: TRectangle;
    Key8: TRectangle;
    lbl8: TLabel;
    Rectangle35: TRectangle;
    Key9: TRectangle;
    lbl9: TLabel;
    Rectangle50: TRectangle;
    Rectangle52: TRectangle;
    Key1: TRectangle;
    lbl1: TLabel;
    Rectangle56: TRectangle;
    Key2: TRectangle;
    lbl2: TLabel;
    Rectangle78: TRectangle;
    Key3: TRectangle;
    lbl3: TLabel;
    Rectangle85: TRectangle;
    Key4: TRectangle;
    lbl4: TLabel;
    Rectangle87: TRectangle;
    Key5: TRectangle;
    lbl5: TLabel;
    Rectangle99: TRectangle;
    Key6: TRectangle;
    lbl6: TLabel;
    Rectangle14: TRectangle;
    Key0: TRectangle;
    lbl0: TLabel;
    RecEnter: TRectangle;
    KeyEnter: TRectangle;
    lblEnter: TLabel;
    KeytraçoPrin: TRectangle;
    Keytraço: TRectangle;
    lbltraço: TLabel;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    img3: TImage;
    edtEditar: TEdit;
    procedure KeyQClick(Sender: TObject);
    procedure edtEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    private
    { Private declarations }
    procedure KeyClick(Sender: TObject);

  public
    FTargetEdit: TEdit;
    procedure SetTargetEdit(ATargetEdit: TEdit);
    { Public declarations }
  end;

var
  TecladoVirtualfrm: TTecladoVirtualfrm;

implementation

{$R *.fmx}

{ TTecladoVirtualfrm }

procedure TTecladoVirtualfrm.SetTargetEdit(ATargetEdit: TEdit);
begin
  FTargetEdit := ATargetEdit;

//  if FTargetEdit.Name = 'edtTelCli' then
//      RecTeclado.Enabled := False
//    else
//      RecTeclado.Enabled := True;
end;

procedure TTecladoVirtualfrm.edtEditarClick(Sender: TObject);
begin
  SetTargetEdit(edtEditar);
end;

procedure TTecladoVirtualfrm.FormCreate(Sender: TObject);
begin
  FTargetEdit := edtEditar;
end;

procedure TTecladoVirtualfrm.FormShow(Sender: TObject);
begin
//  edtEditar.SetFocus;
//  // Somente define o edit local se nenhum outro foi passado
//  if not Assigned(FTargetEdit) then
//    SetTargetEdit(edtEditar);
end;

procedure TTecladoVirtualfrm.KeyClick(Sender: TObject);
var
  Rectangle: TRectangle;
  LabelInside: TLabel;
  Child: TComponent;
  KeyAction: string;
begin
  if Assigned(FTargetEdit) then
  begin

    if Sender is TRectangle then
    begin
      Rectangle := Sender as TRectangle;

      // Busca diretamente pelos filhos do TRectangle
      for Child in Rectangle.Children do
      begin
        if (Child is TLabel) and (Copy(TLabel(Child).Name, 1, 3) = 'lbl') then
        begin
          LabelInside := TLabel(Child);
          KeyAction := LabelInside.Text;

          // Processa teclas especiais
          if KeyAction = 'Enter' then
          begin
            FTargetEdit.Text := edtEditar.Text;
            Close;
          end
          else if KeyAction = 'Space' then
          begin
            FTargetEdit.Text := FTargetEdit.Text + ' ';
          end
          else if KeyAction = 'BackSpace' then
          begin
            if Length(FTargetEdit.Text) > 0 then
              FTargetEdit.Text := Copy(FTargetEdit.Text, 1, Length(FTargetEdit.Text) - 1);
          end
          else if KeyAction = 'Delete' then
          begin
            FTargetEdit.Text := '';
          end
          else
          begin
            FTargetEdit.Text := FTargetEdit.Text + KeyAction;
          end;

          // Chama o evento OnTyping de FTargetEdit
//          if Assigned(FTargetEdit.OnTyping) then
//            FTargetEdit.OnTyping(FTargetEdit);  // Dispara o evento Typing manualmente

          Exit;
        end;
      end;

      ShowMessage('Nenhum label encontrado com prefixo "lbl".');
    end;
  end
  else
    ShowMessage('Nenhum controle de texto associado.');
end;

procedure TTecladoVirtualfrm.KeyQClick(Sender: TObject);
begin
  KeyClick(Sender);
end;

end.
