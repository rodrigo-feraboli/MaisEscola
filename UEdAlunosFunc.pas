unit UEdAlunosFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAlunosFunc = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    SBFunc: TSpeedButton;
    DBEdit8: TDBEdit;
    DBLCBFunc: TDBLookupComboBox;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBFuncClick(Sender: TObject);
    procedure DBLCBFuncKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdAlunosFunc: TFEdAlunosFunc;

implementation

uses UAlunos, UDados, UFunc;

{$R *.dfm}

procedure TFEdAlunosFunc.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAlunos.TbAlunosFunc.Cancel;
      FAlunos.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAlunosFunc.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if DBLCBFunc.Text = '' then begin
    MessageDlg(cgEspDescFuncRespAluno, mtWarning, [mbOk], 0);
    DBLCBFunc.SetFocus;
    exit;
  end;

  if FAlunos.TbAlunosFunc.State in [dsInsert] then begin
    FAlunos.QryAux.SQL.Text := 'SELECT CODALUNO FROM ALUNOSFUNC WHERE CODALUNO = '+ IntToStr(FAlunos.TbAlunosCODALUNO.AsInteger) +
      'and CODFUNC = '+ IntToStr(DBLCBFunc.KeyValue);
    FAlunos.QryAux.Open;
    if not FAlunos.QryAux.IsEmpty then begin
      MessageDlg(cgEspFuncAlunoJa, mtWarning, [mbOk], 0);
      DBLCBFunc.SetFocus;
      FAlunos.QryAux.Close;
      Exit;
    end;
    FAlunos.QryAux.Close;
  end;
  
  try
    FAlunos.TbAlunosFunc.Post;
    FAlunos.ConfTrans(True);
  except
    FAlunos.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdAlunosFunc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAlunosFunc.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAlunos.TbAlunosFunc.State in [dsInsert, dsEdit]) then
    FAlunos.TbAlunosFunc.Cancel;
end;

procedure TFEdAlunosFunc.FormCreate(Sender: TObject);
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

procedure TFEdAlunosFunc.SBFuncClick(Sender: TObject);
begin
  if not VerificarPermissao('FUNCIONÁRIOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFFunc, FFunc);
    FFunc.ShowModal;
  finally
    FreeAndNil(FFunc);
    Dados.LKFuncionarios(True);
  end;

end;

procedure TFEdAlunosFunc.DBLCBFuncKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then
    SBFuncClick(nil);
end;

end.
