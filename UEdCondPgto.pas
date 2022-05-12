unit UEdCondPgto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdCondPgto = class(TForm)
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
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
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
  FEdCondPgto: TFEdCondPgto;

implementation

uses UCondPgto, UDados;

{$R *.dfm}

procedure TFEdCondPgto.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCondPgto.TbCondPgto.Cancel;
      FCondPgto.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdCondPgto.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FCondPgto.TbCondPgtoDESCRICAO.IsNull then begin
    MessageDlg(cgEspDescCondPgto, mtWarning, [mbOk], 0); 
    DBEdit2.SetFocus;
    exit;
  end;
  if FCondPgto.TbCondPgtoPRAZO1.isnull then begin
    MessageDlg('Especifique o prazo 1!', mtWarning, [mbOk], 0);
    DBEdit3.SetFocus;
    Exit
  end;
  if FCondPgto.TbCondPgtoPRAZO2.isnull then
    FCondPgto.TbCondPgtoPRAZO2.Value := 0;

  if FCondPgto.TbCondPgtoPRAZO3.isnull then
    FCondPgto.TbCondPgtoPRAZO3.Value := 0;

  if FCondPgto.TbCondPgtoPRAZO4.isnull then
    FCondPgto.TbCondPgtoPRAZO4.Value := 0;

  if FCondPgto.TbCondPgtoPRAZO5.isnull then
    FCondPgto.TbCondPgtoPRAZO5.Value := 0;

  if FCondPgto.TbCondPgtoPRAZO6.isnull then
    FCondPgto.TbCondPgtoPRAZO6.Value := 0;

  if FCondPgto.TbCondPgtoPRAZO7.isnull then
    FCondPgto.TbCondPgtoPRAZO7.Value := 0;

  if FCondPgto.TbCondPgtoPRAZO8.isnull then
    FCondPgto.TbCondPgtoPRAZO8.Value := 0;

  try
    FCondPgto.TbCondPgto.Post;
    FCondPgto.ConfTrans(True);
  except
    FCondPgto.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdCondPgto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdCondPgto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCondPgto.TbCondPgto.State in [dsInsert, dsEdit]) then
    FCondPgto.TbCondPgto.Cancel;
end;

procedure TFEdCondPgto.FormCreate(Sender: TObject);
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

procedure TFEdCondPgto.DBEdit2Exit(Sender: TObject);
begin
  if FCondPgto.TbCondPgto.State in [dsInsert] then begin
    Tag := 0;
    FCondPgto.QryProx.SQL.Text := 'select descricao from CONDPGTO WHERE descricao = '''+ FCondPgto.TbCondPgtoDESCRICAO.Value + '''';
    FCondPgto.QryProx.Open;
    if not FCondPgto.QryProx.IsEmpty then
      Tag := 1;
    FCondPgto.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta condição de pagamento já existe no cadastro! Deseja realmente manter a condição de pagamento informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FCondPgto.TbCondPgtoDESCRICAO.Clear;
  end;
end;

end.
