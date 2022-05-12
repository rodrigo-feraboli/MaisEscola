unit UTrat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFTrat = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSTrat: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbTrat: TMDODataSet;
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
    TbTratCODTRAT: TSmallintField;
    TbTratDESCRICAO: TMDOStringField;
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
    procedure DSTratDataChange(Sender: TObject; Field: TField);
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
  FTrat: TFTrat;

const
  SQL = 'SELECT * FROM TRATAMENTOS WHERE CODTRAT IS NOT NULL';

implementation

uses UEdTrat, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFTrat.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFTrat.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('TRATAMENTOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbTrat.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODTRAT) FROM TRATAMENTOS';
    QryProx.Open;
    TbTratCODTRAT.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdTrat, FEdTrat);
    FEdTrat.ShowModal;
  finally
    FreeAndNil(FEdTrat);
  end;
end;

procedure TFTrat.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('TRATAMENTOS', 'EDI', 1) or TbTrat.IsEmpty then
    Exit;
  try
    TbTrat.Edit;
    Application.CreateForm(TFEdTrat, FEdTrat);
    FEdTrat.ShowModal;
  finally
    FreeAndNil(FEdTrat);
  end;
end;

procedure TFTrat.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbTrat.Close;
  TbTrat.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbTrat.SelectSQL.Add('CODTRAT')
  else
    TbTrat.SelectSQL.Add('DESCRICAO');
  TbTrat.Open;
end;

procedure TFTrat.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbTrat.Locate('CODTRAT', StrToInt(EdBusca.Text), [])
    else
      TbTrat.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFTrat.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbTrat.Close;
    TbTrat.SelectSQL.Text := SQL + ' and ';
    if RBDescricao.Checked then
      TbTrat.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbTrat.SelectSQL.Add(' CODTRAT CONTAINING '''+ EdBusca.Text +'''');
    TbTrat.Open;
    if TbTrat.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbTrat.Close;
      TbTrat.SelectSQL.Text := SQL;
      TbTrat.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbTratCODTRAT.Value;
  PnlBusca.Visible := True;

end;

procedure TFTrat.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbTratCODTRAT.Value;
  TbTrat.Close;
  TbTrat.SelectSQL.Text := SQL;
  TbTrat.Open;
  TbTrat.Locate('CODTRAT', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFTrat.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFTrat.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('TRATAMENTOS', 'EXC', 1) then
    Exit;
  if (not TbTrat.IsEmpty) and
    (MessageDlg(cgMsgDelDoenca, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbTrat.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFTrat.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFTrat.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFTrat.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFTrat.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbTrat.Bof) then
    TbTrat.First
  else if (sender = SBLast) and (not TbTrat.Bof) then
    TbTrat.Prior
  else if (sender = SBNext) and (not TbTrat.Eof) then
    TbTrat.Next
  else if (sender = SBPrior) and (not TbTrat.Eof) then
    TbTrat.Last
  else
    TbTrat.Refresh;
end;

procedure TFTrat.FormCreate(Sender: TObject);
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

procedure TFTrat.DSTratDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODTRAT) FROM TRATAMENTOS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFTrat.FormShow(Sender: TObject);
begin
  SBFirstClick(SBRefresh);
end;

procedure TFTrat.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFTrat.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFTrat.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFTrat.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('TRATAMENTOS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Tratamentos';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
