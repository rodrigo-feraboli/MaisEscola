unit UEdDoencas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdDoencas = class(TForm)
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
  FEdDoencas: TFEdDoencas;

implementation

uses UDoencas, UDados;

{$R *.dfm}

procedure TFEdDoencas.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FDoencas.TbDoencas.Cancel;
      FDoencas.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdDoencas.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FDoencas.TbDoencasDESCRICAO.IsNull then begin
    MessageDlg(cgEspDescDoenca, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;


  try
    FDoencas.TbDoencas.Post;
    FDoencas.ConfTrans(True);
  except
    FDoencas.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdDoencas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdDoencas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FDoencas.TbDoencas.State in [dsInsert, dsEdit]) then
    FDoencas.TbDoencas.Cancel;
end;

procedure TFEdDoencas.FormCreate(Sender: TObject);
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

procedure TFEdDoencas.DBEdit2Exit(Sender: TObject);
begin
  if FDoencas.TbDoencas.State in [dsInsert] then begin
    Tag := 0;
    FDoencas.QryProx.SQL.Text := 'select descricao from DOENCAS WHERE descricao = '''+ FDoencas.TbDoencasDESCRICAO.Value + '''';
    FDoencas.QryProx.Open;
    if not FDoencas.QryProx.IsEmpty then
      Tag := 1;
    FDoencas.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta doença já existe no cadastro! Deseja realmente manter a doença informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FDoencas.TbDoencasDESCRICAO.Clear;
  end;
end;

end.
