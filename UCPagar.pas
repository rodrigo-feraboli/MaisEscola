unit UCPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, Mask, Menus, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, DB, MDOQuery, MDODatabase, MDOCustomDataSet, ComCtrls;

type
  TFCPagar = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    PnlInfo: TPanel;
    DSCPParcs: TDataSource;
    DSCP: TDataSource;
    TbCP: TMDODataSet;
    TbCPParcs: TMDODataSet;
    Trans: TMDOTransaction;
    TbCPParcsSituacaoStr: TStringField;
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
    TbCPParcsNROCPAGAR: TIntegerField;
    TbCPParcsNROPARC: TIntegerField;
    TbCPParcsVCTOPARC: TDateField;
    TbCPParcsVLRPARC: TMDOBCDField;
    TbCPParcsPGTOPARC: TDateField;
    TbCPParcsVLRPAGO: TMDOBCDField;
    TbCPParcsSITUACAO: TMDOStringField;
    TbCPParcsDATAGERA: TDateField;
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
    QrySearchFORN: TMDOStringField;
    QrySearchBANC: TMDOStringField;
    QrySearchLCTO: TDateField;
    QrySearchVCTO: TDateField;
    QrySearchVLRPARC: TMDOBCDField;
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
    TbCPNROCPAGAR: TSmallintField;
    TbCPCODGEN: TSmallintField;
    TbCPNROCOMPRA: TSmallintField;
    TbCPCODBANCO: TSmallintField;
    TbCPCODCONDPGTO: TSmallintField;
    TbCPDATA: TDateField;
    TbCPOBS: TMemoField;
    TbCPCODCC: TSmallintField;
    QrySearchNROCPAGAR: TSmallintField;
    QrySearchNROPARC: TSmallintField;
    QrySearchCC: TMDOStringField;
    QrySearchSTATUS: TMDOStringField;
    StatusBar2: TStatusBar;
    STAbertas: TStaticText;
    STPagas: TStaticText;
    STNPagas: TStaticText;
    PopupMenu1: TPopupMenu;
    Baixar1: TMenuItem;
    N1: TMenuItem;
    Cancelar1: TMenuItem;
    TbCPParcsVLRMULTA: TMDOBCDField;
    TbCPParcsVLRDESC: TMDOBCDField;
    TbCPParcsNROCHEQUE: TMDOStringField;
    TbCPParcsAGENCIA: TMDOStringField;
    TbCPParcsCODBANCO: TSmallintField;
    Relatrios1: TMenuItem;
    ContasaPagar1: TMenuItem;
    TbCPFornecedor: TStringField;
    TbCPObsStr: TStringField;
    procedure Sair1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TbCPParcsCalcFields(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RBCodigoClick(Sender: TObject);
    procedure TbCPAfterOpen(DataSet: TDataSet);
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
    procedure DSCPDataChange(Sender: TObject; Field: TField);
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
  FCPagar: TFCPagar;

const
  SQL = 'SELECT * FROM CPAGAR WHERE NROCPAGAR IS NOT NULL';

implementation

uses UDados, UCompras, UEdCP, UEdCPParcs, Math, UBaixaCP, URelatoriosCP;

{$R *.dfm}

procedure TFCPagar.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryFornLK.Open;
  Dados.QryBancosLK.Open;
  Dados.QryCCLK.Open;
end;

procedure TFCPagar.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFCPagar.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFCPagar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #27) then
    if not (PnlSearch.Visible) then
      Close
    else
      SBOKClick(SBCanc);
end;

procedure TFCPagar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{ TbCP.Close;
  TbCPParcs.Close;
  TransactionCP.Active := False;
  Action := caFree;}
end;

procedure TFCPagar.FormCreate(Sender: TObject);
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

procedure TFCPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1 then
    AbreAjuda;
{  else if (TbCPParcs.State in [dsbrowse]) then begin
    if key = Vk_F3 then
      SpeedButton3Click(nil)
    else if (Key = Vk_F5) then
      MDOTbCPParcs.Refresh
    else if (Key = Vk_Home) then
      MDOTbCPParcs.First
    else if (Key = 34) then
      MDOTbCPParcs.Prior
    else if (Key = 35) then
      MDOTbCPParcs.Next
    else if (Key = Vk_End) then
      MDOTbCPParcs.Last
    else if (Shift = [ssShift]) and (Key = Vk_Delete) then
      BitBtnExcluirClick (nil)
  end;  }
end;

procedure TFCPagar.TbCPParcsCalcFields(DataSet: TDataSet);
begin
 if TbCPParcsSITUACAO.Value = 'A' then
    TbCPParcsSituacaoStr.Value := 'Aberto'
  else if TbCPParcsSITUACAO.Value = 'P' then
    TbCPParcsSituacaoStr.Value := 'Pago'
  else if TbCPParcsSITUACAO.Value = 'C' then
    TbCPParcsSituacaoStr.Value := 'Cancelado';
end;

procedure TFCPagar.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlSearch.Visible;
  if CanClose = True then begin
    if (TbCPParcs.IsEmpty) and not (TbCP.IsEmpty) then begin
      MessageDlg('Especifique os itens da Conta a Pagar, antes de sair de Conta a Pagar!', mtWarning, [mbok], 0);
      CanClose := False;
    end;
  end;
end;

procedure TFCPagar.RBCodigoClick(Sender: TObject);
begin
  TbCP.Close;
  TbCP.SelectSQL.Text := SQL;
  if RBCodigo.Checked then
    TbCP.SelectSQL.Add ('ORDER BY NROCPAGAR')
  else
    TbCP.SelectSQL.Add ('ORDER BY DATA');
  TbCP.Open;
end;

procedure TFCPagar.TbCPAfterOpen(DataSet: TDataSet);
begin
  TbCPParcs.Open;
end;

procedure TFCPagar.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbCP.Bof) then
    TbCP.First
  else if (sender = SBLast) and (not TbCP.Bof) then
    TbCP.Prior
  else if (sender = SBNext) and (not TbCP.Eof) then
    TbCP.Next
  else if (sender = SBPrior) and (not TbCP.Eof) then
    TbCP.Last
  else
    TbCP.Refresh;
