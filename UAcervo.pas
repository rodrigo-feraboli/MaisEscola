unit UAcervo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery, MDOTable;

type
  TFAcervo = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    DSAcervo: TDataSource;
    TbAcervo: TMDODataSet;
    Trans: TMDOTransaction;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    QryProx: TMDOQuery;
    SBRefresh: TSpeedButton;
    SBPrior: TSpeedButton;
    SBNext: TSpeedButton;
    SBLast: TSpeedButton;
    SBFirst: TSpeedButton;
    Label1: TLabel;
    LblQtde: TLabel;
    RBCodigo: TRadioButton;
    RBDescricao: TRadioButton;
    EdBusca: TEdit;
    TbAcervoCODACERVO: TIntegerField;
    TbAcervoTITULO: TMDOStringField;
    TbAcervoCODAUTOR1: TSmallintField;
    TbAcervoCODAUTOR2: TSmallintField;
    TbAcervoCODAUTOR3: TSmallintField;
    TbAcervoCODEDITORA: TSmallintField;
    TbAcervoCODBARRAS: TMDOStringField;
    TbAcervoPRECO: TMDOBCDField;
    DBGrid1: TDBGrid;
    DBGrid3: TDBGrid;
    SBDelItens: TSpeedButton;
    SBEditItem: TSpeedButton;
    SBNewItem: TSpeedButton;
    StatusBar1: TStatusBar;
    DSAcervoItens: TDataSource;
    TbAcervoItens: TMDODataSet;
    TbAcervoItensCODACERVO: TSmallintField;
    TbAcervoItensNUMREG: TSmallintField;
    TbAcervoItensEDICAO: TSmallintField;
    TbAcervoItensIMPRENTA: TMDOStringField;
    TbAcervoItensESTADO: TSmallintField;
    TbAcervoItensOBS: TMemoField;
    TbAcervoItensFORMA: TSmallintField;
    TbAcervoItensDTREG: TDateField;
    TbAcervoCODGENERO: TSmallintField;
    LblQtde2: TLabel;
    TbAcervoItensCODBARRAS: TMDOStringField;
    TbAcervoReservas: TMDODataSet;
    DSAcervoReservas: TDataSource;
    TbAcervoRetiradas: TMDODataSet;
    DSAcervoRetiradas: TDataSource;
    TbAcervoReservasCODACERVO: TSmallintField;
    TbAcervoReservasCODRESERVA: TSmallintField;
    TbAcervoReservasDTRESERVA: TDateField;
    TbAcervoReservasSTATUS: TMDOStringField;
    TbAcervoReservasCODALUNO: TSmallintField;
    TbAcervoReservasCODFUNC: TSmallintField;
    LblQtde3: TLabel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Label2: TLabel;
    Label4: TLabel;
    TbAcervoReservasQUEM: TSmallintField;
    TbAcervoRetiradasCODACERVO: TSmallintField;
    TbAcervoRetiradasCODRETIRADA: TSmallintField;
    TbAcervoRetiradasCODRESERVA: TSmallintField;
    TbAcervoRetiradasDTRETIRADA: TDateField;
    TbAcervoRetiradasDTDEV: TDateField;
    TbAcervoRetiradasDTDEVOLV: TDateField;
    TbAcervoRetiradasSTATUS: TMDOStringField;
    TbAcervoRetiradasCODALUNO: TSmallintField;
    TbAcervoRetiradasCODFUNC: TSmallintField;
    TbAcervoRetiradasVLRMULTA: TMDOBCDField;
    TbAcervoRetiradasQUEM: TSmallintField;
    LblQtde4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    SBReservas: TSpeedButton;
    SpeedButton2: TSpeedButton;
    TbAcervoReservasTIPORESERVA: TSmallintField;
    TbAcervoReservasNUMREG: TSmallintField;
    TbAcervoReservasStatusStr: TStringField;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
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
    procedure DSAcervoDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure TbAcervoAfterOpen(DataSet: TDataSet);
    procedure TbAcervoAfterClose(DataSet: TDataSet);
    procedure SBNewItemClick(Sender: TObject);
    procedure SBEditItemClick(Sender: TObject);
    procedure SBDelItensClick(Sender: TObject);
    procedure TbAcervoReservasCalcFields(DataSet: TDataSet);
    procedure CancelarRetirada1Click(Sender: TObject);
    procedure GerarRetirada1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SBReservasClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Sinttico1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
    procedure LKTela;
  end;

var
  FAcervo: TFAcervo;

const
  SQL = 'SELECT * FROM ACERVO WHERE CODACERVO IS NOT NULL';

implementation

uses UEdAcervo, UDados, UEdAcervoItens, UEdAcervoRes, UEdAcervoRet,
  UAcervoReservas, UAcervoRetiradas, URelatoriosSint;

{$R *.dfm}

