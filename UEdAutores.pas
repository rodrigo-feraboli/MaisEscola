unit UEdAutores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAutores = class(TForm)
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
  FEdAutores: TFEdAutores;

implementation

uses UDados, UAutores;

{$R *.dfm}

procedure TFEdAutores.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAutores.TbAutores.Cancel;
      FAutores.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAutores.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FAutores.TbAutoresNOME.IsNull then begin
    MessageDlg(cgEspNomeAutor, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FAutores.TbAutores.Post;
    FAutores.ConfTrans(True);
  except
    FAutores.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdAutores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAutores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAutores.TbAutores.State in [dsInsert, dsEdit]) then
    FAutores.TbAutores.Cancel;
end;

procedure TFEdAutores.FormCreate(Sender: TObject);
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

procedure TFEdAutores.DBEdit2Exit(Sender: TObject);
begin
  if FAutores.TbAutores.State in [dsInsert] then begin
    Tag := 0;
    FAutores.QryProx.SQL.Text := 'select NOME from AUTORES WHERE NOME = '''+ FAutores.TbAutoresNOME.Value + '''';
    FAutores.QryProx.Open;
    if not FAutores.QryProx.IsEmpty then
      Tag := 1;
    FAutores.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este autor já existe no cadastro! Deseja realmente manter o autor informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FAutores.TbAutoresNOME.Clear;
  end;
end;

end.
