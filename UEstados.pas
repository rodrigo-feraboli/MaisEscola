unit UEstados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFEstados = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSEstados: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbEstados: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    TbEstadosCODESTADO: TSmallintField;
    TbEstadosUF: TMDOStringField;
    TbEstadosDESCRICAO: TMDOStringField;
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
    procedure DSEstadosDataChange(Sender: TObject; Field: TField);
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
  FEstados: TFEstados;

const
  SQL = 'SELECT * FROM ESTADOS WHERE CODESTADO IS NOT NULL';

implementation

uses UEdEstados, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFEstados.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFEstados.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('ESTADOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbEstados.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODESTADO) FROM ESTADOS';
    QryProx.Open;
    TbEstadosCODESTADO.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdEstados, FEdEstados);
    FEdEstados.ShowModal;
  finally
    FreeAndNil(FEdEstados);
  end;
end;

procedure TFEstados.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('ESTADOS', 'EDI', 1) and TbEstados.IsEmpty then
    Exit;
  try
    TbEstados.Edit;
    Application.CreateForm(TFEdEstados, FEdEstados);
    FEdEstados.ShowModal;
  finally
    FreeAndNil(FEdEstados);
  end;
end;

procedure TFEstados.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbEstados.Close;
  TbEstados.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbEstados.SelectSQL.Add('CODESTADO')
  else
    TbEstados.SelectSQL.Add('DESCRICAO');
  TbEstados.Open;
end;

procedure TFEstados.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbEstados.Locate('CODESTADO', StrToInt(EdBusca.Text), [])
    else
      TbEstados.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFEstados.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbEstados.Close;
    TbEstados.SelectSQL.Text := SQL + ' AND ';
    if RBDescricao.Checked then
      TbEstados.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbEstados.SelectSQL.Add(' CODESTADO CONTAINING '''+ EdBusca.Text +'''');
    TbEstados.Open;
    if TbEstados.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbEstados.Close;
      TbEstados.SelectSQL.Text := SQL;
      TbEstados.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbEstadosCODESTADO.Value;
  PnlBusca.Visible := True;

end;

procedure TFEstados.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag :=  TbEstadosCODESTADO.Value;
  TbEstados.Close;
  TbEstados.SelectSQL.Text := SQL;
  TbEstados.Open;
  TbEstados.Locate('CODESTADO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFEstados.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFEstados.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('ESTADOS', 'EDI', 1) then
    Exit;
  if (not TbEstados.IsEmpty) and
    (MessageDlg(cgMsgDelEstado, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbEstados.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFEstados.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFEstados.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFEstados.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFEstados.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbEstados.Bof) then
    TbEstados.First
  else if (sender = SBLast) and (not TbEstados.Bof) then
    TbEstados.Prior
  else if (sender = SBNext) and (not TbEstados.Eof) then
    TbEstados.Next
  else if (sender = SBPrior) and (not TbEstados.Eof) then
    TbEstados.Last
  else
    TbEstados.Refresh;
end;

procedure TFEstados.FormCreate(Sender: TObject);
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

procedure TFEstados.DSEstadosDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODESTADO) FROM ESTADOS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFEstados.FormShow(Sender: TObject);
begin
//  Dados.ILSistema.GetBitmap(0, SBBusca.Glyph);
  SBFirstClick(SBRefresh);
end;

procedure TFEstados.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFEstados.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFEstados.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFEstados.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('BAIRROS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Estados';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
