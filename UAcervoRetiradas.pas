unit UAcervoRetiradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery, Mask;

type
  TFAcervoRetiradas = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QryRetiradas: TMDOQuery;
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
    PMReservas: TPopupMenu;
    GerarRetirada1: TMenuItem;
    N1: TMenuItem;
    CancelarReseva1: TMenuItem;
    QryRetiradasCODACERVO: TSmallintField;
    QryRetiradasTITULO: TMDOStringField;
    QryRetiradasDTRETIRADA: TDateField;
    QryRetiradasFUNC: TMDOStringField;
    QryRetiradasALUNO: TMDOStringField;
    QryRetiradasDIASLOCADO: TIntegerField;
    QryRetiradasStatus: TStringField;
    SBDevolucao: TSpeedButton;
    QryRetiradasDTDEV: TDateField;
    QryRetiradasDTDEVOLV: TDateField;
    QryRetiradasCODRETIRADA: TSmallintField;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DSReservasDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure SBNewItemClick(Sender: TObject);
    procedure SBPesquisaClick(Sender: TObject);
    procedure SBEditItemClick(Sender: TObject);
    procedure SBDelItensClick(Sender: TObject);
    procedure EdLivroChange(Sender: TObject);
    procedure EdAlunoChange(Sender: TObject);
    procedure EdFuncChange(Sender: TObject);
    procedure RGQuemClick(Sender: TObject);
    procedure DBLCBLivroCloseUp(Sender: TObject);
    procedure DBLCBAlunoCloseUp(Sender: TObject);
    procedure DBLCBFuncCloseUp(Sender: TObject);
    procedure QryRetiradasCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure SBDevolucaoClick(Sender: TObject);
    procedure DBLCBLivroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAcervoRetiradas: TFAcervoRetiradas;

implementation

uses UDados, DateUtils, UAcervo, UEdAcervoRet, UEdAcervoDev;

{$R *.dfm}

procedure TFAcervoRetiradas.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFAcervoRetiradas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFAcervoRetiradas.DSReservasDataChange(Sender: TObject; Field: TField);
begin
  LblQtde.Caption := IntToStr(QryRetiradas.RecordCount) + ' registro(s) encontrado(s)';
end;

procedure TFAcervoRetiradas.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFAcervoRetiradas.FormCreate(Sender: TObject);
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

