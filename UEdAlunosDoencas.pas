unit UEdAlunosDoencas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAlunosDoencas = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    SBDoenca: TSpeedButton;
    DBEdit8: TDBEdit;
    DBLCBDoenca: TDBLookupComboBox;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBDoencaClick(Sender: TObject);
    procedure DBLCBDoencaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdAlunosDoencas: TFEdAlunosDoencas;

implementation

uses UAlunos, UDados, UDoencas;

{$R *.dfm}

procedure TFEdAlunosDoencas.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAlunos.TbAlunosDoencas.Cancel;
      FAlunos.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAlunosDoencas.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  
  if DBLCBDoenca.Text = '' then begin
    MessageDlg('Especifique a doença do aluno!', mtWarning, [mbOk], 0);
    DBLCBDoenca.SetFocus;
    exit;
  end;

  if FAlunos.TbAlunosDoencas.State in [dsInsert] then begin
    FAlunos.QryAux.SQL.Text := 'SELECT CODALUNO FROM ALUNOSDOENCAS WHERE CODALUNO = '+ IntToStr(FAlunos.TbAlunosCODALUNO.AsInteger) +
      'and CODDOENCA = '+ IntToStr(DBLCBDoenca.KeyValue);
    FAlunos.QryAux.Open;
    if not FAlunos.QryAux.IsEmpty then begin
      MessageDlg('Esta doença já foi adicionada a este aluno!', mtWarning, [mbOk], 0);
      DBLCBDoenca.SetFocus;
      FAlunos.QryAux.Close;
      Exit;
    end;
    FAlunos.QryAux.Close;
  end;
  
  try
    FAlunos.TbAlunosDoencas.Post;
    FAlunos.ConfTrans(True);
  except
    FAlunos.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdAlunosDoencas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAlunosDoencas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAlunos.TbAlunosDoencas.State in [dsInsert, dsEdit]) then
    FAlunos.TbAlunosDoencas.Cancel;
end;

procedure TFEdAlunosDoencas.FormCreate(Sender: TObject);
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

procedure TFEdAlunosDoencas.SBDoencaClick(Sender: TObject);
begin
  if not VerificarPermissao('DOENÇAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFDoencas, FDoencas);
    FDoencas.ShowModal;
  finally
    FreeAndNil(FDoencas);
    Dados.LKDoencas(True);
  end;

end;

procedure TFEdAlunosDoencas.DBLCBDoencaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = '+') then
    SBDoencaClick(nil);
end;

end.
