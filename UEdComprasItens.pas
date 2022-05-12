unit UEdComprasItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdComprasItens = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    Label9: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLCBProduto: TDBLookupComboBox;
    DBEdit7: TDBEdit;
    DBEdit4: TDBEdit;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBProdutoExit(Sender: TObject);
    procedure DBLCBProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure DBLCBProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdComprasItens: TFEdComprasItens;

implementation

uses UCompras, UDados, UProdutos;

{$R *.dfm}

procedure TFEdComprasItens.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryProdutosLK.Open;
end;

procedure TFEdComprasItens.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCompras.TbComprasItens.Cancel;
      FCompras.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdComprasItens.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if DBLCBProduto.Text = '' then begin
    MessageDlg('Especifique o produto da venda!', mtWarning, [mbOk], 0);
    DBLCBProduto.SetFocus;
    exit;
  end;

  if FCompras.TbComprasItensQUANT.IsNull then begin
    MessageDlg('Especifique a quantidade da venda!', mtWarning, [mbOk], 0);
    DBEdit1.SetFocus;
    exit;
  end;

  if FCompras.TbComprasItensVLRUNIT.IsNull then begin
    MessageDlg('Especifique o valor unitário da venda!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FCompras.TbComprasItens.Post;
    FCompras.ConfTrans(True);
  except
    FCompras.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdComprasItens.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdComprasItens.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCompras.TbCompras.State in [dsInsert, dsEdit]) then
    FCompras.TbCompras.Cancel;
end;

procedure TFEdComprasItens.FormCreate(Sender: TObject);
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

procedure TFEdComprasItens.SpeedButton1Click(Sender: TObject);
begin
  if not VerificarPermissao('PRODUTOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFProdutos, FProdutos);
    FProdutos.ShowModal;
  finally
    FreeAndNil(FProdutos);
    LKTela;
  end;
end;

procedure TFEdComprasItens.FormShow(Sender: TObject);
begin
  LKTela;
end;

procedure TFEdComprasItens.DBLCBProdutoExit(Sender: TObject);
begin
  if DBLCBProduto.Text <> '' then begin
    Dados.QryAux.SQL.Text := 'select precocompra from produtos where codprod = '+IntToStr(DBLCBProduto.KeyValue);
    Dados.QryAux.Prepare;
    Dados.QryAux.Open;
    FCompras.TbComprasItensVLRUNIT.Value := Dados.QryAux.Fields[0].AsCurrency;
    Dados.QryAux.Close;
    Dados.QryAux.UnPrepare;
  end;
end;

procedure TFEdComprasItens.DBLCBProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  // **** centro de custo
  // Colocar em todo o sistema
  if (key = '+') then
    SpeedButton1Click(nil);
end;

procedure TFEdComprasItens.DBLCBProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = Vk_Back then begin
    (Sender as TDBLookupComboBox).KeyValue := 0;
    FCompras.TbComprasItensCODPRODUTO.Value := 0;
  end;
end;

end.
