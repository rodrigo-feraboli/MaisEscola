unit UEdCPParcs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdCPParcs = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit8: TDBEdit;
    Label3: TLabel;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    DBLCBBanco: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DTPVcto: TDateTimePicker;
    DBText1: TDBText;
    Label7: TLabel;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DTPVctoChange(Sender: TObject);
    procedure DBEdit8Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBBancoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdCPParcs: TFEdCPParcs;

implementation

uses UDados, UCPagar, UBancos;

{$R *.dfm}

procedure TFEdCPParcs.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryBancosLK.Open;
end;

procedure TFEdCPParcs.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCPagar.TbCPParcs.Cancel;
      FCPagar.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdCPParcs.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FCPagar.TbCPParcsDATAGERA.IsNull then begin
    MessageDlg('Especifique a data de cadastro da parcela da Conta a Pagar!', mtWarning, [mbOk], 0);
    DBEdit5.SetFocus;
    exit;
  end;

  if FCPagar.TbCPParcsVCTOPARC.IsNull then begin
    MessageDlg('Especifique a data de vencimento da parcela da Conta a Pagar!', mtWarning, [mbOk], 0);
    DBEdit8.SetFocus;
    exit;
  end;

  if FCPagar.TbCPParcsVLRPARC.IsNull then begin
    MessageDlg('Especifique o valor da parcela da Conta a Pagar!', mtWarning, [mbOk], 0);
    DBEdit8.SetFocus;
    exit;
  end;

  if FCPagar.TbCP.State in [dsInsert] then begin
    FCPagar.QryAux.SQL.Text := 'SELECT MAX(NROPARC) FROM CPAGAR WHERE NROCPAGAR = '+ IntToStr(FCPagar.TbCPParcsNROCPAGAR.Value);
    FCPagar.QryAux.Open;
    Tag := FCPagar.QryAux.Fields[0].AsInteger + 1;
    FCPagar.QryAux.Close;
  end;

  try
    FCPagar.TbCPParcs.Post;
    FCPagar.ConfTrans(True);
    // **** POST <>
  except
    FCPagar.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdCPParcs.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdCPParcs.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCPagar.TbCPParcs.State in [dsInsert, dsEdit]) then
    FCPagar.TbCPParcs.Cancel;
end;

procedure TFEdCPParcs.FormCreate(Sender: TObject);
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

procedure TFEdCPParcs.SpeedButton2Click(Sender: TObject);
begin
  if not VerificarPermissao('BANCOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFBancos, FBancos);
    FBancos.ShowModal;
  finally
    LKTela;
    FreeAndNil(FBancos);
  end;
end;

procedure TFEdCPParcs.DTPVctoChange(Sender: TObject);
begin
  FCPagar.TbCPParcsVCTOPARC.Value := DTPVcto.Date;
end;

procedure TFEdCPParcs.DBEdit8Enter(Sender: TObject);
begin
  try
    DTPVcto.Date := FCPagar.TbCPParcsVCTOPARC.Value;
  except
    DTPVcto.Date := Date;
  end;
end;

procedure TFEdCPParcs.FormShow(Sender: TObject);
begin
  LKTela;
  DBEdit8Enter(nil);
end;

procedure TFEdCPParcs.DBLCBBancoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then
    SpeedButton2Click(nil);
end;

end.
