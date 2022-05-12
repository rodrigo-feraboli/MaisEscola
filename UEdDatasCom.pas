unit UEdDatasCom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdDatasCom = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBRadioGroup1: TDBRadioGroup;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DTPDtCom: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DTPDtComChange(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdDatasCom: TFEdDatasCom;

implementation

uses UDatasCom, UDados;

{$R *.dfm}

procedure TFEdDatasCom.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FDatasCom.TbDatasCom.Cancel;
      FDatasCom.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdDatasCom.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FDatasCom.TbDatasComDATA.IsNull then begin
    MessageDlg(cgEspData, mtWarning, [mbOk], 0);
    DBEdit3.SetFocus;
    exit;
  end else if FDatasCom.TbDatasComDESCRICAO.IsNull then begin
    MessageDlg(cgEspDataCom, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FDatasCom.TbDatasCom.Post;
    FDatasCom.ConfTrans(True);
  except
    FDatasCom.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdDatasCom.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdDatasCom.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FDatasCom.TbDatasCom.State in [dsInsert, dsEdit]) then
    FDatasCom.TbDatasCom.Cancel;
end;

procedure TFEdDatasCom.FormCreate(Sender: TObject);
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

procedure TFEdDatasCom.DTPDtComChange(Sender: TObject);
begin
  FDatasCom.TbDatasComDATA.Value := DTPDtCom.Date;
end;

procedure TFEdDatasCom.DBEdit3Enter(Sender: TObject);
begin
  try
    DTPDtCom.Date := FDatasCom.TbDatasComDATA.Value;
  except
    DTPDtCom.Date := Date;
  end;
end;

procedure TFEdDatasCom.FormShow(Sender: TObject);
begin
  DBEdit3Enter(nil);
end;

procedure TFEdDatasCom.DBEdit2Exit(Sender: TObject);
begin
  if FDatasCom.TbDatasCom.State in [dsInsert] then begin
    Tag := 0;
    FDatasCom.QryProx.SQL.Text := 'select descricao from DTCOM WHERE descricao = '''+ FDatasCom.TbDatasComDESCRICAO.Value + '''';
    FDatasCom.QryProx.Open;
    if not FDatasCom.QryProx.IsEmpty then
      Tag := 1;
    FDatasCom.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Esta data comemorativa já existe no cadastro! Deseja realmente manter a data comemorativa informada?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FDatasCom.TbDatasComDESCRICAO.Clear;
  end;
end;

end.
