unit UProfissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFProfissoes = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSTurmas: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbProfissoes: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    TbProfissoesCODPROFISSAO: TSmallintField;
    TbProfissoesDESCRICAO: TMDOStringField;
    TbProfissoesVALORHORA: TMDOBCDField;
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
    procedure DSTurmasDataChange(Sender: TObject; Field: TField);
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
  FProfissoes: TFProfissoes;

const
  SQL = 'SELECT * FROM PROFISSOES WHERE CODPROFISSAO IS NOT NULL';

implementation

uses UEdProfissoes, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFProfissoes.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFProfissoes.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('PROFISSÕES', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbProfissoes.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODPROFISSAO) FROM PROFISSOES';
    QryProx.Open;
    TbProfissoesCODPROFISSAO.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdProfissoes, FEdProfissoes);
    FEdProfissoes.ShowModal;
  finally
    FreeAndNil(FEdProfissoes);
  end;
end;

procedure TFProfissoes.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('PROFISSÕES', 'EDI', 1) or TbProfissoes.IsEmpty then
    Exit;
  try
    TbProfissoes.Edit;
    Application.CreateForm(TFEdProfissoes, FEdProfissoes);
    FEdProfissoes.ShowModal;
  finally
    FreeAndNil(FEdProfissoes);
  end;
end;

procedure TFProfissoes.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbProfissoes.Close;
  TbProfissoes.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbProfissoes.SelectSQL.Add('CODPROFISSAO')
  else
    TbProfissoes.SelectSQL.Add('DESCRICAO');
  TbProfissoes.Open;
end;

procedure TFProfissoes.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbProfissoes.Locate('CODPROFISSAO', StrToInt(EdBusca.Text), [])
    else
      TbProfissoes.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFProfissoes.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbProfissoes.Close;
    TbProfissoes.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbProfissoes.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbProfissoes.SelectSQL.Add(' CODPROFISSAO CONTAINING '''+ EdBusca.Text +'''');
    TbProfissoes.Open;
    if TbProfissoes.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbProfissoes.Close;
      TbProfissoes.SelectSQL.Text := SQL;
      TbProfissoes.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbProfissoesCODPROFISSAO.Value;
  PnlBusca.Visible := True;

end;

procedure TFProfissoes.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbProfissoesCODPROFISSAO.Value;
  TbProfissoes.Close;
  TbProfissoes.SelectSQL.Text := SQL;
  TbProfissoes.Open;
  TbProfissoes.Locate('CODPROFISSAO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFProfissoes.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFProfissoes.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('PROFISSÕES', 'EXC', 1) then
    Exit;
  if (not TbProfissoes.IsEmpty) and
    (MessageDlg(cgMsgDelProfissao, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbProfissoes.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFProfissoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFProfissoes.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFProfissoes.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFProfissoes.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbProfissoes.Bof) then
    TbProfissoes.First
  else if (sender = SBLast) and (not TbProfissoes.Bof) then
    TbProfissoes.Prior
  else if (sender = SBNext) and (not TbProfissoes.Eof) then
    TbProfissoes.Next
  else if (sender = SBPrior) and (not TbProfissoes.Eof) then
    TbProfissoes.Last
  else
    TbProfissoes.Refresh;
end;

procedure TFProfissoes.FormCreate(Sender: TObject);
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

procedure TFProfissoes.DSTurmasDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODPROFISSAO) FROM PROFISSOES';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFProfissoes.FormShow(Sender: TObject);
begin
//  Dados.ILSistema.GetBitmap(0, SBBusca.Glyph);
  SBFirstClick(SBRefresh);
end;

procedure TFProfissoes.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFProfissoes.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFProfissoes.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFProfissoes.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('PROFISSÕES', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Profissões';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
