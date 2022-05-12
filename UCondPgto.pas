unit UCondPgto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFCondPgto = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSCondPgto: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbCondPgto: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
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
    TbCondPgtoCODCONDPGTO: TSmallintField;
    TbCondPgtoDESCRICAO: TMDOStringField;
    TbCondPgtoPRAZO1: TSmallintField;
    TbCondPgtoPRAZO2: TSmallintField;
    TbCondPgtoPRAZO3: TSmallintField;
    TbCondPgtoPRAZO4: TSmallintField;
    TbCondPgtoPRAZO5: TSmallintField;
    TbCondPgtoPRAZO6: TSmallintField;
    TbCondPgtoPRAZO7: TSmallintField;
    TbCondPgtoPRAZO8: TSmallintField;
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
    procedure DSCondPgtoDataChange(Sender: TObject; Field: TField);
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
  FCondPgto: TFCondPgto;

const
  SQL = 'SELECT * FROM CONDPGTO WHERE CODCONDPGTO IS NOT NULL';

implementation

uses UEdCondPgto, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFCondPgto.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFCondPgto.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('CONDIÇÕES DE PAGAMENTO', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbCondPgto.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODCONDPGTO) FROM CONDPGTO';
    QryProx.Open;
    TbCondPgtoCODCONDPGTO.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdCondPgto, FEdCondPgto);
    FEdCondPgto.ShowModal;
  finally
    FreeAndNil(FEdCondPgto);
  end;
end;

procedure TFCondPgto.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('CONDIÇÕES DE PAGAMENTO', 'EDI', 1) or TbCondPgto.IsEmpty then
    Exit;
  try
    TbCondPgto.Edit;
    Application.CreateForm(TFEdCondPgto, FEdCondPgto);
    FEdCondPgto.ShowModal;
  finally
    FreeAndNil(FEdCondPgto);
  end;
end;

procedure TFCondPgto.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbCondPgto.Close;
  TbCondPgto.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbCondPgto.SelectSQL.Add('CODCONDPGTO')
  else
    TbCondPgto.SelectSQL.Add('DESCRICAO');
  TbCondPgto.Open;
end;

procedure TFCondPgto.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbCondPgto.Locate('CODCONDPGTO', StrToInt(EdBusca.Text), [])
    else
      TbCondPgto.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFCondPgto.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbCondPgto.Close;
    TbCondPgto.SelectSQL.Text := SQL + ' and ';
    if RBDescricao.Checked then
      TbCondPgto.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbCondPgto.SelectSQL.Add(' CODCONDPGTO CONTAINING '''+ EdBusca.Text +'''');
    TbCondPgto.Open;
    if TbCondPgto.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbCondPgto.Close;
      TbCondPgto.SelectSQL.Text := SQL;
      TbCondPgto.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;
  SBBusca.Tag := TbCondPgtoCODCONDPGTO.Value;
  PnlBusca.Visible := True;

end;

procedure TFCondPgto.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbCondPgtoCODCONDPGTO.Value;
  TbCondPgto.Close;
  TbCondPgto.SelectSQL.Text := SQL;
  TbCondPgto.Open;
  TbCondPgto.Locate('CODCONDPGTO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFCondPgto.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFCondPgto.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('CONDIÇÕES DE PAGAMENTO', 'EXC', 1) then
    Exit;
  if (not TbCondPgto.IsEmpty) and
    (MessageDlg(cgMsgDelCondPgto, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbCondPgto.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFCondPgto.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFCondPgto.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFCondPgto.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFCondPgto.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbCondPgto.Bof) then
    TbCondPgto.First
  else if (sender = SBLast) and (not TbCondPgto.Bof) then
    TbCondPgto.Prior
  else if (sender = SBNext) and (not TbCondPgto.Eof) then
    TbCondPgto.Next
  else if (sender = SBPrior) and (not TbCondPgto.Eof) then
    TbCondPgto.Last
  else
    TbCondPgto.Refresh;
end;

procedure TFCondPgto.FormCreate(Sender: TObject);
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

procedure TFCondPgto.DSCondPgtoDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODCONDPGTO) FROM CONDPGTO';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFCondPgto.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFCondPgto.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFCondPgto.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFCondPgto.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONDIÇÕES DE PAGAMENTO', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Condições de Pagamento';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
