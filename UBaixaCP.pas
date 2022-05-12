unit UBaixaCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFBaixaCP = class(TForm)
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
  FBaixaCP: TFBaixaCP;

implementation

uses UCPagar, UDados, UBancos;

{$R *.dfm}

procedure TFBaixaCP.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryBancosLK.open;
end;

procedure TFBaixaCP.SBCancelarClick(Sender: TObject);
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

procedure TFBaixaCP.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FCPagar.TbCPParcsPGTOPARC.IsNull then begin
    MessageDlg('Especifique a data de pagamento da parcela da conta a receber!', mtWarning, [mbOk], 0);
    DBEdit6.SetFocus;
    exit;
  end;

  if FCPagar.TbCPParcsVLRPARC.IsNull then begin
    MessageDlg('Especifique o valor pago da parcela da conta a receber!', mtWarning, [mbOk], 0);
    DBEdit8.SetFocus;
    exit;
  end;

  FCPagar.TbCPParcsSITUACAO.Value := 'P';
  try
    FCPagar.TbCPParcs.Post;
    FCPagar.ConfTrans(True);
  except
    FCPagar.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFBaixaCP.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFBaixaCP.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCPagar.TbCPParcs.State in [dsInsert, dsEdit]) then
    FCPagar.TbCPParcs.Cancel;
end;

procedure TFBaixaCP.FormCreate(Sender: TObject);
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

procedure TFBaixaCP.SpeedButton2Click(Sender: TObject);
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

procedure TFBaixaCP.FormShow(Sender: TObject);
begin
  LKTela;
end;

procedure TFBaixaCP.DBEdit2Exit(Sender: TObject);
begin
  if (FCPagar.TbCPParcsVLRMULTA.Value > 0) and (FCPagar.TbCPParcsVLRDESC.Value > 0) then
    FCPagar.TbCPParcsVLRPAGO.Value := FCPagar.TbCPParcsVLRPARC.Value + FCPagar.TbCPParcsVLRMULTA.Value - FCPagar.TbCPParcsVLRDESC.Value
  else if (FCPagar.TbCPParcsVLRMULTA.Value > 0) then
    FCPagar.TbCPParcsVLRPAGO.Value := FCPagar.TbCPParcsVLRPARC.Value + FCPagar.TbCPParcsVLRMULTA.Value
  else if (FCPagar.TbCPParcsVLRDESC.Value > 0) then
    FCPagar.TbCPParcsVLRPAGO.Value := FCPagar.TbCPParcsVLRPARC.Value - FCPagar.TbCPParcsVLRDESC.Value;
  if sender = DBEdit2 then
    try
      Edit1.Text := FormatFloat('0.00', ((FCPagar.TbCPParcsVLRMULTA.Value * 100) / FCPagar.TbCPParcsVLRPAGO.Value))
    except
      Edit1.Text := '0,00';
    end
  else
    try
      Edit2.Text := FormatFloat('0.00', ((FCPagar.TbCPParcsVLRMULTA.Value * 100) / FCPagar.TbCPParcsVLRPAGO.Value));
    except
      Edit2.Text := '0,00';
    end;
end;

procedure TFBaixaCP.DTPVctoChange(Sender: TObject);
begin
  FCPagar.TbCPParcsPGTOPARC.Value := DTPVcto.Date;
end;

procedure TFBaixaCP.DBEdit6Exit(Sender: TObject);
begin
  try
    DTPVcto.Date := FCPagar.TbCPParcsPGTOPARC.Value;
  except
    DTPVcto.Date := Date;
  end;
end;

procedure TFBaixaCP.DBLCBBancoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '+' then
    SpeedButton2Click(nil); 
end;

procedure TFBaixaCP.Edit1Exit(Sender: TObject);
begin
  try
    FCPagar.TbCPParcsVLRMULTA.Value := FCPagar.TbCPParcsVLRPARC.Value * (StrToFloat(Edit1.Text)/100);
  except
    FCPagar.TbCPParcsVLRMULTA.Value := 0;
  end;
  DBEdit2Exit(DBEdit2);
end;

procedure TFBaixaCP.Edit2Exit(Sender: TObject);
begin
  try
    FCPagar.TbCPParcsVLRDESC.Value := FCPagar.TbCPParcsVLRPARC.Value * (StrToFloat(Edit2.Text)/100);
  except
    FCPagar.TbCPParcsVLRDESC.Value := 0;
  end;
  DBEdit2Exit(DBEdit9);
end;

end.
