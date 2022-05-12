unit UBaixaCR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFBaixaCR = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    DBLCBBanco: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    Edit2: TEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    DTPVcto: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DTPVctoChange(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBLCBBancoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FBaixaCR: TFBaixaCR;

implementation

uses UCReceber, UDados, UBancos;

{$R *.dfm}

procedure TFBaixaCR.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryBancosLK.open;
end;

procedure TFBaixaCR.SBCancelarClick(Sender: TObject);
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

procedure TFBaixaCR.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FCReceber.TbCRParcsPGTOPARC.IsNull then begin
    MessageDlg('Especifique a data de pagamento da parcela da conta a receber!', mtWarning, [mbOk], 0);
    DBEdit6.SetFocus;
    exit;
  end;

  if FCReceber.TbCRParcsVLRPARC.IsNull then begin
    MessageDlg('Especifique o valor pago da parcela da conta a receber!', mtWarning, [mbOk], 0);
    DBEdit8.SetFocus;
    exit;
  end;

  FCReceber.TbCRParcsSITUACAO.Value := 'P';


  try
    FCReceber.TbCRParcs.Post;
    FCReceber.ConfTrans(True);
  except
    FCReceber.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFBaixaCR.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFBaixaCR.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCReceber.TbCRParcs.State in [dsInsert, dsEdit]) then
    FCReceber.TbCRParcs.Cancel;
end;

procedure TFBaixaCR.FormCreate(Sender: TObject);
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

procedure TFBaixaCR.SpeedButton2Click(Sender: TObject);
begin
  if not VerificarPermissao('BANCOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFBancos, FBancos);
    FBancos.ShowModal;
  finally
    FreeAndNil(FBancos);
  end;
end;

procedure TFBaixaCR.FormShow(Sender: TObject);
begin
  LKTela;
end;

procedure TFBaixaCR.DBEdit2Exit(Sender: TObject);
begin
  if (FCReceber.TbCRParcsVLRMULTA.Value > 0) and (FCReceber.TbCRParcsVLRDESC.Value > 0) then
    FCReceber.TbCRParcsVLRPAGO.Value := FCReceber.TbCRParcsVLRPARC.Value + FCReceber.TbCRParcsVLRMULTA.Value - FCReceber.TbCRParcsVLRDESC.Value
  else if (FCReceber.TbCRParcsVLRMULTA.Value > 0) then
    FCReceber.TbCRParcsVLRPAGO.Value := FCReceber.TbCRParcsVLRPARC.Value + FCReceber.TbCRParcsVLRMULTA.Value
  else if (FCReceber.TbCRParcsVLRDESC.Value > 0) then
    FCReceber.TbCRParcsVLRPAGO.Value := FCReceber.TbCRParcsVLRPARC.Value - FCReceber.TbCRParcsVLRDESC.Value;
  if sender = DBEdit2 then
    try
      Edit1.Text := FormatFloat('0.00', ((FCReceber.TbCRParcsVLRMULTA.Value * 100) / FCReceber.TbCRParcsVLRPAGO.Value))
    except
      Edit1.Text := '0,00';
    end
  else
    try
      Edit2.Text := FormatFloat('0.00', ((FCReceber.TbCRParcsVLRMULTA.Value * 100) / FCReceber.TbCRParcsVLRPAGO.Value));
    except
      Edit2.Text := '0,00';
    end;
end;

procedure TFBaixaCR.DTPVctoChange(Sender: TObject);
begin
  FCReceber.TbCRParcsPGTOPARC.Value := DTPVcto.Date;
end;

procedure TFBaixaCR.DBEdit6Exit(Sender: TObject);
begin
  try
    DTPVcto.Date := FCReceber.TbCRParcsPGTOPARC.Value;
  except
    DTPVcto.Date := Date;
  end;
end;

procedure TFBaixaCR.DBLCBBancoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '+' then
    SpeedButton2Click(nil);    
end;

procedure TFBaixaCR.Edit1Exit(Sender: TObject);
begin
  try
    FCReceber.TbCRParcsVLRMULTA.Value := FCReceber.TbCRParcsVLRPARC.Value * (StrToFloat(Edit1.Text)/100);
  except
    FCReceber.TbCRParcsVLRMULTA.Value := 0;
  end;
  DBEdit2Exit(DBEdit2);
end;

procedure TFBaixaCR.Edit2Exit(Sender: TObject);
begin
  try
    FCReceber.TbCRParcsVLRDESC.Value := FCReceber.TbCRParcsVLRPARC.Value * (StrToFloat(Edit2.Text)/100);
  except
    FCReceber.TbCRParcsVLRDESC.Value := 0;
  end;
  DBEdit2Exit(DBEdit9);
end;

end.
