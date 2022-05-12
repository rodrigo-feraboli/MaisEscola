unit UEdAlunosTrat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAlunosTrat = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    SBTrat: TSpeedButton;
    DBEdit8: TDBEdit;
    DBLCBTrat: TDBLookupComboBox;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBTratClick(Sender: TObject);
    procedure DBLCBTratKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdAlunosTrat: TFEdAlunosTrat;

implementation

uses UAlunos, UDados, UTrat;

{$R *.dfm}

procedure TFEdAlunosTrat.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAlunos.TbAlunosTrat.Cancel;
      FAlunos.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAlunosTrat.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  
  if DBLCBtrat.Text = '' then begin
    MessageDlg('Especifique o tratamento do aluno', mtWarning, [mbOk], 0);
    DBLCBTrat.SetFocus;
    exit;
  end;

  if FAlunos.TbAlunosTrat.State in [dsInsert] then begin
    FAlunos.QryAux.SQL.Text := 'SELECT CODALUNO FROM ALUNOSTRAT WHERE CODALUNO = '+ IntToStr(FAlunos.TbAlunosCODALUNO.AsInteger) +
      'and CODTRATAMENTO = '+ IntToStr(DBLCBTrat.KeyValue);
    FAlunos.QryAux.Open;
    if not FAlunos.QryAux.IsEmpty then begin
      MessageDlg('Este tratamento já foi adicionado a este aluno!', mtWarning, [mbOk], 0);
      DBLCBTrat.SetFocus;
      FAlunos.QryAux.Close;
      Exit;
    end;
    FAlunos.QryAux.Close;
  end;
  
  try
    FAlunos.TbAlunosTrat.Post;
    FAlunos.ConfTrans(True);
  except
    FAlunos.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdAlunosTrat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAlunosTrat.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAlunos.TbAlunosTrat.State in [dsInsert, dsEdit]) then
    FAlunos.TbAlunosTrat.Cancel;
end;

procedure TFEdAlunosTrat.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Dados.LKTratamentos(True);
end;

procedure TFEdAlunosTrat.SBTratClick(Sender: TObject);
begin
  if not VerificarPermissao('TRATAMENTOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFTrat, FTrat);
    FTrat.ShowModal;
  finally
    FreeAndNil(FTrat);
    Dados.LKTratamentos(True);
  end;     
end;

procedure TFEdAlunosTrat.DBLCBTratKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then
    SBTratClick(nil);
end;

end.
