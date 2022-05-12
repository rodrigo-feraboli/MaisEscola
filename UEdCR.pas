unit UEdCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdCR = class(TForm)
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    Label13: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    SpeedButton4: TSpeedButton;
    Label5: TLabel;
    DBLCBAluno: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBLCBBanco: TDBLookupComboBox;
    DBEdit10: TDBEdit;
    DBEdit8: TDBEdit;
    DBMemo1: TDBMemo;
    DBLCBCondPgto: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBLCBCC: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBLCBAlunoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdCR: TFEdCR;

implementation

uses UDados, UCReceber, UAlunos, UCondPgto, UCC, UBancos;

{$R *.dfm}

procedure TFEdCR.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryAlunosLK.Open;
  Dados.QryBancosLK.Open;
  Dados.QryCondPgtoLK.Open;
  Dados.QryCCLK.Open;
end;

procedure TFEdCR.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCReceber.TbCR.Cancel;
      FCReceber.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdCR.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FCReceber.TbCRDATA.IsNull then begin
    MessageDlg('Especifique a data de cadastro da Conta a Receber!', mtWarning, [mbOk], 0);
    DBEdit5.SetFocus;
    exit;
  end;

  if DBLCBAluno.Text = '' then begin
    MessageDlg('Especifique o aluno da Conta a Receber!', mtWarning, [mbOk], 0);
    DBLCBAluno.SetFocus;
    exit;
  end;

{  if DBLCBBanco.Text = '' then begin
    MessageDlg('Especifique o banco da Conta a Receber!', mtWarning, [mbOk], 0);
    DBLCBBanco.SetFocus;
    exit;
  end;   }

  if DBLCBCC.Text = '' then begin
    MessageDlg('Especifique o centro de custo da Conta a Receber!', mtWarning, [mbOk], 0);
    DBLCBCC.SetFocus;
    exit;
  end;

  if DBLCBCondPgto.Text = '' then begin
    MessageDlg('Especifique a condição de pagamento da Conta a Receber!', mtWarning, [mbOk], 0);
    DBLCBCondPgto.SetFocus;
    exit;
  end;


  if FCReceber.TbCR.State in [dsInsert] then begin
    FCReceber.QryAux.SQL.Text := 'SELECT MAX(NROCRECEBER) FROM CRECEBER';
    FCReceber.QryAux.Open;
    Tag := FCReceber.QryAux.Fields[0].AsInteger + 1;
    FCReceber.QryAux.Close;
  end;

  try
    FCReceber.TbCR.Post;
    FCReceber.ConfTrans(True);
    // **** POST <>
    // Lançar parcela conf cond pgto -- ideia futura
    //if MessageDlg('Deseja lançar as ')

  except
    FCReceber.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdCR.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdCR.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCReceber.TbCR.State in [dsInsert, dsEdit]) then
    FCReceber.TbCR.Cancel;
end;

procedure TFEdCR.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdCR.SpeedButton1Click(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFAlunos, FAlunos);
    FAlunos.ShowModal;
  finally
    FreeAndNil(FAlunos);
    LKTela;
  end;
end;

procedure TFEdCR.SpeedButton2Click(Sender: TObject);
begin
  if not VerificarPermissao('BANCOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFBancos, FBancos);
    FBancos.ShowModal;
  finally
    FreeAndNil(FBancos);
  end;
end;

procedure TFEdCR.FormShow(Sender: TObject);
begin
  LKTela;
end;

procedure TFEdCR.SpeedButton3Click(Sender: TObject);
begin
  if not VerificarPermissao('CONDIÇÕES DE PAGAMENTO', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCondPgto, FCondPgto);
    FCondPgto.ShowModal;
  finally
    FreeAndNil(FCondPgto);
  end;
end;

procedure TFEdCR.SpeedButton4Click(Sender: TObject);
begin
  if not VerificarPermissao('CENTRO DE CUSTOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCC, FCC);
    FCC.ShowModal;
  finally
    FreeAndNil(FCC);
  end;
end;

procedure TFEdCR.DBLCBAlunoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then begin
    if sender = DBLCBAluno then
      SpeedButton1Click(nil)
    else if sender = DBLCBBanco then
      SpeedButton2Click(nil)
    else if sender = DBLCBCC then
      SpeedButton4Click(nil)
    else if sender = DBLCBCondPgto then
      SpeedButton3Click(nil);
  end;
end;

end.
