unit UEdTurmasAtividades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdTurmasAtividades = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    SBAtiv: TSpeedButton;
    DBEdit8: TDBEdit;
    DBLCBAtividade: TDBLookupComboBox;
    Label3: TLabel;
    SBFunc: TSpeedButton;
    DBEdit1: TDBEdit;
    DBLCBFunc: TDBLookupComboBox;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DTPData: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DTPDataChange(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBAtividadeKeyPress(Sender: TObject; var Key: Char);
    procedure SBAtivClick(Sender: TObject);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdTurmasAtividades: TFEdTurmasAtividades;

implementation

uses UTurmas, UDados, UAtividades, UFunc;

{$R *.dfm}

procedure TFEdTurmasAtividades.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryFuncLK.Open;
  Dados.QryAtividadesLK.Open;
end;

procedure TFEdTurmasAtividades.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FTurmas.TbTurmasAtividades.Cancel;
      FTurmas.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdTurmasAtividades.SBGravarClick(Sender: TObject);
begin
  ActiveControl := Panel3;
  if DBLCBAtividade.Text = '' then begin
    MessageDlg('Especifique a atividade da turma!', mtWarning, [mbOk], 0);
    DBLCBAtividade.SetFocus;
    exit;
  end;
  if DBLCBFunc.Text = '' then begin
    MessageDlg('Especifique o funcionário responsável pela atividade da turma!', mtWarning, [mbOk], 0);
    DBLCBFunc.SetFocus;
    exit;
  end;

  if FTurmas.TbTurmasAtividadesDATA.IsNull then begin
    MessageDlg('Especifique a data da atividade turma!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  if FTurmas.TbTurmasAtividadesHORAINI.IsNull then begin
    MessageDlg('Especifique a hora inicial da atividade turma!', mtWarning, [mbOk], 0);
    DBEdit3.SetFocus;
    exit;
  end;

  if FTurmas.TbTurmasAtividadesHORAFIN.IsNull then begin
    MessageDlg('Especifique a hora final da atividade turma!', mtWarning, [mbOk], 0);
    DBEdit4.SetFocus;
    exit;
  end;
  
  try
    FTurmas.QryProx.SQL.Text := 'select max(NROITEM) from turmasatividades where codatividade = '+
      IntToStr(FTurmas.TbTurmasAtividadesCODATIVIDADE.Value) +' and codturma = '+ IntToStr(FTurmas.TbTurmasCODTURMA.Value);
    FTurmas.QryProx.Open;
    FTurmas.TbTurmasAtividadesNROITEM.Value := FTurmas.QryProx.Fields[0].AsInteger + 1;
    FTurmas.QryProx.close;

    FTurmas.TbTurmasAtividades.Post;
    FTurmas.ConfTrans(True);
  except
    FTurmas.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdTurmasAtividades.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdTurmasAtividades.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FTurmas.TbTurmasAtividades.State in [dsInsert, dsEdit]) then
    FTurmas.TbTurmasAtividades.Cancel;
end;

procedure TFEdTurmasAtividades.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  LKTela;
end;

procedure TFEdTurmasAtividades.DTPDataChange(Sender: TObject);
begin
  FTurmas.TbTurmasAtividadesDATA.Value := DTPData.Date;
end;

procedure TFEdTurmasAtividades.DBEdit2Enter(Sender: TObject);
begin
  try
    DTPData.Date := FTurmas.TbTurmasAtividadesDATA.Value;
  except
    DTPData.Date := Date;
  end;
end;

procedure TFEdTurmasAtividades.FormShow(Sender: TObject);
begin
  DBEdit2Enter(nil);
end;

procedure TFEdTurmasAtividades.DBLCBAtividadeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = '+') then begin
    if sender = SBFunc then
      SBAtivClick(DBLCBAtividade)
    else if sender = DBLCBFunc then
      SBAtivClick(DBLCBFunc);
  end;
end;

procedure TFEdTurmasAtividades.SBAtivClick(Sender: TObject);
begin
  if sender = SBFunc then begin
    if not VerificarPermissao('FUNCIONÁRIOS', 'CONS', 1) then
      Exit;
    try
      Application.CreateForm(TFFunc, FFunc);
      FFunc.ShowModal;
    finally
    FreeAndNil(FFunc);
    end;
  end else begin
    if not VerificarPermissao('ATIVIDADES', 'CONS', 1) then
      Exit;
    try
      Application.CreateForm(TFAtividades, FAtividades);
      FAtividades.ShowModal;
    finally
      FreeAndNil(FAtividades);
    end;
  end;
  LKTela;
end;

end.
