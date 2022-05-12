unit UEdCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdCidades = class(TForm)
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
    DBLCBEstados: TDBLookupComboBox;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    SpeedButton1: TSpeedButton;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBLCBEstadosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdCidades: TFEdCidades;

implementation

uses UCidades, UDados, UEstados;

{$R *.dfm}

procedure TFEdCidades.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryEstadosLK.Open;
end;

procedure TFEdCidades.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCidades.TbCidades.Cancel;
      FCidades.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdCidades.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FCidades.TbCidadesDESCRICAO.IsNull then begin
    MessageDlg('Especifique o nome do estado!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FCidades.TbCidades.Post;
    FCidades.ConfTrans(True);
  except
    try
      FCidades.TbCidades.Post;
      FCidades.ConfTrans(True);
    except
      FCidades.ConfTrans(False);
      MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
    end;
  end;
  Close;
end;

procedure TFEdCidades.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdCidades.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCidades.TbCidades.State in [dsInsert, dsEdit]) then
    FCidades.TbCidades.Cancel;
end;

procedure TFEdCidades.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdCidades.SpeedButton1Click(Sender: TObject);
begin
  if not VerificarPermissao('ESTADOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFEstados, FEstados);
    FEstados.ShowModal;
  finally
    LKTela;
    FreeAndNil(FEstados);
  end;
end;

procedure TFEdCidades.FormShow(Sender: TObject);
begin
  LKTela;
end;

procedure TFEdCidades.DBEdit2Exit(Sender: TObject);
begin
  if FCidades.TbCidades.State in [dsInsert] then begin
    Tag := 0;
    FCidades.QryProx.SQL.Text := 'select descricao from CIDADES WHERE descricao = '''+ FCidades.TbCidadesDESCRICAO.Value + '''';
    FCidades.QryProx.Open;
    if not FCidades.QryProx.IsEmpty then
      Tag := 1;
    FCidades.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta cidade já existe no cadastro! Deseja realmente manter a cidade informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FCidades.TbCidadesDESCRICAO.Clear;
  end;
end;

procedure TFEdCidades.DBLCBEstadosKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then
    SpeedButton1Click(nil);
end;

end.
