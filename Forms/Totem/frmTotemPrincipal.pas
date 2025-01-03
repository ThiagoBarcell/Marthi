unit frmTotemPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects, FMX.Layouts, FMX.Edit,
  FMX.ListBox, FMX.TabControl, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Frame.MarthiGIT.Totem, System.Math, System.IniFiles, Untfuncoes,
  FireDAC.Phys.IBBase, MyVirtualKeyboard, FMX.Filter.Effects, FMX.Ani,
  System.Math.Vectors, FMX.Controls3D, FMX.Objects3D, Marthi.PedeSenha;

type
  TTotemPrincipalfrm = class(TForm)
    VertScrollBox1: TVertScrollBox;
    lytTop: TLayout;
    lytModelo: TLayout;
    lytCenter: TLayout;
    Layout3: TLayout;
    StyleBook1: TStyleBook;
    lytRodape: TLayout;
    ConectMarthi: TFDConnection;
    qryCadCell: TFDQuery;
    qryImagensCell: TFDQuery;
    qryImagensCellCELL_ID: TIntegerField;
    qryImagensCellSEQUENCIA: TIntegerField;
    qryImagensCellIMAGE: TBlobField;
    dtsImagensCell: TBindSourceDB;
    BindingsList1: TBindingsList;
    lytGlobal: TLayout;
    lytToten: TLayout;
    Rectangle8: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    dtsCadCell: TBindSourceDB;
    FBLink: TFDPhysFBDriverLink;
    qryCapacidades: TFDQuery;
    qryCapacidadesARMAZENAMENTO_DESC: TStringField;
    qryCores: TFDQuery;
    qryCoresCOR_DESC: TStringField;
    Rectangle4: TRectangle;
    qryDadosCor: TFDQuery;
    qryDadosCorCELL_VAL_UNIT: TFMTBCDField;
    qryDadosCorCELL_VAL_PARC: TFMTBCDField;
    qryDadosCorARMAZENAMENTO_DESC: TStringField;
    qryCapacidadesARMAZENAMENTO_ID: TIntegerField;
    qryCoresCOR_ID: TIntegerField;
    qryCadCellCELL_ID: TIntegerField;
    qryCadCellCELL_DESC: TStringField;
    qryCadCellCELL_MARCA: TIntegerField;
    qryDadosCorARMAZENAMENTO_ID: TIntegerField;
    ShadowEffect7: TShadowEffect;
    ShadowEffect8: TShadowEffect;
    Label3: TLabel;
    Label5: TLabel;
    btnIphone: TRectangle;
    img1: TImage;
    Label1: TLabel;
    btnXiaomi: TRectangle;
    img2: TImage;
    Label2: TLabel;
    Rectangle5: TRectangle;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    Layout2: TLayout;
    img3: TImage;
    qryRetirada: TFDQuery;
    qryRetiradaTP_PRECO_ID: TIntegerField;
    qryRetiradaTP_PRECO_DESC: TStringField;
    Label4: TLabel;
    Label6: TLabel;
    edtPesquisa: TEdit;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    Rectangle2: TRectangle;
    Label10: TLabel;
    Label9: TLabel;
    qryDadosCorTP_PRECO_ID: TIntegerField;
    qryDadosCorTP_PRECO_DESC: TStringField;
    qryDadosCorCELL_PARCELAS: TStringField;
    qryDadosCorITEM_ID: TIntegerField;
    qryConfig: TFDQuery;
    qryConfigAPI_KEY_WHATSAPP: TStringField;
    qryConfigSENHA_ACESSO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure edtPesquisaEnter(Sender: TObject);
    procedure edtPesquisaTyping(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnIphoneClick(Sender: TObject);
    procedure btnXiaomiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Rectangle2DblClick(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarDados;
    procedure AjustarAlturaScrollBox(ScrollBox: TVertScrollBox);
    procedure CarregarImagensHorizontais(Frame: TFrameTotem; CellID: Integer);
    procedure CarregaComboBox(Frame: TFrameTotem; CellID: Integer; FindCombo, FieldID, FieldDesc : string; oQuery: TFDQuery);
    procedure MostrarTecladoVirtual;
    procedure OcultarTecladoVirtual;
    procedure CorChange(Sender: TObject);
    procedure CapacidadeChange(Sender: TObject);
    procedure RetiradaChange(Sender: TObject);
    procedure ParcelasChange(Sender: TObject);
    procedure EnviaWhatsapp(Sender: TObject);
    procedure OnEnterNomeCli(Sender: TObject);
    procedure OnEnterTelCli(Sender: TObject);
    procedure AtualizarBotoesNavegacao(Frame: TFrameTotem);
    procedure BotaoDireitaClick(Sender: TObject);
    procedure BotaoEsquerdaClick(Sender: TObject);
    procedure ViewportPositionChange(Sender: TObject; const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);
    procedure PreencherParcelas(ComboBox: TComboBox; CELL_ID, ITEM_ID,
      CELL_TP_PRECO: Integer; ValorAVista: Double);
  public
    { Public declarations }
  end;

var
  TotemPrincipalfrm: TTotemPrincipalfrm;
  IsKeyboardShown: Boolean = False;

implementation

{$R *.fmx}
{$R *.Surface.fmx MSWINDOWS}
{$R *.Moto360.fmx ANDROID}
{$R *.iPhone55in.fmx IOS}
{$R *.iPad.fmx IOS}
{$R *.Windows.fmx MSWINDOWS}

{ TTotemPrincipalfrm }

procedure TTotemPrincipalfrm.CapacidadeChange(Sender: TObject);
var
  ComboBox: TComboBox;
  CapacidadeID, CorID: Integer;
  qryDados: TFDQuery;
  ParentObject: TFmxObject;
  Frame: TFrameTotem;
begin
  ComboBox := Sender as TComboBox;

  // Encontra o Frame pai do ComboBox
  ParentObject := ComboBox.Parent;
  while (ParentObject <> nil) and not (ParentObject is TFrameTotem) do
    ParentObject := ParentObject.Parent;

  if not (ParentObject is TFrameTotem) then
    Exit;

  Frame := TFrameTotem(ParentObject);

  // Verifica se uma capacidade foi selecionada
  if ComboBox.ItemIndex = -1 then
    Exit;

  // Obt�m o ID da capacidade selecionada
  CapacidadeID := Integer(ComboBox.Items.Objects[ComboBox.ItemIndex]);

  // Obt�m o ID da cor selecionada
  if Frame.cbbCor.ItemIndex >= 0 then
    CorID := Integer(Frame.cbbCor.Items.Objects[Frame.cbbCor.ItemIndex])
  else
    Exit;

   qryDados := TFDQuery.Create(nil);
  try
    qryDados.Connection := ConectMarthi; // Substitua pelo seu componente de conex�o
    qryDados.SQL.Text :=
      'SELECT CELL_ITENS.CELL_VAL_UNIT, CELL_ITENS.CELL_VAL_PARC, CELL_ITENS.CELL_PARCELAS ' +
      'FROM CELL_ITENS ' +
      'WHERE CELL_ITENS.COR_ID = :COR_ID ' +
      '  AND CELL_ITENS.ARMAZENAMENTO_ID = :ARMAZENAMENTO_ID' +
      '  AND CELL_ITENS.CELL_ID = :CELL_ID';
    qryDados.ParamByName('COR_ID').AsInteger := CorID;
    qryDados.ParamByName('ARMAZENAMENTO_ID').AsInteger := CapacidadeID;
    qryDados.ParamByName('CELL_ID').AsInteger := StrToInt(Frame.CELL_ID.Text);
    qryDados.Open;

    if not qryDados.IsEmpty then
    begin
      Frame.lblValorAVista.Text := Format('R$ %.2f', [qryDados.FieldByName('CELL_VAL_UNIT').AsFloat]);
      Frame.lblValorAPrazo.Text := qryDados.FieldByName('CELL_PARCELAS').AsString + ' X ' + Format('R$ %.2f', [qryDados.FieldByName('CELL_VAL_PARC').AsFloat]);
    end
    else
    begin
      Frame.lblValorAVista.Text := 'R$ 0,00';
      Frame.lblValorAPrazo.Text := 'R$ 0,00';
    end;
  finally
    qryDados.Free;
  end;
end;

procedure TTotemPrincipalfrm.CorChange(Sender: TObject);
var
  ComboBox: TComboBox;
  CorID: Integer;
  ParentObject: TFmxObject;
  Frame: TFrameTotem;
begin
  ComboBox := Sender as TComboBox;

  // Encontra o Frame pai do ComboBox
  ParentObject := ComboBox.Parent;
  while (ParentObject <> nil) and not (ParentObject is TFrameTotem) do
    ParentObject := ParentObject.Parent;

  if not (ParentObject is TFrameTotem) then
    Exit;

  Frame := TFrameTotem(ParentObject);

  // Verifica se uma capacidade foi selecionada
  if ComboBox.ItemIndex = -1 then
    Exit;

  // Obt�m o ID da cor selecionada
  if Frame.cbbCor.ItemIndex >= 0 then
    CorID := Integer(Frame.cbbCor.Items.Objects[Frame.cbbCor.ItemIndex])
  else
    Exit;

  try
    qryDadosCor.ParamByName('COR_ID').AsInteger := CorID;
    qryDadosCor.ParamByName('CELL_ID').AsInteger := StrToInt(Frame.CELL_ID.Text);
    qryDadosCor.Open;

    // Atualiza os labels e o ComboBox de capacidade
    if not qryDadosCor.IsEmpty then
    begin
      Frame.lblValorAVista.Text := Format('R$ %.2f', [qryDadosCor.FieldByName('CELL_VAL_UNIT').AsFloat]);
      Frame.lblValorAPrazo.Text := qryDadosCor.FieldByName('CELL_PARCELAS').AsString + ' X ' + Format('R$ %.2f', [qryDadosCor.FieldByName('CELL_VAL_PARC').AsFloat]);

      Frame.cbbCapacidade.OnChange := nil;
      Frame.cbbCapacidade.Items.Clear;
      while not qryDadosCor.Eof do
      begin
        Frame.cbbCapacidade.Items.AddObject(qryDadosCor.FieldByName('ARMAZENAMENTO_DESC').AsString,
                        TObject(qryDadosCor.FieldByName('ARMAZENAMENTO_ID').AsInteger));
        qryDadosCor.Next;
      end;

      // Seleciona automaticamente o primeiro item, se houver
      if Frame.cbbCapacidade.Items.Count > 0 then
        Frame.cbbCapacidade.ItemIndex := 0;
    end
    else
    begin
      Frame.lblValorAVista.Text := 'R$ 0,00';
      Frame.lblValorAPrazo.Text := 'R$ 0,00';
      Frame.cbbCapacidade.Items.Clear;
    end;
  finally
    Frame.cbbCapacidade.OnChange := CapacidadeChange;
    qryDadosCor.Close;
  end;
end;

procedure TTotemPrincipalfrm.CarregarDados;
var
  Frame: TFrameTotem;
  Cont, CellID: Integer;
  CorID, CapacidadeID, RetiradaID: Integer;
begin
  qryCadCell.Close;
  qryCadCell.Open;

  Cont := 0;
  while VertScrollBox1.Content.ControlsCount > 0 do
    VertScrollBox1.Content.Controls[0].Free;

  dtsCadCell.DataSet.First;
  while not dtsCadCell.DataSet.Eof do
  begin
    Inc(Cont);
    Frame := TFrameTotem.Create(VertScrollBox1);
    Frame.Name := 'Frame' + IntToStr(Cont);
    Frame.Parent := VertScrollBox1;
    Frame.Align := TAlignLayout.Top;
    Frame.tbcTotem.ActiveTab := Frame.TabTotemPrincipal;

    Frame.Margins.Top := 5;
    Frame.Margins.Bottom := 5;

    Frame.lblNomeItem.Text := dtsCadCell.DataSet.FieldByName('CELL_DESC').AsString;

    CellID := dtsCadCell.DataSet.FieldByName('CELL_ID').AsInteger;
    CarregarImagensHorizontais(Frame, CellID);
    // Preenche Combobox de cor
    CarregaComboBox(Frame, CellID, 'cbbCor', 'COR_ID', 'COR_DESC', qryCores);
    // Preenche Combobox de Capacidade
    CarregaComboBox(Frame, CellID, 'cbbCapacidade', 'ARMAZENAMENTO_ID', 'ARMAZENAMENTO_DESC', qryCapacidades);
    // Preenche Combobox de Retirada
    CarregaComboBox(Frame, CellID, 'cbbRetirada', 'TP_PRECO_ID', 'TP_PRECO_DESC', qryRetirada);

    Frame.CELL_MARCA.Text := dtsCadCell.DataSet.FieldByName('CELL_MARCA').AsString;
    Frame.CELL_ID.Text := dtsCadCell.DataSet.FieldByName('CELL_ID').AsString;

    // Obt�m o ID dos itens selecionados
    if Frame.cbbCor.ItemIndex >= 0 then
      CorID := Integer(Frame.cbbCor.Items.Objects[Frame.cbbCor.ItemIndex])
    else
      Exit;

    if Frame.cbbCapacidade.ItemIndex >= 0 then
      CapacidadeID := Integer(Frame.cbbCapacidade.Items.Objects[Frame.cbbCapacidade.ItemIndex])
    else
      Exit;

    if Frame.cbbRetirada.ItemIndex >= 0 then
      RetiradaID := Integer(Frame.cbbRetirada.Items.Objects[Frame.cbbRetirada.ItemIndex])
    else
      Exit;

    try
      qryDadosCor.ParamByName('COR_ID').AsInteger := CorID;
      qryDadosCor.ParamByName('CELL_ID').AsInteger := qryCadCellCELL_ID.AsInteger;
      qryDadosCor.Open;

      // Preenche o ComboBox de Parcelas
      PreencherParcelas(Frame.cbbParcelas,
                        qryCadCellCELL_ID.AsInteger,
                        qryDadosCor.FieldByName('ITEM_ID').AsInteger,
                        RetiradaID,
                        qryDadosCor.FieldByName('CELL_VAL_UNIT').AsFloat);

      // Atualiza os labels e o ComboBox de capacidade
      if not qryDadosCor.IsEmpty then
      begin
        Frame.lblValorAVista.Text := Format('R$ %.2f', [qryDadosCor.FieldByName('CELL_VAL_UNIT').AsFloat]);
        Frame.lblValorAPrazo.Text := qryDadosCor.FieldByName('CELL_PARCELAS').AsString + ' X ' + Format('R$ %.2f', [qryDadosCor.FieldByName('CELL_VAL_PARC').AsFloat]);
      end
      else
      begin
        Frame.lblValorAVista.Text := 'R$ 0,00';
        Frame.lblValorAPrazo.Text := 'R$ 0,00';
      end;
    finally
      qryDadosCor.Close;
    end;

    // Atribuir os eventos OnChange
    Frame.cbbCor.OnChange := CorChange;
    Frame.cbbCapacidade.OnChange := CapacidadeChange;
    Frame.cbbRetirada.OnChange := RetiradaChange;
    Frame.cbbParcelas.OnChange := ParcelasChange;

    // Atribuir o evento OnClick
    Frame.btnEnviaWhatsapp.OnClick := EnviaWhatsapp;

    // Atribuir o evento OnEnter
    Frame.edtNomeCli.OnEnter := OnEnterNomeCli;
    Frame.edtTelCli.OnEnter := OnEnterTelCli;

    dtsCadCell.DataSet.Next;
  end;

  AjustarAlturaScrollBox(VertScrollBox1);
end;

procedure TTotemPrincipalfrm.MostrarTecladoVirtual;
begin
  ShellExecute(0, 'open', 'C:\Windows\System32\osk.exe', nil, nil, SW_SHOWNORMAL);
end;

procedure TTotemPrincipalfrm.OcultarTecladoVirtual;
var
  hwnd: Winapi.Windows.HWND;
begin
  hwnd := FindWindow(nil, 'Teclado Virtual');
  if hwnd <> 0 then
    PostMessage(hwnd, WM_CLOSE, 0, 0);
end;

procedure TTotemPrincipalfrm.OnEnterNomeCli(Sender: TObject);
begin
  if not IsKeyboardShown then
  begin
    ShowKeyboardOn(TEdit(Sender));
    IsKeyboardShown := True; // Marca como exibido
  end
  else
    IsKeyboardShown := False;
end;

procedure TTotemPrincipalfrm.OnEnterTelCli(Sender: TObject);
begin
  if not IsKeyboardShown then
  begin
    ShowKeyboardOn(TEdit(Sender));
    IsKeyboardShown := True; // Marca como exibido
  end
  else
    IsKeyboardShown := False;
end;

procedure TTotemPrincipalfrm.Rectangle2DblClick(Sender: TObject);
var
  PedeSenhaMarthi : TfrmPedeSenhaMarthi;
begin
  qryConfig.Close;
  qryConfig.Open;

  try
    PedeSenhaMarthi := TfrmPedeSenhaMarthi.Create(Self);
    PedeSenhaMarthi.Senha := qryConfigSENHA_ACESSO.AsString;
    PedeSenhaMarthi.Autenticacao := False;

    PedeSenhaMarthi.ShowModal;
    PedeSenhaMarthi.edtSenha.SetFocus;

    if PedeSenhaMarthi.Autenticacao = True then
      Close;

  finally
    FreeAndNil(PedeSenhaMarthi);
  end;

end;

procedure TTotemPrincipalfrm.RetiradaChange(Sender: TObject);
var
  ComboBox: TComboBox;
  CapacidadeID, CorID, RetiradaID: Integer;
  qryDados: TFDQuery;
  ParentObject: TFmxObject;
  Frame: TFrameTotem;
begin
  ComboBox := Sender as TComboBox;

  // Encontra o Frame pai do ComboBox
  ParentObject := ComboBox.Parent;
  while (ParentObject <> nil) and not (ParentObject is TFrameTotem) do
    ParentObject := ParentObject.Parent;

  if not (ParentObject is TFrameTotem) then
    Exit;

  Frame := TFrameTotem(ParentObject);

  // Verifica se uma capacidade foi selecionada
  if ComboBox.ItemIndex = -1 then
    Exit;

  // Obt�m o ID da capacidade selecionada
  RetiradaID := Integer(ComboBox.Items.Objects[ComboBox.ItemIndex]);

  // Obt�m o ID da cor selecionada
  if Frame.cbbCor.ItemIndex >= 0 then
    CorID := Integer(Frame.cbbCor.Items.Objects[Frame.cbbCor.ItemIndex])
  else
    Exit;

   // Obt�m o ID da capacidade selecionada
  if Frame.cbbCapacidade.ItemIndex >= 0 then
    CapacidadeID := Integer(Frame.cbbCapacidade.Items.Objects[Frame.cbbCapacidade.ItemIndex])
  else
    Exit;

   qryDados := TFDQuery.Create(nil);
  try
    qryDados.Connection := ConectMarthi; // Substitua pelo seu componente de conex�o
    qryDados.SQL.Text :=
      'SELECT CELL_ITENS.ITEM_ID, CELL_ITENS.CELL_VAL_UNIT, CELL_ITENS.CELL_VAL_PARC ' +
      'FROM CELL_ITENS ' +
      'WHERE CELL_ITENS.COR_ID = :COR_ID ' +
      '  AND CELL_ITENS.ARMAZENAMENTO_ID = :ARMAZENAMENTO_ID' +
      '  AND CELL_ITENS.TP_PRECO_ID  = :TP_PRECO_ID' +
      '  AND CELL_ITENS.CELL_ID  = :CELL_ID';
    qryDados.ParamByName('COR_ID').AsInteger := CorID;
    qryDados.ParamByName('ARMAZENAMENTO_ID').AsInteger := CapacidadeID;
    qryDados.ParamByName('TP_PRECO_ID').AsInteger := RetiradaID;
    qryDados.ParamByName('CELL_ID').AsInteger := StrToInt(Frame.CELL_ID.Text);
    qryDados.Open;

    if not qryDados.IsEmpty then
    begin
      Frame.lblValorAVista.Text := Format('R$ %.2f', [qryDados.FieldByName('CELL_VAL_UNIT').AsFloat]);
      Frame.lblValorAPrazo.Text := '12 X ' + Format('R$ %.2f', [qryDados.FieldByName('CELL_VAL_PARC').AsFloat]);

      // Preencher o ComboBox de Parcelas
      PreencherParcelas(Frame.cbbParcelas,
                        StrToInt(Frame.CELL_ID.Text),
                        qryDados.FieldByName('ITEM_ID').AsInteger,
                        RetiradaID,
                        qryDados.FieldByName('CELL_VAL_UNIT').AsFloat);
    end
    else
    begin
      Frame.lblValorAVista.Text := 'R$ 0,00';
      Frame.lblValorAPrazo.Text := 'R$ 0,00';
    end;
  finally
    qryDados.Free;
  end;

end;

procedure TTotemPrincipalfrm.ParcelasChange(Sender: TObject);
var
  qryDadosParcela: TFDQuery;
  descricao: string;
  ComboBox: TComboBox;
  ParcelaID: Integer;
  ParentObject: TFmxObject;
  Frame: TFrameTotem;
begin
  ComboBox := Sender as TComboBox;

  // Encontra o Frame pai do ComboBox
  ParentObject := ComboBox.Parent;
  while (ParentObject <> nil) and not (ParentObject is TFrameTotem) do
    ParentObject := ParentObject.Parent;

  if not (ParentObject is TFrameTotem) then
    Exit;

  Frame := TFrameTotem(ParentObject);

  // Verifica se uma capacidade foi selecionada
  if ComboBox.ItemIndex = -1 then
    Exit;

  // Obt�m o ID da capacidade selecionada
  ParcelaID := Integer(ComboBox.Items.Objects[ComboBox.ItemIndex]);

  qryDadosParcela := TFDQuery.Create(nil);
  try
    qryDadosParcela.Connection := ConectMarthi; // Substitua pelo seu componente de conex�o
    qryDadosParcela.SQL.Text :=
      'SELECT ' +
      '  CELL_VAL_ITENS_PARC.CELL_PARCELA, ' +
      '  CELL_VAL_ITENS_PARC.CELL_VAL_PARCELA ' +
      'FROM CELL_VAL_ITENS_PARC ' +
      'WHERE CELL_VAL_ITENS_PARC.CELL_VAL_ITENS_PARC_ID = :CELL_VAL_ITENS_PARC_ID';
    qryDadosParcela.ParamByName('CELL_VAL_ITENS_PARC_ID').AsInteger := ParcelaID;
    qryDadosParcela.Open;

    // Adiciona o valor � vista como o primeiro item
    if ComboBox.ItemIndex = 0 then
      descricao := '1 X ' + Frame.lblValorAVista.Text
    else
      descricao := qryDadosParcela.FieldByName('CELL_PARCELA').AsString + ' X ' +
                   Format('R$ %.2f', [qryDadosParcela.FieldByName('CELL_VAL_PARCELA').AsFloat]);

    Frame.edtValorTel.Text := descricao;

  finally
    qryDadosParcela.Free;
  end;
end;

procedure TTotemPrincipalfrm.PreencherParcelas(ComboBox: TComboBox; CELL_ID, ITEM_ID, CELL_TP_PRECO: Integer; ValorAVista: Double);
var
  qryDadosParcela: TFDQuery;
  descricao: string;
begin
  ComboBox.Items.Clear; // Limpa o ComboBox antes de preencher

  qryDadosParcela := TFDQuery.Create(nil);
  try
    qryDadosParcela.Connection := ConectMarthi; // Substitua pelo seu componente de conex�o
    qryDadosParcela.SQL.Text :=
      'SELECT ' +
      ' CELL_VAL_ITENS_PARC.CELL_VAL_ITENS_PARC_ID, ' +
      ' CELL_VAL_ITENS_PARC.CELL_PARCELA, ' +
      ' CELL_VAL_ITENS_PARC.CELL_VAL_PARCELA ' +
      'FROM CELL_VAL_ITENS_PARC ' +
      'WHERE CELL_VAL_ITENS_PARC.CELL_ID = :CELL_ID ' +
      '  AND CELL_VAL_ITENS_PARC.ITEM_ID = :ITEM_ID ' +
      '  AND CELL_VAL_ITENS_PARC.CELL_TP_PRECO = :CELL_TP_PRECO';
    qryDadosParcela.ParamByName('CELL_ID').AsInteger := CELL_ID;
    qryDadosParcela.ParamByName('ITEM_ID').AsInteger := ITEM_ID;
    qryDadosParcela.ParamByName('CELL_TP_PRECO').AsInteger := CELL_TP_PRECO;
    qryDadosParcela.Open;

    // Adiciona o valor � vista como o primeiro item
    //descricao := '1 X ' + Format('R$ %.2f', [ValorAVista]);
    descricao := '1 X ';
    ComboBox.Items.AddObject(descricao, TObject(1)); // 1 representa uma parcela � vista

    // Adiciona as parcelas vindas do SQL
    while not qryDadosParcela.Eof do
    begin
      descricao := qryDadosParcela.FieldByName('CELL_PARCELA').AsString + ' X ';// +
                   //Format('R$ %.2f', [qryDadosParcela.FieldByName('CELL_VAL_PARCELA').AsFloat]);
      ComboBox.Items.AddObject(descricao, TObject(qryDadosParcela.FieldByName('CELL_VAL_ITENS_PARC_ID').AsInteger));
      qryDadosParcela.Next;
    end;

    // Define o primeiro item como selecionado
    if ComboBox.Items.Count > 0 then
      ComboBox.ItemIndex := 0;

  finally
    qryDadosParcela.Free;
  end;
end;

procedure TTotemPrincipalfrm.AtualizarBotoesNavegacao(Frame: TFrameTotem);
var
  ScrollBox: THorzScrollBox;
  Rectangle : Double;
begin
  // Verifica se o Frame e o HorzScrollBoxImagens n�o s�o nulos
  if not Assigned(Frame) then
    raise Exception.Create('Frame n�o est� inicializado.');

  ScrollBox := Frame.HorzScrollBoxImagens;

  Rectangle := ( StrToFloat(Frame.lblTOT_WIDTH.Text) / StrToFloat(Frame.TOT_IMAGEM.Text) );

  if not Assigned(ScrollBox) then
    raise Exception.Create('HorzScrollBoxImagens n�o est� inicializado.');

  // Verifica se h� conte�do para rolar � esquerda
  Frame.CircEsquerda.Visible := ScrollBox.ViewportPosition.X > 0;

  // Verifica se h� conte�do para rolar � direita
  Frame.CircDireita.Visible := ( Round(ScrollBox.ViewportPosition.X) + Rectangle < StrToInt(Frame.lblTOT_WIDTH.Text) ) AND
                               ( StrToInt(Frame.TOT_IMAGEM.Text) > 1 ) ;

end;

procedure TTotemPrincipalfrm.BotaoDireitaClick(Sender: TObject);
var
  Frame: TFrameTotem;
  ParentObject: TFmxObject;
  Circle : TCircle;
begin
  Circle := Sender as TCircle;

  // Encontra o Frame pai do ComboBox
  ParentObject := Circle.Parent;
  while (ParentObject <> nil) and not (ParentObject is TFrameTotem) do
    ParentObject := ParentObject.Parent;

  if not (ParentObject is TFrameTotem) then
    Exit;

  Frame := TFrameTotem(ParentObject);

  begin
    with Frame.HorzScrollBoxImagens do
    begin
      ViewportPosition := PointF(
        ViewportPosition.X + 215, // Avan�a 100 pixels para a direita
        ViewportPosition.Y
      );
    end;
    AtualizarBotoesNavegacao(Frame); // Atualiza a visibilidade dos bot�es
  end;
end;

procedure TTotemPrincipalfrm.BotaoEsquerdaClick(Sender: TObject);
var
  Frame: TFrameTotem;
  ParentObject: TFmxObject;
  Circle : TCircle;
begin
  Circle := Sender as TCircle;

  // Encontra o Frame pai do ComboBox
  ParentObject := Circle.Parent;
  while (ParentObject <> nil) and not (ParentObject is TFrameTotem) do
    ParentObject := ParentObject.Parent;

  if not (ParentObject is TFrameTotem) then
    Exit;

  Frame := TFrameTotem(ParentObject);

  begin
    with Frame.HorzScrollBoxImagens do
    begin
      ViewportPosition := PointF(
        ViewportPosition.X - 215, // Avan�a 100 pixels para a direita
        ViewportPosition.Y
      );
    end;
    AtualizarBotoesNavegacao(Frame); // Atualiza a visibilidade dos bot�es
  end;
end;

procedure TTotemPrincipalfrm.ViewportPositionChange(Sender: TObject; const OldViewportPosition, NewViewportPosition: TPointF; const ContentSizeChanged: Boolean);
var
  Frame: TFrameTotem;
  ParentObject: TFmxObject;
  HorzScrollBox : THorzScrollBox;
begin
  HorzScrollBox := Sender as THorzScrollBox;

  // Encontra o Frame pai do ComboBox
  ParentObject := HorzScrollBox.Parent;
  while (ParentObject <> nil) and not (ParentObject is TFrameTotem) do
    ParentObject := ParentObject.Parent;

  if not (ParentObject is TFrameTotem) then
    Exit;

  Frame := TFrameTotem(ParentObject);
  AtualizarBotoesNavegacao(Frame);
end;

procedure TTotemPrincipalfrm.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TTotemPrincipalfrm.btnIphoneClick(Sender: TObject);
var
  Frame: TFrameTotem;
  i: Integer;
begin
  // Filtra os frames para exibir apenas os com CELL_MARCA = 0 (iPhone)
  for i := 0 to VertScrollBox1.Content.ControlsCount - 1 do
  begin
    Frame := TFrameTotem(VertScrollBox1.Content.Controls[i]);

    // Verifica se o frame corresponde � marca iPhone (CELL_MARCA = 0)
    if (StrToInt(Frame.CELL_MARCA.Text) = 0) then
      Frame.Visible := True
    else
      Frame.Visible := False; // Esconde os frames que n�o correspondem
  end;

  // Altera a cor de btnXiaomi para White
  btnXiaomi.Fill.Color := TAlphaColors.White;

  // Reseta a cor de btnIphone para Mintcream
  btnIphone.Fill.Color := TAlphaColors.Snow;

end;

procedure TTotemPrincipalfrm.btnXiaomiClick(Sender: TObject);
var
  Frame: TFrameTotem;
  i: Integer;
begin
  // Filtra os frames para exibir apenas os com CELL_MARCA = 1 (Xiaomi)
  for i := 0 to VertScrollBox1.Content.ControlsCount - 1 do
  begin
    Frame := TFrameTotem(VertScrollBox1.Content.Controls[i]);

    // Verifica se o frame corresponde � marca Xiaomi (CELL_MARCA = 1)
    if (StrToInt(Frame.CELL_MARCA.Text) = 1) then
      Frame.Visible := True
    else
      Frame.Visible := False; // Esconde os frames que n�o correspondem
  end;

  // Altera a cor de btnXiaomi para #FFF0EEE8
  btnXiaomi.Fill.Color := TAlphaColors.Snow;

  // Reseta a cor de btnIphone para branco
  btnIphone.Fill.Color := TAlphaColors.White;
end;

procedure TTotemPrincipalfrm.CarregaComboBox(Frame: TFrameTotem;
  CellID: Integer; FindCombo, FieldID, FieldDesc : string; oQuery: TFDQuery);
var
  ComboBox: TComboBox;
begin
  // Localiza o ComboBox de cor no frame
  ComboBox := Frame.FindComponent(FindCombo) as TComboBox;
  if not Assigned(ComboBox) then
    Exit;

  oQuery.Close;
  oQuery.ParamByName('CELL_ID').AsInteger := CellID;
  oQuery.Open;

  ComboBox.Items.Clear;
  while not oQuery.Eof do
  begin
    ComboBox.Items.AddObject(oQuery.FieldByName(FieldDesc).AsString,
                        TObject(oQuery.FieldByName(FieldID).AsInteger));
    oQuery.Next;
  end;

  if ComboBox.Items.Count > 0 then
    ComboBox.ItemIndex := 0; // Seleciona o primeiro item por padr�o

end;

procedure TTotemPrincipalfrm.CarregarImagensHorizontais(Frame: TFrameTotem; CellID: Integer);
var
  ImageQuery: TFDQuery;
  ImageStream: TMemoryStream;
  BlobField: TBlobField;
  CloneRect: TRectangle;
  CurrentLeft: Single;
  TotalWidth: Single;
begin
  // Verifica se o HorzScrollBoxImagens est� inicializado
  if not Assigned(Frame.HorzScrollBoxImagens) then
  begin
    raise Exception.Create('HorzScrollBoxImagens n�o est� inicializado.');
  end;

  // Verifica se o conte�do da HorzScrollBoxImagens foi configurado corretamente
  if not Assigned(Frame.HorzScrollBoxImagens.Content) then
  begin
    raise Exception.Create('Conte�do do HorzScrollBoxImagens n�o est� inicializado.');
  end;

  Frame.HorzScrollBoxImagens.BeginUpdate;
  try
    Frame.HorzScrollBoxImagens.Content.DeleteChildren;
    CurrentLeft := 0;
    TotalWidth := 0;

    ImageQuery := TFDQuery.Create(nil);
    try
      ImageQuery.Connection := ConectMarthi;
      ImageQuery.SQL.Text := 'SELECT IMAGE FROM CELL_IMAGES WHERE CELL_ID = :CELL_ID';
      ImageQuery.ParamByName('CELL_ID').AsInteger := CellID;
      ImageQuery.Open;
      Frame.TOT_IMAGEM.Text := IntToStr(ImageQuery.RecordCount);

      while not ImageQuery.Eof do
      begin
        CloneRect := TRectangle.Create(Frame.HorzScrollBoxImagens);
        CloneRect.Parent := Frame.HorzScrollBoxImagens;
        CloneRect.Width := Frame.imgCell.Width;
        CloneRect.Height := Frame.imgCell.Height;
        CloneRect.Margins.Top := 5;
        CloneRect.Margins.Left := 5;
        CloneRect.Margins.Right := 3;
        CloneRect.Margins.Bottom := 5;
        CloneRect.Position.X := CurrentLeft;
        CloneRect.Position.Y := 0;
        CloneRect.Stroke.Assign(Frame.imgCell.Stroke);
        CloneRect.Fill.Kind := TBrushKind.Bitmap;
        CloneRect.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
        CloneRect.SetBounds(CloneRect.Position.X, CloneRect.Position.Y, CloneRect.Width, CloneRect.Height);
        CloneRect.XRadius := 10;
        CloneRect.YRadius := 10;

        BlobField := ImageQuery.FieldByName('IMAGE') as TBlobField;
        if not BlobField.IsNull then
        begin
          ImageStream := TMemoryStream.Create;
          try
            BlobField.SaveToStream(ImageStream);
            ImageStream.Position := 0;
            CloneRect.Fill.Bitmap.Bitmap.LoadFromStream(ImageStream);
          finally
            ImageStream.Free;
          end;
        end
        else
        begin
          CloneRect.Fill.Kind := TBrushKind.Solid;
          CloneRect.Fill.Color := TAlphaColors.Gray;
        end;

        CurrentLeft := CurrentLeft + CloneRect.Width + 10;
        TotalWidth := CurrentLeft;

        ImageQuery.Next;
      end;

      Frame.HorzScrollBoxImagens.Content.Width := TotalWidth;
      Frame.lblTOT_WIDTH.Text := FloatToStr(TotalWidth);
    finally
      ImageQuery.Free;
    end;

    // Atualiza os bot�es de navega��o
    AtualizarBotoesNavegacao(Frame);

    // Configura os eventos dos bot�es de navega��o
    Frame.CircDireita.OnClick := BotaoDireitaClick;
    Frame.CircEsquerda.OnClick := BotaoEsquerdaClick;
    Frame.HorzScrollBoxImagens.OnViewportPositionChange := ViewportPositionChange;

  finally
    Frame.HorzScrollBoxImagens.EndUpdate;
  end;
end;

procedure TTotemPrincipalfrm.edtPesquisaEnter(Sender: TObject);
begin
  if not IsKeyboardShown then
  begin
    ShowKeyboardOn(TEdit(Sender));
    IsKeyboardShown := True; // Marca como exibido
  end
  else
    IsKeyboardShown := False;
end;

procedure TTotemPrincipalfrm.edtPesquisaTyping(Sender: TObject);
var
  Frame: TFrameTotem;
  i: Integer;
  SearchText: string;
begin
  // Obt�m o texto digitado
  SearchText := edtPesquisa.Text.Trim;

  // Se o campo de pesquisa estiver vazio, mostra todos os frames
  if SearchText = '' then
  begin
    // Torna todos os frames vis�veis
    for i := 0 to VertScrollBox1.Content.ControlsCount - 1 do
    begin
      Frame := TFrameTotem(VertScrollBox1.Content.Controls[i]);
      Frame.Visible := True;
    end;
  end
  else
  begin
    // Filtra a consulta com base no texto digitado
    qryCadCell.Filtered := False;
    qryCadCell.Filter := Format('CELL_DESC LIKE %s', [QuotedStr('%' + SearchText + '%')]);
    qryCadCell.Filtered := True;

    // Percorre os frames no ScrollBox e ajusta a visibilidade com base no filtro
    for i := 0 to VertScrollBox1.Content.ControlsCount - 1 do
    begin
      Frame := TFrameTotem(VertScrollBox1.Content.Controls[i]);

      // Verifica se o texto do campo edtPesquisa est� na descri��o do Frame
      if Frame.lblNomeItem.Text.ToLower.Contains(SearchText.ToLower) then
        Frame.Visible := True  // Torna o frame vis�vel se o texto contiver a descri��o
      else
        Frame.Visible := False; // Torna o frame invis�vel caso contr�rio
    end;
  end;
end;

procedure TTotemPrincipalfrm.EnviaWhatsapp(Sender: TObject);
var
  Frame: TFrameTotem;
  lFuncoes : TFuncoesUteis;
  ParentObject: TFmxObject;
  btn : TRectangle;
begin
  btn := Sender as TRectangle;

  // Encontra o Frame pai do ComboBox
  ParentObject := btn.Parent;
  while (ParentObject <> nil) and not (ParentObject is TFrameTotem) do
    ParentObject := ParentObject.Parent;

  if not (ParentObject is TFrameTotem) then
    Exit;

  Frame := TFrameTotem(ParentObject);

  if Frame.edtNomeCli.Text = '' then
  begin
    MessageDlg('Informe seu nome !', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    Frame.edtNomeCli.SetFocus;
    Abort;
  end;

  if Frame.edtTelCli.Text = '' then
  begin
    MessageDlg('Informe seu Telefone !', TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK], 0);
    Frame.edtTelCli.SetFocus;
    Abort;
  end;

  lFuncoes.EnviarMsgWhatsApp( '8404a52b-690a-422f-be65-3281d55ac4b9', '24981244253', Frame.edtTelCli.Text,
                              'Oi Tudo Bem !! ' + #13 + #13 + 'Sou o ' + Frame.edtNomeCli.Text + #13 +
                              'Acabei de escolher um celular ' + Frame.lblTITULOCEL.Text +
                              ', aqui no Totem do Shopping no valor de ' + Frame.edtValorTel.Text + Frame.cbbMododePagamento.Items[Frame.cbbMododePagamento.ItemIndex] +
                              'Poderia me dar mais informa��es sobre o produto?' , '', False );
end;

procedure TTotemPrincipalfrm.AjustarAlturaScrollBox(ScrollBox: TVertScrollBox);
var
  I: Integer;
  AlturaTotal: Single;
begin
  AlturaTotal := 0;

  // Calcula a altura total dos componentes dentro do Content
  for I := 0 to ScrollBox.Content.ControlsCount - 1 do
  begin
    AlturaTotal := Max(AlturaTotal, ScrollBox.Content.Controls[I].Position.Y + ScrollBox.Content.Controls[I].Height);
  end;

  // Ajusta a altura do conte�do para incluir todos os elementos
  ScrollBox.Content.Height := AlturaTotal;
end;

procedure TTotemPrincipalfrm.FormCreate(Sender: TObject);
var
 oIniCaminhos : tinifile;
 lFuncoes : TFuncoesUteis;
 sCaminhoIni, sCaminhoApp  : string;
begin

  lFuncoes.ConectaBD_Ini( ConectMarthi, FBLink );

  // Define a cor inicial para btnIphone
  btnIphone.Fill.Color := TAlphaColors.Mintcream; // Cor inicial
  btnXiaomi.Fill.Color := TAlphaColors.White; // Cor inicial
end;

procedure TTotemPrincipalfrm.FormShow(Sender: TObject);
begin
  CarregarDados;
end;

end.
