unit UBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFBancos = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSBancos: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbBancos: TMDODataSet;
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
    Relatrios1: TMenuItem;
    Sinttico1: TMenuItem;
    TbBancosCODBANCO: TSmallintField;
    TbBancosDATACADASTRO: TDateField;
    TbBancosNOME: TMDOStringField;
    TbBancosFANTASIA: TMDOStringField;
    TbBancosENDERECO: TMDOStringField;
    TbBancosCODCIDADE: TSmallintField;
    TbBancosCODBAIRRO: TSmallintField;
    TbBancosBAIRRO: TMDOStringField;
    TbBancosFONE: TMDOStringField;
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
    procedure DSBancosDataChange(Sender: TObject; Field: TField);
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
  FBancos: TFBancos;

const
  SQL = 'SELECT * FROM BANCOS WHERE CODBANCO IS NOT NULL';

implementation

uses UEdBancos, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFBancos.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFBancos.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('BANCOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbBancos.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODBANCO) FROM BANCOS';
    QryProx.Open;
    TbBancosCODBANCO.Value := QryProx.Fields[0].AsInteger + 1;
    TbBancosDATACADASTRO.Value := Date;
    QryProx.Close;
    Application.CreateForm(TFEdBancos, FEdBancos);
    FEdBancos.ShowModal;
  finally
    FreeAndNil(FEdBancos);
  end;
end;

procedure TFBancos.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('BANCOS', 'EDI', 1) or TbBancos.IsEmpty then
    Exit;
  try
    TbBancos.Edit;
    Application.CreateForm(TFEdBancos, FEdBancos);
    FEdBancos.ShowModal;
  finally
    FreeAndNil(FEdBancos);
  end;
end;

procedure TFBancos.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbBancos.Close;
  TbBancos.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbBancos.SelectSQL.Add('CODBANCO')
  else
    TbBancos.SelectSQL.Add('NOME');
  TbBancos.Open;
end;

procedure TFBancos.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbBancos.Locate('CODBANCO', StrToInt(EdBusca.Text), [])
    else
      TbBancos.Locate('NOME', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFBancos.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbBancos.Close;
    TbBancos.SelectSQL.Text := SQL + ' and ';
    if RBDescricao.Checked then
      TbBancos.SelectSQL.Add(' NOME CONTAINING '''+ EdBusca.Text +'''')
    else
      TbBancos.SelectSQL.Add(' CODBANCO CONTAINING '''+ EdBusca.Text +'''');
    TbBancos.Open;
    if TbBancos.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbBancos.Close;
      TbBancos.SelectSQL.Text := SQL;
      TbBancos.Open;
      Exit;
    end;
  end;

  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;
  SBBusca.Tag := TbBancosCODBANCO.Value;
  PnlBusca.Visible := True;

end;

procedure TFBancos.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbBancosCODBANCO.Value;
  TbBancos.Close;
  TbBancos.SelectSQL.Text := SQL;
  TbBancos.Open;
  TbBancos.Locate('CODBANCO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFBancos.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFBancos.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('BANCOS', 'EXC', 1) then
    Exit;
  if (not TbBancos.IsEmpty) and
    (MessageDlg(cgMsgDelBanco, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbBancos.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFBancos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFBancos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFBancos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFBancos.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbBancos.Bof) then
    TbBancos.First
  else if (sender = SBLast) and (not TbBancos.Bof) then
    TbBancos.Prior
  else if (sender = SBNext) and (not TbBancos.Eof) then
    TbBancos.Next
  else if (sender = SBPrior) and (not TbBancos.Eof) then
    TbBancos.Last
  else
    TbBancos.Refresh;
end;

procedure TFBancos.FormCreate(Sender: TObject);
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

procedure TFBancos.DSBancosDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODBANCO) FROM BANCOS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFBancos.FormShow(Sender: TObject);
begin
//  Dados.ILSistema.GetBitmap(0, SBBusca.Glyph);
  SBFirstClick(SBRefresh);
end;

procedure TFBancos.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFBancos.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFBancos.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFBancos.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('BANCOS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Bancos';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
