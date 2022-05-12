unit UEdCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdCFOP = class(TForm)
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
  FEdCFOP: TFEdCFOP;

implementation

uses UCFOP, UDados;

{$R *.dfm}

procedure TFEdCFOP.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCFOP.TbCFOP.Cancel;
      FCFOP.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdCFOP.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FCFOP.TbCFOPDESCRICAO.IsNull then begin
    MessageDlg(cgEspDescCFOP, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;


  try
    FCFOP.TbCFOP.Post;
    FCFOP.ConfTrans(True);
  except
    FCFOP.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdCFOP.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdCFOP.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCFOP.TbCFOP.State in [dsInsert, dsEdit]) then
    FCFOP.TbCFOP.Cancel;
end;

procedure TFEdCFOP.FormCreate(Sender: TObject);
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

procedure TFEdCFOP.DBEdit2Exit(Sender: TObject);
begin
  if FCFOP.TbCFOP.State in [dsInsert] then begin
    Tag := 0;
    FCFOP.QryProx.SQL.Text := 'select descricao from CFOP WHERE descricao = '''+ FCFOP.TbCFOPDESCRICAO.Value + '''';
    FCFOP.QryProx.Open;
    if not FCFOP.QryProx.IsEmpty then
      Tag := 1;
    FCFOP.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta CFOP já existe no cadastro! Deseja realmente manter a CFOP informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FCFOP.TbCFOPDESCRICAO.Clear;
  end;
end;

end.
