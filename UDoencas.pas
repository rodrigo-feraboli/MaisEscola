unit UDoencas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFDoencas = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSDoencas: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbDoencas: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    TbDoencasCODDOENCA: TSmallintField;
    TbDoencasDESCRICAO: TMDOStringField;
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
    procedure DSDoencasDataChange(Sender: TObject; Field: TField);
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
  FDoencas: TFDoencas;

const
  SQL = 'SELECT * FROM DOENCAS WHERE CODDOENCA IS NOT NULL';

implementation

uses UEdDoencas, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFDoencas.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFDoencas.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('DOENÇAS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbDoencas.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODDOENCA) FROM DOENCAS';
    QryProx.Open;
    TbDoencasCODDOENCA.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdDoencas, FEdDoencas);
    FEdDoencas.ShowModal;
  finally
    FreeAndNil(FEdDoencas);
  end;
end;

procedure TFDoencas.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('DOENÇAS', 'EDI', 1) or TbDoencas.IsEmpty then
    Exit;
  try
    TbDoencas.Edit;
    Application.CreateForm(TFEdDoencas, FEdDoencas);
    FEdDoencas.ShowModal;
  finally
    FreeAndNil(FEdDoencas);
  end;
end;

procedure TFDoencas.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbDoencas.Close;
  TbDoencas.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbDoencas.SelectSQL.Add('CODDOENCA')
  else
    TbDoencas.SelectSQL.Add('DESCRICAO');
  TbDoencas.Open;
end;

procedure TFDoencas.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbDoencas.Locate('CODDOENCA', StrToInt(EdBusca.Text), [])
    else
      TbDoencas.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFDoencas.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbDoencas.Close;
    TbDoencas.SelectSQL.Text := SQL + ' and ';
    if RBDescricao.Checked then
      TbDoencas.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbDoencas.SelectSQL.Add(' CODDOENCA CONTAINING '''+ EdBusca.Text +'''');
    TbDoencas.Open;
    if TbDoencas.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbDoencas.Close;
      TbDoencas.SelectSQL.Text := SQL;
      TbDoencas.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbDoencasCODDOENCA.Value;
  PnlBusca.Visible := True;

end;

procedure TFDoencas.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbDoencasCODDOENCA.Value;
  TbDoencas.Close;
  TbDoencas.SelectSQL.Text := SQL;
  TbDoencas.Open;
  TbDoencas.Locate('CODDOENCA', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFDoencas.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFDoencas.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('DOENÇAS', 'EXC', 1) then
    Exit;
  if (not TbDoencas.IsEmpty) and
    (MessageDlg(cgMsgDelDoenca, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbDoencas.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFDoencas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFDoencas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFDoencas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFDoencas.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbDoencas.Bof) then
    TbDoencas.First
  else if (sender = SBLast) and (not TbDoencas.Bof) then
    TbDoencas.Prior
  else if (sender = SBNext) and (not TbDoencas.Eof) then
    TbDoencas.Next
  else if (sender = SBPrior) and (not TbDoencas.Eof) then
    TbDoencas.Last
  else
    TbDoencas.Refresh;
end;

procedure TFDoencas.FormCreate(Sender: TObject);
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

procedure TFDoencas.DSDoencasDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODDOENCA) FROM DOENCAS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFDoencas.FormShow(Sender: TObject);
begin
//  Dados.ILSistema.GetBitmap(0, SBBusca.Glyph);
  SBFirstClick(SBRefresh);
end;

procedure TFDoencas.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFDoencas.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFDoencas.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFDoencas.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('DOENÇAS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Doenças';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
