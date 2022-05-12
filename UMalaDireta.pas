unit UMalaDireta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ShellApi, MAPI, IdMessage,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  IdBaseComponent, IdAntiFreezeBase, IdAntiFreeze, DBClient, Provider,
  MDOQuery;

type
  TFMalaDireta = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    RBNome: TRadioButton;
    RBMail: TRadioButton;
    EdBusca: TEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    StatusBar1: TStatusBar;
    LblQtde: TLabel;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    Assunto: TLabel;
    EdAssunto: TEdit;
    Mensagem: TLabel;
    MemoMsg: TMemo;
    SpeedButton1: TSpeedButton;
    RGFilltro: TGroupBox;
    CBPais: TCheckBox;
    CBMaes: TCheckBox;
    CBFornecedores: TCheckBox;
    CBFuncionarios: TCheckBox;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    DSMalaDireta: TDataSource;
    CDSMalaDireta: TClientDataSet;
    QryMalaDireta: TMDOQuery;
    QryMalaDiretaTIPO: TMDOStringField;
    QryMalaDiretaEMAIL: TMDOStringField;
    DataSetProvider1: TDataSetProvider;
    CDSMalaDiretaTIPO: TStringField;
    QryMalaDiretaNOME: TMDOStringField;
    CDSMalaDiretaNOME: TStringField;
    CDSMalaDiretaEMAIL: TStringField;
    CDSAnexos: TClientDataSet;
    CDSAnexosPATH: TStringField;
    DSAnexos: TDataSource;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    ODAnexos: TOpenDialog;
    RGPriority: TRadioGroup;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DSCidadesDataChange(Sender: TObject; Field: TField);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure CBPaisClick(Sender: TObject);
    procedure SBNovoClick(Sender: TObject);
    procedure RBNomeClick(Sender: TObject);
    procedure EdBuscaChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMalaDireta: TFMalaDireta;


implementation

uses UDados;

{$R *.dfm}     
procedure TFMalaDireta.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFMalaDireta.DSCidadesDataChange(Sender: TObject; Field: TField);
begin
  LblQtde.Caption :=  IntToStr(CDSMalaDireta.RecordCount) + ' registros encontrados';
end;

procedure TFMalaDireta.SBExcluirClick(Sender: TObject);
var
  i: Smallint;
  Msg: TMapiMessage;
  lpSender, lpRecepient: TMapiRecipDesc;
  FileAttach: TMapiFileDesc;
  SM: TFNMapiSendMail;
  MAPIModule: HModule;
  Flags: Cardinal;

begin
  if CDSMalaDireta.IsEmpty then
    Exit;
  LblQtde.Hint :=  'mailto: ';
  CDSMalaDireta.DisableControls;
  CDSMalaDireta.First;
  while not CDSMalaDireta.Eof do begin
    LblQtde.Hint := LblQtde.Hint + CDSMalaDiretaEMAIL.Value + '; ';
    CDSMalaDireta.Next;
  end;
  CDSMalaDireta.First;
  CDSMalaDireta.EnableControls;

  if EdAssunto.Text <> '' then
    LblQtde.Hint := LblQtde.Hint + '?Subject= '+ EdAssunto.Text;
  MemoMsg.Tag := MemoMsg.Lines.Count;
  if MemoMsg.Lines.Text <> '' then
    if MemoMsg.Tag = 1 then
      LblQtde.Hint := LblQtde.Hint + '&Body= '+ MemoMsg.Lines.Text
    else begin
      i := 0;
      LblQtde.Hint := LblQtde.Hint + '&Body= ';
      while i <= MemoMsg.Tag  do begin
        if i = 0 then
          LblQtde.Hint := LblQtde.Hint + MemoMsg.Lines[i]
        else
          LblQtde.Hint := LblQtde.Hint + '%0D%0A'+ MemoMsg.Lines[i];
        Inc(i);
      end;

    end;
//(mailto: Destino), (?Subject= Assunto), (&Body= Corpo do e-mail).
//  Mail := 'mailto:delphimais@ubbi.com.br'+'?Subject=TESTE' +
//'&Body= Olá, este é um e-mail teste' + '%0D%0A' +
//'Primeira linha' + '%0D%0A' + 'Segunda linha' + '%0D%0A' + 'terceira linha';

//Abre a janela como Normal atraves do Shell

//  LblQtde.Hint := StringReplace(LblQtde.Hint, '#$D#$A', '%0D%0A', [rfReplaceAll]);
  ShellExecute(handle, 'open', pChar (LblQtde.Hint), '', '', SW_SHOW);
end;

procedure TFMalaDireta.SBSairClick(Sender: TObject);
begin
  IdSMTP1.Host := Dados.TbConfigMAILSMTP.Value;
  IdSMTP1.Password := Dados.TbConfigMAILPASS.Value;
  IdMessage1.From.Address := Dados.TbConfigMAILFROM.Value; 
  IdMessage1.From.Name := Dados.TbConfigMAILNAME.Value;

//  IdSMTP1.MailAddresses := '';
  CDSMalaDireta.DisableControls;
  CDSMalaDireta.First;
  while not CDSMalaDireta.Eof do begin
