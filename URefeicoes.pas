unit URefeicoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFRefeicoes = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSAlim: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbRefeicoes: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    TbRefeicoesDESCRICAO: TMDOStringField;
    QryProx: TMDOQuery;
    TbRefeicoesCODREFEICAO: TSmallintField;
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
    procedure DSAlimDataChange(Sender: TObject; Field: TField);
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
  FRefeicoes: TFRefeicoes;

const
  SQL = 'SELECT * FROM REFEICOES WHERE CODREFEICAO IS NOT NULL';

implementation

uses UEdRefeicoes, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFRefeicoes.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFRefeicoes.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('REFEIÇÕES', 'EDI', 1) then
    exit;
  try
    ConfTrans(True);
    TbRefeicoes.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODREFEICAO) FROM REFEICOES';
    QryProx.Open;
    TbRefeicoesCODREFEICAO.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdRefeicoes, FEdRefeicoes);
    FEdRefeicoes.ShowModal;
  finally
    FreeAndNil(FEdRefeicoes);
  end;
end;

procedure TFRefeicoes.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('REFEIÇÕES', 'EDI', 1) or TbRefeicoes.IsEmpty then
    Exit;
  try
    TbRefeicoes.Edit;
    Application.CreateForm(TFEdRefeicoes, FEdRefeicoes);
    FEdRefeicoes.ShowModal;
  finally
    FreeAndNil(FEdRefeicoes);
  end;
end;

procedure TFRefeicoes.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbRefeicoes.Close;
  TbRefeicoes.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbRefeicoes.SelectSQL.Add('CODREFEICAO')
  else
    TbRefeicoes.SelectSQL.Add('DESCRICAO');
  TbRefeicoes.Open;
end;

procedure TFRefeicoes.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbRefeicoes.Locate('CODREFEICAO', StrToInt(EdBusca.Text), [])
    else
      TbRefeicoes.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFRefeicoes.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbRefeicoes.Close;
    TbRefeicoes.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbRefeicoes.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbRefeicoes.SelectSQL.Add(' CODREFEICAO CONTAINING '''+ EdBusca.Text +'''');
    TbRefeicoes.Open;
    if TbRefeicoes.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbRefeicoes.Close;
      TbRefeicoes.SelectSQL.Text := SQL;
      TbRefeicoes.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbRefeicoesCODREFEICAO.Value;
  PnlBusca.Visible := True;

end;

procedure TFRefeicoes.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbRefeicoesCODREFEICAO.Value;
  TbRefeicoes.Close;
  TbRefeicoes.SelectSQL.Text := SQL;
  TbRefeicoes.Open;
  TbRefeicoes.Locate('CODREFEICAO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFRefeicoes.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFRefeicoes.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('REFEIÇÕES', 'EXC', 1) then
    Exit;
  if (not TbRefeicoes.IsEmpty) and
    (MessageDlg('Deseja excluir a refeição selecionada?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbRefeicoes.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFRefeicoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFRefeicoes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFRefeicoes.FormKeyDown(Sender: TObject; var Key: Word;
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
end;

procedure TFRefeicoes.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbRefeicoes.Bof) then
    TbRefeicoes.First
  else if (sender = SBLast) and (not TbRefeicoes.Bof) then
    TbRefeicoes.Prior
  else if (sender = SBNext) and (not TbRefeicoes.Eof) then
    TbRefeicoes.Next
  else if (sender = SBPrior) and (not TbRefeicoes.Eof) then
    TbRefeicoes.Last
  else
    TbRefeicoes.Refresh;
end;

procedure TFRefeicoes.FormCreate(Sender: TObject);
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

procedure TFRefeicoes.DSAlimDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODREFEICAO) FROM REFEICOES';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFRefeicoes.FormShow(Sender: TObject);
begin
//  Dados.ILSistema.GetBitmap(0, SBBusca.Glyph);
  SBFirstClick(SBRefresh);
end;

procedure TFRefeicoes.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFRefeicoes.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFRefeicoes.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFRefeicoes.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('REFEIÇÕES', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Refeições';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
