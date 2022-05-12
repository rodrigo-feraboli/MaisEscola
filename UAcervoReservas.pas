unit UAcervoReservas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery, Mask;

type
  TFAcervoReservas = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QryReservas: TMDOQuery;
    DSReservas: TDataSource;
    DBGrid1: TDBGrid;
    LblQtde: TLabel;
    SBDelItens: TSpeedButton;
    SBEditItem: TSpeedButton;
    SBNewItem: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    EdLivro: TEdit;
    DBLCBLivro: TDBLookupComboBox;
    CBIni: TCheckBox;
    DTPIni: TDateTimePicker;
    CBFin: TCheckBox;
    DTPFin: TDateTimePicker;
    RGStatus: TRadioGroup;
    LblAluno: TLabel;
    LblFunc: TLabel;
    EdAluno: TEdit;
    DBLCBAluno: TDBLookupComboBox;
    EdFunc: TEdit;
    DBLCBFunc: TDBLookupComboBox;
    RGQuem: TRadioGroup;
    SBPesquisa: TSpeedButton;
    QryReservasTITULO: TMDOStringField;
    QryReservasDTRESERVA: TDateField;
    QryReservasNOME: TMDOStringField;
    QryReservasNOME1: TMDOStringField;
    QryReservasST: TMDOStringField;
    PMReservas: TPopupMenu;
    GerarRetirada1: TMenuItem;
    N1: TMenuItem;
    CancelarReseva1: TMenuItem;
    QryReservasCODACERVO: TSmallintField;
    QryReservasCODRESERVA: TSmallintField;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DSReservasDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure SBNewItemClick(Sender: TObject);
    procedure SBPesquisaClick(Sender: TObject);
    procedure CancelarReseva1Click(Sender: TObject);
    procedure SBEditItemClick(Sender: TObject);
    procedure SBDelItensClick(Sender: TObject);
    procedure EdLivroChange(Sender: TObject);
    procedure EdAlunoChange(Sender: TObject);
    procedure EdFuncChange(Sender: TObject);
    procedure RGQuemClick(Sender: TObject);
    procedure DBLCBLivroCloseUp(Sender: TObject);
    procedure DBLCBAlunoCloseUp(Sender: TObject);
    procedure DBLCBFuncCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLCBLivroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAcervoReservas: TFAcervoReservas;

implementation

uses UDados, UAlunos, DateUtils, UAcervo, UEdAcervoRes;

{$R *.dfm}

procedure TFAcervoReservas.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFAcervoReservas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFAcervoReservas.DSReservasDataChange(Sender: TObject; Field: TField);
begin
  LblQtde.Caption := IntToStr(QryReservas.RecordCount) + ' registro(s) encontrado(s)';
end;

procedure TFAcervoReservas.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFAcervoReservas.FormCreate(Sender: TObject);
begin
  FAcervo.LKTela;
  DTPIni.Date := Date;
  DTPFin.Date := Date + 30;
  DBLCBLivro.KeyValue := FAcervo.TbAcervoCODACERVO.Value;
  DBLCBAluno.KeyValue := 0;
  DBLCBFunc.KeyValue := 0;
  RGQuemClick(nil);
  SBPesquisaClick(nil);
end;

