unit UEditoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFEditoras = class(TForm)
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
    DSEditoras: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbEditoras: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    LblQtde: TLabel;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    TbEditorasCODEDITORA: TSmallintField;
    TbEditorasDESCRICAO: TMDOStringField;
    QryProx: TMDOQuery;
    SBRefresh: TSpeedButton;
    SBPrior: TSpeedButton;
    SBNext: TSpeedButton;
    SBLast: TSpeedButton;
    SBFirst: TSpeedButton;
    Relatrios1: TMenuItem;
    Sintticos1: TMenuItem;
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
    procedure DSEditorasDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Sintticos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FEditoras: TFEditoras;

const
  SQL = 'SELECT * FROM EDITORAS WHERE CODEDITORA IS NOT NULL';

implementation

uses UEdEditoras, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFEditoras.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFEditoras.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('EDITORAS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbEditoras.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODEDITORA) FROM EDITORAS';
    QryProx.Open;
    TbEditorasCODEDITORA.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdEditoras, FEdEditoras);
    FEdEditoras.ShowModal;
  finally
    FreeAndNil(FEdEditoras);
  end;
end;

procedure TFEditoras.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('EDITORAS', 'EDI', 1) or (TbEditoras.IsEmpty) then
    Exit;
  try
    TbEditoras.Edit;
    Application.CreateForm(TFEdEditoras, FEdEditoras);
    FEdEditoras.ShowModal;
  finally
    FreeAndNil(FEdEditoras);
  end;
end;

procedure TFEditoras.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbEditoras.Close;
  TbEditoras.SelectSQL.Text := SQL +' ORDER BY ';
  if sender = RBCodigo then
    TbEditoras.SelectSQL.Add('CODEDITORA')
  else
    TbEditoras.SelectSQL.Add('DESCRICAO');
  TbEditoras.Open;
end;

procedure TFEditoras.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbEditoras.Locate('CODEDITORA', StrToInt(EdBusca.Text), [])
    else
      TbEditoras.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFEditoras.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbEditoras.Close;
    TbEditoras.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbEditoras.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbEditoras.SelectSQL.Add(' CODEDITORA CONTAINING '''+ EdBusca.Text +'''');
    TbEditoras.Open;
    if TbEditoras.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbEditoras.Close;
      TbEditoras.SelectSQL.Text := SQL;
      TbEditoras.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbEditorasCODEDITORA.Value;
  PnlBusca.Visible := True;

end;

procedure TFEditoras.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbEditorasCODEDITORA.Value;
  TbEditoras.Close;
  TbEditoras.SelectSQL.Text := SQL;
  TbEditoras.Open;
  TbEditoras.Locate('CODEDITORA', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFEditoras.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFEditoras.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('EDITORAS', 'EXC', 1) then
    Exit;
  if (not TbEditoras.IsEmpty) and
    (MessageDlg('Deseja excluir a editora selecionada?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbEditoras.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFEditoras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFEditoras.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFEditoras.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFEditoras.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbEditoras.Bof) then
    TbEditoras.First
  else if (sender = SBLast) and (not TbEditoras.Bof) then
    TbEditoras.Prior
  else if (sender = SBNext) and (not TbEditoras.Eof) then
    TbEditoras.Next
  else if (sender = SBPrior) and (not TbEditoras.Eof) then
    TbEditoras.Last
  else
    TbEditoras.Refresh;
end;

procedure TFEditoras.FormCreate(Sender: TObject);
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

procedure TFEditoras.DSEditorasDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODEDITORA) FROM EDITORAS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFEditoras.FormShow(Sender: TObject);
begin

  SBFirstClick(SBRefresh);
end;

procedure TFEditoras.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFEditoras.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFEditoras.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFEditoras.Sintticos1Click(Sender: TObject);
begin
  if not VerificarPermissao('EDITORAS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Editoras';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
