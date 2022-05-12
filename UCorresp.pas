unit UCorresp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFCorresp = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSCorresp: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbCorresp: TMDODataSet;
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
    TbCorrespNROORDEM: TSmallintField;
    TbCorrespESPECIE: TSmallintField;
    TbCorrespDTENV: TDateField;
    TbCorrespDTENT: TDateField;
    TbCorrespPROCED: TMDOStringField;
    TbCorrespASSUNTO: TMDOStringField;
    Relatrios1: TMenuItem;
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
    procedure DSCorrespDataChange(Sender: TObject; Field: TField);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FCorresp: TFCorresp;

const
  SQL = 'SELECT * FROM CORRESPONDENCIAS WHERE NROORDEM IS NOT NULL';

implementation

uses UDados, UEdCorresp;

{$R *.dfm}

procedure TFCorresp.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFCorresp.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('CORRESPONDENCIAS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbCorresp.Append;
    TbCorrespESPECIE.Value := 1;
    QryProx.SQL.Text := 'SELECT MAX(NROORDEM) FROM CORRESPONDENCIAS';
    QryProx.Open;
    TbCorrespNROORDEM.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdCorresp, FEdCorresp);
    FEdCorresp.ShowModal;
  finally
    FreeAndNil(FEdCorresp);
  end;
end;

procedure TFCorresp.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('CORRESPONDENCIAS', 'EDI', 1) and TbCorresp.IsEmpty then
    Exit;
  try
    TbCorresp.Edit;
    Application.CreateForm(TFEdCorresp, FEdCorresp);
    FEdCorresp.ShowModal;
  finally
    FreeAndNil(FEdCorresp);
  end;
end;

procedure TFCorresp.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbCorresp.Close;
  TbCorresp.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbCorresp.SelectSQL.Add('NROORDEM')
  else
    TbCorresp.SelectSQL.Add('ASSUNTO');
  TbCorresp.Open;
end;

procedure TFCorresp.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbCorresp.Locate('NROORDEM', StrToInt(EdBusca.Text), [])
    else
      TbCorresp.Locate('ASSUNTO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFCorresp.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbCorresp.Close;
    TbCorresp.SelectSQL.Text := SQL + ' AND ';
    if RBDescricao.Checked then
      TbCorresp.SelectSQL.Add(' ASSUNTO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbCorresp.SelectSQL.Add(' NROORDEM CONTAINING '''+ EdBusca.Text +'''');
    TbCorresp.Open;
    if TbCorresp.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbCorresp.Close;
      TbCorresp.SelectSQL.Text := SQL;
      TbCorresp.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbCorrespNROORDEM.Value;
  PnlBusca.Visible := True;

end;

procedure TFCorresp.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag :=  TbCorrespNROORDEM.Value;
  TbCorresp.Close;
  TbCorresp.SelectSQL.Text := SQL;
  TbCorresp.Open;
  TbCorresp.Locate('NROORDEM', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFCorresp.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFCorresp.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('CORRESPONDENCIAS', 'EDI', 1) then
    Exit;
  if (not TbCorresp.IsEmpty) and
    (MessageDlg(cgMsgDelEstado, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbCorresp.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFCorresp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFCorresp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFCorresp.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFCorresp.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbCorresp.Bof) then
    TbCorresp.First
  else if (sender = SBLast) and (not TbCorresp.Bof) then
    TbCorresp.Prior
  else if (sender = SBNext) and (not TbCorresp.Eof) then
    TbCorresp.Next
  else if (sender = SBPrior) and (not TbCorresp.Eof) then
    TbCorresp.Last
  else
    TbCorresp.Refresh;
end;

procedure TFCorresp.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);

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

procedure TFCorresp.DSCorrespDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(NROORDEM) FROM CORRESPONDENCIAS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFCorresp.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFCorresp.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFCorresp.DBGrid2DrawColumnCell(Sender: TObject;
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
