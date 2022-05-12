unit UEdTrat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdTrat = class(TForm)
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
  FEdTrat: TFEdTrat;

implementation

uses UTrat, UDados;

{$R *.dfm}

procedure TFEdTrat.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FTrat.TbTrat.Cancel;
      FTrat.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdTrat.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FTrat.TbTratDESCRICAO.IsNull then begin
    MessageDlg(cgEspDescDoenca, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FTrat.TbTrat.Post;
    FTrat.ConfTrans(True);
  except
    FTrat.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;  
  Close;
end;

procedure TFEdTrat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdTrat.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FTrat.TbTrat.State in [dsInsert, dsEdit]) then
    FTrat.TbTrat.Cancel;
end;

procedure TFEdTrat.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdTrat.DBEdit2Exit(Sender: TObject);
begin
  if FTrat.TbTrat.State in [dsInsert] then begin
    Tag := 0;
    FTrat.QryProx.SQL.Text := 'select descricao from TRATAMENTOS WHERE descricao = '''+ FTrat.TbTratDESCRICAO.Value + '''';
    FTrat.QryProx.Open;
    if not FTrat.QryProx.IsEmpty then
      Tag := 1;
    FTrat.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este tratamento já existe no cadastro! Deseja realmente manter o tratamento informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FTrat.TbTratDESCRICAO.Clear;
  end;
end;

end.
