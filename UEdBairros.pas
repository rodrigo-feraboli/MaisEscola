unit UEdBairros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdBairros = class(TForm)
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
  FEdBairros: TFEdBairros;

implementation

uses UBairros, UDados;

{$R *.dfm}

procedure TFEdBairros.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FBairros.TbBairros.Cancel;
      FBairros.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdBairros.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FBairros.TbBairrosDESCRICAO.IsNull then begin
    MessageDlg(cgEspDescBairro, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end; 
  try
    FBairros.TbBairros.Post;
    FBairros.ConfTrans(True);
  except
    FBairros.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdBairros.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdBairros.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FBairros.TbBairros.State in [dsInsert, dsEdit]) then
    FBairros.TbBairros.Cancel;
end;

procedure TFEdBairros.FormCreate(Sender: TObject);
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

procedure TFEdBairros.DBEdit2Exit(Sender: TObject);
begin
  if FBairros.TbBairros.State in [dsInsert] then begin
    Tag := 0;
    FBairros.QryProx.SQL.Text := 'select DESCRICAO from BAIRROS WHERE DESCRICAO = '''+ FBairros.TbBairrosDESCRICAO.Value + '''';
    FBairros.QryProx.Open;
    if not FBairros.QryProx.IsEmpty then
      Tag := 1;
    FBairros.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este bairro já existe no cadastro! Deseja realmente manter o bairro informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FBairros.TbBairrosDESCRICAO.Clear;
  end;
end;

end.
