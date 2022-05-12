unit UFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFFunc = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSFunc: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbFunc: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    TbFuncCODFUNC: TSmallintField;
    TbFuncNOME: TMDOStringField;
    TbFuncCODPROFISSAO: TSmallintField;
    TbFuncDTCAD: TDateField;
    TbFuncDTCONTR: TDateField;
    TbFuncDTNASC: TDateField;
    QryProx: TMDOQuery;
    Label1: TLabel;
    LblQtde: TLabel;
    RBCodigo: TRadioButton;
    RBDescricao: TRadioButton;
    EdBusca: TEdit;
    SBFirst: TSpeedButton;
    SBLast: TSpeedButton;
    SBNext: TSpeedButton;
    SBPrior: TSpeedButton;
    SBRefresh: TSpeedButton;
    Relatrios1: TMenuItem;
    Sinttico1: TMenuItem;
    TbFuncEMAIL: TMDOStringField;
    TbFuncCODCIDADE: TSmallintField;
    TbFuncCEP: TMDOStringField;
    TbFuncENDERECO: TMDOStringField;
    TbFuncCODBAIRRO: TSmallintField;
    TbFuncCTNUM: TMDOStringField;
    TbFuncCTSERIE: TMDOStringField;
    TbFuncRG: TMDOStringField;
    TbFuncFONE: TMDOStringField;
    TbFuncCELULAR: TMDOStringField;
    TbFuncPATHFOTO: TMDOStringField;
    TbFuncSEXO: TMDOStringField;
    TbFuncOBS: TMemoField;
    Analitco1: TMenuItem;
    procedure SBNovoClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure RBCodigoClick(Sender: TObject);
    procedure EdBuscaChange(Sender: TObject);
    procedure SBBuscaClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SBSairClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SBFirstClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSFuncDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure Sinttico1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FFunc: TFFunc;

const
  SQL = 'SELECT * FROM FUNC WHERE CODFUNC IS NOT NULL';

implementation

uses UEdFunc, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFFunc.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFFunc.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('FUNCIONÁRIOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbFunc.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODFUNC) FROM FUNC';
    QryProx.Open;
    TbFuncCODFUNC.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    TbFuncDTCAD.Value := Date;
    Application.CreateForm(TFEdFunc, FEdFunc);
    FEdFunc.ShowModal;
  finally
    FreeAndNil(FEdFunc);
  end;
end;

procedure TFFunc.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('FUNCIONÁRIOS', 'EDI', 1) or TbFunc.IsEmpty then
    Exit;
  try
    TbFunc.Edit;
    Application.CreateForm(TFEdFunc, FEdFunc);
    FEdFunc.ShowModal;
  finally
    FreeAndNil(FEdFunc);
  end;
end;

procedure TFFunc.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbFunc.Close;
  TbFunc.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbFunc.SelectSQL.Add('CODFUNC')
  else
    TbFunc.SelectSQL.Add('NOME');
  TbFunc.Open;
end;

procedure TFFunc.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbFunc.Locate('CODFUNC', StrToInt(EdBusca.Text), [])
    else
      TbFunc.Locate('NOME', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFFunc.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbFunc.Close;
    TbFunc.SelectSQL.Text := SQL + ' AND ';
    if RBDescricao.Checked then
      TbFunc.SelectSQL.Add(' NOME CONTAINING '''+ EdBusca.Text +'''')
    else
      TbFunc.SelectSQL.Add(' CODFUNC CONTAINING '''+ EdBusca.Text +'''');
    TbFunc.Open;
    if TbFunc.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbFunc.Close;
      TbFunc.SelectSQL.Text := SQL;
      TbFunc.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbFuncCODFUNC.Value;
  PnlBusca.Visible := True;

end;

procedure TFFunc.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbFuncCODFUNC.Value;
  TbFunc.Close;
  TbFunc.SelectSQL.Text := SQL;
  TbFunc.Open;
  TbFunc.Locate('CODFUNC', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFFunc.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFFunc.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('FUNCIONÁRIOS', 'EXC', 1) then
    Exit;
  if (not TbFunc.IsEmpty) and
    (MessageDlg(cgMsgDelFunc, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbFunc.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFFunc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFFunc.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFFunc.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1 then
    AbreAjuda
  else if not PnlBusca.Visible then begin
    if (Key = 78 {n}) and (Shift = [ssCtrl]) then
      SBNovoClick(nil)
    else if (Key = 65 {a}) and (Shift = [ssCtrl]) then
      SBAlterarClick(nil)
    else if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
      SBExcluirClick(nil)
    else if (Key = Vk_F3) then
      SBBuscaClick(nil);
  end;

  // verificar pq deixa inserir tmb saindo da tela do cadastro (esc não cancela)
end;

procedure TFFunc.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbFunc.Bof) then
    TbFunc.First
  else if (sender = SBLast) and (not TbFunc.Bof) then
    TbFunc.Prior
  else if (sender = SBNext) and (not TbFunc.Eof) then
    TbFunc.Next
  else if (sender = SBPrior) and (not TbFunc.Eof) then
    TbFunc.Last
  else
    TbFunc.Refresh;
end;

procedure TFFunc.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  
  Dados.ILSistema.GetBitmap(0, SBFirst.Glyph);
  Dados.ILSistema.GetBitmap(1, SBLast.Glyph);
  Dados.ILSistema.GetBitmap(2, SBNext.Glyph);
  Dados.ILSistema.GetBitmap(3, SBPrior.Glyph);
  Dados.ILSistema.GetBitmap(4, SBRefresh.Glyph);
  Dados.ILSistema.GetBitmap(5, SBBusca.Glyph);

  
  Trans.StartTransaction;
  RBCodigo.Checked;
  RBCodigoClick(RBCodigo);

end;

procedure TFFunc.DSFuncDataChange(Sender: TObject; Field: TField);
begin
  LblQtde.Caption :=  IntToStr(TbFunc.RecordCount) + ' registros encontrados';
end;

procedure TFFunc.FormShow(Sender: TObject);
begin
//  Dados.ILSistema.GetBitmap(0, SBBusca.Glyph);
  SBFirstClick(SBRefresh);
end;

procedure TFFunc.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFFunc.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('FUNCIONÁRIOS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Funcionários';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
