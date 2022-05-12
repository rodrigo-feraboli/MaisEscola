unit UEdRefeicoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdRefeicoes = class(TForm)
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
  FEdRefeicoes: TFEdRefeicoes;

implementation

uses URefeicoes, UDados;

{$R *.dfm}

procedure TFEdRefeicoes.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FRefeicoes.TbRefeicoes.Cancel;
      FRefeicoes.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdRefeicoes.SBGravarClick(Sender: TObject);
begin
  if DBEdit2.Text = '' then begin
    MessageDlg('Especifique a descrição da alimentação!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end; 

  try
    FRefeicoes.TbRefeicoes.Post;
    FRefeicoes.ConfTrans(True);
  except
    FRefeicoes.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdRefeicoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdRefeicoes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FRefeicoes.TbRefeicoes.State in [dsInsert, dsEdit]) then
    FRefeicoes.TbRefeicoes.Cancel;
end;

procedure TFEdRefeicoes.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdRefeicoes.DBEdit2Exit(Sender: TObject);
begin
  if FRefeicoes.TbRefeicoes.State in [dsInsert] then begin
    Tag := 0;
    FRefeicoes.QryProx.SQL.Text := 'select descricao from REFEICOES WHERE descricao = '''+ FRefeicoes.TbRefeicoesDESCRICAO.Value + '''';
    FRefeicoes.QryProx.Open;
    if not FRefeicoes.QryProx.IsEmpty then
      Tag := 1;
    FRefeicoes.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta refeição já existe no cadastro! Deseja realmente manter a refeição informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FRefeicoes.TbRefeicoesDESCRICAO.Clear;
  end;
end;

end.
