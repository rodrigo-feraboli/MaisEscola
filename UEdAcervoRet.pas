unit UEdAcervoRet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAcervoRet = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBText1: TDBText;
    DBRadioGroup1: TDBRadioGroup;
    LblAluno: TLabel;
    DBEAluno: TDBEdit;
    DBLCBAluno: TDBLookupComboBox;
    SBAluno: TSpeedButton;
    LblFunc: TLabel;
    DBEFunc: TDBEdit;
    DBLCBFunc: TDBLookupComboBox;
    SBFunc: TSpeedButton;
    DTPRet: TDateTimePicker;
    DTPDev: TDateTimePicker;
    DTPDevol: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure DTPRetChange(Sender: TObject);
    procedure DTPDevChange(Sender: TObject);
    procedure DTPDevolChange(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SBAlunoClick(Sender: TObject);
    procedure SBFuncClick(Sender: TObject);
    procedure DBLCBAlunoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdAcervoRet: TFEdAcervoRet;

implementation

uses UAcervo, UDados, UAlunos, UFunc;

{$R *.dfm}

procedure TFEdAcervoRet.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryAlunosLK.Open;
  Dados.QryFuncLK.Open;
end;

procedure TFEdAcervoRet.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAcervo.TbAcervoRetiradas.Cancel;
      FAcervo.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAcervoRet.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FAcervo.TbAcervoRetiradasDTRETIRADA.IsNull then begin
    MessageDlg('Especifique a data da retirada!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;
  if FAcervo.TbAcervoRetiradasDTDEV.IsNull then begin
    MessageDlg('Especifique a data da devolução!', mtWarning, [mbOk], 0);
    DBEdit5.SetFocus;
    exit;
  end;
  if (DBRadioGroup1.ItemIndex = 1) and (DBLCBAluno.Text = '') then begin
    MessageDlg('Especifique o aluno que fez a retirada!', mtWarning, [mbOk], 0);
    DBLCBAluno.SetFocus;
    exit;
  end;
  if (DBRadioGroup1.ItemIndex = 2) and (DBLCBFunc.Text = '') then begin
    MessageDlg('Especifique o funcionário que fez a retirada!', mtWarning, [mbOk], 0);
    DBLCBFunc.SetFocus;
    exit;
  end;
  try
    FAcervo.QryProx.SQL.Text := 'SELECT MAX(CODRETIRADA) FROM ACERVORETIRADAS WHERE CODACERVO = '+ IntToStr(FAcervo.TbAcervoCODACERVO.Value);
    FAcervo.QryProx.Open;
    FAcervo.TbAcervoRetiradasCODRETIRADA.Value := FAcervo.QryProx.Fields[0].AsInteger + 1;
    FAcervo.QryProx.Close;
    FAcervo.TbAcervoRetiradas.Post;
    FAcervo.ConfTrans(True);
  except
    FAcervo.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end; 
  Close;
end;

procedure TFEdAcervoRet.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAcervoRet.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAcervo.TbAcervoRetiradas.State in [dsInsert, dsEdit]) then
    FAcervo.TbAcervoRetiradas.Cancel;
end;

procedure TFEdAcervoRet.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  LKTela;
end;

procedure TFEdAcervoRet.DBRadioGroup1Change(Sender: TObject);
begin
  LblAluno.Visible := DBRadioGroup1.Value = '1';
  LblFunc.Visible :=  DBRadioGroup1.Value = '2';

  DBEAluno.Visible := LblAluno.Visible;
  DBEFunc.Visible := LblFunc.Visible;
  DBLCBAluno.Visible := LblAluno.Visible;
  SBAluno.Visible := LblAluno.Visible;
  DBLCBFunc.Visible := LblFunc.Visible;
  SBFunc.Visible := LblFunc.Visible;
end;

procedure TFEdAcervoRet.DTPRetChange(Sender: TObject);
begin
  FAcervo.TbAcervoRetiradasDTRETIRADA.Value := DTPRet.Date;
end;

procedure TFEdAcervoRet.DTPDevChange(Sender: TObject);
begin
  FAcervo.TbAcervoRetiradasDTDEV.Value := DTPDev.Date;
end;

procedure TFEdAcervoRet.DTPDevolChange(Sender: TObject);
begin
   FAcervo.TbAcervoRetiradasDTDEVOLV.Value := DTPDevol.Date;
end;

procedure TFEdAcervoRet.DBEdit2Enter(Sender: TObject);
begin
  try
    DTPRet.Date := FAcervo.TbAcervoRetiradasDTRETIRADA.Value;
  except
    DTPRet.Date := Date;
  end;
end;

procedure TFEdAcervoRet.DBEdit5Exit(Sender: TObject);
begin
  try
    DTPDev.Date := FAcervo.TbAcervoRetiradasDTDEV.Value;
  except
    DTPDev.Date := Date;
  end;
end;

procedure TFEdAcervoRet.DBEdit4Enter(Sender: TObject);
begin
  try
    DTPDevol.Date := FAcervo.TbAcervoRetiradasDTDEVOLV.Value;
  except
    DTPDevol.Date := Date;
  end;
end;

procedure TFEdAcervoRet.FormShow(Sender: TObject);
begin
  DBEdit2Enter(nil);
  DBEdit5Exit(nil);
  DBEdit4Enter(nil);
end;

procedure TFEdAcervoRet.SBAlunoClick(Sender: TObject);
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

procedure TFEdAcervoRet.SBFuncClick(Sender: TObject);
begin
  if not VerificarPermissao('FUNCIONÁRIOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFFunc, FFunc);
    FFunc.ShowModal;
  finally
    FreeAndNil(FFunc);
    LKTela;
  end;
end;

procedure TFEdAcervoRet.DBLCBAlunoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '+' then begin
    if sender = DBLCBAluno then
      SBAlunoClick(nil)
    else
      SBFuncClick(nil);
  end;
end;

end.
