unit UEdCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdCheques = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBLCBBanco: TDBLookupComboBox;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    SBBanco: TSpeedButton;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    Label10: TLabel;
    SBAluno: TSpeedButton;
    DBEdit9: TDBEdit;
    DBLCBAluno: TDBLookupComboBox;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    DTPBom: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBBancoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure DBLCBAlunoKeyPress(Sender: TObject; var Key: Char);
    procedure DTPBomChange(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DBLCBAlunoExit(Sender: TObject);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdCheques: TFEdCheques;

implementation

uses UCheques, UDados, UBancos, UAlunos;

{$R *.dfm}

procedure TFEdCheques.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryBancosLK.Open;
  Dados.QryAlunosLK.Open;
end;

procedure TFEdCheques.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCheques.TbCheques.Cancel;
      FCheques.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdCheques.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FCheques.TbChequesEMITENTE.IsNull then begin
    MessageDlg('Especifique o banco do cheque!', mtWarning, [mbOk], 0);
    DBLCBBanco.SetFocus;
    exit;
  end;

  if FCheques.TbChequesCODBANCO.IsNull then begin
    MessageDlg('Especifique o banco do cheque!', mtWarning, [mbOk], 0);
    DBLCBBanco.SetFocus;
    exit;
  end;
  if FCheques.TbChequesAGENCIA.IsNull then begin
    MessageDlg('Especifique a agência do cheque!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  if FCheques.TbChequesCONTA.IsNull then begin
    MessageDlg('Especifique a conta do cheque!', mtWarning, [mbOk], 0);
    DBEdit4.SetFocus;
    exit;
  end;

  if FCheques.TbChequesNUMERO.IsNull then begin
    MessageDlg('Especifique o número do cheque!', mtWarning, [mbOk], 0);
    DBEdit5.SetFocus;
    exit;
  end;

  if (DBCheckBox1.Checked) and (FCheques.TbChequesBOMPARA.IsNull) then begin
    MessageDlg('Especifique a data do bom para do cheque!', mtWarning, [mbOk], 0);
    DBEdit6.SetFocus;
    exit;
  end;      

  if FCheques.TbChequesVALOR.IsNull then begin
    MessageDlg('Especifique o valor do cheque!', mtWarning, [mbOk], 0);
    DBEdit7.SetFocus;
    exit;
  end;

  try
    FCheques.TbCheques.Post;
    FCheques.ConfTrans(True);
  except
    FCheques.QryProx.SQL.Text := 'SELECT MAX(CODIGO) FROM CHEQUES';
    FCheques.QryProx.Open;
    FCheques.TbChequesCODIGO.Value := FCheques.QryProx.Fields[0].AsInteger + 1;
    FCheques.QryProx.Close;
    try
    FCheques.TbCheques.Post;
    FCheques.ConfTrans(True);
    except
      FCheques.ConfTrans(False);
      MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
    end;
  end;
  Close;
end;

procedure TFEdCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdCheques.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCheques.TbCheques.State in [dsInsert, dsEdit]) then
    FCheques.TbCheques.Cancel;
end;

procedure TFEdCheques.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdCheques.SBBancoClick(Sender: TObject);
begin
  if sender = SBAluno then begin
    if not VerificarPermissao('ALUNOS', 'CONS', 1) then
      Exit;
    try
      Application.CreateForm(TFAlunos, FAlunos);
      FAlunos.ShowModal;
    finally
      FreeAndNil(FAlunos);
      LKTela;
    end;
  end else begin
    if not VerificarPermissao('BANCOS', 'CONS', 1) then
      Exit;
    try
      Application.CreateForm(TFBancos, FBancos);
      FBancos.ShowModal;
    finally
      FreeAndNil(FBancos);
      LKTela;
    end;
  end;
end;

procedure TFEdCheques.FormShow(Sender: TObject);
begin
  DBCheckBox1Click(nil);
  DBEdit6Enter(nil);
  LKTela;
end;

procedure TFEdCheques.DBCheckBox1Click(Sender: TObject);
begin
  Label6.Visible := DBCheckBox1.Checked;
  DBEdit6.Visible := Label6.Visible;
  DTPBom.Visible :=  Label6.Visible;
end;

procedure TFEdCheques.DBLCBAlunoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then begin
    if sender = DBLCBAluno then
      SBBancoClick(SBAluno)
    else
      SBBancoClick(SBBanco);
  end;
end;

procedure TFEdCheques.DTPBomChange(Sender: TObject);
begin
  FCheques.TbChequesBOMPARA.Value := DTPBom.Date;
end;

procedure TFEdCheques.DBEdit6Enter(Sender: TObject);
begin
  try
    DTPBom.Date := FCheques.TbChequesBOMPARA.Value;
  except
    DTPBom.Date := Date;
  end;
end;

procedure TFEdCheques.DBLCBAlunoExit(Sender: TObject);
begin
  if FCheques.TbChequesEMITENTE.IsNull then
    FCheques.TbChequesEMITENTE.Value := DBLCBAluno.Text;
end;

end.
