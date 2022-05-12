unit UDatasCom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFDatasCom = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSDatasCom: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbDatasCom: TMDODataSet;
    Trans: TMDOTransaction;
    TbDatasComDATA: TDateField;
    TbDatasComDESCRICAO: TMDOStringField;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    StatusBar1: TStatusBar;
    TbDatasComTIPOFERIADO: TSmallintField;
    TbDatasComCODDTCOM: TSmallintField;
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
    TbDatasComFERIADOLETIVO: TSmallintField;
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
    procedure DSDatasComDataChange(Sender: TObject; Field: TField);
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
  FDatasCom: TFDatasCom;

const
  SQL = 'SELECT * FROM DTCOM WHERE CODDTCOM IS NOT NULL';

implementation

uses UEdDatasCom, UDados;

{$R *.dfm}

procedure TFDatasCom.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFDatasCom.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('DATAS COMEMORATIVAS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbDatasCom.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODDTCOM) FROM DTCOM';
    QryProx.Open;
    TbDatasComCODDTCOM.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    TbDatasComFERIADOLETIVO.Value := 0;
    TbDatasComTIPOFERIADO.Value := 1;
    Application.CreateForm(TFEdDatasCom, FEdDatasCom);
    FEdDatasCom.ShowModal;
  finally
    FreeAndNil(FEdDatasCom);
  end;
end;

procedure TFDatasCom.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('DATAS COMEMORATIVAS', 'EDI', 1) or TbDatasCom.IsEmpty then
    Exit;
  try
    TbDatasCom.Edit;
    Application.CreateForm(TFEdDatasCom, FEdDatasCom);
    FEdDatasCom.ShowModal;
  finally
    FreeAndNil(FEdDatasCom);
  end;
end;

procedure TFDatasCom.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbDatasCom.Close;
  TbDatasCom.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbDatasCom.SelectSQL.Add('CODDTCOM')
  else if sender = RBDescricao then
    TbDatasCom.SelectSQL.Add('DESCRICAO')
  else
    TbDatasCom.SelectSQL.Add('DATA');
  TbDatasCom.Open;
end;

procedure TFDatasCom.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbDatasCom.Locate('CODDTCOM', StrToInt(EdBusca.Text), [])
    else if RBDescricao.Checked then
      TbDatasCom.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFDatasCom.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbDatasCom.Close;
    TbDatasCom.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbDatasCom.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else //if RBDescricao.Checked then
      TbDatasCom.SelectSQL.Add(' CODDTCOM CONTAINING '''+ EdBusca.Text +'''');
//    else
//      TbDatasCom.SelectSQL.Add(' DATA CONTAINING '''+ EdBusca.Text +'''');
    TbDatasCom.Open;
    if TbDatasCom.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbDatasCom.Close;
      TbDatasCom.SelectSQL.Text := SQL;
      TbDatasCom.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 107;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;
  SBBusca.Tag := TbDatasComCODDTCOM.Value;
  PnlBusca.Visible := True;

end;

procedure TFDatasCom.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbDatasComCODDTCOM.Value;
  TbDatasCom.Close;
  TbDatasCom.SelectSQL.Text := SQL;
  TbDatasCom.Open;
  TbDatasCom.Locate('CODDTCOM', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFDatasCom.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFDatasCom.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('DATAS COMEMORATIVAS', 'EXC', 1) then
    Exit; 
  if (not TbDatasCom.IsEmpty) and
    (MessageDlg(cgMsgDelDtCom, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbDatasCom.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFDatasCom.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFDatasCom.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFDatasCom.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFDatasCom.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbDatasCom.Bof) then
    TbDatasCom.First
  else if (sender = SBLast) and (not TbDatasCom.Bof) then
    TbDatasCom.Prior
  else if (sender = SBNext) and (not TbDatasCom.Eof) then
    TbDatasCom.Next
  else if (sender = SBPrior) and (not TbDatasCom.Eof) then
    TbDatasCom.Last
  else
    TbDatasCom.Refresh;
end;

procedure TFDatasCom.FormCreate(Sender: TObject);
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

procedure TFDatasCom.DSDatasComDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODDTCOM) FROM DTCOM';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFDatasCom.FormShow(Sender: TObject);
begin
//  Dados.ILSistema.GetBitmap(0, SBBusca.Glyph);
  SBFirstClick(SBRefresh);
end;

procedure TFDatasCom.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFDatasCom.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFDatasCom.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFDatasCom.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('DATAS COMEMORATIVAS', 'REL', 1) then
    Exit;
end;

end.
