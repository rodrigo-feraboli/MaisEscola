unit UEdCC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdCC = class(TForm)
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
  FEdCC: TFEdCC;

implementation

uses UCC, UDados;

{$R *.dfm}

procedure TFEdCC.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCC.TbCC.Cancel;
      FCC.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdCC.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FCC.TbCCDESCRICAO.IsNull then begin
    MessageDlg(cgEspDescCC, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;


  try
    FCC.TbCC.Post;
    FCC.ConfTrans(True);
  except
    FCC.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdCC.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdCC.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCC.TbCC.State in [dsInsert, dsEdit]) then
    FCC.TbCC.Cancel;
end;

procedure TFEdCC.FormCreate(Sender: TObject);
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

procedure TFEdCC.DBEdit2Exit(Sender: TObject);
begin
  if FCC.TbCC.State in [dsInsert] then begin
    Tag := 0;
    FCC.QryProx.SQL.Text := 'select descricao from cc WHERE descricao = '''+ FCC.TbCCDESCRICAO.Value + '''';
    FCC.QryProx.Open;
    if not FCC.QryProx.IsEmpty then
      Tag := 1;
    FCC.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este centro de custo já existe no cadastro! Deseja realmente manter o centro de custo informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FCC.TbCCDESCRICAO.Clear;
  end;
end;

end.