procedure TFAcervoReservas.SBNewItemClick(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EDI', 1) then // ** RESERVA DO ACERVO
    Exit;
  try
    FAcervo.ConfTrans(True);
    FAcervo.TbAcervoReservas.Append;
    FAcervo.TbAcervoReservasTIPORESERVA.Value := 0;
    FAcervo.TbAcervoReservasCODACERVO.Value := DBLCBLivro.KeyValue;
    FAcervo.TbAcervoReservasDTRESERVA.Value := Date;
    FAcervo.TbAcervoReservasSTATUS.Value := 'A';
    FAcervo.TbAcervoReservasQUEM.Value := 1; 
    Application.CreateForm(TFEdAcervoRes, FEdAcervoRes);
    FEdAcervoRes.ShowModal;
  finally
    FreeAndNil(FEdAcervoRes);
    FAcervo.ConfTrans(True);
    SBPesquisaClick(nil);
  end;
end;

procedure TFAcervoReservas.SBPesquisaClick(Sender: TObject);
var
  vlFiltroSQL: String;
begin
  vlFiltroSQL := 'FROM ACERVORESERVAS AR '+
    'LEFT JOIN ALUNOS AL ON AL.CODALUNO = AR.CODALUNO '+
    'LEFT JOIN FUNC F ON F.CODFUNC = AR.CODFUNC '+
    'INNER JOIN ACERVO A ON A.CODACERVO = AR.CODACERVO WHERE AR.CODACERVO IS NOT NULL ';
  if CBIni.Checked then
    vlFiltroSQL := vlFiltroSQL + ' AND AR.DTRESERVA >=:plDtIni';
  if CBFin.Checked then
    vlFiltroSQL := vlFiltroSQL +  ' AND AR.DTRESERVA <=:plDtFin';   
  case RGStatus.ItemIndex of
    1: vlFiltroSQL := vlFiltroSQL + ' AND AR.STATUS = ''A'' ';
    2: vlFiltroSQL := vlFiltroSQL + ' AND AR.STATUS = ''C'' ';
    3: vlFiltroSQL := vlFiltroSQL + ' AND AR.STATUS = ''O'' ';
  end;
  case RGQuem.ItemIndex of
    0: if DBLCBAluno.Text <> '' then
      vlFiltroSQL := vlFiltroSQL + ' AND AR.CODALUNO = '+ IntToStr(DBLCBAluno.KeyValue);
    1: if DBLCBFunc.Text <> '' then
      vlFiltroSQL := vlFiltroSQL + ' AND AR.CODFUNC = '+ IntToStr(DBLCBFunc.KeyValue);
  end;
  if DBLCBLivro.Text <> '' then
    vlFiltroSQL := vlFiltroSQL +  ' AND AR.CODACERVO = '+ IntToStr(DBLCBLivro.KeyValue);
  FAcervo.LKTela;
  QryReservas.Close;
  QryReservas.SQL.Text := 'SELECT AR.CODACERVO, AR.CODRESERVA, A.TITULO, AR.DTRESERVA, F.NOME,  AL.NOME, CAST(CASE AR.STATUS WHEN ''A'' THEN ''Aguardando'' '+
    'WHEN ''C'' THEN ''Cancelada'' ELSE ''Concluída'' END AS VARCHAR(10)) AS ST '+  vlFiltroSQL;
  if CBIni.Checked then
    QryReservas.ParamByName('plDtIni').AsDate := DTPIni.Date;
  if CBFin.Checked then
    QryReservas.ParamByName('plDtFin').AsDate := DTPFin.Date;
  QryReservas.Open;
  FAcervo.QryProx.Close;
  FAcervo.QryProx.SQL.Text := 'SELECT COUNT(AR.STATUS) '+  vlFiltroSQL;
  if CBIni.Checked then
    FAcervo.QryProx.ParamByName('plDtIni').AsDate := DTPIni.Date;
  if CBFin.Checked then
    FAcervo.QryProx.ParamByName('plDtFin').AsDate := DTPFin.Date;
  FAcervo.QryProx.Open;
  LblQtde.Caption := IntToStr(FAcervo.QryProx.Fields[0].AsInteger) + ' reservas encontradas';
  FAcervo.QryProx.Close;
end;

procedure TFAcervoReservas.CancelarReseva1Click(Sender: TObject);
begin
  FAcervo.TbAcervoReservas.Locate('CODACERVO', QryReservasCODACERVO.Value, []);
  FAcervo.TbAcervoReservas.Locate('CODRESERVA', QryReservasCODRESERVA.Value, []);
  if FAcervo.TbAcervoReservasSTATUS.Value = 'C' then begin
    MessageDlg('Esta reserva já está cancelada!', mtWarning, [mbOk], 0);
    exit;
  end;
  if FAcervo.TbAcervoReservasSTATUS.Value = 'O' then begin
    MessageDlg('Esta reserva já está concluída e não pode ser cancelada!', mtWarning, [mbOk], 0);
    exit;
  end;
  FAcervo.TbAcervoReservas.Edit;
  FAcervo.TbAcervoReservasSTATUS.Value := 'C';
  FAcervo.TbAcervoReservas.Post;
  FAcervo.ConfTrans(True);  
  SBPesquisaClick(nil);
end;

procedure TFAcervoReservas.SBEditItemClick(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EDI', 1) or QryReservas.IsEmpty then  // ** RESERVA DO ACERVO
    Exit;
  try
    FAcervo.TbAcervoReservas.Locate('CODACERVO', QryReservasCODACERVO.Value, []);
    FAcervo.TbAcervoReservas.Locate('CODRESERVA', QryReservasCODRESERVA.Value, []);
    FAcervo.TbAcervoReservas.Edit;
    Application.CreateForm(TFEdAcervoRes, FEdAcervoRes);
    FEdAcervoRes.ShowModal;
  finally
    FreeAndNil(FEdAcervoRes);
    SBPesquisaClick(nil);
  end;
end;

procedure TFAcervoReservas.SBDelItensClick(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EXC', 1) then // ** RESERVA DO ACERVO
    Exit;
  if (not QryReservas.IsEmpty) and
    (MessageDlg('Deseja excluir a reserva selecionada?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      FAcervo.TbAcervoReservas.Locate('CODACERVO', QryReservasCODACERVO.Value, []);
      FAcervo.TbAcervoReservas.Locate('CODRESERVA', QryReservasCODRESERVA.Value, []);
      FAcervo.TbAcervoReservas.Delete;
      FAcervo.ConfTrans(True);
    except
      FAcervo.ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
  SBPesquisaClick(nil);    
end;

procedure TFAcervoReservas.EdLivroChange(Sender: TObject);
begin
  try
    if EdLivro.Text <> '' then begin
      SBNewItem.Tag := StrToInt(EdLivro.Text);
      DBLCBLivro.KeyValue := SBNewItem.Tag;
    end;
  except
    EdLivro.Text := '';
  end;
end;

procedure TFAcervoReservas.EdAlunoChange(Sender: TObject);
begin
  try
    if EdAluno.Text <> '' then begin
      SBNewItem.Tag := StrToInt(EdAluno.Text);
      DBLCBAluno.KeyValue := SBNewItem.Tag;
    end;
  except
    EdAluno.Text := '';
  end;
end;

procedure TFAcervoReservas.EdFuncChange(Sender: TObject);
begin
  try
    if EdFunc.Text <> '' then begin
      SBNewItem.Tag := StrToInt(EdFunc.Text);
      DBLCBFunc.KeyValue := SBNewItem.Tag;
    end;
  except
    EdFunc.Text := '';
  end;
end;

procedure TFAcervoReservas.RGQuemClick(Sender: TObject);
begin
  LblAluno.Visible := RGQuem.ItemIndex = 0;
  LblFunc.Visible :=  RGQuem.ItemIndex = 1;
  EdFunc.Visible := LblFunc.Visible;
  EdAluno.Visible := LblAluno.Visible;
  DBLCBAluno.Visible := LblAluno.Visible;
  DBLCBFunc.Visible := LblFunc.Visible;
  Dados.QryFuncLK.FetchAll;
end;

procedure TFAcervoReservas.DBLCBLivroCloseUp(Sender: TObject);
begin
  try
    EdLivro.Text := IntToStr(DBLCBLivro.KeyValue);
  except
    EdLivro.Clear;
  end;
end;

procedure TFAcervoReservas.DBLCBAlunoCloseUp(Sender: TObject);
begin
  try
    EdAluno.Text := IntToStr(DBLCBAluno.KeyValue);
  except
    EdAluno.Clear;
  end;
end;

procedure TFAcervoReservas.DBLCBFuncCloseUp(Sender: TObject);
begin
  try
    EdFunc.Text := IntToStr(DBLCBFunc.KeyValue);
  except
    EdFunc.Clear;
  end;
end;

procedure TFAcervoReservas.FormShow(Sender: TObject);
begin
  DBLCBLivroCloseUp(nil);
  DBLCBAlunoCloseUp(nil);
  DBLCBFuncCloseUp(nil);
end;

procedure TFAcervoReservas.DBLCBLivroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = Vk_Back then 
    (Sender as TDBLookupComboBox).KeyValue := 0;
end;

end.
