unit UProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFProdutos = class(TForm)
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
    DSProdutos: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbProdutos: TMDODataSet;
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
    TbProdutosCODPROD: TSmallintField;
    TbProdutosDESCRICAO: TMDOStringField;
    TbProdutosPRECOCOMPRA: TMDOBCDField;
    TbProdutosPRECOVENDA: TMDOBCDField;
    TbProdutosDATACAD: TDateField;
    TbProdutosDATAULTVENDA: TDateField;
    TbProdutosDATAULTCOMPRA: TDateField;
    TbProdutosESTATUAL: TMDOBCDField;
    TbProdutosESTMINIMO: TMDOBCDField;
    TbProdutosESTALERTA: TMDOBCDField;
    TbProdutosALUNOSADQ: TMDOStringField;
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
    procedure DSProdutosDataChange(Sender: TObject; Field: TField);
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
  FProdutos: TFProdutos;

const
  SQL = 'SELECT * FROM PRODUTOS WHERE CODPROD IS NOT NULL';

implementation

uses UEdProdutos, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFProdutos.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFProdutos.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('PRODUTOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbProdutos.Append;
    TbProdutosALUNOSADQ.Value := 'F';
    TbProdutosDATACAD.Value := Date;
    QryProx.SQL.Text := 'SELECT MAX(CODPROD) FROM PRODUTOS';
    QryProx.Open;
    TbProdutosCODPROD.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdProdutos, FEdProdutos);
    FEdProdutos.ShowModal;
  finally
    FreeAndNil(FEdProdutos);
  end;
end;

procedure TFProdutos.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('PRODUTOS', 'EDI', 1) or (TbProdutos.IsEmpty) then
    Exit;
  try
    TbProdutos.Edit;
    Application.CreateForm(TFEdProdutos, FEdProdutos);
    FEdProdutos.ShowModal;
  finally
    FreeAndNil(FEdProdutos);
  end;
end;

procedure TFProdutos.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbProdutos.Close;
  TbProdutos.SelectSQL.Text := SQL +' ORDER BY ';
  if sender = RBCodigo then
    TbProdutos.SelectSQL.Add('CODPROD')
  else
    TbProdutos.SelectSQL.Add('DESCRICAO');
  TbProdutos.Open;
end;

procedure TFProdutos.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbProdutos.Locate('CODPROD', StrToInt(EdBusca.Text), [])
    else
      TbProdutos.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFProdutos.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbProdutos.Close;
    TbProdutos.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbProdutos.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbProdutos.SelectSQL.Add(' CODPROD CONTAINING '''+ EdBusca.Text +'''');
    TbProdutos.Open;
    if TbProdutos.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbProdutos.Close;
      TbProdutos.SelectSQL.Text := SQL;
      TbProdutos.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbProdutosCODPROD.Value;
  PnlBusca.Visible := True;

end;

procedure TFProdutos.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbProdutosCODPROD.Value;
  TbProdutos.Close;
  TbProdutos.SelectSQL.Text := SQL;
  TbProdutos.Open;
  TbProdutos.Locate('CODPROD', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFProdutos.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFProdutos.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('PRODUTOS', 'EXC', 1) then
    Exit;
  if (not TbProdutos.IsEmpty) and
    (MessageDlg('Deseja excluir o produto selecionado?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbProdutos.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFProdutos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFProdutos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFProdutos.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbProdutos.Bof) then
    TbProdutos.First
  else if (sender = SBLast) and (not TbProdutos.Bof) then
    TbProdutos.Prior
  else if (sender = SBNext) and (not TbProdutos.Eof) then
    TbProdutos.Next
  else if (sender = SBPrior) and (not TbProdutos.Eof) then
    TbProdutos.Last
  else
    TbProdutos.Refresh;
end;

procedure TFProdutos.FormCreate(Sender: TObject);
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

procedure TFProdutos.DSProdutosDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODPROD) FROM PRODUTOS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFProdutos.FormShow(Sender: TObject);
begin
  SBFirstClick(SBRefresh);
end;

procedure TFProdutos.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFProdutos.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFProdutos.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFProdutos.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('PRODUTOS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Produtos';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
