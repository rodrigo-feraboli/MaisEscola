unit UEdAlunosRemedios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAlunosRemedios = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    SBRem: TSpeedButton;
    DBEdit8: TDBEdit;
    DBLCBRemedios: TDBLookupComboBox;
    Label3: TLabel;
    DBEdit1: TDBMemo;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBRemClick(Sender: TObject);
    procedure DBLCBRemediosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdAlunosRemedios: TFEdAlunosRemedios;

implementation

uses UAlunos, UDados, URemedios;

{$R *.dfm}

procedure TFEdAlunosRemedios.SBCancelarClick(Sender: TObject);
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

procedure TFEdAlunosRemedios.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  
  if DBLCBRemedios.Text = '' then begin
    MessageDlg(cgEspRemedioAluno, mtWarning, [mbOk], 0);
    DBLCBRemedios.SetFocus;
    exit;
  end;

  if FAlunos.TbAlunosRemedios.State in [dsInsert] then begin
    FAlunos.QryAux.SQL.Text := 'SELECT CODALUNO FROM ALUNOSREMEDIOS WHERE CODALUNO = '+ IntToStr(FAlunos.TbAlunosCODALUNO.AsInteger) +
      'and CODREMEDIO = '+ IntToStr(DBLCBRemedios.KeyValue);
    FAlunos.QryAux.Open;
    if not FAlunos.QryAux.IsEmpty then begin
      MessageDlg('Este remédio já foi adicionado a este aluno!', mtWarning, [mbOk], 0);
      DBLCBRemedios.SetFocus;
      FAlunos.QryAux.Close;
      Exit;
    end;
    FAlunos.QryAux.Close;
  end;
  
  try
    FAlunos.TbAlunosRemedios.Post;
    FAlunos.ConfTrans(True);
  except
    FAlunos.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdAlunosRemedios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAlunosRemedios.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAlunos.TbAlunosRemedios.State in [dsInsert, dsEdit]) then
    FAlunos.TbAlunosRemedios.Cancel;
end;

procedure TFEdAlunosRemedios.FormCreate(Sender: TObject);
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

procedure TFEdAlunosRemedios.SBRemClick(Sender: TObject);
begin
  if not VerificarPermissao('REMÉDIOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFRemedios, FRemedios);
    FRemedios.ShowModal;
  finally
    FreeAndNil(FRemedios);
    Dados.LKRemedios(True);
  end;

end;

procedure TFEdAlunosRemedios.DBLCBRemediosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = '+') then
    SBRemClick(nil);
end;

end.
