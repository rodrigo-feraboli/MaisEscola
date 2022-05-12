unit UEdProfissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdProfissoes = class(TForm)
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
    Label4: TLabel;
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
  FEdProfissoes: TFEdProfissoes;

implementation

uses UProfissoes, UDados;

{$R *.dfm}

procedure TFEdProfissoes.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FProfissoes.TbProfissoes.Cancel;
      FProfissoes.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdProfissoes.SBGravarClick(Sender: TObject);
begin
  ActiveControl := Panel3;
  if FProfissoes.TbProfissoesDESCRICAO.IsNull then begin
    MessageDlg(cgEspDescProf, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end; 

  try
    FProfissoes.TbProfissoes.Post;
    FProfissoes.ConfTrans(True);
  except
    FProfissoes.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdProfissoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdProfissoes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FProfissoes.TbProfissoes.State in [dsInsert, dsEdit]) then
    FProfissoes.TbProfissoes.Cancel;
end;

procedure TFEdProfissoes.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdProfissoes.DBEdit2Exit(Sender: TObject);
begin
  if FProfissoes.TbProfissoes.State in [dsInsert] then begin
    Tag := 0;
    FProfissoes.QryProx.SQL.Text := 'select descricao from PROFISSOES WHERE descricao = '''+ FProfissoes.TbProfissoesDESCRICAO.Value + '''';
    FProfissoes.QryProx.Open;
    if not FProfissoes.QryProx.IsEmpty then
      Tag := 1;
    FProfissoes.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta profissão já existe no cadastro! Deseja realmente manter a profissão informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FProfissoes.TbProfissoesDESCRICAO.Clear;
  end;
end;

end.
