unit UEdBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdBancos = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    SBBairro: TSpeedButton;
    SBCidade: TSpeedButton;
    Label28: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBLCBBairro: TDBLookupComboBox;
    DBLCBCidade: TDBLookupComboBox;
    DBEdit28: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBBairroClick(Sender: TObject);
    procedure SBCidadeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBLCBBairroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdBancos: TFEdBancos;

implementation

uses UBancos, UDados, UBairros, UCidades;

{$R *.dfm}

procedure TFEdBancos.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryBairrosLK.Open;
  Dados.QryCidadesLK.Open;
end;

procedure TFEdBancos.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FBancos.TbBancos.Cancel;
      FBancos.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdBancos.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FBancos.TbBancosNome.IsNull then begin
    MessageDlg('Especifique o nome do banco!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  if DBLCBBairro.Text = '' then begin
    MessageDlg('Especifique o bairro!', mtWarning, [mbOk], 0);
    DBLCBBairro.SetFocus;
    exit;
  end;

  if DBLCBCidade.Text = '' then begin
    MessageDlg('Especifique a cidade!', mtWarning, [mbOk], 0);
    DBLCBCidade.SetFocus;
    exit;
  end;

  try
    FBancos.TbBancos.Post;
    FBancos.ConfTrans(True);
  except
    FBancos.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdBancos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdBancos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FBancos.TbBancos.State in [dsInsert, dsEdit]) then
    FBancos.TbBancos.Cancel;
end;

procedure TFEdBancos.FormCreate(Sender: TObject);
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

procedure TFEdBancos.SBBairroClick(Sender: TObject);
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

procedure TFEdBancos.SBCidadeClick(Sender: TObject);
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



procedure TFEdBancos.FormShow(Sender: TObject);
begin
  LKTela;
end;

procedure TFEdBancos.DBEdit2Exit(Sender: TObject);
begin
  if not (FBancos.TbBancosNOME.IsNull) and (FBancos.TbBancosFANTASIA.IsNull) then
    FBancos.TbBancosFANTASIA.Value := FBancos.TbBancosNOME.Value;

  if FBancos.TbBancos.State in [dsInsert] then begin
    Tag := 0;
    FBancos.QryProx.SQL.Text := 'select nome from bancos WHERE nome = '''+ FBancos.TbBancosNOME.Value + '''';
    FBancos.QryProx.Open;
    if not FBancos.QryProx.IsEmpty then
      Tag := 1;
    FBancos.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este banco já existe no cadastro! Deseja realmente manter o banco informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FBancos.TbBancosNOME.Clear;
  end;
end;

procedure TFEdBancos.DBLCBBairroKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then begin
    if sender = DBLCBBairro then
      SBBairroClick(nil)
    else if sender = DBLCBCidade then
      SBCidadeClick(nil);
  end;
end;

end.
