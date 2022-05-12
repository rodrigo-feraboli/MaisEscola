unit UEdCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdCP = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    DBLCBForn: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBLCBBanco: TDBLookupComboBox;
    DBEdit10: TDBEdit;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    SpeedButton3: TSpeedButton;
    Label4: TLabel;
    DBLCBCondPgto: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    SpeedButton4: TSpeedButton;
    Label5: TLabel;
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
    procedure Label1Click(Sender: TObject);
    procedure DBLCBFornKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdCP: TFEdCP;

implementation

uses UDados, UCPagar, UAlunos, UCondPgto, UCC, UBancos;

{$R *.dfm}

procedure TFEdCP.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryFornLK.Open;
  Dados.QryBancosLK.Open;
  Dados.QryCondPgtoLK.Open;
  Dados.QryCCLK.Open;
end;

procedure TFEdCP.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCPagar.TbCP.Cancel;
      FCPagar.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdCP.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FCPagar.TbCPDATA.IsNull then begin
    MessageDlg('Especifique a data de cadastro da Conta a Pagar!', mtWarning, [mbOk], 0);
    DBEdit5.SetFocus;
    exit;
  end;

  if DBLCBForn.Text = '' then begin
    MessageDlg('Especifique o fornecedor da Conta a Pagar!', mtWarning, [mbOk], 0);
    DBLCBForn.SetFocus;
    exit;
  end;

{  if DBLCBBanco.Text = '' then begin
    MessageDlg('Especifique o banco da Conta a Receber!', mtWarning, [mbOk], 0);
    DBLCBBanco.SetFocus;
    exit;
  end;   }

  if DBLCBCC.Text = '' then begin
    MessageDlg('Especifique o centro de custo da Conta a Pagar!', mtWarning, [mbOk], 0);
    DBLCBCC.SetFocus;
    exit;
  end;

  if DBLCBCondPgto.Text = '' then begin
    MessageDlg('Especifique a condição de pagamento da Conta a Pagar!', mtWarning, [mbOk], 0);
    DBLCBCondPgto.SetFocus;
    exit;
  end;


  if FCPagar.TbCP.State in [dsInsert] then begin
    FCPagar.QryAux.SQL.Text := 'SELECT MAX(NROCPAGAR) FROM CPAGAR';
    FCPagar.QryAux.Open;
    Tag := FCPagar.QryAux.Fields[0].AsInteger + 1;
    FCPagar.QryAux.Close;
  end;

  try
    FCPagar.TbCP.Post;
    FCPagar.ConfTrans(True);
    // **** POST <>
    // Lançar parcela conf cond pgto -- ideia futura
    //if MessageDlg('Deseja lançar as ')

  except
    FCPagar.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdCP.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdCP.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCPagar.TbCP.State in [dsInsert, dsEdit]) then
    FCPagar.TbCP.Cancel;
end;

procedure TFEdCP.FormCreate(Sender: TObject);
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

procedure TFEdCP.SpeedButton1Click(Sender: TObject);
begin
  if not VerificarPermissao('FORNECEDORES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFAlunos, FAlunos);
    FAlunos.ShowModal;
  finally
    FreeAndNil(FAlunos);
    LKTela;
  end;
end;

procedure TFEdCP.SpeedButton2Click(Sender: TObject);
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

procedure TFEdCP.FormShow(Sender: TObject);
begin
  LKTela;
end;

procedure TFEdCP.SpeedButton3Click(Sender: TObject);
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

procedure TFEdCP.SpeedButton4Click(Sender: TObject);
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

procedure TFEdCP.Label1Click(Sender: TObject);
begin
  // quando tiver mostrar
end;

procedure TFEdCP.DBLCBFornKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then begin
    if sender = DBLCBForn then
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
