unit UEdAlunosAlergias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAlunosAlergias = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    SBAlergia: TSpeedButton;
    DBEdit8: TDBEdit;
    DBLCBAlergia: TDBLookupComboBox;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBAlergiaClick(Sender: TObject);
    procedure DBLCBAlergiaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdAlunosAlergias: TFEdAlunosAlergias;

implementation

uses UAlunos, UDados, UAlergias;

{$R *.dfm}

procedure TFEdAlunosAlergias.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAlunos.TbAlunosAlergias.Cancel;
      FAlunos.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAlunosAlergias.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  
  if DBLCBAlergia.Text = '' then begin
    MessageDlg(cgEspAlergiaAluno, mtWarning, [mbOk], 0);
    DBLCBAlergia.SetFocus;
    exit;
  end;

  if FAlunos.TbAlunosAlergias.State in [dsInsert] then begin
    FAlunos.QryAux.SQL.Text := 'SELECT CODALUNO FROM ALUNOSALERGIAS WHERE CODALUNO = '+ IntToStr(FAlunos.TbAlunosCODALUNO.AsInteger) +
      'and CODALERGIA = '+ IntToStr(DBLCBAlergia.KeyValue);
    FAlunos.QryAux.Open;
    if not FAlunos.QryAux.IsEmpty then begin
      MessageDlg('Esta alergia já foi adicionada a este aluno!', mtWarning, [mbOk], 0);
      DBLCBAlergia.SetFocus;
      FAlunos.QryAux.Close;
      Exit;
    end;
    FAlunos.QryAux.Close;
  end;
  
  try
    FAlunos.TbAlunosAlergias.Post;
    FAlunos.ConfTrans(True);
  except
    FAlunos.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdAlunosAlergias.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAlunosAlergias.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAlunos.TbAlunosAlergias.State in [dsInsert, dsEdit]) then
    FAlunos.TbAlunosAlergias.Cancel;
end;

procedure TFEdAlunosAlergias.FormCreate(Sender: TObject);
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

procedure TFEdAlunosAlergias.SBAlergiaClick(Sender: TObject);
begin
  if not VerificarPermissao('ALERGIAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFAlergias, FAlergias);
    FAlergias.ShowModal;
  finally
    FreeAndNil(FAlergias);
    Dados.LKAlergias(True);
  end;

end;

procedure TFEdAlunosAlergias.DBLCBAlergiaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = '+') then
    SBAlergiaClick(nil);
end;

end.
