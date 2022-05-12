unit UEdAlunosProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAlunosProd = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    SBProd: TSpeedButton;
    DBEdit8: TDBEdit;
    DBLCBProd: TDBLookupComboBox;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DTPVcto: TDateTimePicker;
    DTPPago: TDateTimePicker;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBProdClick(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DTPVctoChange(Sender: TObject);
    procedure DTPPagoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBProdKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdAlunosProd: TFEdAlunosProd;

implementation

uses UAlunos, UDados, UProdutos;

{$R *.dfm}

procedure TFEdAlunosProd.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAlunos.TbAlunosProdutos.Cancel;
      FAlunos.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAlunosProd.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  
  if DBLCBProd.Text = '' then begin
    MessageDlg(cgEspConvAluno, mtWarning, [mbOk], 0);
    DBLCBProd.SetFocus;
    exit;
  end;

  if FAlunos.TbAlunosProdutos.State in [dsInsert] then begin
    FAlunos.QryAux.SQL.Text := 'SELECT CODALUNO FROM ALUNOSPRODUTOS WHERE CODALUNO = '+ IntToStr(FAlunos.TbAlunosCODALUNO.AsInteger) +
      'and CODPROD = '+ IntToStr(DBLCBProd.KeyValue);
    FAlunos.QryAux.Open;
    if not FAlunos.QryAux.IsEmpty then begin
      MessageDlg('Este produto já foi adicionado a este aluno!', mtWarning, [mbOk], 0);
      DBLCBProd.SetFocus;
      FAlunos.QryAux.Close;
      Exit;
    end;
    FAlunos.QryAux.Close;
  end;
  
  try
    FAlunos.TbAlunosProdutos.Post;
    FAlunos.ConfTrans(True);
  except
    FAlunos.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdAlunosProd.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAlunosProd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAlunos.TbAlunosProdutos.State in [dsInsert, dsEdit]) then
    FAlunos.TbAlunosProdutos.Cancel;
end;

procedure TFEdAlunosProd.FormCreate(Sender: TObject);
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

procedure TFEdAlunosProd.SBProdClick(Sender: TObject);
begin
  if not VerificarPermissao('PRODUTOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFProdutos, FProdutos);
    FProdutos.ShowModal;
  finally
    FreeAndNil(FProdutos);
    Dados.LKProdutos(True);
  end;

end;

procedure TFEdAlunosProd.DBEdit2Enter(Sender: TObject);
begin
  try
    DTPVcto.Date := FAlunos.TbAlunosProdutosDTVCTO.Value;
  except
    DTPVcto.Date := Date;
  end;
end;

procedure TFEdAlunosProd.DBEdit3Exit(Sender: TObject);
begin
  try
    DTPPago.Date := FAlunos.TbAlunosProdutosDTPAGO.Value;
  except
    DTPPago.Date := Date;
  end;
end;

procedure TFEdAlunosProd.DTPVctoChange(Sender: TObject);
begin
  FAlunos.TbAlunosProdutosDTVCTO.Value := DTPVcto.Date;
end;

procedure TFEdAlunosProd.DTPPagoChange(Sender: TObject);
begin
  FAlunos.TbAlunosProdutosDTPAGO.Value := DTPPago.Date;
end;

procedure TFEdAlunosProd.FormShow(Sender: TObject);
begin
  DBEdit2Enter(nil);
  DBEdit3Exit(nil);
end;

procedure TFEdAlunosProd.DBLCBProdKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then
    SBProdClick(nil);
end;

end.