procedure TFAcervoRetiradas.SBNewItemClick(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EDI', 1) then // ** RETIRADA DO ACERVO
    Exit;
  try
    FAcervo.ConfTrans(True);
    FAcervo.TbAcervoRetiradas.Append;
    FAcervo.TbAcervoRetiradasCODACERVO.Value := DBLCBLivro.KeyValue;
    FAcervo.TbAcervoRetiradasDTRETIRADA.Value := Date;
//    FAcervo.TbAcervoRetiradasSTATUS.Value := 'A';
    FAcervo.TbAcervoRetiradasQUEM.Value := 1;
    Application.CreateForm(TFEdAcervoRet, FEdAcervoRet);
    FEdAcervoRet.ShowModal;
  finally
    FreeAndNil(FEdAcervoRet);
    FAcervo.ConfTrans(True);
    SBPesquisaClick(nil);
  end;
end;

procedure TFAcervoRetiradas.SBPesquisaClick(Sender: TObject);
var
  vlFiltroSQL: String;
begin
  vlFiltroSQL := 'FROM ACERVORETIRADAS AR '+
    'LEFT JOIN ALUNOS AL ON AL.CODALUNO = AR.CODALUNO '+
    'LEFT JOIN FUNC F ON F.CODFUNC = AR.CODFUNC '+
    'INNER JOIN ACERVO A ON A.CODACERVO = AR.CODACERVO WHERE AR.CODACERVO IS NOT NULL ';
  if CBIni.Checked then
    vlFiltroSQL := vlFiltroSQL + ' AND AR.DTRETIRADA >=:plDtIni';
  if CBFin.Checked then
    vlFiltroSQL := vlFiltroSQL +  ' AND AR.DTRETIRADA <=:plDtFin';
  case RGStatus.ItemIndex of
    1: vlFiltroSQL := vlFiltroSQL + ' AND AR.DTDEV <= CURRENT_DATE AND AR.DTDEVOLV IS NULL ';
    2: vlFiltroSQL := vlFiltroSQL + ' AND AR.DTDEV > CURRENT_DATE AND AR.DTDEVOLV IS NULL';
    3: vlFiltroSQL := vlFiltroSQL + ' AND AR.DTDEVOLV IS NOT NULL AND AR.DTDEVOLV <= AR.DTDEV ';
    4: vlFiltroSQL := vlFiltroSQL + ' AND AR.DTDEVOLV IS NOT NULL AND AR.DTDEVOLV > AR.DTDEV ';
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
  QryRetiradas.Close;
  QryRetiradas.SQL.Text := 'SELECT AR.CODACERVO, AR.CODRETIRADA, A.TITULO, AR.DTRETIRADA, F.NOME AS FUNC,  AL.NOME AS ALUNO, AR.DTDEV,'+
    'AR.DTDEVOLV, CURRENT_DATE - AR.DTRETIRADA AS DIASLOCADO '+  vlFiltroSQL;
  if CBIni.Checked then
    QryRetiradas.ParamByName('plDtIni').AsDate := DTPIni.Date;
  if CBFin.Checked then
    QryRetiradas.ParamByName('plDtFin').AsDate := DTPFin.Date;
  QryRetiradas.Open;
  FAcervo.QryProx.Close;
  FAcervo.QryProx.SQL.Text := 'SELECT COUNT(AR.CODACERVO) '+  vlFiltroSQL;
  if CBIni.Checked then
    FAcervo.QryProx.ParamByName('plDtIni').AsDate := DTPIni.Date;
  if CBFin.Checked then
    FAcervo.QryProx.ParamByName('plDtFin').AsDate := DTPFin.Date;
  FAcervo.QryProx.Open;
  LblQtde.Caption := IntToStr(FAcervo.QryProx.Fields[0].AsInteger) + ' retiradas encontradas';
  FAcervo.QryProx.Close;
end;

procedure TFAcervoRetiradas.SBEditItemClick(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EDI', 1) or QryRetiradas.IsEmpty then  // ** RESERVA DO ACERVO
    Exit;
  try
    FAcervo.ConfTrans(True);
    FAcervo.TbAcervoRetiradas.Locate('CODACERVO', QryRetiradasCODACERVO.Value, []);
    FAcervo.TbAcervoRetiradas.Locate('CODRETIRADA', QryRetiradasCODRETIRADA.Value, []);
    FAcervo.TbAcervoRetiradas.Edit;
    Application.CreateForm(TFEdAcervoRet, FEdAcervoRet);
    FEdAcervoRet.ShowModal;
  finally
    FreeAndNil(FEdAcervoRet);
    SBPesquisaClick(nil);
  end;
end;

procedure TFAcervoRetiradas.SBDelItensClick(Sender: TObject);
begin
  FAcervo.ConfTrans(True);
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EXC', 1) then // ** RESERVA DO ACERVO
    Exit;
  if (not QryRetiradas.IsEmpty) and
    (MessageDlg('Deseja excluir a retirada selecionada?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try  
      FAcervo.TbAcervoRetiradas.Locate('CODACERVO', QryRetiradasCODACERVO.Value, []);
      FAcervo.TbAcervoRetiradas.Locate('CODRETIRADA', QryRetiradasCODRETIRADA.Value, []);
      FAcervo.TbAcervoRetiradas.Delete;
      FAcervo.ConfTrans(True);
    except
      FAcervo.ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
  SBPesquisaClick(nil);    
end;

procedure TFAcervoRetiradas.EdLivroChange(Sender: TObject);
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

procedure TFAcervoRetiradas.EdAlunoChange(Sender: TObject);
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

procedure TFAcervoRetiradas.EdFuncChange(Sender: TObject);
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

procedure TFAcervoRetiradas.RGQuemClick(Sender: TObject);
begin
  LblAluno.Visible := RGQuem.ItemIndex = 0;
  LblFunc.Visible :=  RGQuem.ItemIndex = 1;
  EdFunc.Visible := LblFunc.Visible;
  EdAluno.Visible := LblAluno.Visible;
  DBLCBAluno.Visible := LblAluno.Visible;
  DBLCBFunc.Visible := LblFunc.Visible;
  Dados.QryFuncLK.FetchAll;
end;

procedure TFAcervoRetiradas.DBLCBLivroCloseUp(Sender: TObject);
begin
  try
    EdLivro.Text := IntToStr(DBLCBLivro.KeyValue);
  except
    EdLivro.Clear;
  end;
end;

procedure TFAcervoRetiradas.DBLCBAlunoCloseUp(Sender: TObject);
begin
  try
    EdAluno.Text := IntToStr(DBLCBAluno.KeyValue);
  except
    EdAluno.Clear;
  end;
end;

procedure TFAcervoRetiradas.DBLCBFuncCloseUp(Sender: TObject);
begin
  try
    EdFunc.Text := IntToStr(DBLCBFunc.KeyValue);
  except
    EdFunc.Clear;
  end;
end;

procedure TFAcervoRetiradas.QryRetiradasCalcFields(DataSet: TDataSet);
begin
//  if QryReservasDIASLOCADO.Value
end;

procedure TFAcervoRetiradas.FormShow(Sender: TObject);
begin
  DBLCBLivroCloseUp(nil);
  DBLCBAlunoCloseUp(nil);
  DBLCBFuncCloseUp(nil);
end;

procedure TFAcervoRetiradas.SBDevolucaoClick(Sender: TObject);
begin
  FAcervo.ConfTrans(True);
  if not QryRetiradasDTDEVOLV.IsNull then begin
    MessageDlg('Este livro já foi devolvido!', mtWarning, [mbOk], 0);
    Exit;
  end;
  try
    FAcervo.ConfTrans(True);
    FAcervo.TbAcervoRetiradas.Locate('CODACERVO', QryRetiradasCODACERVO.Value, []);
    FAcervo.TbAcervoRetiradas.Locate('CODRETIRADA', QryRetiradasCODRETIRADA.Value, []);
    FAcervo.TbAcervoRetiradas.Edit;

//    FAcervo.TbAcervoRetiradasDTDEVOLV.Value := Date;
    Application.CreateForm(TFEdAcervoDev, FEdAcervoDev);
    if not QryRetiradasALUNO.IsNull then begin
      FEdAcervoDev.Lbl.Caption := 'Aluno';
      FEdAcervoDev.LblQuem.Caption := QryRetiradasALUNO.Value;
    end else begin
      FEdAcervoDev.Lbl.Caption := 'Fornecedor';
      FEdAcervoDev.LblQuem.Caption := QryRetiradasFUNC.Value;
    end;
      
    FEdAcervoDev.ShowModal;
  finally
    FreeAndNil(FEdAcervoDev);
  end;
end;

procedure TFAcervoRetiradas.DBLCBLivroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = Vk_Back then
    (Sender as TDBLookupComboBox).KeyValue := 0;
end;

end.
