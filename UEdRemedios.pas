unit UEdRemedios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdRemedios = class(TForm)
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
  FEdRemedios: TFEdRemedios;

implementation

uses URemedios, UDados;

{$R *.dfm}

procedure TFEdRemedios.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FRemedios.TbRemedios.Cancel;
      FRemedios.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdRemedios.SBGravarClick(Sender: TObject);
begin
  ActiveControl := Panel3;
  if FRemedios.TbRemediosDESCRICAO.IsNull then begin
    MessageDlg(cgEspDescRemedio, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FRemedios.TbRemedios.Post;
    FRemedios.ConfTrans(True);
  except
    FRemedios.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdRemedios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdRemedios.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FRemedios.TbRemedios.State in [dsInsert, dsEdit]) then
    FRemedios.TbRemedios.Cancel;
end;

procedure TFEdRemedios.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdRemedios.DBEdit2Exit(Sender: TObject);
begin
  if FRemedios.TbRemedios.State in [dsInsert] then begin
    Tag := 0;
    FRemedios.QryProx.SQL.Text := 'select descricao from REMEDIOS WHERE descricao = '''+ FRemedios.TbRemediosDESCRICAO.Value + '''';
    FRemedios.QryProx.Open;
    if not FRemedios.QryProx.IsEmpty then
      Tag := 1;
    FRemedios.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta remédio já existe no cadastro! Deseja realmente manter o remédio informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FRemedios.TbRemediosDESCRICAO.Clear;
  end;
end;

end.
