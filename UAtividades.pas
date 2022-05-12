unit UAtividades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFAtividades = class(TForm)
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
    DSAtividades: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbAtividades: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    LblQtde: TLabel;
    SBFirst: TSpeedButton;
    SBLast: TSpeedButton;
    SBNext: TSpeedButton;
    SBPrior: TSpeedButton;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    QryProx: TMDOQuery;
    SBRefresh: TSpeedButton;
    TbAtividadesDESCRICAO: TMDOStringField;
    TbAtividadesCODATIVIDADE: TSmallintField;
    Relatrios1: TMenuItem;
    Atividades1: TMenuItem;
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
    procedure DSAtividadesDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Atividades1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FAtividades: TFAtividades;

const
  SQL = 'SELECT * FROM ATIVIDADES WHERE CODATIVIDADE IS NOT NULL';

implementation

uses UEdAtividades, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFAtividades.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFAtividades.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('TIPOS DE ATIVIDADES', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAtividades.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODATIVIDADE) FROM ATIVIDADES';
    QryProx.Open;
    TbAtividadesCODATIVIDADE.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdAtividades, FEdAtividades);
    FEdAtividades.ShowModal;
  finally
    FreeAndNil(FEdAtividades);
  end;
end;

procedure TFAtividades.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('ATIVIDADES', 'EDI', 1) or (TbAtividades.IsEmpty) then
    Exit;
  try
    TbAtividades.Edit;
    Application.CreateForm(TFEdAtividades, FEdAtividades);
    FEdAtividades.ShowModal;
  finally
    FreeAndNil(FEdAtividades);
  end;
end;

procedure TFAtividades.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbAtividades.Close;
  TbAtividades.SelectSQL.Text := SQL +' ORDER BY ';
  if sender = RBCodigo then
    TbAtividades.SelectSQL.Add('CODATIVIDADE')
  else
    TbAtividades.SelectSQL.Add('DESCRICAO');
  TbAtividades.Open;
end;

procedure TFAtividades.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbAtividades.Locate('CODATIVIDADE', StrToInt(EdBusca.Text), [])
    else
      TbAtividades.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFAtividades.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbAtividades.Close;
    TbAtividades.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbAtividades.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbAtividades.SelectSQL.Add(' CODATIVIDADE CONTAINING '''+ EdBusca.Text +'''');
    TbAtividades.Open;
    if TbAtividades.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbAtividades.Close;
      TbAtividades.SelectSQL.Text := SQL;
      TbAtividades.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbAtividadesCODATIVIDADE.Value;
  PnlBusca.Visible := True;

end;

procedure TFAtividades.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbAtividadesCODATIVIDADE.Value;
  TbAtividades.Close;
  TbAtividades.SelectSQL.Text := SQL;
  TbAtividades.Open;
  TbAtividades.Locate('CODATIVIDADE', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFAtividades.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFAtividades.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('ATIVIDADES', 'EXC', 1) then
    Exit;
  if (not TbAtividades.IsEmpty) and
    (MessageDlg('Deseja excluir a atividade selecionada?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAtividades.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAtividades.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFAtividades.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFAtividades.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFAtividades.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbAtividades.Bof) then
    TbAtividades.First
  else if (sender = SBLast) and (not TbAtividades.Bof) then
    TbAtividades.Prior
  else if (sender = SBNext) and (not TbAtividades.Eof) then
    TbAtividades.Next
  else if (sender = SBPrior) and (not TbAtividades.Eof) then
    TbAtividades.Last
  else
    TbAtividades.Refresh;
end;

procedure TFAtividades.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);

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

procedure TFAtividades.DSAtividadesDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODATIVIDADE) FROM ATIVIDADES';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFAtividades.FormShow(Sender: TObject);
begin
//  Dados.ilSistema.GetBitmap(SBFirst.Glymph);
  SBFirstClick(SBRefresh);
end;

procedure TFAtividades.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFAtividades.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFAtividades.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFAtividades.Atividades1Click(Sender: TObject);
begin
  if not VerificarPermissao('ATIVIDADES', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Atividades';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
