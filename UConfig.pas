unit UConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, DB, ExtCtrls, Mask, ComCtrls,
  ShellCtrls;

type
  TFConfig = class(TForm)
    SBOK: TSpeedButton;
    SBCanc: TSpeedButton;
    DSConfig: TDataSource;
    Panel2: TPanel;
    ImApa: TImage;
    LblApa: TLabel;
    ImConf: TImage;
    LblConf: TLabel;
    ImOutros: TImage;
    LblOutros: TLabel;
    PnlApar: TPanel;
    GroupBox1: TGroupBox;
    PnlAmarelo: TPanel;
    PnlAzul: TPanel;
    PnlGelo: TPanel;
    PnlPrata: TPanel;
    PnlConfMail: TPanel;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    PnlOutros: TPanel;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    SBPath: TSpeedButton;
    DBEdit1: TDBEdit;
    Panel1: TPanel;
    SBOKTree: TSpeedButton;
    ShellTreeView1: TShellTreeView;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    DBRadioGroup2: TDBRadioGroup;
    DBPorc: TDBEdit;
    DBValor: TDBEdit;
    Label7: TLabel;
    DBEdit9: TDBEdit;
    Label8: TLabel;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    SBCidade: TSpeedButton;
    DBLCBCidade: TDBLookupComboBox;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    DBEdit7: TDBEdit;
    DBLCBBairro: TDBLookupComboBox;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    DBValorM: TDBEdit;
    DBPorcM: TDBEdit;
    GroupBox2: TGroupBox;
    SpeedButton2: TSpeedButton;
    DBLCBCondPgto: TDBLookupComboBox;
    DBEdit12: TDBEdit;
    GroupBox7: TGroupBox;
    SBCC: TSpeedButton;
    DBLCBCC: TDBLookupComboBox;
    DBEdit13: TDBEdit;
    procedure SBPathClick(Sender: TObject);
    procedure SBOKTreeClick(Sender: TObject);
    procedure PnlAmareloClick(Sender: TObject);
    procedure SBOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImApaClick(Sender: TObject);
    procedure DBRadioGroup2Change(Sender: TObject);
    procedure SBCidadeClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBRadioGroup3Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBLCBCondPgtoKeyPress(Sender: TObject; var Key: Char);
    procedure SBCCClick(Sender: TObject);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FConfig: TFConfig;

implementation

uses UDados, UCidades, UBairros, UCondPgto, UCC;

{$R *.dfm}

procedure TFConfig.LKTela;
begin
  Dados.ConfTrans(true);
  Dados.QryCidadesLK.Open;
  Dados.QryBairrosLK.Open;
  Dados.QryCondPgtoLK.Open;
  Dados.QryCCLK.Open;
end;

procedure TFConfig.SBPathClick(Sender: TObject);
begin
  SBOK.Enabled := False;
  GroupBox3.Enabled := SBOK.Enabled;
  GroupBox2.Enabled := SBOK.Enabled;
  GroupBox1.Enabled := SBOK.Enabled;
  Panel1.Top := 5;
  Panel1.Left := 140;
  Panel1.Visible := not SBOK.Enabled;
end;

procedure TFConfig.SBOKTreeClick(Sender: TObject);
begin
  SBOK.Enabled := True;
  GroupBox3.Enabled := SBOK.Enabled;
  GroupBox2.Enabled := SBOK.Enabled;
  GroupBox1.Enabled := SBOK.Enabled;
  Panel1.Visible := not SBOK.Enabled;
  Dados.TbConfigPATHSAVEBACKUP.Value := ShellTreeView1.Path; 
end;

procedure TFConfig.PnlAmareloClick(Sender: TObject);
begin
  PnlAmarelo.Font.Style := [];
  PnlAzul.Font.Style := [];
  PnlGelo.Font.Style := [];
  PnlPrata.Font.Style := [];
  if sender = PnlAmarelo then begin
    PnlAmarelo.Font.Style := [fsBold];
    Dados.TbConfigCORSISTEMA.Value :=  ColorToString(PnlAmarelo.Color);
  end else if sender = PnlAzul then begin
    PnlAzul.Font.Style := [fsBold];
    Dados.TbConfigCORSISTEMA.Value :=  ColorToString(PnlAzul.Color);
  end else if sender = PnlGelo then begin
    PnlGelo.Font.Style := [fsBold];
    Dados.TbConfigCORSISTEMA.Value :=  ColorToString(PnlGelo.Color);
  end else begin
    PnlPrata.Font.Style := [fsBold];
    Dados.TbConfigCORSISTEMA.Value :=  ColorToString(PnlPrata.Color);
  end;;
