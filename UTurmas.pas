unit UTurmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery, DateUtils;

type
  TFTurmas = class(TForm)
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
    TbTurmas: TMDODataSet;
    TbTurmasCODTURMA: TSmallintField;
    TbTurmasDESCRICAO: TMDOStringField;
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
    TbTurmasAtividades: TMDODataSet;
    TbTurmasCardapio: TMDODataSet;
    TbTurmasAtividadesCODTURMA: TSmallintField;
    TbTurmasAtividadesCODATIVIDADE: TSmallintField;
    TbTurmasAtividadesNROITEM: TSmallintField;
    TbTurmasAtividadesCODFUNC: TSmallintField;
    TbTurmasAtividadesDATA: TDateField;
    TbTurmasAtividadesHORAINI: TTimeField;
    TbTurmasAtividadesHORAFIN: TTimeField;
    DSTurmasAtividades: TDataSource;
    DSTurmasCardapio: TDataSource;
    SBNewAtividade: TSpeedButton;
    SBEditAtividade: TSpeedButton;
    SBDelAtividade: TSpeedButton;
    DBGrid4: TDBGrid;
    TbTurmasAtividadesAtividade: TStringField;
    TbTurmasAtividadesTIPOATIVIDADE: TMDOStringField;
    TbTurmasAtividadesSTATUS: TMDOStringField;
    SBNewCardapio: TSpeedButton;
    TbTurmasCardapioCODTURMA: TSmallintField;
    TbTurmasCardapioDATA: TDateField;
    TbTurmasCardapiosItens: TMDODataSet;
    DSTurmasCardapiosItens: TDataSource;
    TbTurmasCardapiosItensCODTURMA: TSmallintField;
    TbTurmasCardapiosItensDATA: TDateField;
    TbTurmasCardapiosItensNROITEM: TSmallintField;
    TbTurmasCardapiosItensCODREFEICAO: TSmallintField;
    TbTurmasCardapiosItensHORA: TTimeField;
    SBNewCardapioDia: TSpeedButton;
    SBEditCard: TSpeedButton;
    SpeedButton11: TSpeedButton;
    DBGrid5: TDBGrid;
    DTPCalend: TDateTimePicker;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    TbTurmasCardapiosItensRefeicao: TStringField;
    TbTurmasVLRCARNE: TMDOBCDField;
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
    procedure TbTurmasAfterOpen(DataSet: TDataSet);
    procedure SBNewAtividadeClick(Sender: TObject);
    procedure SBEditAtividadeClick(Sender: TObject);
    procedure SBDelAtividadeClick(Sender: TObject);
    procedure SBNewCardapioClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SBEditCardClick(Sender: TObject);
    procedure SBNewCardapioDiaClick(Sender: TObject);
    procedure DTPCalendChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
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
  FTurmas: TFTurmas;

const
  SQL = 'SELECT * FROM TURMAS WHERE CODTURMA IS NOT NULL';

implementation

uses UEdTurmas, UDados, UEdTurmasAtividades, UEdTurmasLancaDias,
  UEdTurmasCardapio, UEdTurmasCalRef, URelatoriosSint;

{$R *.dfm}

procedure TFTurmas.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFTurmas.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbTurmas.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODTURMA) FROM TURMAS';
    QryProx.Open;
    TbTurmasCODTURMA.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdTurmas, FEdTurmas);
    FEdTurmas.ShowModal;
  finally
    FreeAndNil(FEdTurmas);
  end;
end;

procedure TFTurmas.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'EDI', 1) or TbTurmas.IsEmpty then
    Exit;
  try
    TbTurmas.Edit;
    Application.CreateForm(TFEdTurmas, FEdTurmas);
    FEdTurmas.ShowModal;
  finally
    FreeAndNil(FEdTurmas);
  end;
end;

procedure TFTurmas.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbTurmas.Close;
  TbTurmas.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbTurmas.SelectSQL.Add('CODTURMA')
  else
    TbTurmas.SelectSQL.Add('DESCRICAO');
  TbTurmas.Open;
end;

procedure TFTurmas.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbTurmas.Locate('CODTURMA', StrToInt(EdBusca.Text), [])
    else
      TbTurmas.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFTurmas.SBBuscaClick(Sender: TObject);
