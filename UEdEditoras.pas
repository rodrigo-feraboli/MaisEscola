unit UEdEditoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdEditoras = class(TForm)
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
  FEdEditoras: TFEdEditoras;

implementation

uses UEditoras, UDados;

{$R *.dfm}

procedure TFEdEditoras.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FEditoras.TbEditoras.Cancel;
      FEditoras.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdEditoras.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FEditoras.TbEditorasDESCRICAO.IsNull then begin
    MessageDlg(cgEspNomeEditora, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FEditoras.TbEditoras.Post;
    FEditoras.ConfTrans(True);
  except
    FEditoras.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdEditoras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdEditoras.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FEditoras.TbEditoras.State in [dsInsert, dsEdit]) then
    FEditoras.TbEditoras.Cancel;
end;

procedure TFEdEditoras.FormCreate(Sender: TObject);
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

procedure TFEdEditoras.DBEdit2Exit(Sender: TObject);
begin
  if FEditoras.TbEditoras.State in [dsInsert] then begin
    Tag := 0;
    FEditoras.QryProx.SQL.Text := 'select descricao from EDITORAS WHERE descricao = '''+ FEditoras.TbEditorasDESCRICAO.Value + '''';
    FEditoras.QryProx.Open;
    if not FEditoras.QryProx.IsEmpty then
      Tag := 1;
    FEditoras.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta editora já existe no cadastro! Deseja realmente manter a editora informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FEditoras.TbEditorasDESCRICAO.Clear;
  end;
end;

end.
