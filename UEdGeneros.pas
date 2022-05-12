unit UEdGeneros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdGeneros = class(TForm)
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
  FEdGeneros: TFEdGeneros;

implementation

uses UGeneros, UDados;

{$R *.dfm}

procedure TFEdGeneros.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FGeneros.TbGeneros.Cancel;
      FGeneros.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdGeneros.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FGeneros.TbGenerosDESCRICAO.IsNull then begin
    MessageDlg(cgEspNomeGenero, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FGeneros.TbGeneros.Post;
    FGeneros.ConfTrans(True);
  except
    FGeneros.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdGeneros.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdGeneros.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FGeneros.TbGeneros.State in [dsInsert, dsEdit]) then
    FGeneros.TbGeneros.Cancel;
end;

procedure TFEdGeneros.FormCreate(Sender: TObject);
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

procedure TFEdGeneros.DBEdit2Exit(Sender: TObject);
begin
  if FGeneros.TbGeneros.State in [dsInsert] then begin
    Tag := 0;
    FGeneros.QryProx.SQL.Text := 'select descricao from GENEROS WHERE descricao = '''+ FGeneros.TbGenerosDESCRICAO.Value + '''';
    FGeneros.QryProx.Open;
    if not FGeneros.QryProx.IsEmpty then
      Tag := 1;
    FGeneros.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este gênero já existe no cadastro! Deseja realmente manter o gênero informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FGeneros.TbGenerosDESCRICAO.Clear;
  end;
end;

end.
