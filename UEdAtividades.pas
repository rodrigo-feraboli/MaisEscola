unit UEdAtividades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAtividades = class(TForm)
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
  FEdAtividades: TFEdAtividades;

implementation

uses UAtividades, UDados;

{$R *.dfm}

procedure TFEdAtividades.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAtividades.TbAtividades.Cancel;
      FAtividades.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAtividades.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FAtividades.TbAtividadesDESCRICAO.IsNull then begin
    MessageDlg('Especifique a descrição da atividade!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FAtividades.TbAtividades.Post;
    FAtividades.ConfTrans(True);
  except
    FAtividades.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdAtividades.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAtividades.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAtividades.TbAtividades.State in [dsInsert, dsEdit]) then
    FAtividades.TbAtividades.Cancel;
end;

procedure TFEdAtividades.FormCreate(Sender: TObject);
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

procedure TFEdAtividades.DBEdit2Exit(Sender: TObject);
begin
  if FAtividades.TbAtividades.State in [dsInsert] then begin
    Tag := 0;
    FAtividades.QryProx.SQL.Text := 'select DESCRICAO from ATIVIDADES WHERE DESCRICAO = '''+ FAtividades.TbAtividadesDESCRICAO.Value + '''';
    FAtividades.QryProx.Open;
    if not FAtividades.QryProx.IsEmpty then
      Tag := 1;
    FAtividades.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta atividade já existe no cadastro! Deseja realmente manter a atividade informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FAtividades.TbAtividadesDESCRICAO.Clear;
  end;
end;

end.
