unit UEdAcervoItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB, CJVBarCode;

type
  TFEdAcervoItens = class(TForm)
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
    DBRadioGroup1: TDBRadioGroup;
    Label5: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    CJVBarCode1: TCJVBarCode;
    DTPRegistro: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure DTPRegistroChange(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdAcervoItens: TFEdAcervoItens;

implementation

uses UAcervo, UDados, UGeneros, UAutores, UEditoras;

{$R *.dfm}

procedure TFEdAcervoItens.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryGenerosLK.Open;
  Dados.QryAutoresLK.Open;
  Dados.QryEditorasLK.Open;
end;

procedure TFEdAcervoItens.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAcervo.TbAcervo.Cancel;
      FAcervo.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAcervoItens.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;


  if FAcervo.TbAcervoItensIMPRENTA.IsNull then begin
    MessageDlg('Especifique a Imprenta do livro!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  if FAcervo.TbAcervoItensDTREG.IsNull then begin
    MessageDlg('Especifique a data do registro!', mtWarning, [mbOk], 0);
    DBEdit3.SetFocus;
    exit;
  end;

  if FAcervo.TbAcervoItensEDICAO.IsNull then begin
    MessageDlg('Especifique a edição do livro!', mtWarning, [mbOk], 0);
    DBEdit4.SetFocus;
    exit;
  end;

  try
    FAcervo.TbAcervoItens.Post;
    FAcervo.ConfTrans(True);
  except
    FAcervo.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdAcervoItens.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAcervoItens.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAcervo.TbAcervo.State in [dsInsert, dsEdit]) then
    FAcervo.TbAcervo.Cancel;
end;

procedure TFEdAcervoItens.FormCreate(Sender: TObject);
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
  DBEdit5Change(nil);
end;

procedure TFEdAcervoItens.DBEdit5Change(Sender: TObject);
begin
  CJVBarCode1.Texto := FAcervo.TbAcervoItensCODBARRAS.Value;
end;

procedure TFEdAcervoItens.DTPRegistroChange(Sender: TObject);
begin
  FAcervo.TbAcervoItensDTREG.Value := DTPRegistro.Date;
end;

procedure TFEdAcervoItens.DBEdit3Enter(Sender: TObject);
begin
  try
    DTPRegistro.Date := FAcervo.TbAcervoItensDTREG.Value;
  except
    DTPRegistro.Date := Date;
  end;
end;

procedure TFEdAcervoItens.FormShow(Sender: TObject);
begin
  DBEdit3Enter(nil);
end;

end.
