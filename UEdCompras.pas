unit UEdCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdCompras = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    SpeedButton1: TSpeedButton;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    Label16: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBLCBForn: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBLCBCFOP: TDBLookupComboBox;
    DBEdit14: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    SpeedButton4: TSpeedButton;
    Label13: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit12: TDBEdit;
    DBLCBTransp: TDBLookupComboBox;
    Label32: TLabel;
    DBEdit30: TDBEdit;
    Label3: TLabel;
    Label2: TLabel;
    DTPEmiss: TDateTimePicker;
    DTPDtCompra: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DTPEmissChange(Sender: TObject);
    procedure DTPDtCompraChange(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure DBEdit30Exit(Sender: TObject);
    procedure DBLCBFornKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdCompras: TFEdCompras;

implementation

uses UDados, UCompras, UGen, UCFOP;

{$R *.dfm}

procedure TFEdCompras.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryFornLK.Open;
  Dados.QryCFOPLK.Open;
  Dados.QryTranspLK.Open;
end;

procedure TFEdCompras.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCompras.TbCompras.Cancel;
      FCompras.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdCompras.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FCompras.TbComprasDATAEMISSAONF.IsNull then begin
    MessageDlg('Especifique o data de emissão da NF da compra!', mtWarning, [mbOk], 0);
    DBEdit30.SetFocus;
    exit;
  end;

  if FCompras.TbComprasNRONF.Text = '' then begin
    MessageDlg('Especifique o número da NF da compra!', mtWarning, [mbOk], 0);
    DBEdit4.SetFocus;
    exit;
  end;

  if DBLCBForn.Text = '' then begin
    MessageDlg('Especifique o fornecedor da compra!', mtWarning, [mbOk], 0);
    DBLCBForn.SetFocus;
    exit;
  end;

  if DBLCBCFOP.Text = '' then begin
    MessageDlg('Especifique a CFOP da compra!', mtWarning, [mbOk], 0);
    DBLCBCFOP.SetFocus;
    exit;
  end;

  if FCompras.TbComprasFRETEPORCONTA.IsNull then begin
    MessageDlg('Especifique quem pagará o frete!', mtWarning, [mbOk], 0);
    DBRadioGroup2.SetFocus;
    exit;
  end;

  if DBLCBTransp.Text = '' then begin
    MessageDlg('Especifique a transportadora!', mtWarning, [mbOk], 0);
    DBLCBTransp.SetFocus;
    exit;
  end;


  if FCompras.TbCompras.State in [dsInsert] then begin
    FCompras.QryProx.SQL.Text := 'SELECT MAX(NROCOMPRA) FROM COMPRAS';
    FCompras.QryProx.Open;
    Tag := FCompras.QryProx.Fields[0].AsInteger + 1;
    FCompras.QryProx.Close;
  end;

  if FCompras.TbComprasCODCONDPGTO.IsNull then
    FCompras.TbComprasCODCONDPGTO.Value :=  Dados.TbConfigCODCONDPGTO.Value;
    
  try
    FCompras.TbCompras.Post;
    FCompras.ConfTrans(True);
    // **** POST <>
  except
    FCompras.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdCompras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdCompras.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCompras.TbCompras.State in [dsInsert, dsEdit]) then
    FCompras.TbCompras.Cancel;
end;

procedure TFEdCompras.FormCreate(Sender: TObject);
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

procedure TFEdCompras.SpeedButton1Click(Sender: TObject);
begin
  if not VerificarPermissao('FORNECEDORES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFGen, FGen);
    FGen.Caption := 'Cadastro de Fornecedores';
    FGen.SBBusca.Hint := 'Busca Avançada de Fornecedores';
    FGen.ShowModal;
  finally
    FreeAndNil(FGen);
    LKTela;
  end;
end;

procedure TFEdCompras.SpeedButton4Click(Sender: TObject);
begin
  if not VerificarPermissao('TRANSPORTADORAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFGen, FGen);
    FGen.Caption := 'Cadastro de Transportadoras';
    FGen.SBBusca.Hint := 'Busca Avançada de Transportadoras';
    FGen.ShowModal;
  finally
    FreeAndNil(FGen);
    LKTela;
  end;    
end;

procedure TFEdCompras.SpeedButton2Click(Sender: TObject);
begin
  if not VerificarPermissao('CFOP', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCFOP, FCFOP);
    FCFOP.ShowModal;
  finally
    FreeAndNil(FCFOP);
    LKTela;
  end;
end;

procedure TFEdCompras.FormShow(Sender: TObject);
begin
  LKTela;
  DBEdit30Exit(nil);
  DBEdit5Enter(nil);
end;

procedure TFEdCompras.DTPEmissChange(Sender: TObject);
begin
  FCompras.TbComprasDATAEMISSAONF.Value := DTPEmiss.Date;
end;

procedure TFEdCompras.DTPDtCompraChange(Sender: TObject);
begin
  FCompras.TbComprasDATACOMPRA.Value := DTPDtCompra.Date;
end;

procedure TFEdCompras.DBEdit5Enter(Sender: TObject);
begin
  try
    DTPDtCompra.Date := FCompras.TbComprasDATACOMPRA.Value;
  except
    DTPDtCompra.Date := Date;
  end;
end;

procedure TFEdCompras.DBEdit30Exit(Sender: TObject);
begin
  try
    DTPEmiss.Date := FCompras.TbComprasDATAEMISSAONF.Value;
  except
    DTPEmiss.Date := Date;
  end;
end;

procedure TFEdCompras.DBLCBFornKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then begin
    if sender = DBLCBForn then
      SpeedButton1Click(nil)
    else if sender = DBLCBCFOP then
      SpeedButton2Click(nil)
    else if sender = DBLCBTransp then
      SpeedButton4Click(nil);
  end;
end;

end.