begin
  // colocar um containg no SQL  da tabela e exibir somente o necessário
  if EdBusca.Text <> '' then begin
    TbTurmas.Close;
    TbTurmas.SelectSQL.Text := SQL + ' AND ';
    if RBDescricao.Checked then
      TbTurmas.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbTurmas.SelectSQL.Add(' CODTURMA CONTAINING '''+ EdBusca.Text +'''');
    TbTurmas.Open;
    if TbTurmas.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbTurmas.Close;
      TbTurmas.SelectSQL.Text := SQL;
      TbTurmas.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 107;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbTurmasCODTURMA.Value;
  PnlBusca.Visible := True;

end;

procedure TFTurmas.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbTurmasCODTURMA.Value;
  TbTurmas.Close;
  TbTurmas.SelectSQL.Text := SQL;
  TbTurmas.Open;
  TbTurmas.Locate('CODTURMA', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFTurmas.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFTurmas.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'EXC', 1) then
    exit;
  if (not TbTurmas.IsEmpty) and
    (MessageDlg(cgMsgDelTurma , mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    TbTurmasAtividades.First;
    while not TbTurmasAtividades.Eof do
      TbTurmasAtividades.Delete;


    try
      TbTurmas.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFTurmas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFTurmas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFTurmas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFTurmas.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbTurmas.Bof) then
    TbTurmas.First
  else if (sender = SBLast) and (not TbTurmas.Bof) then
    TbTurmas.Prior
  else if (sender = SBNext) and (not TbTurmas.Eof) then
    TbTurmas.Next
  else if (sender = SBPrior) and (not TbTurmas.Eof) then
    TbTurmas.Last
  else
    TbTurmas.Refresh;
end;

procedure TFTurmas.FormCreate(Sender: TObject);
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
  DTPCalend.Date := Date;
end;

procedure TFTurmas.DSTurmasDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODTURMA) FROM TURMAS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
end;

procedure TFTurmas.FormShow(Sender: TObject);
begin
//  Dados.ILSistema.GetBitmap(0, SBBusca.Glyph);
  SBFirstClick(SBRefresh);
end;

procedure TFTurmas.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFTurmas.TbTurmasAfterOpen(DataSet: TDataSet);
begin
  TbTurmasAtividades.Open;
  TbTurmasCardapio.Open;
  TbTurmasCardapiosItens.Open;
end;

procedure TFTurmas.SBNewAtividadeClick(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbTurmasAtividades.Append;
    TbTurmasAtividadesCODTURMA.Value :=  TbTurmasCODTURMA.Value;
    TbTurmasAtividadesSTATUS.Value := 'A';
    TbTurmasAtividadesTIPOATIVIDADE.Value := 'I';
    Application.CreateForm(TFEdTurmasAtividades, FEdTurmasAtividades);
    FEdTurmasAtividades.ShowModal;
  finally
    FreeAndNil(FEdTurmasAtividades);
  end;
end;

procedure TFTurmas.SBEditAtividadeClick(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'EDI', 1) or TbTurmas.IsEmpty then
    Exit;
  try
    TbTurmasAtividades.Edit;
    Application.CreateForm(TFEdTurmasAtividades, FEdTurmasAtividades);
    FEdTurmasAtividades.ShowModal;
  finally
    FreeAndNil(FEdTurmasAtividades);
  end;
end;

procedure TFTurmas.SBDelAtividadeClick(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'EXC', 1) or TbTurmas.IsEmpty then
    Exit;
  if (not TbTurmasAtividades.IsEmpty) and
    (MessageDlg(cgMsgDelAtTurma, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbTurmasAtividades.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFTurmas.SBNewCardapioClick(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'EDI', 1) then
    Exit;
  try
    Application.CreateForm(TFEdTurmasLancaDias, FEdTurmasLancaDias);
    FEdTurmasLancaDias.EdNum.Text := '1';
    FEdTurmasLancaDias.DTPIni.Date := StartOfTheWeek(Date);
    FEdTurmasLancaDias.DTPFin.Date := EndOfTheWeek(Date);
    FEdTurmasLancaDias.ShowModal;
  finally
    FreeAndNil(FEdTurmasLancaDias);
  end;
end;

procedure TFTurmas.SpeedButton11Click(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'EXC', 1) or TbTurmasCardapiosItens.IsEmpty then
    Exit;
  if (not TbTurmasCardapiosItens.IsEmpty) and
    (MessageDlg(cgMsgDelAtTurma, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbTurmasCardapiosItens.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFTurmas.SBEditCardClick(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'EDI', 1) or TbTurmas.IsEmpty then
    Exit;
  try
    TbTurmasAtividades.Edit;
    Application.CreateForm(TFEdTurmasCardapio, FEdTurmasCardapio);
    FEdTurmasCardapio.ShowModal;
  finally
    FreeAndNil(FEdTurmasCardapio);
  end;
end;

procedure TFTurmas.SBNewCardapioDiaClick(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'EDI', 1) then
    Exit;
  try
    Application.CreateForm(TFEdTurmasCardapio, FEdTurmasCardapio);
    TbTurmasCardapiosItens.Append;

    TbTurmasCardapiosItensCODTURMA.Value := TbTurmasCODTURMA.Value;
    TbTurmasCardapiosItensDATA.Value := Date;
    QryProx.SQL.Text := 'SELECT MAX(NROITEM) FROM TURMASCARDAPIOSITENS WHERE CODTURMA = '+ IntToStr(TbTurmasCODTURMA.Value) +' '+
      'AND DATA = CURRENT_DATE';
    QryProx.open;
    TbTurmasCardapiosItensNROITEM.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close; 
    FEdTurmasCardapio.ShowModal;
  finally
    FreeAndNil(FEdTurmasCardapio);
  end;
end;

procedure TFTurmas.DTPCalendChange(Sender: TObject);
begin
  TbTurmasCardapiosItens.Close;
  TbTurmasCardapiosItens.SelectSQL.Text := 'Select * from TURMASCARDAPIOSITENS WHERE CODTURMA = :CODTURMA '+
    ' AND DATA = '''+ FormatDateTime('dd.mm.yyyy', Date) +'''';
  TbTurmasCardapiosItens.Open;
end;

procedure TFTurmas.SpeedButton1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFEdTurmasCalRef, FEdTurmasCalRef);
    FEdTurmasCalRef.ShowModal;
  finally
    FreeAndNil(FEdTurmasCalRef);
  end;
end;

procedure TFTurmas.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFTurmas.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFTurmas.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Turmas';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
