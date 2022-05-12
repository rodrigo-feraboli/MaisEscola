unit UCReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Mask, Menus, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, DB, MDOQuery, MDODatabase, MDOCustomDataSet, ComCtrls;

type
  TFCReceber = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    PnlInfo: TPanel;
    DSCRParcs: TDataSource;
    DSCR: TDataSource;
    TbCR: TMDODataSet;
    TbCRParcs: TMDODataSet;
    Trans: TMDOTransaction;
    TbCRParcsSituacaoStr: TStringField;
    DBGrid2: TDBGrid;
    Label223: TLabel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    PnlSup: TPanel;
    SBRefresh: TSpeedButton;
    SBPrior: TSpeedButton;
    SBNext: TSpeedButton;
    SBLast: TSpeedButton;
    SBFirst: TSpeedButton;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    SBBusca: TSpeedButton;
    Label9: TLabel;
    LblQtde: TLabel;
    RBCodigo: TRadioButton;
    RBDescricao: TRadioButton;
    EdBusca: TEdit;
    StatusBar1: TStatusBar;
    SBNewItem: TSpeedButton;
    SBDelParc: TSpeedButton;
    SBAltItem: TSpeedButton;
    QryAux: TMDOQuery;
    PnlSearch: TPanel;
    DBLCBForn: TDBLookupComboBox;
    DBLCBBanco: TDBLookupComboBox;
    DBTST1: TEdit;
    DBTST: TEdit;
    CBForn: TCheckBox;
    CBBanco: TCheckBox;
    DBGridSearch: TDBGrid;
    GroupBox1: TGroupBox;
    CBLctoIni: TCheckBox;
    DTPLctoIni: TDateTimePicker;
    CBLctoFin: TCheckBox;
    DTPLctoFin: TDateTimePicker;
    GroupBox2: TGroupBox;
    CBVctoIni: TCheckBox;
    DTPVencIni: TDateTimePicker;
    CBVctoFin: TCheckBox;
    DTPVencFin: TDateTimePicker;
    LblQtde2: TLabel;
    QrySearch: TMDOQuery;
    DSSearch: TDataSource;
    SBOK: TSpeedButton;
    SBCanc: TSpeedButton;
    SpeedButton3: TSpeedButton;
    RGStatus: TRadioGroup;
    GroupBox3: TGroupBox;
    RBAll: TRadioButton;
    RBMen: TRadioButton;
    RBIgu: TRadioButton;
    RBMai: TRadioButton;
    EdDinDin: TEdit;
    DBLCBCC: TDBLookupComboBox;
    DBTST2: TEdit;
    CBCC: TCheckBox;
    StatusBar2: TStatusBar;
    STAbertas: TStaticText;
    STPagas: TStaticText;
    STNPagas: TStaticText;
    PopupMenu1: TPopupMenu;
    Baixar1: TMenuItem;
    N1: TMenuItem;
    Cancelar1: TMenuItem;
    Relatrios1: TMenuItem;
    ContasaPagar1: TMenuItem;
    TbCRCliente: TStringField;
    TbCROBSStr: TStringField;
    QrySearchNROCRECEBER: TSmallintField;
    QrySearchNROPARC: TSmallintField;
    QrySearchFORN: TMDOStringField;
    QrySearchBANC: TMDOStringField;
    QrySearchCC: TMDOStringField;
    QrySearchLCTO: TDateField;
    QrySearchVCTO: TDateField;
    QrySearchVLRPARC: TMDOBCDField;
    QrySearchSTATUS: TMDOStringField;
    TbCRNROCRECEBER: TSmallintField;
    TbCRCODCONDPGTO: TSmallintField;
    TbCRNROVENDA: TSmallintField;
    TbCRCODBANCO: TSmallintField;
    TbCRCODGEN: TSmallintField;
    TbCRDATA: TDateField;
    TbCROBS: TMemoField;
    TbCRCODCC: TSmallintField;
    TbCRParcsNROCRECEBER: TSmallintField;
    TbCRParcsNROPARC: TSmallintField;
    TbCRParcsVCTOPARC: TDateField;
    TbCRParcsVLRPARC: TMDOBCDField;
    TbCRParcsPGTOPARC: TDateField;
    TbCRParcsVLRPAGO: TMDOBCDField;
    TbCRParcsSITUACAO: TMDOStringField;
    TbCRParcsDATAGERA: TDateField;
    TbCRParcsVLRMULTA: TMDOBCDField;
    TbCRParcsVLRDESC: TMDOBCDField;
    TbCRParcsNROCHEQUE: TMDOStringField;
    TbCRParcsAGENCIA: TMDOStringField;
    TbCRParcsCODBANCO: TSmallintField;
    procedure Sair1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TbCRParcsCalcFields(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RBCodigoClick(Sender: TObject);
    procedure TbCRAfterOpen(DataSet: TDataSet);
    procedure SBFirstClick(Sender: TObject);
    procedure SBNovoClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBDelParcClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBSairClick(Sender: TObject);
    procedure SBAltItemClick(Sender: TObject);
    procedure SBNewItemClick(Sender: TObject);
    procedure SBBuscaClick(Sender: TObject);
    procedure SBOKClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure RBAllClick(Sender: TObject);
    procedure DBLCBFornCloseUp(Sender: TObject);
    procedure DBLCBBancoCloseUp(Sender: TObject);
    procedure DBLCBCCCloseUp(Sender: TObject);
    procedure DBTSTExit(Sender: TObject);
    procedure DBTST1Exit(Sender: TObject);
    procedure DBTST2Exit(Sender: TObject);
    procedure EdDinDinChange(Sender: TObject);
    procedure DSCRDataChange(Sender: TObject; Field: TField);
    procedure Cancelar1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure Baixar1Click(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridSearchDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FCReceber: TFCReceber;

const
  SQL = 'SELECT * FROM CRECEBER WHERE NROCRECEBER IS NOT NULL';

implementation

uses UDados, UEdCR, UEdCRParcs, Math, UBaixaCR, URelatoriosCP;

{$R *.dfm}

procedure TFCReceber.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryFornLK.Open;
  Dados.QryBancosLK.Open;
  Dados.QryCCLK.Open;
end;

procedure TFCReceber.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFCReceber.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFCReceber.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then
    if not (PnlSearch.Visible) then
      Close
    else
      SBOKClick(SBCanc);
end;

procedure TFCReceber.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{ TbCR.Close;
  TbCRParcs.Close;
  TransactionCP.Active := False;
  Action := caFree;}
end;

procedure TFCReceber.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  RBCodigoClick(nil);
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar2.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  STAbertas.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  STNPagas.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  STPagas.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Dados.ILSistema.GetBitmap(0, SBFirst.Glyph);
  Dados.ILSistema.GetBitmap(1, SBLast.Glyph);
  Dados.ILSistema.GetBitmap(2, SBNext.Glyph);
  Dados.ILSistema.GetBitmap(3, SBPrior.Glyph);
  Dados.ILSistema.GetBitmap(4, SBRefresh.Glyph);
  Dados.ILSistema.GetBitmap(5, SBBusca.Glyph);  
  RBCodigoClick(nil);
end;

procedure TFCReceber.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1 then
    AbreAjuda
  {else if (TbCRParcs.State in [dsbrowse]) then begin
    if key = Vk_F3 then
      SpeedButton3Click(nil)
    else if (Key = Vk_F5) then
      MDOTbCRParcs.Refresh
    else if (Key = Vk_Home) then
      MDOTbCRParcs.First
    else if (Key = 34) then
      MDOTbCRParcs.Prior
    else if (Key = 35) then
      MDOTbCRParcs.Next
    else if (Key = Vk_End) then
      MDOTbCRParcs.Last
    else if (Shift = [ssShift]) and (Key = Vk_Delete) then
      BitBtnExcluirClick (nil)
  end;  }
end;

procedure TFCReceber.TbCRParcsCalcFields(DataSet: TDataSet);
begin
 if TbCRParcsSITUACAO.Value = 'A' then
    TbCRParcsSituacaoStr.Value := 'Aberto'
  else if TbCRParcsSITUACAO.Value = 'P' then
    TbCRParcsSituacaoStr.Value := 'Pago'
  else if TbCRParcsSITUACAO.Value = 'C' then
    TbCRParcsSituacaoStr.Value := 'Cancelado';
end;

procedure TFCReceber.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlSearch.Visible;
  if CanClose = True then begin
    if (TbCRParcs.IsEmpty) and not (TBCR.IsEmpty) then begin
      MessageDlg('Especifique os itens da Conta a Receber, antes de sair de Conta a Receber!', mtWarning, [mbok], 0);
      CanClose := False;
    end;
  end;
end;

procedure TFCReceber.RBCodigoClick(Sender: TObject);
begin
  TbCR.Close;
  TbCR.SelectSQL.Text := SQL;
  if RBCodigo.Checked then
    TbCR.SelectSQL.Add ('ORDER BY NROCRECEBER')
  else
    TbCR.SelectSQL.Add ('ORDER BY DATA');
  TbCR.Open;
end;

procedure TFCReceber.TbCRAfterOpen(DataSet: TDataSet);
begin
  TbCRParcs.Open;
end;

procedure TFCReceber.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbCR.Bof) then
    TbCR.First
  else if (sender = SBLast) and (not TbCR.Bof) then
    TbCR.Prior
  else if (sender = SBNext) and (not TbCR.Eof) then
    TbCR.Next
  else if (sender = SBPrior) and (not TbCR.Eof) then
    TbCR.Last
  else
    TbCR.Refresh;
end;

procedure TFCReceber.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A RECEBER', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbCR.Append;
    QryAux.SQL.Text := 'SELECT MAX(NROCRECEBER) FROM CRECEBER';
    QryAux.Open;
    TbCRNROCRECEBER.Value := QryAux.Fields[0].AsInteger + 1;
    QryAux.Close;
    TbCRDATA.Value := Date;
    Application.CreateForm(TFEdCR, FEdCR);
    FEdCR.ShowModal;
  finally
    FreeAndNil(FEdCR);
  end;
end;

procedure TFCReceber.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A RECEBER', 'EXC', 1) then
    Exit;
  if (not TbCR.IsEmpty) and
    (MessageDlg(cgMsgDelCP, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbCRParcs.First;
      while not TbCRParcs.Eof do
        TbCRParcs.Delete;
      TbCR.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFCReceber.SBDelParcClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A RECEBER', 'EXC', 1) then
    Exit;
  if (not TbCRParcs.IsEmpty) and
    (MessageDlg(cgMsgDelCRParc, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbCRParcs.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFCReceber.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A RECEBER', 'EDI', 1) then
    Exit;
  if TbCR.IsEmpty then
    Exit;
  try
    TbCR.Edit;
    Application.CreateForm(TFEdCR, FEdCR);
    FEdCR.ShowModal;
  finally
    FreeAndNil(FEdCR);
  end;
end;

procedure TFCReceber.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFCReceber.SBAltItemClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A RECEBER', 'EDI', 1) then
    Exit;
  if TbCRParcs.IsEmpty then
    Exit;
  try
    TbCRParcs.Edit;
    Application.CreateForm(TFEdCRParcs, FEdCRParcs);
    FEdCRParcs.ShowModal;
  finally
    FreeAndNil(FEdCRParcs);
  end;
end;

procedure TFCReceber.SBNewItemClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A RECEBER', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbCRParcs.Append;
    TbCRParcsNROCRECEBER.Value := TbCRNROCRECEBER.Value;
    QryAux.SQL.Text := 'SELECT MAX(NROPARC) FROM CRECEBERPARCS WHERE NROCRECEBER = '+ IntToStr(TbCRNROCRECEBER.Value);
    QryAux.Open;
    TbCRParcsNROPARC.Value := QryAux.Fields[0].AsInteger + 1;
    QryAux.Close;
    TbCRParcsDATAGERA.Value := Date;
    TbCRParcsSITUACAO.Value := 'A';
    Application.CreateForm(TFEdCRParcs, FEdCRParcs);
    FEdCRParcs.ShowModal;
  finally
    FreeAndNil(FEdCRParcs);
  end;
end;

procedure TFCReceber.SBBuscaClick(Sender: TObject);
begin
  DTPLctoIni.Date := Date;
  DTPLctoFin.Date := Date - 30;
  DTPVencIni.Date := Date;
  DTPVencFin.Date := Date - 30;
  PnlSearch.Top := 0;
  PnlSearch.Left := 0;
  Arquivo1.Visible := False;
  Relatrios1.Visible := Arquivo1.Visible;
  PnlSup.Enabled := Arquivo1.Visible;
  PnlInfo.Enabled := Arquivo1.Visible;
  LblQtde2.Caption := '';
  Caption := 'Busca de Contas a Receber';
  LKTela;
  PnlSearch.Visible := not Arquivo1.Visible;
end;

procedure TFCReceber.SBOKClick(Sender: TObject);
begin
  if (sender = SBOK) or (Sender = DBGridSearch) then begin
    TbCR.Locate('NROCRECEBER', QrySearchNROCRECEBER.Value, []);
    TbCRParcs.Locate('NROPARC', QrySearchNROPARC.Value, []);
  end;

  Arquivo1.Visible := True;
  Relatrios1.Visible := Arquivo1.Visible;
  PnlSup.Enabled := Arquivo1.Visible;
  PnlInfo.Enabled := Arquivo1.Visible;
  Caption := 'Cadastro de Contas a Receber';
  PnlSearch.Visible := not Arquivo1.Visible;
end;

procedure TFCReceber.SpeedButton3Click(Sender: TObject);
  var
    vlSQLFiltro, vlSQLFiltroAux: String;
  procedure CalcAbertas;
  begin
    QryAux.SQL.Text := 'SELECT SUM(CRP.VLRPARC) FROM CRECEBERPARCS CRP INNER JOIN CRECEBER CR ON CR.NROCRECEBER = CRP.NROCRECEBER '+
      'INNER JOIN GEN G ON G.CODGEN = CR.CODGEN '+
      'INNER JOIN CC C ON C.CODCC = CR.CODCC ' +
      'LEFT JOIN BANCOS B ON B.CODBANCO = CR.CODBANCO ';

    QryAux.SQL.Add(vlSQLFiltro + ' AND SITUACAO = ''A''');
    QryAux.Open;
    STAbertas.Caption := 'Abertas: R$ '+FormatCurr('#,##0.00', QryAux.Fields[0].AsCurrency);
    QryAux.Close;
  end;

  procedure CalcNPagas;
  begin
    QryAux.SQL.Text := 'SELECT SUM(CRP.VLRPARC) FROM CRECEBERPARCS CRP INNER JOIN CRECEBER CR ON CR.NROCRECEBER = CRP.NROCRECEBER '+
      'INNER JOIN GEN G ON G.CODGEN = CR.CODGEN '+
      'INNER JOIN CC C ON C.CODCC = CR.CODCC ' +
      'LEFT JOIN BANCOS B ON B.CODBANCO = CR.CODBANCO ';
    QryAux.SQL.Add(vlSQLFiltro + ' AND SITUACAO = ''A'' AND CRP.VCTOPARC < CURRENT_DATE');
    QryAux.Open;
    STNPagas.Caption := 'Abertas após o vcto. : R$ '+FormatCurr('#,##0.00', QryAux.Fields[0].AsCurrency);
    QryAux.Close;
  end;

  procedure CalcPagas;
  begin
    QryAux.SQL.Text := 'SELECT SUM(CRP.VLRPARC) FROM CRECEBERPARCS CRP INNER JOIN CRECEBER CR ON CR.NROCRECEBER = CRP.NROCRECEBER '+
      'INNER JOIN GEN G ON G.CODGEN = CR.CODGEN '+
      'INNER JOIN CC C ON C.CODCC = CR.CODCC ' +
      'LEFT JOIN BANCOS B ON B.CODBANCO = CR.CODBANCO ';
    QryAux.SQL.Add(vlSQLFiltro + ' AND SITUACAO = ''P''');
    QryAux.Open;
    STPagas.Caption := 'Pagas: R$ '+FormatCurr('#,##0.00', QryAux.Fields[0].AsCurrency);
    QryAux.Close;
  end;

  procedure ZeraAbertas;
  begin
    STAbertas.Caption := 'Abertas: R$ 0,00';
  end;

  procedure ZeraNPagas;
  begin
    STNPagas.Caption := 'Abertas: R$ 0,00';
  end;

  procedure ZeraPagas;
  begin
    STPagas.Caption := 'Pagas: R$ 0,00';
  end;
begin
  vlSQLFiltro := 'WHERE CR.NROCRECEBER IS NOT NULL ';

  case RGStatus.ItemIndex of
    0: begin
      CalcAbertas;
      CalcNPagas;
      CalcPagas;
    end;
    1: begin
      CalcAbertas;
      ZeraNPagas;
      ZeraPagas;
    end;
    2: begin
      ZeraAbertas;
      ZeraNPagas;
      ZeraPagas;
    end;
    3: begin
      ZeraAbertas;
      ZeraNPagas;
      CalcPagas;
    end;
    4: begin
      ZeraAbertas;
      CalcNPagas;
      ZeraPagas;
    end;
  end;

  if (CBForn.Checked) and (DBLCBForn.Text <> '') then
    vlSQLFiltro := vlSQLFiltro + ' AND G.CODGEN = :PLCODGEN ';
  if (CBBanco.Checked) and (DBLCBBanco.Text <> '') then
    vlSQLFiltro := vlSQLFiltro + ' AND B.CODBANCO = :PLCODBANCO ';
  if (CBCC.Checked) and (DBLCBCC.Text <> '') then
    vlSQLFiltro := vlSQLFiltro + ' AND C.CODCC = :PLCODCC ';
  if (CBLctoIni.Checked) then
    vlSQLFiltro := vlSQLFiltro + ' AND CPP.DATAGERA >= :PLDTINI ';
  if (CBLctoFin.Checked) then
    vlSQLFiltro := vlSQLFiltro + ' AND CPP.DATAGERA <= :PLDTFIN ';
  if (CBVctoIni.Checked) then
    vlSQLFiltro := vlSQLFiltro + ' AND CPP.VCTOPARC >= :PLDTINI ';
  if (CBVctoFin.Checked) then begin
    vlSQLFiltro := vlSQLFiltro + ' AND CPP.VCTOPARC <= :PLDTFIN ';
  end;
  if not RBAll.Checked then begin
    if RBMen.Checked then
      vlSQLFiltro := vlSQLFiltro + ' AND CPP.VLRPARC <= :PLVLR'
    else if RBIgu.Checked then
      vlSQLFiltro := vlSQLFiltro + ' AND CPP.VLRPARC = :PLVLR'
    else if RBMai.Checked then
      vlSQLFiltro := vlSQLFiltro + ' AND CPP.VLRPARC >= :PLVLR';
  end;

  vlSQLFiltroAux := '';
  case RGStatus.ItemIndex of
    1: vlSQLFiltroAux := ' AND SITUACAO = ''A''';
    2: vlSQLFiltroAux := ' AND SITUACAO = ''C''';
    3: vlSQLFiltroAux := ' AND SITUACAO = ''P''';
    4: vlSQLFiltroAux := ' AND SITUACAO = ''A'' AND CPP.VCTOPARC < CURRENT_DATE';
  end;
  QryAux.SQL.Text :=   'SELECT COUNT(CRP.NROPARC) FROM CRECEBERPARCS CRP INNER JOIN CRECEBER CR ON CR.NROCRECEBER = CRP.NROCRECEBER '+
    'INNER JOIN GEN G ON G.CODGEN = CR.CODGEN '+
    'INNER JOIN CC C ON C.CODCC = CR.CODCC ' +
    'LEFT JOIN BANCOS B ON B.CODBANCO = CR.CODBANCO ';

  QryAux.SQL.Add(vlSQLFiltro + vlSQLFiltroAux);
  if (CBForn.Checked) and (DBLCBForn.Text <> '') then
    QryAux.ParamByName('PLCODGEN').AsInteger := DBLCBForn.KeyValue ;
  if (CBBanco.Checked) and (DBLCBBanco.Text <> '') then
    QryAux.ParamByName('PLCODBANCO').AsInteger := DBLCBBanco.KeyValue;
  if (CBCC.Checked) and (DBLCBCC.Text <> '') then
    QryAux.ParamByName('PLCODCC').AsInteger := DBLCBCC.KeyValue;
  if (CBLctoIni.Checked) then
    QryAux.ParamByName('PLDTINI').AsDate := DTPLctoIni.Date;
  if (CBLctoFin.Checked) then
    QryAux.ParamByName('PLDTFIN').AsDate := DTPLctoFin.Date;
  if (CBVctoIni.Checked) then
    QryAux.ParamByName('PLDTINI').AsDate := DTPVencIni.Date;
  if (CBVctoFin.Checked) then
    QryAux.ParamByName('PLDTFIN').AsDate := DTPVencFin.Date;
  if not RBAll.Checked then
    QryAux.ParamByName('PLVLR').AsCurrency := StrToCurr(EdDinDin.Text);
  QryAux.Open;
  LblQtde2.Caption :=  IntToStr(QryAux.Fields[0].AsInteger) + ' registros encontrados';
  QryAux.Close;

  QrySearch.Close;
  QrySearch.SQL.Text := 'select CRP.NROCRECEBER, CRP.NROPARC, G.Nome as FORN, B.Nome as BANC, C.descricao as cc,   '+
    'CRP.datagera as LCTO, CRP.vctoparc as VCTO, CRP.vlrparc, '+
    'CAST (CASE CRP.SITUACAO WHEN ''A'' THEN ''Aberta'' '+
    'WHEN ''C'' THEN ''Cancelada'' '+
    'ELSE ''Vencida não paga'' end AS VARCHAR(16)) as STATUS '+
    'FROM CRECEBERPARCS CRP '+
    'INNER JOIN CRECEBER CR ON CR.NROCRECEBER = CRP.NROCRECEBER '+
    'INNER JOIN GEN G ON G.CODGEN = CR.CODGEN '+
    'INNER JOIN CC C ON C.CODCC = CR.CODCC '+
    'LEFT JOIN BANCOS B ON B.CODBANCO = CR.CODBANCO ';

  QrySearch.SQL.Add(vlSQLFiltro + vlSQLFiltroAux);
  if (CBForn.Checked) and (DBLCBForn.Text <> '') then
    QrySearch.ParamByName('PLCODGEN').AsInteger := DBLCBForn.KeyValue ;
  if (CBBanco.Checked) and (DBLCBBanco.Text <> '') then
    QrySearch.ParamByName('PLCODBANCO').AsInteger := DBLCBBanco.KeyValue;
  if (CBCC.Checked) and (DBLCBCC.Text <> '') then
    QrySearch.ParamByName('PLCODCC').AsInteger := DBLCBCC.KeyValue;
  if (CBLctoIni.Checked) then
    QrySearch.ParamByName('PLDTINI').AsDate := DTPLctoIni.Date;
  if (CBLctoFin.Checked) then
    QrySearch.ParamByName('PLDTFIN').AsDate := DTPLctoFin.Date;
  if (CBVctoIni.Checked) then
    QrySearch.ParamByName('PLDTINI').AsDate := DTPVencIni.Date;
  if (CBVctoFin.Checked) then
    QrySearch.ParamByName('PLDTFIN').AsDate := DTPVencFin.Date;
  if not RBAll.Checked then
    QrySearch.ParamByName('PLVLR').AsCurrency := StrToCurr(EdDinDin.Text);
  QrySearch.Open;
end;

procedure TFCReceber.RBAllClick(Sender: TObject);
begin
  if RBAll.Checked then
    EdDinDin.Visible := False
  else if RBMen.Checked then begin
    EdDinDin.Left := 82;
    EdDinDin.Top := 32;
    EdDinDin.Visible := True;
    EdDinDin.SetFocus;
  end else if RBIgu.Checked then begin
    EdDinDin.Left := 83;
    EdDinDin.Top := 46;
    EdDinDin.Visible := True;
    EdDinDin.SetFocus;
  end else if RBMai.Checked then begin
    EdDinDin.Left := 198;
    EdDinDin.Top := 13;
    EdDinDin.Visible := True;
    EdDinDin.SetFocus;
  end;
end;

procedure TFCReceber.DBLCBFornCloseUp(Sender: TObject);
begin
  try
    DBTST.Text := IntToStr(DBLCBForn.KeyValue);
  except
  end;
end;

procedure TFCReceber.DBLCBBancoCloseUp(Sender: TObject);
begin
  try
    DBTST1.Text := IntToStr(DBLCBBanco.KeyValue);
  except
  end;
end;

procedure TFCReceber.DBLCBCCCloseUp(Sender: TObject);
begin
  try
    DBTST2.Text := IntToStr(DBLCBCC.KeyValue);
  except
  end;
end;

procedure TFCReceber.DBTSTExit(Sender: TObject);
begin
  try
    Tag := StrToInt(DBTST.Text);
    DBLCBForn.KeyValue := Tag;
  except
    MessageDlg('Digite somente números neste campo!', mtWarning, [mbOk], 0);
    DBTST.Clear;
  end;
  Tag := 0;
end;

procedure TFCReceber.DBTST1Exit(Sender: TObject);
begin
  try
    Tag := StrToInt(DBTST1.Text);
    DBLCBBanco.KeyValue := Tag;
  except
    MessageDlg('Digite somente números neste campo!', mtWarning, [mbOk], 0);
    DBTST1.Clear;
  end;
  Tag := 0;
end;

procedure TFCReceber.DBTST2Exit(Sender: TObject);
begin
  try
    Tag := StrToInt(DBTST2.Text);
    DBLCBCC.KeyValue := Tag;
  except
    MessageDlg('Digite somente números neste campo!', mtWarning, [mbOk], 0);
    DBTST2.Clear;
  end;
  Tag := 0;
end;

procedure TFCReceber.EdDinDinChange(Sender: TObject);
begin
  if EdDinDin.Text <> '' then
    try
      StrToCurr(EdDinDin.Text);
    except
      MessageDlg('Digite Valor no formato 1.234,56 neste campo!',  mtWarning, [mbOk], 0);
      EdDinDin.Clear;
      EdDinDin.SetFocus;
    end;
end;

procedure TFCReceber.DSCRDataChange(Sender: TObject; Field: TField);
begin
  QryAux.SQL.Text := 'SELECT COUNT(NROCRECEBER) FROM CRECEBER';
  QryAux.Open;
  LblQtde.Caption :=  IntToStr(QryAux.Fields[0].AsInteger) + ' registros encontrados';
  QryAux.Close;
end;

procedure TFCReceber.Cancelar1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A RECEBER', 'EDI', 1) then
    Exit;
  if TbCRParcsSITUACAO.Value = 'C' then
    exit;
  if TbCRParcsSITUACAO.Value = 'P' then begin
    MessageDlg('Esta parcela da Conta a Receber foi paga! Operação Cancelada!', mtWarning, [mbOk], 0);
    exit;
  end;
  try
    TbCRParcs.Edit;
    TbCRParcsSITUACAO.Value := 'C';
    TbCRParcs.Post;
    MessageDlg('Parcela cancelada com sucesso!', mtInformation, [mbOk], 0);
    ConfTrans(True);
  except
    MessageDlg('Erro ao cancelar parcela!', mtWarning, [mbOk], 0);
    ConfTrans(False);
  end;
end;

procedure TFCReceber.ContasaPagar1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A RECEBER', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosCP, FRelatoriosCP);
    FRelatoriosCP.vpTabelaMae := 'CRECEBER';
    FRelatoriosCP.vpTabelaFilha := 'CRECEBERPARCS';
    FRelatoriosCP.vpCampoPrinc := 'NROCRECEBER';
    FRelatoriosCP.Caption := 'Relatório de Contas a Receber';
    FRelatoriosCP.CBForn.Caption := 'Aluno';
    FRelatoriosCP.DBLCBForn.ListSource := Dados.DSAlunosLK;
    FRelatoriosCP.DBLCBForn.ListField := 'CODALUNO;NOME';
    FRelatoriosCP.DBLCBForn.KeyField := 'CODALUNO';
    FRelatoriosCP.vlTbGen := 'ALUNOS';
    FRelatoriosCP.vlCampoGen := 'CODALUNO';
    FRelatoriosCP.ShowModal;
  finally
    FreeAndNil(FRelatoriosCP);
  end;
end;

procedure TFCReceber.Baixar1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A RECEBER', 'EDI', 1) then
    Exit;
  if TbCRParcsSITUACAO.Value = 'P' then
    exit;
  if TbCRParcsSITUACAO.Value = 'C' then begin
    MessageDlg('Esta parcela da Conta a Receber foi cancelada! Operação Cancelada!', mtWarning, [mbOk], 0);
    exit;
  end;
  try
    TbCRParcs.Edit;
    Application.CreateForm(TFBaixaCR, FBaixaCR);
    FBaixaCR.ShowModal;
  finally
    FreeAndNil(FBaixaCR);
  end;
end;

procedure TFCReceber.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFCReceber.DBGridSearchDrawColumnCell(Sender: TObject;
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
