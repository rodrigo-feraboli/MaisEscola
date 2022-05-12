unit UEdAlunosSaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAlunosSaidas = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    DBEdit8: TDBEdit;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    DBText2: TDBText;
    DBText3: TLabel;
    DTPData: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DTPDataChange(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdAlunosSaidas: TFEdAlunosSaidas;

implementation

uses UAlunos, UDados;

{$R *.dfm}

procedure TFEdAlunosSaidas.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAlunos.TbAlunosTrat.Cancel;
      FAlunos.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAlunosSaidas.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;

  if FAlunos.TbAlunosAvDTSAI.IsNull then begin
    MessageDlg('Especifique a data da saída!', mtWarning, [mbOk], 0);
    DBEdit1.SetFocus;
    exit;
  end;

  if FAlunos.TbAlunosAvHRSAI.IsNull then begin
    MessageDlg('Especifique a hora da saída!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  if FAlunos.TbAlunosAvMOTIVO.IsNull then begin
    MessageDlg('Especifique o motivo da saída!', mtWarning, [mbOk], 0);
    DBMemo1.SetFocus;
    exit;
  end;
  
  try
    FAlunos.TbAlunosAv.Post;
    FAlunos.ConfTrans(True);
  except
    FAlunos.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdAlunosSaidas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAlunosSaidas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAlunos.TbAlunosAlergias.State in [dsInsert, dsEdit]) then
    FAlunos.TbAlunosAlergias.Cancel;
end;

procedure TFEdAlunosSaidas.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdAlunosSaidas.DTPDataChange(Sender: TObject);
begin
  FAlunos.TbAlunosAvDTSAI.Value := DTPData.Date;
end;

procedure TFEdAlunosSaidas.DBEdit1Enter(Sender: TObject);
begin
  try
    DTPData.Date := FAlunos.TbAlunosAvDTSAI.Value;
  except
    DTPData.Date := Date;
  end;
end;

procedure TFEdAlunosSaidas.FormShow(Sender: TObject);
begin
  DBEdit1Enter(nil);
end;

end.