end;

procedure TFCPagar.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A PAGAR', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbCP.Append;
    QryAux.SQL.Text := 'SELECT MAX(NROCPAGAR) FROM CPAGAR';
    QryAux.Open;
    TbCPNROCPAGAR.Value := QryAux.Fields[0].AsInteger + 1;
    QryAux.Close;
    TbCPDATA.Value := Date;
    Application.CreateForm(TFEdCP, FEdCP);
    FEdCP.ShowModal;
  finally
    FreeAndNil(FEdCP);
  end;
end;

procedure TFCPagar.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A PAGAR', 'EXC', 1) then
    Exit;
  if (not TbCP.IsEmpty) and
    (MessageDlg(cgMsgDelCP, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbCPParcs.First;
      while not TbCPParcs.Eof do
        TbCPParcs.Delete;
      TbCP.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFCPagar.SBDelParcClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A PAGAR', 'EXC', 1) then
    Exit;
  if (not TbCPParcs.IsEmpty) and
    (MessageDlg(cgMsgDelCPParc, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbCPParcs.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFCPagar.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A PAGAR', 'EDI', 1) then
    Exit;
  if TbCP.IsEmpty then
    Exit;
  try
    TbCP.Edit;
    Application.CreateForm(TFEdCP, FEdCP);
    FEdCP.ShowModal;
  finally
    FreeAndNil(FEdCP);
  end;
end;

procedure TFCPagar.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFCPagar.SBAltItemClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A PAGAR', 'EDI', 1) then
    Exit;
  if TbCPParcs.IsEmpty then
    Exit;
  try
    TbCPParcs.Edit;
    Application.CreateForm(TFEdCPParcs, FEdCPParcs);
    FEdCPParcs.ShowModal;
  finally
    FreeAndNil(FEdCPParcs);
  end;  
end;

procedure TFCPagar.SBNewItemClick(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A PAGAR', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbCPParcs.Append;
    TbCPParcsNROCPAGAR.Value := TbCPNROCPAGAR.Value;
    QryAux.SQL.Text := 'SELECT MAX(NROPARC) FROM CPAGARPARCS WHERE NROCPAGAR = '+ IntToStr(TbCPNROCPAGAR.Value);
    QryAux.Open;
    TbCPParcsNROPARC.Value := QryAux.Fields[0].AsInteger + 1;
    QryAux.Close;
    TbCPParcsDATAGERA.Value := Date;
    TbCPParcsSITUACAO.Value := 'A';
    Application.CreateForm(TFEdCPParcs, FEdCPParcs);
    FEdCPParcs.ShowModal;
  finally
    FreeAndNil(FEdCPParcs);
  end;
end;

procedure TFCPagar.SBBuscaClick(Sender: TObject);
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
  Caption := 'Busca de Contas a Pagar';
  LKTela;
  PnlSearch.Visible := not Arquivo1.Visible; 
end;

procedure TFCPagar.SBOKClick(Sender: TObject);
begin
  if (sender = SBOK) or (Sender = DBGridSearch) then begin
    TbCP.Locate('NROCPAGAR', QrySearchNROCPAGAR.Value, []);
    TbCPParcs.Locate('NROPARC', QrySearchNROPARC.Value, []);
  end;

  Arquivo1.Visible := True;
  Relatrios1.Visible := Arquivo1.Visible;
  PnlSup.Enabled := Arquivo1.Visible;
  PnlInfo.Enabled := Arquivo1.Visible;
  Caption := 'Cadastro de Contas a Pagar';
  PnlSearch.Visible := not Arquivo1.Visible;
end;

procedure TFCPagar.SpeedButton3Click(Sender: TObject);
  var
    vlSQLFiltro, vlSQLFiltroAux: String;
  procedure CalcAbertas;
  begin
    QryAux.SQL.Text := 'SELECT SUM(CPP.VLRPARC) FROM CPAGARPARCS CPP INNER JOIN CPAGAR CP ON CP.NROCPAGAR = CPP.NROCPAGAR '+
      'INNER JOIN GEN G ON G.CODGEN = CP.CODGEN '+
      'INNER JOIN CC C ON C.CODCC = CP.CODCC ' +
      'LEFT JOIN BANCOS B ON B.CODBANCO = CP.CODBANCO ';

    QryAux.SQL.Add(vlSQLFiltro + ' AND SITUACAO = ''A''');
    QryAux.Open;
    STAbertas.Caption := 'Abertas: R$ '+FormatCurr('#,##0.00', QryAux.Fields[0].AsCurrency);
    QryAux.Close;
  end;

  procedure CalcNPagas;
  begin
    QryAux.SQL.Text := 'SELECT SUM(CPP.VLRPARC) FROM CPAGARPARCS CPP INNER JOIN CPAGAR CP ON CP.NROCPAGAR = CPP.NROCPAGAR '+
      'INNER JOIN GEN G ON G.CODGEN = CP.CODGEN '+
      'INNER JOIN CC C ON C.CODCC = CP.CODCC ' +
      'LEFT JOIN BANCOS B ON B.CODBANCO = CP.CODBANCO ';
    QryAux.SQL.Add(vlSQLFiltro + ' AND SITUACAO = ''A'' AND CPP.VCTOPARC < CURRENT_DATE');
    QryAux.Open;
    STNPagas.Caption := 'Abertas após o vcto. : R$ '+FormatCurr('#,##0.00', QryAux.Fields[0].AsCurrency);
    QryAux.Close;
  end;

  procedure CalcPagas;
  begin
    QryAux.SQL.Text := 'SELECT SUM(CPP.VLRPAGO) FROM CPAGARPARCS CPP INNER JOIN CPAGAR CP ON CP.NROCPAGAR = CPP.NROCPAGAR '+
      'INNER JOIN GEN G ON G.CODGEN = CP.CODGEN '+
      'INNER JOIN CC C ON C.CODCC = CP.CODCC ' +
      'LEFT JOIN BANCOS B ON B.CODBANCO = CP.CODBANCO ';
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
  vlSQLFiltro := 'WHERE CPP.NROCPAGAR IS NOT NULL ';

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
  QryAux.SQL.Text := 'SELECT COUNT(CPP.NROPARC) FROM CPAGARPARCS CPP INNER JOIN CPAGAR CP ON CP.NROCPAGAR = CPP.NROCPAGAR '+
    'INNER JOIN GEN G ON G.CODGEN = CP.CODGEN '+
    'INNER JOIN CC C ON C.CODCC = CP.CODCC ' +
    'LEFT JOIN BANCOS B ON B.CODBANCO = CP.CODBANCO ';
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
  QrySearch.SQL.Text := 'SELECT CPP.NROCPAGAR, CPP.NROPARC, G.NOME AS FORN, B.NOME AS BANC, C.DESCRICAO AS CC, CPP.DATAGERA AS LCTO, CPP.VCTOPARC AS VCTO, '+
    'CPP.VLRPARC, CAST (CASE CPP.SITUACAO WHEN ''A'' THEN ''Aberta'' '+
    'WHEN ''C'' THEN ''Cancelada'' '+
    'ELSE ''Vencida não paga'' end AS VARCHAR(16)) as STATUS '+
    'FROM CPAGARPARCS CPP INNER JOIN CPAGAR CP ON CP.NROCPAGAR = CPP.NROCPAGAR '+
    'INNER JOIN GEN G ON G.CODGEN = CP.CODGEN '+
    'INNER JOIN CC C ON C.CODCC = CP.CODCC ' +
    'LEFT JOIN BANCOS B ON B.CODBANCO = CP.CODBANCO  ';
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

procedure TFCPagar.RBAllClick(Sender: TObject);
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

procedure TFCPagar.DBLCBFornCloseUp(Sender: TObject);
begin
  try
    DBTST.Text := IntToStr(DBLCBForn.KeyValue);
  except
  end;
end;

procedure TFCPagar.DBLCBBancoCloseUp(Sender: TObject);
begin
  try
    DBTST1.Text := IntToStr(DBLCBBanco.KeyValue);
  except
  end;
end;

procedure TFCPagar.DBLCBCCCloseUp(Sender: TObject);
begin
  try
    DBTST2.Text := IntToStr(DBLCBCC.KeyValue);
  except
  end;
end;

procedure TFCPagar.DBTSTExit(Sender: TObject);
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

procedure TFCPagar.DBTST1Exit(Sender: TObject);
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

procedure TFCPagar.DBTST2Exit(Sender: TObject);
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

procedure TFCPagar.EdDinDinChange(Sender: TObject);
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

procedure TFCPagar.DSCPDataChange(Sender: TObject; Field: TField);
begin
  QryAux.SQL.Text := 'SELECT COUNT(NROCPAGAR) FROM CPAGAR';
  QryAux.Open;
  LblQtde.Caption :=  IntToStr(QryAux.Fields[0].AsInteger) + ' registros encontrados';
  QryAux.Close;
end;

procedure TFCPagar.Cancelar1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A PAGAR', 'EDI', 1) then
    Exit;
  if TbCPParcsSITUACAO.Value = 'C' then
    exit;
  if TbCPParcsSITUACAO.Value = 'P' then begin
    MessageDlg('Esta parcela da Conta a Pagar foi paga! Operação Cancelada!', mtWarning, [mbOk], 0);
    exit;
  end;
  try
    TbCPParcs.Edit;
    TbCPParcsSITUACAO.Value := 'C';
    TbCPParcs.Post;
    MessageDlg('Parcela cancelada com sucesso!', mtInformation, [mbOk], 0);
    ConfTrans(True);
  except
    MessageDlg('Erro ao cancelar parcela!', mtWarning, [mbOk], 0);
    ConfTrans(False);
  end;
end;

procedure TFCPagar.ContasaPagar1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A PAGAR', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosCP, FRelatoriosCP);
    FRelatoriosCP.Caption := 'Relatório de Contas a Pagar';
    FRelatoriosCP.CBForn.Caption := 'Fornecedor';
    FRelatoriosCP.DBLCBForn.ListSource := Dados.DSFornLK;
    FRelatoriosCP.DBLCBForn.ListField := 'CODGEN;NOME';
    FRelatoriosCP.DBLCBForn.KeyField := 'CODGEN';
    FRelatoriosCP.vpTabelaMae := 'CPAGAR';
    FRelatoriosCP.vpTabelaFilha := 'CPAGARPARCS';
    FRelatoriosCP.vpCampoPrinc := 'NROCPAGAR';
    FRelatoriosCP.vlTbGen := 'GEN';
    FRelatoriosCP.vlCampoGen := 'CODGEN';
    FRelatoriosCP.ShowModal;
  finally
    FreeAndNil(FRelatoriosCP);
  end;
end;

procedure TFCPagar.Baixar1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A PAGAR', 'EDI', 1) then
    Exit;
  if TbCPParcsSITUACAO.Value = 'P' then
    exit;
  if TbCPParcsSITUACAO.Value = 'C' then begin
    MessageDlg('Esta parcela da Conta a Pagar foi cancelada! Operação Cancelada!', mtWarning, [mbOk], 0);
    exit;
  end;
  try
    TbCPParcs.Edit;
    Application.CreateForm(TFBaixaCP, FBaixaCP);
    FBaixaCP.ShowModal;
  finally
    FreeAndNil(FBaixaCP);
  end;
end;

procedure TFCPagar.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFCPagar.DBGridSearchDrawColumnCell(Sender: TObject;
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
