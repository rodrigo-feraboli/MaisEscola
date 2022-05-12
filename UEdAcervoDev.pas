unit UEdAcervoDev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAcervoDev = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Lbl: TLabel;
    LblQuem: TLabel;
    DTPdev: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DTPdevChange(Sender: TObject);
    procedure DBEdit4Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdAcervoDev: TFEdAcervoDev;

implementation

uses UAcervo, UDados, UAlunos, UFunc;

{$R *.dfm}

procedure TFEdAcervoDev.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAcervo.TbAcervoRetiradas.Cancel;
      FAcervo.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAcervoDev.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FAcervo.TbAcervoRetiradasDTDEVOLV.IsNull then begin
    MessageDlg('Especifique a data da devolução!', mtWarning, [mbOk], 0);
    DBEdit4.SetFocus;
    exit;
  end; 
  try
    FAcervo.TbAcervoRetiradas.Post;
    FAcervo.ConfTrans(True);
  except
    FAcervo.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdAcervoDev.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAcervoDev.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAcervo.TbAcervoRetiradas.State in [dsInsert, dsEdit]) then
    FAcervo.TbAcervoRetiradas.Cancel;
end;

procedure TFEdAcervoDev.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdAcervoDev.DTPdevChange(Sender: TObject);
begin
  FAcervo.TbAcervoRetiradasDTDEV.Value := DTPdev.Date;
end;

procedure TFEdAcervoDev.DBEdit4Enter(Sender: TObject);
begin
  try
    DTPdev.Date := FAcervo.TbAcervoRetiradasDTDEV.Value;
  except
    DTPdev.Date := Date;
  end;
end;

procedure TFEdAcervoDev.FormShow(Sender: TObject);
begin
  DBEdit4Enter(nil);
end;

end.
