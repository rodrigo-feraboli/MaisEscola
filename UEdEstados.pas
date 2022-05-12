unit UEdEstados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdEstados = class(TForm)
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
  FEdEstados: TFEdEstados;

implementation

uses UEstados, UDados;

{$R *.dfm}

procedure TFEdEstados.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FEstados.TbEstados.Cancel;
      FEstados.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdEstados.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FEstados.TbEstadosDESCRICAO.IsNull then begin
    MessageDlg(cgEspDescEst, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;
  if FEstados.TbEstadosUF.IsNull then begin
    MessageDlg(cgEspDescEstUF, mtWarning, [mbOk], 0);
    DBEdit3.SetFocus;
    exit;
  end;

  try
    Festados.TbEstados.Post;
    Festados.ConfTrans(True);
  except
    Festados.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdEstados.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdEstados.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Festados.TbEstados.State in [dsInsert, dsEdit]) then
    Festados.TbEstados.Cancel;
end;

procedure TFEdEstados.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdEstados.DBEdit2Exit(Sender: TObject);
begin
  if FEstados.TbEstados.State in [dsInsert] then begin
    Tag := 0;
    FEstados.QryProx.SQL.Text := 'select descricao from ESTADOS WHERE descricao = '''+ FEstados.TbEstadosDESCRICAO.Value + '''';
    FEstados.QryProx.Open;
    if not FEstados.QryProx.IsEmpty then
      Tag := 1;
    FEstados.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este estado já existe no cadastro! Deseja realmente manter o estado informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FEstados.TbEstadosDESCRICAO.Clear;
  end;
end;

end.
