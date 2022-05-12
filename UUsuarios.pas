unit UUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFUsuarios = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSUsuarios: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbUsuarios: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    QryProx: TMDOQuery;
    TbUsuModulos: TMDODataSet;
    DSUsuModulos: TDataSource;
    TbUsuariosCODUSUARIO: TSmallintField;
    TbUsuariosLOGIN: TMDOStringField;
    TbUsuariosSENHA: TMDOStringField;
    TbUsuModulosCODUSUARIO: TSmallintField;
    TbUsuModulosCODMODULO: TSmallintField;
    TbUsuModulosNIVELCONS: TMDOStringField;
    TbUsuModulosNIVELEDI: TMDOStringField;
    TbUsuModulosNIVELEXC: TMDOStringField;
    TbUsuModulosNIVELREL: TMDOStringField;
    QryModulos: TMDOQuery;
    QryModulosCODMODULO: TIntegerField;
    QryModulosDESCRICAO: TMDOStringField;
    TbUsuModulosModulo: TStringField;
    TbUsuModulosNivelRelStr: TStringField;
    TbUsuModulosNivelExcStr: TStringField;
    TbUsuModulosNivelEdiStr: TStringField;
    TbUsuModulosNivelConsStr: TStringField;
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
    procedure DSUsuariosDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure TbUsuariosAfterOpen(DataSet: TDataSet);
    procedure TbUsuariosBeforeClose(DataSet: TDataSet);
    procedure TbUsuModulosCalcFields(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }  
  public
    { Public declarations }
    procedure CopiarModulos;
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FUsuarios: TFUsuarios;

const
  SQL = 'SELECT * FROM USUARIOS WHERE CODUSUARIO IS NOT NULL';

implementation

uses UDados, UEdUsuarios;

{$R *.dfm}

procedure TFUsuarios.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFUsuarios.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('USUÁRIOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbUsuarios.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODUSUARIO) FROM USUARIOS';
    QryProx.Open;
    TbUsuariosCODUSUARIO.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdUsuarios, FEdUsuarios);
    FEdUsuarios.ShowModal;
  finally
    FreeAndNil(FEdUsuarios);
  end;
end;

procedure TFUsuarios.SBAlterarClick(Sender: TObject);
begin
  if (not VerificarPermissao('USUÁRIOS', 'EDI', 1)) or (TbUsuarios.IsEmpty) then
    Exit;
  try
    TbUsuarios.Edit;
    Application.CreateForm(TFEdUsuarios, FEdUsuarios);
    FEdUsuarios.ShowModal;
  finally
    FreeAndNil(FEdUsuarios);
  end;
end;

procedure TFUsuarios.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbUsuarios.Close;
  TbUsuarios.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbUsuarios.SelectSQL.Add('CODUSUARIO')
  else
    TbUsuarios.SelectSQL.Add('LOGIN');
  TbUsuarios.Open;
end;

procedure TFUsuarios.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbUsuarios.Locate('CODUSUARIO', StrToInt(EdBusca.Text), [])
    else
      TbUsuarios.Locate('LOGIN', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFUsuarios.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbUsuarios.Close;
    TbUsuarios.SelectSQL.Text := SQL + ' AND ';
    if RBDescricao.Checked then
      TbUsuarios.SelectSQL.Add(' LOGIN CONTAINING '''+ EdBusca.Text +'''')
    else
      TbUsuarios.SelectSQL.Add(' CODUSUARIO CONTAINING '''+ EdBusca.Text +'''');
    TbUsuarios.Open;
    if TbUsuarios.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbUsuarios.Close;
      TbUsuarios.SelectSQL.Text := SQL;
      TbUsuarios.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
//  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbUsuariosCODUSUARIO.Value;
  PnlBusca.Visible := True;

end;

procedure TFUsuarios.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag :=  TbUsuariosCODUSUARIO.Value;
  TbUsuarios.Close;
  TbUsuarios.SelectSQL.Text := SQL;
  TbUsuarios.Open;
  TbUsuarios.Locate('CODUSUARIO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
//  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFUsuarios.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFUsuarios.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('USUÁRIOS', 'EXC', 1) then
    Exit;
  if (not TbUsuarios.IsEmpty) and
    (MessageDlg(cgMsgDelUsuario, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbUsuarios.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFUsuarios.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFUsuarios.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFUsuarios.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbUsuarios.Bof) then
    TbUsuarios.First
  else if (sender = SBLast) and (not TbUsuarios.Bof) then
    TbUsuarios.Prior
  else if (sender = SBNext) and (not TbUsuarios.Eof) then
    TbUsuarios.Next
  else if (sender = SBPrior) and (not TbUsuarios.Eof) then
    TbUsuarios.Last
  else
    TbUsuarios.Refresh;
end;

procedure TFUsuarios.FormCreate(Sender: TObject);
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

procedure TFUsuarios.DSUsuariosDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODUSUARIO) FROM USUARIOS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFUsuarios.FormShow(Sender: TObject);
begin
  SBFirstClick(SBRefresh);
end;

procedure TFUsuarios.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFUsuarios.CopiarModulos;
begin
  if not QryModulos.Active then
    QryModulos.Open;
  QryModulos.First;
    while not QryModulos.Eof do begin
      TbUsuModulos.Append;
      TbUsuModulosCODUSUARIO.Value := TbUsuariosCODUSUARIO.Value;
      TbUsuModulosCODMODULO.Value := QryModulosCODMODULO.Value;
      TbUsuModulosNIVELCONS.Value := 'T';
      TbUsuModulosNIVELEDI.Value := 'F';
      TbUsuModulosNIVELEXC.Value := 'F';
      TbUsuModulosNIVELREL.Value := 'F';
      TbUsuModulos.Post;
      QryModulos.Next;
    end;
end;

procedure TFUsuarios.TbUsuariosAfterOpen(DataSet: TDataSet);
begin
  TbUsuModulos.Open;
end;

procedure TFUsuarios.TbUsuariosBeforeClose(DataSet: TDataSet);
begin
  TbUsuModulos.Close;
end;

procedure TFUsuarios.TbUsuModulosCalcFields(DataSet: TDataSet);
begin
  TbUsuModulosNivelConsStr.Clear;
  TbUsuModulosNivelEdiStr.Clear;
  TbUsuModulosNivelExcStr.Clear;
  TbUsuModulosNivelRelStr.Clear;
  if TbUsuModulosNIVELCONS.Value = 'T' then
    TbUsuModulosNivelConsStr.Value := 'X';
  if TbUsuModulosNIVELEDI.Value = 'T' then
    TbUsuModulosNivelEdiStr.Value := 'X';
  if TbUsuModulosNIVELEXC.Value = 'T' then
    TbUsuModulosNivelExcStr.Value := 'X';
  if TbUsuModulosNIVELREL.Value = 'T' then
    TbUsuModulosNivelRelStr.Value := 'X';
end;

procedure TFUsuarios.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFUsuarios.DBGrid2DrawColumnCell(Sender: TObject;
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
