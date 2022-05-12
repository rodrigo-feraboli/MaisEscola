unit UEdAlergias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAlergias = class(TForm)
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
  FEdAlergias: TFEdAlergias;

implementation

uses UAlergias, UDados;

{$R *.dfm}

procedure TFEdAlergias.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAlergias.TbAlergias.Cancel;
      FAlergias.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAlergias.SBGravarClick(Sender: TObject);
begin
  panel3.SetFocus;
  if FAlergias.TbAlergiasDESCRICAO.IsNull then begin
    MessageDlg(cgEspNomeAlergia, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FAlergias.TbAlergias.Post;
    FAlergias.ConfTrans(True);
  except
    FAlergias.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdAlergias.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAlergias.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAlergias.TbAlergias.State in [dsInsert, dsEdit]) then
    FAlergias.TbAlergias.Cancel;
end;

procedure TFEdAlergias.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdAlergias.DBEdit2Exit(Sender: TObject);
begin
  if FAlergias.TbAlergias.State in [dsInsert] then begin
    Tag := 0;
    FAlergias.QryProx.SQL.Text := 'select DESCRICAO from ALERGIAS WHERE DESCRICAO = '''+ FAlergias.TbAlergiasDESCRICAO.Value + '''';
    FAlergias.QryProx.Open;
    if not FAlergias.QryProx.IsEmpty then
      Tag := 1;
    FAlergias.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta alergia já existe no cadastro! Deseja realmente manter a alergia informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FAlergias.TbAlergiasDESCRICAO.Clear;
  end;
end;

end.
