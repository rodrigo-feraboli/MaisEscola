unit UCFOP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFCFOP = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSCFOP: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    TbCFOP: TMDODataSet;
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
    TbCFOPCODCFOP: TSmallintField;
    TbCFOPDESCRICAO: TMDOStringField;
    TbCFOPCFOP: TMDOStringField;
    DBGrid2: TDBGrid;
    Relatrios1: TMenuItem;
    CFOP1: TMenuItem;
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
    procedure DSCFOPDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CFOP1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FCFOP: TFCFOP;

const
  SQL = 'SELECT * FROM CFOP WHERE CODCFOP IS NOT NULL';

implementation

uses UEdCFOP, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFCFOP.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFCFOP.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('CFOP', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbCFOP.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODCFOP) FROM CFOP';
    QryProx.Open;
    TbCFOPCODCFOP.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdCFOP, FEdCFOP);
    FEdCFOP.ShowModal;
  finally
    FreeAndNil(FEdCFOP);
  end;
end;

procedure TFCFOP.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('CFOP', 'EDI', 1) or TbCFOP.IsEmpty then
    Exit;
  try
    TbCFOP.Edit;
    Application.CreateForm(TFEdCFOP, FEdCFOP);
    FEdCFOP.ShowModal;
  finally
    FreeAndNil(FEdCFOP);
  end;
end;

procedure TFCFOP.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbCFOP.Close;
  TbCFOP.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbCFOP.SelectSQL.Add('CODCFOP')
  else
    TbCFOP.SelectSQL.Add('DESCRICAO');
  TbCFOP.Open;
end;

procedure TFCFOP.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbCFOP.Locate('CODCFOP', StrToInt(EdBusca.Text), [])
    else
      TbCFOP.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFCFOP.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbCFOP.Close;
    TbCFOP.SelectSQL.Text := SQL + ' and ';
    if RBDescricao.Checked then
      TbCFOP.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbCFOP.SelectSQL.Add(' CODCFOP CONTAINING '''+ EdBusca.Text +'''');
    TbCFOP.Open;
    if TbCFOP.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbCFOP.Close;
      TbCFOP.SelectSQL.Text := SQL;
      TbCFOP.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbCFOPCODCFOP.Value;
  PnlBusca.Visible := True;

end;

procedure TFCFOP.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbCFOPCODCFOP.Value;
  TbCFOP.Close;
  TbCFOP.SelectSQL.Text := SQL;
  TbCFOP.Open;
  TbCFOP.Locate('CODCFOP', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFCFOP.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFCFOP.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('CFOP', 'EXC', 1) then
    Exit;
  if (not TbCFOP.IsEmpty) and
    (MessageDlg(cgMsgDelCFOP, mtConfirmation, [mbyes, mbno], 0) = IDYES) then   
    try
      TbCFOP.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFCFOP.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFCFOP.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFCFOP.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFCFOP.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbCFOP.Bof) then
    TbCFOP.First
  else if (sender = SBLast) and (not TbCFOP.Bof) then
    TbCFOP.Prior
  else if (sender = SBNext) and (not TbCFOP.Eof) then
    TbCFOP.Next
  else if (sender = SBPrior) and (not TbCFOP.Eof) then
    TbCFOP.Last
  else
    TbCFOP.Refresh;
end;

procedure TFCFOP.FormCreate(Sender: TObject);
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

procedure TFCFOP.DSCFOPDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODCFOP) FROM CFOP';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFCFOP.FormShow(Sender: TObject);
begin
//  Dados.ILSistema.GetBitmap(0, SBBusca.Glyph);
  SBFirstClick(SBRefresh);
end;

procedure TFCFOP.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFCFOP.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFCFOP.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFCFOP.CFOP1Click(Sender: TObject);
begin
  if not VerificarPermissao('CFOP', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de CFOP';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
