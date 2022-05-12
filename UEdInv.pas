unit UEdInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdInv = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBLCBProdutos: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBMemo1: TDBMemo;
    SBProd: TSpeedButton;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBLCBProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure SBProdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdInv: TFEdInv;

implementation

uses UInv, UDados, UProdutos;

{$R *.dfm}

procedure TFEdInv.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FInv.TbInv.Cancel;
      FInv.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdInv.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FInv.TbInvNUM.IsNull then begin
    MessageDlg('Especifique o número!', mtWarning, [mbOk], 0);
    DBEdit6.SetFocus;
    exit;
  end;
  if DBLCBProdutos.Text = '' then begin
    MessageDlg('Especifique a data de entrada!', mtWarning, [mbOk], 0);
    DBLCBProdutos.SetFocus;
    exit;
  end;
  if FInv.TbInvESTOQUE.IsNull then begin
    MessageDlg('Especifique o estoque!', mtWarning, [mbOk], 0);
    DBEdit4.SetFocus;
    exit;
  end;
  if FInv.TbInvAQUISICAO.IsNull then begin
    MessageDlg('Especifique a aquisição!', mtWarning, [mbOk], 0);
    DBEdit7.SetFocus;
    exit;
  end;
  if FInv.TbInvBAIXA.IsNull then begin
    MessageDlg('Especifique a aquisição!', mtWarning, [mbOk], 0);
    DBEdit8.SetFocus;
    exit;
  end;

  try
    FInv.TbInv.Post;
    FInv.ConfTrans(True);
  except
    FInv.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdInv.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdInv.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FInv.TbInv.State in [dsInsert, dsEdit]) then
    FInv.TbInv.Cancel;
end;

procedure TFEdInv.FormCreate(Sender: TObject);
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

procedure TFEdInv.DBLCBProdutosKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then
    SBProdClick(nil);
end;

procedure TFEdInv.SBProdClick(Sender: TObject);
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

end.
