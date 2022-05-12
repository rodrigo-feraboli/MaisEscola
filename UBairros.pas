unit UBairros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFBairros = class(TForm)
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
    DSBairros: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbBairros: TMDODataSet;
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
    TbBairrosCODBAIRRO: TSmallintField;
    TbBairrosDESCRICAO: TMDOStringField;
    QryProx: TMDOQuery;
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
    procedure DSBairrosDataChange(Sender: TObject; Field: TField);
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
  FBairros: TFBairros;

const
  SQL = 'SELECT * FROM BAIRROS WHERE CODBAIRRO IS NOT NULL';

implementation

uses UEdBairros, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFBairros.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFBairros.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('BAIRROS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbBairros.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODBAIRRO) FROM BAIRROS';
    QryProx.Open;
    TbBairrosCODBAIRRO.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdBairros, FEdBairros);
    FEdBairros.ShowModal;
  finally
    FreeAndNil(FEdBairros);
  end;
end;

procedure TFBairros.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('BAIRROS', 'EDI', 1) or (TbBairros.IsEmpty) then
    Exit;
  try
    TbBairros.Edit;
    Application.CreateForm(TFEdBairros, FEdBairros);
    FEdBairros.ShowModal;
  finally
    FreeAndNil(FEdBairros);
  end;
end;

procedure TFBairros.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbBairros.Close;
  TbBairros.SelectSQL.Text := SQL +' ORDER BY ';
  if sender = RBCodigo then
    TbBairros.SelectSQL.Add('CODBAIRRO')
  else
    TbBairros.SelectSQL.Add('DESCRICAO');
  TbBairros.Open;
end;

procedure TFBairros.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbBairros.Locate('CODBAIRRO', StrToInt(EdBusca.Text), [])
    else
      TbBairros.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFBairros.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbBairros.Close;
    TbBairros.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbBairros.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbBairros.SelectSQL.Add(' CODBAIRRO CONTAINING '''+ EdBusca.Text +'''');
    TbBairros.Open;
    if TbBairros.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbBairros.Close;
      TbBairros.SelectSQL.Text := SQL;
      TbBairros.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbBairrosCODBAIRRO.Value;
  PnlBusca.Visible := True;

end;

procedure TFBairros.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbBairrosCODBAIRRO.Value;
  TbBairros.Close;
  TbBairros.SelectSQL.Text := SQL;
  TbBairros.Open;
  TbBairros.Locate('CODBAIRRO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFBairros.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFBairros.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('BAIRROS', 'EXC', 1) then
    Exit;
  if (not TbBairros.IsEmpty) and
    (MessageDlg(cgEspDescBairro, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbBairros.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFBairros.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFBairros.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFBairros.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFBairros.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbBairros.Bof) then
    TbBairros.First
  else if (sender = SBLast) and (not TbBairros.Bof) then
    TbBairros.Prior
  else if (sender = SBNext) and (not TbBairros.Eof) then
    TbBairros.Next
  else if (sender = SBPrior) and (not TbBairros.Eof) then
    TbBairros.Last
  else
    TbBairros.Refresh;
end;

procedure TFBairros.FormCreate(Sender: TObject);
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

procedure TFBairros.DSBairrosDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODBAIRRO) FROM BAIRROS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFBairros.FormShow(Sender: TObject);
begin
//  Dados.ilSistema.GetBitmap(SBFirst.Glymph);
  SBFirstClick(SBRefresh);
end;

procedure TFBairros.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFBairros.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFBairros.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFBairros.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('BAIRROS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Bairros';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
