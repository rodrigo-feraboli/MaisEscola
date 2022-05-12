unit UDisciplinas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFDisciplinas = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSDisciplinas: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbDisciplinas: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    TbDisciplinasCODDISC: TSmallintField;
    TbDisciplinasDESCRICAO: TMDOStringField;
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
    procedure DSDisciplinasDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Sinttico1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FDisciplinas: TFDisciplinas;

const
  SQL = 'SELECT * FROM DISCIPLINAS WHERE CODDISC IS NOT NULL';

implementation

uses UEdDisciplinas, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFDisciplinas.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFDisciplinas.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('DISCIPLINAS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbDisciplinas.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODDISC) FROM DISCIPLINAS';
    QryProx.Open;
    TbDisciplinasCODDISC.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdDisciplinas, FEdDisciplinas);
    FEdDisciplinas.ShowModal;
  finally
    FreeAndNil(FEdDisciplinas);
  end;
end;

procedure TFDisciplinas.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('DISCIPLINAS', 'EDI', 1) or (TbDisciplinas.IsEmpty) then
    Exit;
  try
    TbDisciplinas.Edit;
    Application.CreateForm(TFEdDisciplinas, FEdDisciplinas);
    FEdDisciplinas.ShowModal;
  finally
    FreeAndNil(FEdDisciplinas);
  end;
end;

procedure TFDisciplinas.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbDisciplinas.Close;
  TbDisciplinas.SelectSQL.Text := SQL +' ORDER BY ';
  if sender = RBCodigo then
    TbDisciplinas.SelectSQL.Add('CODDISC')
  else
    TbDisciplinas.SelectSQL.Add('DESCRICAO');
  TbDisciplinas.Open;
end;

procedure TFDisciplinas.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbDisciplinas.Locate('CODDISC', StrToInt(EdBusca.Text), [])
    else
      TbDisciplinas.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFDisciplinas.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbDisciplinas.Close;
    TbDisciplinas.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbDisciplinas.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbDisciplinas.SelectSQL.Add(' CODDISC CONTAINING '''+ EdBusca.Text +'''');
    TbDisciplinas.Open;
    if TbDisciplinas.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbDisciplinas.Close;
      TbDisciplinas.SelectSQL.Text := SQL;
      TbDisciplinas.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbDisciplinasCODDISC.Value;
  PnlBusca.Visible := True;

end;

procedure TFDisciplinas.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbDisciplinasCODDISC.Value;
  TbDisciplinas.Close;
  TbDisciplinas.SelectSQL.Text := SQL;
  TbDisciplinas.Open;
  TbDisciplinas.Locate('CODDISC', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFDisciplinas.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFDisciplinas.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('DISCIPLINAS', 'EXC', 1) then
    Exit;
  if (not TbDisciplinas.IsEmpty) and
    (MessageDlg('Deseja excluir a disciplina selecionada?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbDisciplinas.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFDisciplinas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFDisciplinas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFDisciplinas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFDisciplinas.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbDisciplinas.Bof) then
    TbDisciplinas.First
  else if (sender = SBLast) and (not TbDisciplinas.Bof) then
    TbDisciplinas.Prior
  else if (sender = SBNext) and (not TbDisciplinas.Eof) then
    TbDisciplinas.Next
  else if (sender = SBPrior) and (not TbDisciplinas.Eof) then
    TbDisciplinas.Last
  else
    TbDisciplinas.Refresh;
end;

procedure TFDisciplinas.FormCreate(Sender: TObject);
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

procedure TFDisciplinas.DSDisciplinasDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODDISC) FROM DISCIPLINAS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFDisciplinas.FormShow(Sender: TObject);
begin

  SBFirstClick(SBRefresh);
end;

procedure TFDisciplinas.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFDisciplinas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with TDBGrid(Sender) do
    if odd(DataSource.DataSet.RecNo) then begin
      Canvas.Brush.Color := Dados.vgCorGrid;
      Canvas.FillRect(Rect);
      DefaultDrawDataCell(Rect,Column.Field,State);
      if gdFocused in state then begin
        Canvas.Brush.Color := Dados.vgCorFoco;
        Canvas.FillRect(Rect);
        DefaultDrawDataCell(Rect,Column.Field,State);
      end;
    end;
end;

procedure TFDisciplinas.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with TDBGrid(Sender) do
    if odd(DataSource.DataSet.RecNo) then begin
      Canvas.Brush.Color := Dados.vgCorBusca;
      Canvas.FillRect(Rect);
      DefaultDrawDataCell(Rect,Column.Field,State);
      if gdFocused in state then begin
        Canvas.Brush.Color := Dados.vgCorFoco;
        Canvas.FillRect(Rect);
        DefaultDrawDataCell(Rect,Column.Field,State);
      end;
    end;
end;

procedure TFDisciplinas.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('DISCIPLINAS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Disciplinas';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
