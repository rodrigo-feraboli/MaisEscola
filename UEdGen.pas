unit UEdGen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB, ShellApi;

type
  TFEdGen = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    SBBairro: TSpeedButton;
    DBLCBBairro: TDBLookupComboBox;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    SBCidade: TSpeedButton;
    DBLCBCidades: TDBLookupComboBox;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBMemo1: TDBMemo;
    SBMail: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    Label21: TLabel;
    EdUF: TEdit;
    CBForn: TDBCheckBox;
    CBTrans: TDBCheckBox;
    DTPDataFund: TDateTimePicker;
    DTPDataCad: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBBairroClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure SBMailClick(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure DBEdit19Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DTPDataFundChange(Sender: TObject);
    procedure DTPDataCadChange(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure DBLCBCidadesEnter(Sender: TObject);
    procedure DBLCBCidadesExit(Sender: TObject);
    procedure DBLCBBairroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdGen: TFEdGen;

implementation

uses UGen, UDados, UBairros, UCidades;

{$R *.dfm}

procedure TFEdGen.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryBairrosLK.Open;
  Dados.QryCidadesLK.Open;
  Dados.QryEstadosLK.Open;
end;

procedure TFEdGen.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FGen.TbGen.Cancel;
      FGen.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdGen.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FGen.TbGenNOME.IsNull then begin
    MessageDlg(cgEspDescForn, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end; 

  if FGen.TbGenCNPJ.IsNull then begin
    MessageDlg('Especifique o CNPJ!', mtWarning, [mbOk], 0);
    DBEdit18.SetFocus;
    exit;
  end;

  if FGen.TbGenIE.IsNull then begin
    MessageDlg('Especifique a IE!', mtWarning, [mbOk], 0);
    DBEdit19.SetFocus;
    exit;
  end;

  if DBLCBBairro.Text = '' then begin
    MessageDlg('Especifique o bairro!', mtWarning, [mbOk], 0);
    DBLCBBairro.SetFocus;
    exit;
  end;

  if DBLCBCidades.Text = ''  then begin
    MessageDlg('Especifique a cidade!', mtWarning, [mbOk], 0);
    DBLCBCidades.SetFocus;
    exit;
  end;

  try
    FGen.TbGen.Post;
    FGen.ConfTrans(True);
  except
    FGen.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdGen.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdGen.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FGen.TbGen.State in [dsInsert, dsEdit]) then
    FGen.TbGen.Cancel;
end;

procedure TFEdGen.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  LKTela;
end;

procedure TFEdGen.SBBairroClick(Sender: TObject);
begin
  if sender = SBBairro then begin
    if not VerificarPermissao('BAIRROS', 'CONS', 1) then
      Exit;
    try
      Application.CreateForm(TFBairros, FBairros);
      FBairros.ShowModal;
    finally
      FreeAndNil(FBairros);
    end;
  end else if sender = SBCidade then begin
    if not VerificarPermissao('CIDADES', 'CONS', 1) then
      Exit;
    try
      Application.CreateForm(TFCidades, FCidades);
      FCidades.ShowModal;
    finally
      FreeAndNil(FCidades);
    end;
  end;
  LKTela;
end;

procedure TFEdGen.DBEdit2Exit(Sender: TObject);
var
  vlTipoCad: String;
begin
  if (FGen.TbGenNOME.Value <> '') and (FGen.TbGenFANTASIA.Value = '') then
    FGen.TbGenFANTASIA.Value := FGen.TbGenNOME.Value;

  if FGen.TbGen.State in [dsInsert] then begin
    vlTipoCad := 'fornecedor';
    if caption = 'Edição de Transportadoras' then
      vlTipoCad := 'transportadora';
    Tag := 0;
    FGen.QryProx.SQL.Text := 'select NOME from GEN WHERE NOME = '''+ FGen.TbGenNOME.Value + '''';
    FGen.QryProx.Open;
    if not FGen.QryProx.IsEmpty then
      Tag := 1;
    FGen.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este '+ vlTipoCad +' já existe no cadastro! Deseja realmente manter o '+ vlTipoCad +' informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FGen.TbGenNOME.Clear;
  end;
end;

procedure TFEdGen.SBMailClick(Sender: TObject);
begin
  if not FGen.TbGenEMAIL.IsNull then
    ShellExecute(handle, 'open', PChar('mailto:'+ FGen.TbGenEMAIL.Value), '', '', SW_SHOW);
end;

procedure TFEdGen.DBEdit18Exit(Sender: TObject);
begin
  if FGen.TbGen.State in [dsinsert, dsedit] then
    if DBRadioGroup1.ItemIndex = 1 then begin
      if Length(FGen.TbGenCNPJ.Value) < 14 then begin
        MessageDlg(cgMsgDigiteCNPJ, mtWarning, [mbOk], 0);
        DBEdit18.SetFocus;
      end else if not Dados.VerificaCNPJ(FGen.TbGenCNPJ.Value) then begin
        MessageDlg('CNPJ Inválido!', mtWarning, [mbOk], 0);
        DBEdit18.SetFocus;
      end;
    end else begin
      if Length(FGen.TbGenCNPJ.Value) < 11 then begin
        MessageDlg('Digite o CPF!', mtWarning, [mbOk], 0);
        DBEdit18.SetFocus;
      end else if not Dados.VerificaCPF(FGen.TbGenCNPJ.Value) then begin
        MessageDlg('CPF Inválido!', mtWarning, [mbOk], 0);
        DBEdit18.SetFocus;
      end;
    end;
end;

procedure TFEdGen.DBEdit19Exit(Sender: TObject);
begin
  if (FGen.TbGen.State in [dsedit, dsinsert])  and (FGen.TbGenTIPO.Value = 'J') then begin
    if Length(FGen.TbGenIE.Value) < 10 then begin
      MessageDlg('Digite a IE!', mtWarning, [mbOk], 0);
      DBEdit19.SetFocus;
    end else if (FGen.TbGenCODCIDADE.IsNull) and (FGen.TbGenTIPO.Value = 'J') then begin
      MessageDlg('Especifique a cidade do fornecedor e após digite a IE!', mtWarning, [mbOk], 0);
      DBLCBCidades.SetFocus;
    end else if (Dados.VerificaIE(FGen.TbGenIE.Value, EdUF.Text) = 1) and
      (FGen.TbGenTIPO.Value = 'J') then begin
      MessageDlg('IE Inválida!', mtWarning, [mbOk], 0);
      DBEdit19.SetFocus;
    end;
  end;
end;

procedure TFEdGen.FormShow(Sender: TObject);
begin
  DBLCBCidadesExit(nil);
  DBEdit4Exit(nil);
  DBEdit5Enter(nil);
end;

procedure TFEdGen.DTPDataFundChange(Sender: TObject);
begin
  FGen.TbGenDTFUND.Value := DTPDataFund.Date;
end;

procedure TFEdGen.DTPDataCadChange(Sender: TObject);
begin
  FGen.TbGenDTCAD.Value := DTPDataCad.Date;
end;

procedure TFEdGen.DBEdit4Exit(Sender: TObject);
begin
  try
    DTPDataCad.Date := FGen.TbGenDTCAD.Value;
  except
    DTPDataCad.Date := Date;
  end;
end;

procedure TFEdGen.DBEdit5Enter(Sender: TObject);
begin
  try
    DTPDataFund.Date := FGen.TbGenDTFUND.Value;
  except
    DTPDataFund.Date := Date;
  end;
end;

procedure TFEdGen.DBLCBCidadesEnter(Sender: TObject);
begin
  EdUF.Clear;
  if not FGen.TbGenCODCIDADE.IsNull then begin
    Dados.QryCidadesLK.Locate('CODCIDADE', FGen.TbGenCODCIDADE.Value, []);
    Dados.QryEstadosLK.Locate('CODESTADO', Dados.QryCidadesLK.Fields[2].AsInteger, []);
    EdUF.Text := Dados.QryEstadosLK.FieldByName('UF').AsString;
  end;
end;

procedure TFEdGen.DBLCBCidadesExit(Sender: TObject);
begin
  DBLCBCidadesEnter(nil);
  if (FGen.TbGenCEP.IsNull) and (DBLCBCidades.Text <> '') then begin
    FGen.QryProx.SQL.Text := 'select CEP from cidades where codcidade = '+ IntToStr(DBLCBCidades.KeyValue);
    FGen.QryProx.Open;
    FGen.TbGenCEP.Value := FGen.QryProx.Fields[0].AsString;
    FGen.QryProx.Close;
  end;
end;

procedure TFEdGen.DBLCBBairroKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then begin
    if sender = DBLCBBairro then
      SBBairroClick(SBBairro)
    else if sender = DBLCBCidades then
      SBBairroClick(DBLCBCidades)
  end;
end;

end.