end;

procedure TFConfig.SBOKClick(Sender: TObject);
begin
  if sender = SBOK then begin
    Dados.TbConfig.Post;
    Dados.ConfTrans(True);
  end else begin
    Dados.TbConfig.Cancel;
    Dados.ConfTrans(False);
  end;
  Close;
end;

procedure TFConfig.FormCreate(Sender: TObject);
var
  i: integer;
begin
  DBRadioGroup2Change(nil);
  PnlConfMail.Left := 113;
  PnlConfMail.Top := 0;
  ClientHeight := 411;
  ClientWidth := 668;
  PnlApar.Left := PnlConfMail.Left;
  PnlApar.Top := PnlConfMail.Top;
  PnlOutros.Left := PnlConfMail.Left;
  PnlOutros.Top := PnlConfMail.Top;
  ImApaClick(ImApa);
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then begin
      if (TPanel(Components[i]).Tag <> 1) then
        TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
    end;
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  PnlAmarelo.Font.Style := [];
  PnlAzul.Font.Style := [];
  PnlGelo.Font.Style := [];
  PnlPrata.Font.Style := [];
  if Dados.TbConfigCORSISTEMA.Value =  ColorToString(PnlAmarelo.Color) then
    PnlAmarelo.Font.Style := [fsBold]
  else if Dados.TbConfigCORSISTEMA.Value =  ColorToString(PnlAzul.Color) then
    PnlAzul.Font.Style := [fsBold]
  else if Dados.TbConfigCORSISTEMA.Value =  ColorToString(PnlGelo.Color) then
    PnlGelo.Font.Style := [fsBold]
  else
    PnlPrata.Font.Style := [fsBold];
  LKTela;
end;

procedure TFConfig.ImApaClick(Sender: TObject);
begin
  PnlApar.Visible :=  (sender = ImApa) or (sender = LblApa);
  PnlConfMail.Visible := (sender = ImConf) or (sender = LblConf);
  PnlOutros.Visible := (sender = ImOutros) or (sender = LblOutros);
end;

procedure TFConfig.DBRadioGroup2Change(Sender: TObject);
begin
  DBValor.Visible := DBRadioGroup2.ItemIndex = 1;
  DBPorc.Visible := DBRadioGroup2.ItemIndex = 0;
end;

procedure TFConfig.SBCidadeClick(Sender: TObject);
begin
  if not VerificarPermissao('CIDADES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCidades, FCidades);
    FCidades.ShowModal;
  finally
    FreeAndNil(FCidades);
    LKTela;
  end;
end;

procedure TFConfig.SpeedButton1Click(Sender: TObject);
begin
  if not VerificarPermissao('BAIRROS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFBairros, FBairros);
    FBairros.ShowModal;
  finally
    FreeAndNil(FBairros);
    LKTela;
  end;
end;

procedure TFConfig.DBRadioGroup3Change(Sender: TObject);
begin
  DBValorM.Visible := DBRadioGroup3.ItemIndex = 1;
  DBPorcM.Visible := DBRadioGroup3.ItemIndex = 0;
end;

procedure TFConfig.SpeedButton2Click(Sender: TObject);
begin
  if not VerificarPermissao('CONDIÇÕES DE PAGAMENTO', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCondPgto, FCondPgto);
    FCondPgto.ShowModal;
  finally
    FreeAndNil(FCondPgto);
    LKTela;
  end;
end;

procedure TFConfig.DBLCBCondPgtoKeyPress(Sender: TObject; var Key: Char);
begin
  if key = '+' then begin
    if sender = DBLCBCondPgto then
      SpeedButton2Click(nil)
    else if sender = DBLCBBairro then
      SpeedButton1Click(nil)
    else if sender = DBLCBCidade then
      SBCidadeClick(nil)
    else if sender = DBLCBCC then
      SBCCClick(nil);
  end;
end;

procedure TFConfig.SBCCClick(Sender: TObject);
begin
  if not VerificarPermissao('CENTRO DE CUSTOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCC, FCC);
    FCC.ShowModal;
  finally
    FreeAndNil(FCC);
  end;
end;

end.
