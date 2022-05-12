unit UEdAcervoRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB, MDOCustomDataSet, MDOQuery;

type
  TFEdAcervoRes = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    LblAluno: TLabel;
    DBEAluno: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBLCBAluno: TDBLookupComboBox;
    SBAluno: TSpeedButton;
    LblFunc: TLabel;
    DBEFunc: TDBEdit;
    DBLCBFunc: TDBLookupComboBox;
    SBFunc: TSpeedButton;
    DBLivro: TDBEdit;
    DBLCBLivro: TDBLookupComboBox;
    DBRadioGroup2: TDBRadioGroup;
    Label3: TLabel;
    DBLCBEdicao: TDBLookupComboBox;
    QryAcervosRes: TMDOQuery;
    DSAcervosRes: TDataSource;
    QryAcervosResEDICAO: TSmallintField;
    QryAcervosResEdicaoStr: TStringField;
    DTPReserva: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure SBAlunoClick(Sender: TObject);
    procedure SBFuncClick(Sender: TObject);
    procedure QryAcervosResCalcFields(DataSet: TDataSet);
    procedure DBLCBLivroExit(Sender: TObject);
    procedure DBRadioGroup2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBEdicaoClick(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DTPReservaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdAcervoRes: TFEdAcervoRes;

implementation

uses UAcervo, UDados, UAlunos, UFunc;

{$R *.dfm}

procedure TFEdAcervoRes.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAcervo.TbAcervoReservas.Cancel;
      FAcervo.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAcervoRes.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;


  if FAcervo.TbAcervoReservasDTRESERVA.IsNull then begin
    MessageDlg('Especifique a data da reserva do livro!', mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  if (DBRadioGroup1.Value = '1') and (DBLCBAluno.Text = '') then begin
    MessageDlg('Especifique o aluno que fez a reserva!', mtWarning, [mbOk], 0);
    DBLCBAluno.SetFocus;
    exit;
  end;

  if (DBRadioGroup1.Value = '2') and (DBLCBFunc.Text = '') then begin
    MessageDlg('Especifique o funcionário que fez a reserva!', mtWarning, [mbOk], 0);
    DBLCBFunc.SetFocus;
    exit;
  end;

  if (DBLCBEdicao.Visible) and (DBLCBEdicao.Text = '') then begin
    MessageDlg('Especifique a edição do livro para a reserva!', mtWarning, [mbOk], 0);
    DBLCBEdicao.SetFocus;
    exit;
  end;

  try

    FAcervo.QryProx.SQL.Text := 'SELECT MAX(CODRESERVA) FROM ACERVORESERVAS WHERE CODACERVO = '+ IntToStr(FAcervo.TbAcervoCODACERVO.Value);
    FAcervo.QryProx.Open;
    FAcervo.TbAcervoReservasCODRESERVA.Value := FAcervo.QryProx.Fields[0].AsInteger + 1;
    FAcervo.QryProx.Close;

    FAcervo.TbAcervoReservas.Post;
    FAcervo.ConfTrans(True);
  except
    FAcervo.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdAcervoRes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAcervoRes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAcervo.TbAcervoReservas.State in [dsInsert, dsEdit]) then
    FAcervo.TbAcervoReservas.Cancel;
end;

procedure TFEdAcervoRes.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  
  FAcervo.LKTela;
end;

procedure TFEdAcervoRes.DBRadioGroup1Change(Sender: TObject);
begin
  LblAluno.Visible := DBRadioGroup1.Value = '1';
  LblFunc.Visible :=  DBRadioGroup1.Value = '2';
  DBEFunc.Visible := LblFunc.Visible;
  DBEAluno.Visible := LblAluno.Visible;
  DBLCBAluno.Visible := LblAluno.Visible;
  SBAluno.Visible := LblAluno.Visible;
  DBLCBFunc.Visible := LblFunc.Visible;
  SBFunc.Visible := LblFunc.Visible;
  Dados.QryFuncLK.FetchAll;
end;

procedure TFEdAcervoRes.SBAlunoClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFAlunos, FAlunos);
    FAlunos.ShowModal;
  finally
    FreeAndNil(FAlunos);
    FAcervo.LKTela;
  end; 
end;

procedure TFEdAcervoRes.SBFuncClick(Sender: TObject);
begin
  if not VerificarPermissao('FUNCIONÁRIOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFFunc, FFunc);
    FFunc.ShowModal;
  finally
    FreeAndNil(FFunc);
    FAcervo.LKTela;
  end;
end;

procedure TFEdAcervoRes.QryAcervosResCalcFields(DataSet: TDataSet);
begin
  QryAcervosResEdicaoStr.Value := IntToStr(QryAcervosResEDICAO.Value) + 'ª Edição';
end;

procedure TFEdAcervoRes.DBLCBLivroExit(Sender: TObject);
begin
  QryAcervosRes.Close;
  QryAcervosRes.ParamByName('plCod').AsInteger := DBLCBLivro.KeyValue;
  QryAcervosRes.Open;
end;

procedure TFEdAcervoRes.DBRadioGroup2Change(Sender: TObject);
begin
  Label3.Visible := DbRadioGroup2.ItemIndex = 1;
  DBLCBEdicao.Visible :=  Label3.Visible;
end;

procedure TFEdAcervoRes.FormShow(Sender: TObject);
begin
  DBLCBLivroExit(nil);
  DBEdit2Enter(nil);
  DBRadioGroup2Change(nil);
end;

procedure TFEdAcervoRes.DBLCBEdicaoClick(Sender: TObject);
begin
  // Pesquisa se existe na escola o livro antes de reservar
  
end;

procedure TFEdAcervoRes.DBEdit2Enter(Sender: TObject);
begin
  try
    DTPReserva.Date := FAcervo.TbAcervoReservasDTRESERVA.Value;
  except
    DTPReserva.Date := Date;
  end;
end;

procedure TFEdAcervoRes.DTPReservaChange(Sender: TObject);
begin
  FAcervo.TbAcervoReservasDTRESERVA.Value := DTPReserva.Date;
end;

end.
