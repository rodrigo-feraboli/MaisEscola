unit UEdDisciplinas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEDDisciplinas = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEDDisciplinas: TFEDDisciplinas;

implementation

uses UDisciplinas, UDados;

{$R *.dfm}

procedure TFEDDisciplinas.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FDisciplinas.TbDisciplinas.Cancel;
      FDisciplinas.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEDDisciplinas.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FDisciplinas.TbDisciplinasDESCRICAO.IsNull then begin
    MessageDlg(cgEspNomeDisc, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FDisciplinas.TbDisciplinas.Post;
    FDisciplinas.ConfTrans(True);
  except
    FDisciplinas.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEDDisciplinas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEDDisciplinas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FDisciplinas.TbDisciplinas.State in [dsInsert, dsEdit]) then
    FDisciplinas.TbDisciplinas.Cancel;
end;

procedure TFEDDisciplinas.FormCreate(Sender: TObject);
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

procedure TFEDDisciplinas.DBEdit2Exit(Sender: TObject);
begin
  if FDisciplinas.TbDisciplinas.State in [dsInsert] then begin
    Tag := 0;
    FDisciplinas.QryProx.SQL.Text := 'select descricao from DISCIPLINAS WHERE descricao = '''+ FDisciplinas.TbDisciplinasDESCRICAO.Value + '''';
    FDisciplinas.QryProx.Open;
    if not FDisciplinas.QryProx.IsEmpty then
      Tag := 1;
    FDisciplinas.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta disciplina já existe no cadastro! Deseja realmente manter a disciplina informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FDisciplinas.TbDisciplinasDESCRICAO.Clear;
  end;
end;

end.
