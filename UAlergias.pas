unit UAlergias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFAlergias = class(TForm)
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
    DSAlergias: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbAlergias: TMDODataSet;
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
    TbAlergiasCODALERGIA: TSmallintField;
    TbAlergiasDESCRICAO: TMDOStringField;
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
    procedure DSAlergiasDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Sinttico1Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FAlergias: TFAlergias;

const
  SQL = 'SELECT * FROM ALERGIAS WHERE CODALERGIA IS NOT NULL';

implementation

uses UEdAlergias, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFAlergias.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFAlergias.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('ALERGIAS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAlergias.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODALERGIA) FROM ALERGIAS';
    QryProx.Open;
    TbAlergiasCODALERGIA.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdAlergias, FEdAlergias);
    FEdAlergias.ShowModal;
  finally
    FreeAndNil(FEdAlergias);
  end;
end;

procedure TFAlergias.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('ALERGIAS', 'EDI', 1) or (TbAlergias.IsEmpty) then
    Exit;
  try
    TbAlergias.Edit;
    Application.CreateForm(TFEdAlergias, FEdAlergias);
    FEdAlergias.ShowModal;
  finally
    FreeAndNil(FEdAlergias);
  end;
end;

procedure TFAlergias.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbAlergias.Close;
  TbAlergias.SelectSQL.Text := SQL +' ORDER BY ';
  if sender = RBCodigo then
    TbAlergias.SelectSQL.Add('CODALERGIA')
  else
    TbAlergias.SelectSQL.Add('DESCRICAO');
  TbAlergias.Open;
end;

procedure TFAlergias.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbAlergias.Locate('CODALERGIA', StrToInt(EdBusca.Text), [])
    else
      TbAlergias.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFAlergias.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbAlergias.Close;
    TbAlergias.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbAlergias.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbAlergias.SelectSQL.Add(' CODALERGIA CONTAINING '''+ EdBusca.Text +'''');
    TbAlergias.Open;
    if TbAlergias.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbAlergias.Close;
      TbAlergias.SelectSQL.Text := SQL;
      TbAlergias.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbAlergiasCODALERGIA.Value;
  PnlBusca.Visible := True;

end;

procedure TFAlergias.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbAlergiasCODALERGIA.Value;
  TbAlergias.Close;
  TbAlergias.SelectSQL.Text := SQL;
  TbAlergias.Open;
  TbAlergias.Locate('CODALERGIA', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFAlergias.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFAlergias.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('ALERGIAS', 'EXC', 1) then
    Exit;
  if (not TbAlergias.IsEmpty) and
    (MessageDlg('Deseja excluir a alergia selecionada?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAlergias.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAlergias.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFAlergias.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFAlergias.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFAlergias.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbAlergias.Bof) then
    TbAlergias.First
  else if (sender = SBLast) and (not TbAlergias.Bof) then
    TbAlergias.Prior
  else if (sender = SBNext) and (not TbAlergias.Eof) then
    TbAlergias.Next
  else if (sender = SBPrior) and (not TbAlergias.Eof) then
    TbAlergias.Last
  else
    TbAlergias.Refresh;
end;

procedure TFAlergias.FormCreate(Sender: TObject);
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

procedure TFAlergias.DSAlergiasDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODALERGIA) FROM ALERGIAS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFAlergias.FormShow(Sender: TObject);
begin
//  Dados.ilSistema.GetBitmap(SBFirst.Glymph);
end;

procedure TFAlergias.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFAlergias.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFAlergias.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('ALERGIAS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Alergias';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

procedure TFAlergias.DBGrid2DrawColumnCell(Sender: TObject;
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

end.
