unit UInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFInv = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSInv: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbInv: TMDODataSet;
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
    EdBusca: TEdit;
    SBFirst: TSpeedButton;
    SBLast: TSpeedButton;
    SBNext: TSpeedButton;
    SBPrior: TSpeedButton;
    SBRefresh: TSpeedButton;
    TbInvNUM: TSmallintField;
    TbInvCODPROD: TIntegerField;
    TbInvESTOQUE: TSmallintField;
    TbInvAQUISICAO: TSmallintField;
    TbInvBAIXA: TSmallintField;
    TbInvOBS: TMemoField;
    TbInvProduto: TStringField;
    TbInvCODIGO: TIntegerField;
    Relatrios1: TMenuItem;
    Inv1: TMenuItem;
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
    procedure DSInvDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Inv1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FInv: TFInv;

const
  SQL = 'SELECT * FROM INVENTARIO WHERE NUM IS NOT NULL';

implementation

uses UEdInv, UDados;

{$R *.dfm}

procedure TFInv.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFInv.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('INVENTÁRIO DE ESTOQUE', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbInv.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODIGO) FROM INVENTARIO';
    QryProx.Open;
    TbInvCODIGO.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdInv, FEdInv);
    FEdInv.ShowModal;
  finally
    FreeAndNil(FEdInv);
  end;
end;

procedure TFInv.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('INVENTÁRIO DE ESTOQUE', 'EDI', 1) and TbInv.IsEmpty then
    Exit;
  try
    TbInv.Edit;
    Application.CreateForm(TFEdInv, FEdInv);
    FEdInv.ShowModal;
  finally
    FreeAndNil(FEdInv);
  end;
end;

procedure TFInv.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbInv.Close;
  TbInv.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbInv.SelectSQL.Add('CODIGO');
  TbInv.Open;
end;

procedure TFInv.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbInv.Locate('CODIGO', StrToInt(EdBusca.Text), [])
  end;
end;

procedure TFInv.SBBuscaClick(Sender: TObject);
begin
// VERIFICAR
{  if EdBusca.Text <> '' then begin
    TbInv.Close;
    TbInv.SelectSQL.Text := SQL + 'AND ';
    if RBDescricao.Checked then
      TbInv.SelectSQL.Add(' CODIGO CONTAINING '''+ EdBusca.Text +'''');
    TbInv.Open;
    if TbInv.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbInv.Close;
      TbInv.SelectSQL.Text := SQL;
      TbInv.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbInvNROORDEM.Value;
  PnlBusca.Visible := True;  }

end;

procedure TFInv.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag :=  TbInvCODIGO.Value;
  TbInv.Close;
  TbInv.SelectSQL.Text := SQL;
  TbInv.Open;
  TbInv.Locate('CODIGO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFInv.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFInv.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('INVENTÁRIO DE ESTOQUE', 'EXC', 1) then
    Exit;
  if (not TbInv.IsEmpty) and
    (MessageDlg(cgMsgDelEstado, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbInv.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFInv.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFInv.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFInv.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFInv.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbInv.Bof) then
    TbInv.First
  else if (sender = SBLast) and (not TbInv.Bof) then
    TbInv.Prior
  else if (sender = SBNext) and (not TbInv.Eof) then
    TbInv.Next
  else if (sender = SBPrior) and (not TbInv.Eof) then
    TbInv.Last
  else
    TbInv.Refresh;
end;

procedure TFInv.FormCreate(Sender: TObject);
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

procedure TFInv.DSInvDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODIGO) FROM INVENTARIO';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFInv.FormShow(Sender: TObject);
begin
  SBFirstClick(SBRefresh);
end;

procedure TFInv.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFInv.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFInv.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
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

procedure TFInv.Inv1Click(Sender: TObject);
begin
  if not VerificarPermissao('INVENTÁRIO DE ESTOQUE', 'REL', 1) then
    Exit;
end;

end.
