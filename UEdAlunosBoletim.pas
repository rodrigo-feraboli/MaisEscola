unit UEdAlunosBoletim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAlunosBoletim = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    DBEdit8: TDBEdit;
    RGComp: TDBRadioGroup;
    RGHig: TDBRadioGroup;
    RGAss: TDBRadioGroup;
    RGDESM: TDBRadioGroup;
    RGAte: TDBRadioGroup;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdAlunosBoletim: TFEdAlunosBoletim;

implementation

uses UAlunos, UDados, UAlergias;

{$R *.dfm}

procedure TFEdAlunosBoletim.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAlunos.TbAlunosAval.Cancel;
      FAlunos.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAlunosBoletim.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FAlunos.TbAlunosAvalASD.IsNull then begin
    MessageDlg('Especifique a nota para Assiduidade!', mtWarning, [mbOk], 0);
    RGAss.SetFocus;
    Exit;
  end;

  if FAlunos.TbAlunosAvalATE.IsNull then begin
    MessageDlg('Especifique a nota para Atenção!', mtWarning, [mbOk], 0);
    RGAte.SetFocus;
    Exit;
  end;

  if FAlunos.TbAlunosAvalCOMP.IsNull then begin
    MessageDlg('Especifique a nota para Comportamento!', mtWarning, [mbOk], 0);
    RGComp.SetFocus;
    Exit;
  end;

  if FAlunos.TbAlunosAvalDM.IsNull then begin
    MessageDlg('Especifique a nota para Desenvolvimento Motor!', mtWarning, [mbOk], 0);
    RGDESM.SetFocus;
    Exit;
  end;

  if FAlunos.TbAlunosAvalHIG.IsNull then begin
    MessageDlg('Especifique a nota para Higiene!', mtWarning, [mbOk], 0);
    RGHig.SetFocus;
    Exit;
  end;

  
  try
    FAlunos.TbAlunosAval.Post;
    FAlunos.ConfTrans(True);
  except
    FAlunos.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdAlunosBoletim.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAlunosBoletim.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAlunos.TbAlunosAlergias.State in [dsInsert, dsEdit]) then
    FAlunos.TbAlunosAlergias.Cancel;
end;

procedure TFEdAlunosBoletim.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

end.
