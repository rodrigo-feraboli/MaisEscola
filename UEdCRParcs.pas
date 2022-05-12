unit UEdCRParcs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdCRParcs = class(TForm)
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
  FEdCRParcs: TFEdCRParcs;

implementation

uses UDados, UCReceber, UBancos;

{$R *.dfm}

procedure TFEdCRParcs.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryBancosLK.Open;
end;

procedure TFEdCRParcs.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCReceber.TbCRParcs.Cancel;
      FCReceber.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdCRParcs.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FCReceber.TbCRParcsDATAGERA.IsNull then begin
    MessageDlg('Especifique a data de cadastro da parcela da Conta a Receber!', mtWarning, [mbOk], 0);
    DBEdit5.SetFocus;
    exit;
  end;

  if FCReceber.TbCRParcsVCTOPARC.IsNull then begin
    MessageDlg('Especifique a data de vencimento da parcela da Conta a Receber!', mtWarning, [mbOk], 0);
    DBEdit8.SetFocus;
    exit;
  end;

  if FCReceber.TbCRParcsVLRPARC.IsNull then begin
    MessageDlg('Especifique o valor da parcela da Conta a Receber!', mtWarning, [mbOk], 0);
    DBEdit8.SetFocus;
    exit;
  end;

  if FCReceber.TbCR.State in [dsInsert] then begin
    FCReceber.QryAux.SQL.Text := 'SELECT MAX(NROPARC) FROM CRECEBER WHERE NROCRECEBER = '+ IntToStr(FCReceber.TbCRParcsNROCRECEBER.Value);
    FCReceber.QryAux.Open;
    Tag := FCReceber.QryAux.Fields[0].AsInteger + 1;
    FCReceber.QryAux.Close;
  end;

  try
    FCReceber.TbCRParcs.Post;
    FCReceber.ConfTrans(True);
    // **** POST <>
  except
    FCReceber.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdCRParcs.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdCRParcs.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCReceber.TbCRParcs.State in [dsInsert, dsEdit]) then
    FCReceber.TbCRParcs.Cancel;
end;

procedure TFEdCRParcs.FormCreate(Sender: TObject);
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

procedure TFEdCRParcs.SpeedButton2Click(Sender: TObject);
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

procedure TFEdCRParcs.DTPVctoChange(Sender: TObject);
begin
  FCReceber.TbCRParcsVCTOPARC.Value := DTPVcto.Date;
end;

procedure TFEdCRParcs.DBEdit8Enter(Sender: TObject);
begin
  try
    DTPVcto.Date := FCReceber.TbCRParcsVCTOPARC.Value;
  except
    DTPVcto.Date := Date;
  end;
end;

procedure TFEdCRParcs.FormShow(Sender: TObject);
begin
  LKTela;
  DBEdit8Enter(nil);
end;

procedure TFEdCRParcs.DBLCBBancoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then
    SpeedButton2Click(nil);
end;

end.
