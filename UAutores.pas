unit UAutores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFAutores = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Label1: TLabel;
    RBCodigo: TRadioButton;
    RBDescricao: TRadioButton;
    EdBusca: TEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSAutores: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbAutores: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    LblQtde: TLabel;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    TbAutoresCODAUTOR: TSmallintField;
    TbAutoresNOME: TMDOStringField;
    QryProx: TMDOQuery;
    SBRefresh: TSpeedButton;
    SBPrior: TSpeedButton;
    SBNext: TSpeedButton;
    SBLast: TSpeedButton;
    SBFirst: TSpeedButton;
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
    procedure DSAutoresDataChange(Sender: TObject; Field: TField);
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
  FAutores: TFAutores;

const
  SQL = 'SELECT * FROM AUTORES WHERE CODAUTOR IS NOT NULL';

implementation

uses UEdAutores, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFAutores.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFAutores.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('AUTORES', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAutores.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODAUTOR) FROM AUTORES';
    QryProx.Open;
    TbAutoresCODAUTOR.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdAutores, FEdAutores);
    FEdAutores.ShowModal;
  finally
    FreeAndNil(FEdAutores);
  end;
end;

procedure TFAutores.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('AUTORES', 'EDI', 1) or (TbAutores.IsEmpty) then
    Exit;
  try
    TbAutores.Edit;
    Application.CreateForm(TFEdAutores, FEdAutores);
    FEdAutores.ShowModal;
  finally
    FreeAndNil(FEdAutores);
  end;
end;

procedure TFAutores.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbAutores.Close;
  TbAutores.SelectSQL.Text := SQL +' ORDER BY ';
  if sender = RBCodigo then
    TbAutores.SelectSQL.Add('CODAUTOR')
  else
    TbAutores.SelectSQL.Add('NOME');
  TbAutores.Open;
end;

procedure TFAutores.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbAutores.Locate('CODAUTOR', StrToInt(EdBusca.Text), [])
    else
      TbAutores.Locate('NOME', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFAutores.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbAutores.Close;
    TbAutores.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbAutores.SelectSQL.Add(' NOME CONTAINING '''+ EdBusca.Text +'''')
    else
      TbAutores.SelectSQL.Add(' CODAUTOR CONTAINING '''+ EdBusca.Text +'''');
    TbAutores.Open;
    if TbAutores.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbAutores.Close;
      TbAutores.SelectSQL.Text := SQL;
      TbAutores.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbAutoresCODAUTOR.Value;
  PnlBusca.Visible := True;

end;

procedure TFAutores.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbAutoresCODAUTOR.Value;
  TbAutores.Close;
  TbAutores.SelectSQL.Text := SQL;
  TbAutores.Open;
  TbAutores.Locate('CODAUTOR', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFAutores.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFAutores.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('AUTORES', 'EXC', 1) then
    Exit;
  if (not TbAutores.IsEmpty) and
    (MessageDlg('Deseja excluir o autor selecionado?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAutores.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAutores.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFAutores.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFAutores.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFAutores.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbAutores.Bof) then
    TbAutores.First
  else if (sender = SBLast) and (not TbAutores.Bof) then
    TbAutores.Prior
  else if (sender = SBNext) and (not TbAutores.Eof) then
    TbAutores.Next
  else if (sender = SBPrior) and (not TbAutores.Eof) then
    TbAutores.Last
  else
    TbAutores.Refresh;
end;

procedure TFAutores.FormCreate(Sender: TObject);
var
  i: smallint;
begin
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

procedure TFAutores.DSAutoresDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODAUTOR) FROM AUTORES';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFAutores.FormShow(Sender: TObject);
begin

  SBFirstClick(SBRefresh);
end;

procedure TFAutores.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFAutores.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFAutores.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFAutores.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('AUTORES', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Autores';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