procedure TFAcervo.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryAcervosLK.Open;
  Dados.QryAlunosLK.Open;
  Dados.QryFuncLK.Open;
end;

procedure TFAcervo.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFAcervo.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAcervo.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODACERVO) FROM ACERVO';
    QryProx.Open;
    TbAcervoCODACERVO.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdAcervo, FEdAcervo);
    FEdAcervo.ShowModal;
  finally
    FreeAndNil(FEdAcervo);
  end;
end;

procedure TFAcervo.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EDI', 1) or TbAcervo.IsEmpty then
    Exit;
  try
    TbAcervo.Edit;
    Application.CreateForm(TFEdAcervo, FEdAcervo);
    FEdAcervo.ShowModal;
  finally
    FreeAndNil(FEdAcervo);
  end;
end;

procedure TFAcervo.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbAcervo.Close;
  TbAcervo.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbAcervo.SelectSQL.Add('CODACERVO')
  else
    TbAcervo.SelectSQL.Add('TITULO');
  TbAcervo.Open;
end;

procedure TFAcervo.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbAcervo.Locate('CODACERVO', StrToInt(EdBusca.Text), [])
    else
      TbAcervo.Locate('TITULO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFAcervo.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbAcervo.Close;
    TbAcervo.SelectSQL.Text := SQL + ' AND ';
    if RBDescricao.Checked then
      TbAcervo.SelectSQL.Add(' TITULO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbAcervo.SelectSQL.Add(' CODACERVO CONTAINING '''+ EdBusca.Text +'''');
    TbAcervo.Open;
    if TbAcervo.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbAcervo.Close;
      TbAcervo.SelectSQL.Text := SQL;
      TbAcervo.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 105;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbAcervoCODACERVO.Value;
  PnlBusca.Visible := True;

end;

procedure TFAcervo.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbAcervoCODACERVO.Value;
  TbAcervo.Close;
  TbAcervo.SelectSQL.Text := SQL;
  TbAcervo.Open;
  TbAcervo.Locate('CODACERVO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFAcervo.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFAcervo.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EXC', 1) then
    Exit;
  if (not TbAcervo.IsEmpty) and
    (MessageDlg('Deseja excluir o acervo literário selecionado?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAcervoReservas.First;
      TbAcervoRetiradas.First;
      while not TbAcervoReservas.Eof do
        TbAcervoReservas.Delete;
      while not TbAcervoRetiradas.Eof do
        TbAcervoRetiradas.Delete;
      TbAcervo.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAcervo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFAcervo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFAcervo.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFAcervo.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbAcervo.Bof) then
    TbAcervo.First
  else if (sender = SBLast) and (not TbAcervo.Bof) then
    TbAcervo.Prior
  else if (sender = SBNext) and (not TbAcervo.Eof) then
    TbAcervo.Next
  else if (sender = SBPrior) and (not TbAcervo.Eof) then
    TbAcervo.Last
  else
    TbAcervo.Refresh;
end;

procedure TFAcervo.FormCreate(Sender: TObject);
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

procedure TFAcervo.DSAcervoDataChange(Sender: TObject; Field: TField);
begin
  LblQtde.Caption :=  IntToStr(TbAcervo.RecordCount) + ' registros encontrados';
  QryProx.SQL.Text := 'SELECT COUNT(NUMREG) from ACERVOITENS Where CODACERVO = '+ IntToStr(FAcervo.TbAcervoCODACERVO.Value);
  QryProx.Open;
  LblQtde2.Caption := IntToStr(QryProx.Fields[0].AsInteger) +' exemplares encontrados';
  QryProx.Close;

  TbAcervoRetiradas.Close;
  QryProx.SQL.Text := 'SELECT COUNT(CODACERVO) from ACERVORESERVAS Where STATUS = ''A'' AND CODACERVO = '+ IntToStr(FAcervo.TbAcervoCODACERVO.Value);
  QryProx.Open;
  LblQtde3.Caption := IntToStr(QryProx.Fields[0].AsInteger) +' reservas encontradas';
  QryProx.Close;
  TbAcervoRetiradas.Open;

  TbAcervoRetiradas.Close;
  QryProx.SQL.Text := 'SELECT COUNT(CODACERVO) from ACERVORETIRADAS Where CODACERVO = '+ IntToStr(FAcervo.TbAcervoCODACERVO.Value);
  QryProx.Open;
  LblQtde4.Caption := IntToStr(QryProx.Fields[0].AsInteger) +' retiradas encontradas';
  QryProx.Close;
  TbAcervoRetiradas.Open;
end;

procedure TFAcervo.FormShow(Sender: TObject);
begin
  SBFirstClick(SBRefresh);
end;

procedure TFAcervo.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFAcervo.TbAcervoAfterOpen(DataSet: TDataSet);
begin
  TbAcervoItens.Open;
  TbAcervoReservas.Open;
  TbAcervoRetiradas.Open;
end;

procedure TFAcervo.TbAcervoAfterClose(DataSet: TDataSet);
begin
  TbAcervoItens.Close;
  TbAcervoReservas.Close;
  TbAcervoRetiradas.Close;
end;

procedure TFAcervo.SBNewItemClick(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAcervoItens.Append;
    TbAcervoItensESTADO.Value := 1;
    TbAcervoItensCODACERVO.Value := TbAcervoCODACERVO.Value;
    QryProx.SQL.Text := 'SELECT MAX(NUMREG) FROM ACERVOITENS';
    QryProx.Open;
    TbAcervoItensNUMREG.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdAcervoItens, FEdAcervoItens);
    FEdAcervoItens.ShowModal;
  finally
    FreeAndNil(FEdAcervoItens);
  end;
end;

procedure TFAcervo.SBEditItemClick(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EDI', 1) or TbAcervoItens.IsEmpty then
    Exit;
  try
    TbAcervoItens.Edit;
    Application.CreateForm(TFEdAcervoItens, FEdAcervoItens);
    FEdAcervoItens.ShowModal;
  finally
    FreeAndNil(FEdAcervoItens);
  end;
end;

procedure TFAcervo.SBDelItensClick(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EXC', 1) then
    Exit;
  if (not TbAcervoItens.IsEmpty) and
    (MessageDlg('Deseja excluir o item selecionado?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAcervoItens.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAcervo.TbAcervoReservasCalcFields(DataSet: TDataSet);
begin
  if TbAcervoReservasSTATUS.Value = 'A' then
    TbAcervoReservasStatusStr.Value := 'Aguardando'
  else if TbAcervoReservasSTATUS.Value = 'C' then
    TbAcervoReservasStatusStr.Value := 'Concluído'
  else if TbAcervoReservasSTATUS.Value = 'N' then
    TbAcervoReservasStatusStr.Value := 'Cancelado';
end;

procedure TFAcervo.CancelarRetirada1Click(Sender: TObject);
begin
  if TbAcervoReservasSTATUS.Value <> 'A' then begin
    MessageDlg('Esta reserva não está aberta para o cancelamento da mesma!', mtWarning, [mbOK], 0);
    Exit;
  end;
  try
    TbAcervoReservas.Edit;
    TbAcervoReservasSTATUS.Value := 'N';
    TbAcervoReservas.Post;
    ConfTrans(True);
    MessageDlg('Reserva cancelada com sucesso!', mtInformation, [mbOk],0);
  except
    ConfTrans(False);
    MessageDlg('Erro ao cancelar a reserva!', mtWarning, [mbOk],0);
  end;
end;

procedure TFAcervo.GerarRetirada1Click(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'EDI', 1) then // ** RETIRADA DO ACERVO
    Exit;
  try
    ConfTrans(True);
    TbAcervoRetiradas.Append;
    TbAcervoRetiradasCODACERVO.Value := TbAcervoCODACERVO.Value;

    TbAcervoRetiradasCODRESERVA.Value := TbAcervoReservasCODRESERVA.Value;
    TbAcervoRetiradasDTRETIRADA.Value := Date;
    TbAcervoRetiradasSTATUS.Value := 'A';
    TbAcervoRetiradasQUEM.Value := TbAcervoReservasQUEM.Value;
    if not TbAcervoReservasCODALUNO.IsNull then
      TbAcervoRetiradasCODALUNO.Value := TbAcervoReservasCODALUNO.Value;
    if not TbAcervoRetiradasCODFUNC.IsNull then
      TbAcervoRetiradasCODFUNC.Value := TbAcervoReservasCODFUNC.Value; 

    QryProx.SQL.Text := 'SELECT MAX(CODRETIRADA) FROM ACERVORETIRADAS WHERE CODACERVO = '+ IntToStr(TbAcervoCODACERVO.Value);
    QryProx.Open;
    TbAcervoRetiradasCODRESERVA.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;

    Application.CreateForm(TFEdAcervoRet, FEdAcervoRet);
    FEdAcervoRet.ShowModal;
  finally
    FreeAndNil(FEdAcervoRet);
  end;
end;

procedure TFAcervo.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFAcervo.SBReservasClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFAcervoReservas,FAcervoReservas);
    FAcervoReservas.EdLivro.Text := IntToStr(TbAcervoCODACERVO.Value);
    FAcervoReservas.ShowModal;
  finally
    FreeAndNil(FAcervoReservas);
  end;
end;

procedure TFAcervo.SpeedButton2Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFAcervoRetiradas, FAcervoRetiradas);
    FAcervoRetiradas.ShowModal;
  finally
    FreeAndNil(FAcervoRetiradas);
  end;

end;

procedure TFAcervo.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFAcervo.Sinttico1Click(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Acervo';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

end.
