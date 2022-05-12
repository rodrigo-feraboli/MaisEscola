unit URemedios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFRemedios = class(TForm)
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
    TbRemedios: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    TbRemediosCODREMEDIO: TSmallintField;
    TbRemediosDESCRICAO: TMDOStringField;
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
    Sintticos1: TMenuItem;
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
    procedure Sintticos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FRemedios: TFRemedios;

const
  SQL = 'SELECT * FROM REMEDIOS WHERE CODREMEDIO IS NOT NULL';

implementation

uses UEdRemedios, UDados, URelatoriosSint;

{$R *.dfm}

procedure TFRemedios.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFRemedios.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('REMÉDIOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbRemedios.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODREMEDIO) FROM REMEDIOS';
    QryProx.Open;
    TbRemediosCODREMEDIO.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdRemedios, FEdRemedios);
    FEdRemedios.ShowModal;
  finally
    FreeAndNil(FEdRemedios);
  end;
end;

procedure TFRemedios.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('REMÉDIOS', 'EDI', 1) or TbRemedios.IsEmpty then
    Exit;
  try
    TbRemedios.Edit;
    Application.CreateForm(TFEdRemedios, FEdRemedios);
    FEdRemedios.ShowModal;
  finally
    FreeAndNil(FEdRemedios);
  end;
end;

procedure TFRemedios.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbRemedios.Close;
  TbRemedios.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbRemedios.SelectSQL.Add('CODREMEDIO')
  else
    TbRemedios.SelectSQL.Add('DESCRICAO');
  TbRemedios.Open;
end;

procedure TFRemedios.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbRemedios.Locate('CODREMEDIO', StrToInt(EdBusca.Text), [])
    else
      TbRemedios.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFRemedios.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbRemedios.Close;
    TbRemedios.SelectSQL.Text := SQL + ' AND ';
    if RBDescricao.Checked then
      TbRemedios.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbRemedios.SelectSQL.Add(' CODREMEDIO CONTAINING '''+ EdBusca.Text +'''');
    TbRemedios.Open;
    if TbRemedios.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbRemedios.Close;
      TbRemedios.SelectSQL.Text := SQL;
      TbRemedios.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbRemediosCODREMEDIO.Value;
  PnlBusca.Visible := True;

end;

procedure TFRemedios.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbRemediosCODREMEDIO.Value;
  TbRemedios.Close;
  TbRemedios.SelectSQL.Text := SQL;
  TbRemedios.Open;
  TbRemedios.Locate('CODREMEDIO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFRemedios.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFRemedios.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('REMÉDIOS', 'EXC', 1) then
    Exit;
  if (not TbRemedios.IsEmpty) and
    (MessageDlg(cgMsgDelRemedio, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbRemedios.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFRemedios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFRemedios.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFRemedios.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFRemedios.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbRemedios.Bof) then
    TbRemedios.First
  else if (sender = SBLast) and (not TbRemedios.Bof) then
    TbRemedios.Prior
  else if (sender = SBNext) and (not TbRemedios.Eof) then
    TbRemedios.Next
  else if (sender = SBPrior) and (not TbRemedios.Eof) then
    TbRemedios.Last
  else
    TbRemedios.Refresh;
end;

procedure TFRemedios.FormCreate(Sender: TObject);
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

procedure TFRemedios.DSTurmasDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODREMEDIO) FROM REMEDIOS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFRemedios.FormShow(Sender: TObject);
begin
//  Dados.ILSistema.GetBitmap(0, SBBusca.Glyph);
  SBFirstClick(SBRefresh);
end;

procedure TFRemedios.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFRemedios.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFRemedios.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFRemedios.Sintticos1Click(Sender: TObject);
begin
  if not VerificarPermissao('REMÉDIOS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Remédios';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
