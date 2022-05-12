unit UEdTurmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdTurmas = class(TForm)
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
  FEdTurmas: TFEdTurmas;

implementation

uses UTurmas, UDados;

{$R *.dfm}

procedure TFEdTurmas.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FTurmas.TbTurmas.Cancel;
      Dados.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdTurmas.SBGravarClick(Sender: TObject);
begin
  ActiveControl := Panel3;
  if FTurmas.TbTurmasDESCRICAO.IsNull then begin
    MessageDlg(cgMsgEspDescTurma, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;


  try
    FTurmas.TbTurmas.Post;
    FTurmas.ConfTrans(True);
  except
    FTurmas.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdTurmas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdTurmas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FTurmas.TbTurmas.State in [dsInsert, dsEdit]) then
    FTurmas.TbTurmas.Cancel;
end;

procedure TFEdTurmas.FormCreate(Sender: TObject);
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

procedure TFEdTurmas.DBEdit2Exit(Sender: TObject);
begin
  if FTurmas.TbTurmas.State in [dsInsert] then begin
    Tag := 0;
    FTurmas.QryProx.SQL.Text := 'select descricao from TURMAS WHERE descricao = '''+ FTurmas.TbTurmasDESCRICAO.Value + '''';
    FTurmas.QryProx.Open;
    if not FTurmas.QryProx.IsEmpty then
      Tag := 1;
    FTurmas.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta turma já existe no cadastro! Deseja realmente manter a turma informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FTurmas.TbTurmasDESCRICAO.Clear;
  end;
end;

end.
