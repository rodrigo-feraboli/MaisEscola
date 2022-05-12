unit UMovEst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFMovEst = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSMovEst: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbMovEst: TMDODataSet;
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
    TbMovEstNROMOV: TIntegerField;
    TbMovEstCODPRODUTO: TIntegerField;
    TbMovEstDATA: TDateField;
    TbMovEstQUANT: TMDOBCDField;
    TbMovEstTIPO: TMDOStringField;
    TbMovEstOBS: TMemoField;
    TbMovEstProduto: TStringField;
    RadioGroup1: TRadioGroup;
    TbMovEstTipoStr: TStringField;
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
    procedure DSMovEstDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure TbMovEstCalcFields(DataSet: TDataSet);
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
  FMovEst: TFMovEst;

const
  SQL = 'SELECT * FROM MOVEST WHERE NROMOV IS NOT NULL';

implementation

uses UEdMovEst, UDados;

{$R *.dfm}

procedure TFMovEst.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFMovEst.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('MOVIMENTAÇÃO DE ESTOQUE', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbMovEst.Append;
    QryProx.SQL.Text := 'SELECT MAX(NROMOV) FROM MOVEST';
    QryProx.Open;
    TbMovEstNROMOV.Value := QryProx.Fields[0].AsInteger + 1;
    TbMovEstTIPO.Value := 'E';
    QryProx.Close;
    Application.CreateForm(TFEdMovEst, FEdMovEst);
    FEdMovEst.ShowModal;
  finally
    FreeAndNil(FEdMovEst);
  end;
end;

procedure TFMovEst.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('MOVIMENTAÇÃO DE ESTOQUE', 'EDI', 1) or TbMovEst.IsEmpty then
    Exit;
  try
    TbMovEst.Edit;
    Application.CreateForm(TFEdMovEst, FEdMovEst);
    FEdMovEst.ShowModal;
  finally
    FreeAndNil(FEdMovEst);
  end;
end;

procedure TFMovEst.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbMovEst.Close;
  TbMovEst.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbMovEst.SelectSQL.Add('NROMOV')
  else
    TbMovEst.SelectSQL.Add('DESCRICAO');
  TbMovEst.Open;
end;

procedure TFMovEst.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbMovEst.Locate('NROMOV', StrToInt(EdBusca.Text), [])
    else
      TbMovEst.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFMovEst.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbMovEst.Close;
    TbMovEst.SelectSQL.Text := SQL + ' and ';
    if RBDescricao.Checked then
      TbMovEst.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbMovEst.SelectSQL.Add(' NROMOV CONTAINING '''+ EdBusca.Text +'''');
    TbMovEst.Open;
    if TbMovEst.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbMovEst.Close;
      TbMovEst.SelectSQL.Text := SQL;
      TbMovEst.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
//  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbMovEstNROMOV.Value;
  PnlBusca.Visible := True;

end;

procedure TFMovEst.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbMovEstNROMOV.Value;
  TbMovEst.Close;
  TbMovEst.SelectSQL.Text := SQL;
  TbMovEst.Open;
  TbMovEst.Locate('CODDOENCA', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
//  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFMovEst.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFMovEst.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('DOENÇAS', 'EXC', 1) then
    Exit;
  if (not TbMovEst.IsEmpty) and
    (MessageDlg(cgMsgDelDoenca, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbMovEst.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFMovEst.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFMovEst.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFMovEst.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFMovEst.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbMovEst.Bof) then
    TbMovEst.First
  else if (sender = SBLast) and (not TbMovEst.Bof) then
    TbMovEst.Prior
  else if (sender = SBNext) and (not TbMovEst.Eof) then
    TbMovEst.Next
  else if (sender = SBPrior) and (not TbMovEst.Eof) then
    TbMovEst.Last
  else
    TbMovEst.Refresh;
end;

procedure TFMovEst.FormCreate(Sender: TObject);
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

procedure TFMovEst.DSMovEstDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(NROMOV) FROM MOVEST';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFMovEst.FormShow(Sender: TObject);
begin
//  Dados.ILSistema.GetBitmap(0, SBBusca.Glyph);
end;

procedure TFMovEst.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFMovEst.TbMovEstCalcFields(DataSet: TDataSet);
begin
  if TbMovEstTIPO.Value = 'E' then
    TbMovEstTipoStr.Value := 'Entrada'
  else
    TbMovEstTipoStr.Value := 'Saída';
end;

procedure TFMovEst.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFMovEst.DBGrid2DrawColumnCell(Sender: TObject;
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
