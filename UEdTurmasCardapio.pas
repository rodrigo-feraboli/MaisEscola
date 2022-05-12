unit UEdTurmasCardapio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdTurmasCardapio = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    SBRef: TSpeedButton;
    DBEdit8: TDBEdit;
    DBLCBRefeicao: TDBLookupComboBox;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBLCBRefeicaoKeyPress(Sender: TObject; var Key: Char);
    procedure SBRefClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdTurmasCardapio: TFEdTurmasCardapio;

implementation

uses UTurmas, UDados, URefeicoes;

{$R *.dfm}


procedure TFEdTurmasCardapio.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FTurmas.TbTurmasCardapiosItens.Cancel;
      FTurmas.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdTurmasCardapio.SBGravarClick(Sender: TObject);
begin
  if DBLCBRefeicao.Text = '' then begin
    MessageDlg('Especifique a refeição da turma!', mtWarning, [mbOk], 0);
    DBLCBRefeicao.SetFocus;
    exit;
  end;

  if FTurmas.TbTurmasCardapiosItensHORA.IsNull then begin
    MessageDlg('Especifique a hora da refeição', mtWarning, [mbOk], 0);
    DBEdit3.SetFocus;
    exit;
  end;
  
  try
    FTurmas.TbTurmasCardapiosItens.Post;
    FTurmas.ConfTrans(True);
  except
    FTurmas.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdTurmasCardapio.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdTurmasCardapio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FTurmas.TbTurmasAtividades.State in [dsInsert, dsEdit]) then
    FTurmas.TbTurmasAtividades.Cancel;
end;

procedure TFEdTurmasCardapio.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Dados.LKRefeicoes(True);
end;

procedure TFEdTurmasCardapio.DBLCBRefeicaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = '+') then
    SBRefClick(nil);
end;

procedure TFEdTurmasCardapio.SBRefClick(Sender: TObject);
begin
  if not VerificarPermissao('REFEIÇÕES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFRefeicoes, FRefeicoes);
    FRefeicoes.ShowModal;
  finally
    FreeAndNil(FRefeicoes);
    Dados.LKRefeicoes(True);
  end;
end;

end.
