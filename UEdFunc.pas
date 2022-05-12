unit UEdFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdFunc = class(TForm)
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
    Bairro: TLabel;
    SpeedButton5: TSpeedButton;
    DBEdit33: TDBEdit;
    DBLCBBairro: TDBLookupComboBox;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    DBEdit6: TDBEdit;
    DBLCBProfissao: TDBLookupComboBox;
    Label8: TLabel;
    SpeedButton2: TSpeedButton;
    DBEdit7: TDBEdit;
    DBLCBCidade: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    SpeedButton3: TSpeedButton;
    ImaFunc: TImage;
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
    DTPNasc: TDateTimePicker;
    DTPContr: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DTPNascChange(Sender: TObject);
    procedure DTPContrChange(Sender: TObject);
    procedure DBEdit5Enter(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure DBLCBCidadeExit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBLCBProfissaoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdFunc: TFEdFunc;

implementation

uses UFunc, UDados, UProfissoes, UBairros, UCidades;

{$R *.dfm}

procedure TFEdFunc.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryProfissoesLK.Open;
  Dados.QryBairrosLK.Open;
  Dados.QryCidadesLK.Open;
end;

procedure TFEdFunc.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FFunc.TbFunc.Cancel;
      FFunc.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdFunc.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FFunc.TbFuncDTNASC.IsNull then begin
    MessageDlg('Especifique a data de nascimento do funcionário!', mtWarning, [mbOk], 0);
    DBEdit5.SetFocus;
    exit;
  end;

  if FFunc.TbFuncNOME.IsNull then begin
    MessageDlg(cgEspDescFunc, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  if FFunc.TbFuncCTNUM.IsNull then begin
    MessageDlg('Especifique o número da Carteira de Trabalho do funcionário!', mtWarning, [mbOk], 0);
    DBEdit8.SetFocus;
    exit;
  end;

  if FFunc.TbFuncCTSERIE.IsNull then begin
    MessageDlg('Especifique a série da Carteira de Trabalho do funcionário!', mtWarning, [mbOk], 0);
    DBEdit9.SetFocus;
    exit;
  end;

  if FFunc.TbFuncDTCONTR.IsNull then begin
    MessageDlg('Especifique a data de contratação do funcionário!', mtWarning, [mbOk], 0);
    DBEdit4.SetFocus;
    exit;
  end;

  if FFunc.TbFuncRG.IsNull then begin
    MessageDlg('Especifique o RG do funcionário!', mtWarning, [mbOk], 0);
    DBEdit10.SetFocus;
    exit;
  end;

  if DBLCBProfissao.Text = '' then begin
    MessageDlg('Especifique a profissão do funcionário!', mtWarning, [mbOk], 0);
    DBLCBProfissao.SetFocus;
    exit;
  end;

  if FFunc.TbFuncFONE.IsNull then begin
    MessageDlg('Especifique o fone do funcionário!', mtWarning, [mbOk], 0);
    DBEdit11.SetFocus;
    exit;
  end;

  if FFunc.TbFuncCELULAR.IsNull then begin
    MessageDlg('Especifique o celular do funcionário!', mtWarning, [mbOk], 0);
    DBEdit12.SetFocus;
    exit;
  end;

  if FFunc.TbFuncENDERECO.IsNull then begin
    MessageDlg('Especifique o celular do funcionário!', mtWarning, [mbOk], 0);
    DBEdit14.SetFocus;
    exit;
  end;

  if DBLCBBairro.Text = ''  then begin
    MessageDlg('Especifique o bairro do funcionário!', mtWarning, [mbOk], 0);
    DBLCBBairro.SetFocus;
    exit;
  end;

  if DBLCBCidade.Text = ''  then begin
    MessageDlg('Especifique a cidade do funcionário!', mtWarning, [mbOk], 0);
    DBLCBCidade.SetFocus;
    exit;
  end;


  try
    FFunc.TbFunc.Post;
    FFunc.ConfTrans(True);
  except
    FFunc.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdFunc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdFunc.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FFunc.TbFunc.State in [dsInsert, dsEdit]) then
    FFunc.TbFunc.Cancel;
end;

procedure TFEdFunc.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdFunc.FormShow(Sender: TObject);
begin
  LKTela;
  try
    ImaFunc.Picture.LoadFromFile(FFunc.TbFuncPATHFOTO.Value);
  except
  end;
  DBEdit5Enter(nil);
  DBEdit4Enter(nil);
end;

procedure TFEdFunc.SpeedButton1Click(Sender: TObject);
begin
  if not VerificarPermissao('PROFISSÕES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFProfissoes, FProfissoes);
    FProfissoes.ShowModal;
  finally
    FreeAndNil(FProfissoes);
    LKTela;
  end;
end;

procedure TFEdFunc.SpeedButton5Click(Sender: TObject);
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

procedure TFEdFunc.SpeedButton2Click(Sender: TObject);
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

procedure TFEdFunc.SpeedButton3Click(Sender: TObject);
begin
  if Dados.ODFotos.Execute then
    FFunc.TbFuncPATHFOTO.Value := Dados.ODFotos.FileName;
  try
    ImaFunc.Picture.LoadFromFile(FFunc.TbFuncPATHFOTO.Value);
  except
  end;
end;

procedure TFEdFunc.DTPNascChange(Sender: TObject);
begin
  FFunc.TbFuncDTNASC.Value := DTPNasc.Date;
end;

procedure TFEdFunc.DTPContrChange(Sender: TObject);
begin
  FFunc.TbFuncDTCONTR.Value := DTPContr.Date;
end;

procedure TFEdFunc.DBEdit5Enter(Sender: TObject);
begin
  try
    DTPNasc.Date := FFunc.TbFuncDTNASC.Value;
  except
    DTPNasc.Date := Date;
  end;
end;

procedure TFEdFunc.DBEdit4Enter(Sender: TObject);
begin
  try
    DTPContr.Date := FFunc.TbFuncDTCONTR.Value;
  except
    DTPContr.Date := Date;
  end;
end;

procedure TFEdFunc.DBLCBCidadeExit(Sender: TObject);
begin
  if FFunc.TbFuncCEP.IsNull then begin
    FFunc.QryProx.SQL.Text := 'select CEP from cidades where codcidade = '+ IntToStr(DBLCBCidade.KeyValue);
    FFunc.QryProx.Open;
    FFunc.TbFuncCEP.Value := FFunc.QryProx.Fields[0].AsString;
    FFunc.QryProx.Close;
  end;
end;

procedure TFEdFunc.DBEdit2Exit(Sender: TObject);
begin
  if FFunc.TbFunc.State in [dsInsert] then begin
    Tag := 0;
    FFunc.QryProx.SQL.Text := 'select NOME from FUNC WHERE NOME = '''+ FFunc.TbFuncNOME.Value + '''';
    FFunc.QryProx.Open;
    if not FFunc.QryProx.IsEmpty then
      Tag := 1;
    FFunc.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este funcionário já existe no cadastro! Deseja realmente manter o funcionário informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FFunc.TbFuncNOME.Clear;
  end;
end;

procedure TFEdFunc.DBLCBProfissaoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then begin
    if (sender = DBLCBProfissao) then
      SpeedButton1Click(nil)
    else if (sender = DBLCBBairro)  then
      SpeedButton5Click(nil)
    else if sender = DBLCBCidade then
      SpeedButton2Click(nil);
  end;
end;

end.
