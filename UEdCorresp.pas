  unit UEdCorresp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdCorresp = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DTPEntrada: TDateTimePicker;
    DTPEnvio: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DTPEntradaChange(Sender: TObject);
    procedure DTPEnvioChange(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdCorresp: TFEdCorresp;

implementation

uses UCorresp, UDados;

{$R *.dfm}

procedure TFEdCorresp.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FCorresp.TbCorresp.Cancel;
      FCorresp.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdCorresp.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FCorresp.TbCorrespDTENV.IsNull then begin
    MessageDlg('Especifique a data de envio!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;
  if FCorresp.TbCorrespDTENT.IsNull then begin
    MessageDlg('Especifique a data de entrada!', mtWarning, [mbOk], 0);
    DBEdit4.SetFocus;
    exit;
  end;
  if FCorresp.TbCorrespPROCED.IsNull then begin
    MessageDlg('Especifique a procedência!', mtWarning, [mbOk], 0);
    DBEdit3.SetFocus;
    exit;
  end;
  if FCorresp.TbCorrespASSUNTO.IsNull then begin
    MessageDlg('Especifique o assunto!', mtWarning, [mbOk], 0);
    DBEdit5.SetFocus;
    exit;
  end;

  try
    FCorresp.TbCorresp.Post;
    FCorresp.ConfTrans(True);
  except
    FCorresp.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdCorresp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdCorresp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FCorresp.TbCorresp.State in [dsInsert, dsEdit]) then
    FCorresp.TbCorresp.Cancel;
end;

procedure TFEdCorresp.FormCreate(Sender: TObject);
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

procedure TFEdCorresp.DTPEntradaChange(Sender: TObject);
begin
  FCorresp.TbCorrespDTENT.Value := DTPEntrada.Date;
end;

procedure TFEdCorresp.DTPEnvioChange(Sender: TObject);
begin
  FCorresp.TbCorrespDTENV.Value := DTPEnvio.Date;
end;

procedure TFEdCorresp.DBEdit2Enter(Sender: TObject);
begin
  try
    DTPEnvio.Date := FCorresp.TbCorrespDTENV.Value;
  except
    DTPEnvio.Date := Date;
  end;
end;

procedure TFEdCorresp.DBEdit4Exit(Sender: TObject);
begin
  try
    DTPEntrada.Date := FCorresp.TbCorrespDTENT.Value;
  except
    DTPEntrada.Date := Date;
  end;
end;

procedure TFEdCorresp.FormShow(Sender: TObject);
begin
  DBEdit4Exit(nil);
  DBEdit2Enter(nil);
end;

end.
