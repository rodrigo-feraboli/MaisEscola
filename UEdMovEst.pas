  unit UEdMovEst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdMovEst = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBLCBProdutos: TDBLookupComboBox;
    SBProdutos: TSpeedButton;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBProdutosClick(Sender: TObject);
    procedure DBLCBProdutosKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdMovEst: TFEdMovEst;

implementation

uses UMovEst, UDados, UProdutos;

{$R *.dfm}

procedure TFEdMovEst.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FMovEst.TbMovEst.Cancel;
      FMovEst.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdMovEst.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if DBLCBProdutos.Text = '' then begin
    MessageDlg('Especifique o produto!', mtWarning, [mbOk], 0);
    DBLCBProdutos.SetFocus;
    exit;
  end;

  if FMovEst.TbMovEstQUANT.IsNull then begin
    MessageDlg('Especifique a quantidade!', mtWarning, [mbOk], 0);
    DBEdit4.SetFocus;
    exit;
  end;

  try
    FMovEst.TbMovEst.Post;
    FMovEst.ConfTrans(True);
  except
    FMovEst.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdMovEst.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdMovEst.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FMovEst.TbMovEst.State in [dsInsert, dsEdit]) then
    FMovEst.TbMovEst.Cancel;
end;

procedure TFEdMovEst.FormCreate(Sender: TObject);
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

procedure TFEdMovEst.SBProdutosClick(Sender: TObject);
begin
  if not VerificarPermissao('PRODUTOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFProdutos, FProdutos);
    FProdutos.ShowModal;
  finally
    FreeAndNil(FProdutos);
    Dados.LKProdutos(True);
  end;
end;

procedure TFEdMovEst.DBLCBProdutosKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then
    SBProdutosClick(nil);
end;

end.