//  IdMessage1.EMailAddresses := IdMessage1.EMailAddresses + CDSMalaDiretaEMAIL.Value + '; ';
    CDSMalaDireta.Next;
  end;
  CDSMalaDireta.First;
  CDSMalaDireta.EnableControls;


//  IdMessage1.CCList.EMailAddresses := EditCC.Text;
//  IdMessage1.BccList.EMailAddresses := EditCCO.Text;
  IdMessage1.Subject := EdAssunto.Text;
  case RGPriority.ItemIndex of
    0: IdMessage1.Priority := mpHighest;
    1: IdMessage1.Priority := mpHigh;
    2: IdMessage1.Priority := mpNormal;
    3: IdMessage1.Priority := mpLow;
    4: IdMessage1.Priority := mpLowest;
  end;


  IdMessage1.Body := MemoMsg.Lines;

//  if

  IdSMTP1.Connect;
  try
    if Dados.TbConfigMAILAUTENTICA.Value = 1 then
      IdSMTP1.Authenticate;
    IdSMTP1.Send(IdMessage1);
  finally
    IdSMTP1.Disconnect;
  end;
  Application.MessageBox('Email enviado com sucesso!', 'Confirmação', MB_ICONINFORMATION + MB_OK);
end;

procedure TFMalaDireta.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);

  CDSAnexos.CreateDataSet;
  CDSMalaDireta.CreateDataSet;
  QryMalaDireta.Open;
  CDSMalaDireta.Data := DataSetProvider1.Data;
  RBNomeClick(RBNome);
  CBPaisClick(nil);
end;

procedure TFMalaDireta.SBAlterarClick(Sender: TObject);
begin
  CDSMalaDireta.EmptyDataSet;
  CDSMalaDireta.Data := DataSetProvider1.Data;
  RBNomeClick(RBNome);
  CBPaisClick(nil);
end;

procedure TFMalaDireta.CBPaisClick(Sender: TObject);
begin
  CDSMalaDireta.DisableControls;
  CDSMalaDireta.Filtered := False;
  CDSMalaDireta.Filter := '';
  if CBPais.Checked then
    CDSMalaDireta.Filter := '(TIPO = ''Pai'')';
  if CBMaes.Checked then
    if CDSMalaDireta.Filter <> '' then
      CDSMalaDireta.Filter := CDSMalaDireta.Filter + 'OR (TIPO = ''Mãe'')'
    else
      CDSMalaDireta.Filter := '(TIPO = ''Mãe'')';

  if CBFornecedores.Checked then
    if CDSMalaDireta.Filter <> '' then
      CDSMalaDireta.Filter := CDSMalaDireta.Filter + 'OR (TIPO = ''Fornecedor'')'
    else
      CDSMalaDireta.Filter := '(TIPO = ''Fornecedor'')';

  if CBFuncionarios.Checked then
    if CDSMalaDireta.Filter <> '' then
      CDSMalaDireta.Filter := CDSMalaDireta.Filter + 'OR (TIPO = ''Funcionário'')'
    else
      CDSMalaDireta.Filter := '(TIPO = ''Funcionário'')';  

  CDSMalaDireta.Filtered := True;
  CDSMalaDireta.EnableControls;
end;

procedure TFMalaDireta.SBNovoClick(Sender: TObject);
begin
  if MessageDlg('Deseja remover o e-mail selecionado?', mtConfirmation,  [mbYes, mbNo], 0) = IDYES then
    CDSMalaDireta.Delete;
end;

procedure TFMalaDireta.RBNomeClick(Sender: TObject);
begin
  if Sender = RBNome then
    CDSMalaDireta.IndexFieldNames := 'NOME'
  else
    CDSMalaDireta.IndexFieldNames := 'EMAIL';
  end;

procedure TFMalaDireta.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then
    if RBNome.Checked then
      CDSMalaDireta.Locate('NOME', EdBusca.Text, [loPartialKey, loCaseInsensitive])
    else
      CDSMalaDireta.Locate('EMAIL', EdBusca.Text, [loPartialKey, loCaseInsensitive])
end;

procedure TFMalaDireta.SpeedButton3Click(Sender: TObject);
begin
  if ODAnexos.Execute then begin
    CDSAnexos.Append;
    CDSAnexosPATH.Value := ODAnexos.FileName;
    CDSAnexos.Post;
  end;
end;

procedure TFMalaDireta.SpeedButton4Click(Sender: TObject);
begin
  if MessageDlg('Deseja remover o anexo selecionado?', mtConfirmation,  [mbYes, mbNo], 0) = IDYES then
    CDSAnexos.Delete;
end;

procedure TFMalaDireta.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with TDBGrid(Sender) do
    if odd(DataSource.DataSet.RecNo) then begin
      Canvas.Brush.Color := Dados.vgCorGrid;
      Canvas.FillRect(Rect);
      DefaultDrawDataCell(Rect,Column.Field,State);
      if gdFocused in state then begin
        Canvas.Brush.Color := Dados.vgCorFoco;
        Canvas.FillRect(Rect);
        DefaultDrawDataCell(Rect,Column.Field,State);
      end;
    end;
end;

end.
