unit UAlunos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery, DateUtils;

type
  TFAlunos = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    DSAlunos: TDataSource;
    TbAlunos: TMDODataSet;
    Trans: TMDOTransaction;
    Panel1: TPanel;
    Panel3: TPanel;
    SBBusca: TSpeedButton;
    Label1: TLabel;
    LblQtde: TLabel;
    RBCodigo: TRadioButton;
    RBDescricao: TRadioButton;
    EdBusca: TEdit;
    DSAlunosFunc: TDataSource;
    TbAlunosFunc: TMDODataSet;
    TbAlunosFuncCODALUNO: TSmallintField;
    TbAlunosFuncCODFUNC: TSmallintField;
    TbAlunosFuncNome: TStringField;
    QryAux: TMDOQuery;
    ImaAluno: TImage;
    QryProx: TMDOQuery;
    SBRefresh: TSpeedButton;
    SBPrior: TSpeedButton;
    SBNext: TSpeedButton;
    SBLast: TSpeedButton;
    SBFirst: TSpeedButton;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    TbAlunosDoencas: TMDODataSet;
    DSAlunosDoencas: TDataSource;
    DSAlunosAlergias: TDataSource;
    TbAlunosAlergias: TMDODataSet;
    DSAlunosProdutos: TDataSource;
    TbAlunosProdutos: TMDODataSet;
    DSAlunosRemedios: TDataSource;
    TbAlunosRemedios: TMDODataSet;
    TbAlunosDoencasCODALUNO: TSmallintField;
    TbAlunosDoencasCODDOENCA: TSmallintField;
    TbAlunosDoencasNome: TStringField;
    TbAlunosAlergiasCODALUNO: TSmallintField;
    TbAlunosAlergiasCODALERGIA: TSmallintField;
    TbAlunosAlergiasNome: TStringField;
    TbAlunosProdutosProduto: TStringField;
    TbAlunosRemediosRemedios: TStringField;
    TbAlunosProdutosCODALUNO: TIntegerField;
    TbAlunosProdutosCODPROD: TIntegerField;
    TbAlunosProdutosVALOR: TMDOBCDField;
    TbAlunosProdutosDTVCTO: TDateField;
    TbAlunosProdutosDTPGTO: TDateField;
    TbAlunosProdutosDTPAGO: TDateField;
    TbAlunosProdutosPAGO: TMDOStringField;
    TbAlunosRemediosCODALUNO: TSmallintField;
    TbAlunosRemediosCODREMEDIO: TSmallintField;
    TbAlunosRemediosMODOAPLIC: TMemoField;
    TbAlunosRemediosREPETDIA: TMDOStringField;
    TbAlunosCarne: TMDODataSet;
    DSAlunosCarne: TDataSource;
    TbAlunosCarneCODALUNO: TSmallintField;
    TbAlunosCarneCODCARNE: TSmallintField;
    TbAlunosCarneVALOR: TMDOBCDField;
    TbAlunosCarneDTVCTO: TDateField;
    TbAlunosCarneDTPGTO: TDateField;
    TbAlunosCarneSTATUS: TMDOStringField;
    TbAlunosCarneStatusStr: TStringField;
    TbAlunosCarneVALORPAGO: TMDOBCDField;
    TbAlunosCarnePERCMULTA: TMDOBCDField;
    TbAlunosCarneVALORMULTA: TMDOBCDField;
    TbAlunosCarnePERCDESC: TMDOBCDField;
    TbAlunosCarneVALORDESC: TMDOBCDField;
    AlunosInadimplentes1: TMenuItem;
    N1: TMenuItem;
    DSAlunosAval: TDataSource;
    TbAlunosAval: TMDODataSet;
    TbAlunosAvalCODALUNO: TIntegerField;
    TbAlunosAvalPERIODO: TMDOStringField;
    TbAlunosAvalCOMP: TSmallintField;
    TbAlunosAvalHIG: TSmallintField;
    TbAlunosAvalATE: TSmallintField;
    TbAlunosAvalASD: TSmallintField;
    TbAlunosAvalDM: TSmallintField;
    TbAlunosCODALUNO: TSmallintField;
    TbAlunosNOME: TMDOStringField;
    TbAlunosATIVO: TSmallintField;
    TbAlunosCODTURMA: TSmallintField;
    TbAlunosEMFERIAS: TSmallintField;
    TbAlunosDATAINGRESSO: TDateField;
    TbAlunosDATACAD: TDateField;
    TbAlunosMATRICULA: TIntegerField;
    TbAlunosDTNASC: TDateField;
    TbAlunosPATHFOTO: TMDOStringField;
    TbAlunosPATHFOTOPAI: TMDOStringField;
    TbAlunosPATHFOTOMAE: TMDOStringField;
    TbAlunosPATHFOTORESP: TMDOStringField;
    TbAlunosNOMEPAI: TMDOStringField;
    TbAlunosDTNASCPAI: TDateField;
    TbAlunosDTNASCMAE: TDateField;
    TbAlunosNOMEMAE: TMDOStringField;
    TbAlunosENDERECO: TMDOStringField;
    TbAlunosENDERECOPAI: TMDOStringField;
    TbAlunosENDERECOMAE: TMDOStringField;
    TbAlunosCODCIDADE: TSmallintField;
    TbAlunosCODCIDADEPAI: TSmallintField;
    TbAlunosCODCIDADEMAE: TSmallintField;
    TbAlunosCODBAIRRO: TSmallintField;
    TbAlunosCODBAIRROPAI: TSmallintField;
    TbAlunosCODBAIRROMAE: TSmallintField;
    TbAlunosPMJ: TSmallintField;
    TbAlunosSEPARADOS: TSmallintField;
    TbAlunosRESPONSAVELBUSCA: TSmallintField;
    TbAlunosEMERGENCIACHAMAR: TSmallintField;
    TbAlunosEMERGENCIANOME: TMDOStringField;
    TbAlunosEMERGENCIAFONE: TMDOStringField;
    TbAlunosEMACIDENTE: TSmallintField;
    TbAlunosEMACIDADENTEOUTRO: TMDOStringField;
    TbAlunosCODPROFPAI: TSmallintField;
    TbAlunosESCOLARIDADEPAI: TMDOStringField;
    TbAlunosESCOLARIDADEMAE: TMDOStringField;
    TbAlunosENDPROFPAI: TMDOStringField;
    TbAlunosTELPROFPAI: TMDOStringField;
    TbAlunosHORATRABPAIMAINI: TTimeField;
    TbAlunosHORATRABPAIMAFIN: TTimeField;
    TbAlunosHORATRABPAITAINI: TTimeField;
    TbAlunosHORATRABPAITAFIN: TTimeField;
    TbAlunosCODPROFMAE: TSmallintField;
    TbAlunosENDPROFMAE: TMDOStringField;
    TbAlunosTELPROFMAE: TMDOStringField;
    TbAlunosHORATRABMAEMAINI: TTimeField;
    TbAlunosHORATRABMAEMAFIN: TTimeField;
    TbAlunosHORATRABMAETAINI: TTimeField;
    TbAlunosHORATRABMAETAFIN: TTimeField;
    TbAlunosCEP: TMDOStringField;
    TbAlunosCEPPAI: TMDOStringField;
    TbAlunosCEPMAE: TMDOStringField;
    TbAlunosFONE: TMDOStringField;
    TbAlunosFONEPAI: TMDOStringField;
    TbAlunosFONEMAE: TMDOStringField;
    TbAlunosCELPAI: TMDOStringField;
    TbAlunosCELMAE: TMDOStringField;
    TbAlunosRGPAI: TMDOStringField;
    TbAlunosRGMAE: TMDOStringField;
    TbAlunosCPFPAI: TMDOStringField;
    TbAlunosCPFMAE: TMDOStringField;
    TbAlunosEMAILPAI: TMDOStringField;
    TbAlunosEMAILMAE: TMDOStringField;
    TbAlunosOBS: TMemoField;
    DSAlunosSai: TDataSource;
    DSAlunosTrat: TDataSource;
    TbAlunosAv: TMDODataSet;
    TbAlunosTrat: TMDODataSet;
    TbAlunosAvCODALUNO: TSmallintField;
    TbAlunosAvCODAVISO: TSmallintField;
    TbAlunosAvDTHRINS: TDateTimeField;
    TbAlunosAvDTSAI: TDateField;
    TbAlunosAvHRSAI: TTimeField;
    TbAlunosAvMOTIVO: TMemoField;
    TbAlunosTratCODALUNO: TSmallintField;
    TbAlunosTratCODTRATAMENTO: TSmallintField;
    TbAlunosTratTrat: TStringField;
    TbAlunosAvSTATUS: TSmallintField;
    TbAlunosAvStatusSTR: TStringField;
    TbAlunosAvalComportamento: TStringField;
    TbAlunosAvalHigiene: TStringField;
    TbAlunosAvalAtencao: TStringField;
    TbAlunosAvalAssiduidade: TStringField;
    TbAlunosAvalDesenMot: TStringField;
    SpeedButton18: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SBNewTrat: TSpeedButton;
    SBNewResp: TSpeedButton;
    SBNewRemedio: TSpeedButton;
    SBNewProd: TSpeedButton;
    SBNewDoenca: TSpeedButton;
    SBNewBol: TSpeedButton;
    SBNewAv: TSpeedButton;
    SBNewAlergia: TSpeedButton;
    SBEditBol: TSpeedButton;
    SBEditAv: TSpeedButton;
    SBDelTrat: TSpeedButton;
    SBDelRemedio: TSpeedButton;
    SBDelProd: TSpeedButton;
    SBDelFunc: TSpeedButton;
    SBDelDoenca: TSpeedButton;
    SBDelBol: TSpeedButton;
    SBDelAv: TSpeedButton;
    SBDelAlergia: TSpeedButton;
    SBAltTrat: TSpeedButton;
    SBAltRemedio: TSpeedButton;
    SBAltProd: TSpeedButton;
    SBAltFunc: TSpeedButton;
    SBAltDoenca: TSpeedButton;
    SBAltAlergia: TSpeedButton;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    DBGrid9: TDBGrid;
    DBGrid8: TDBGrid;
    DBGrid7: TDBGrid;
    DBGrid6: TDBGrid;
    DBGrid5: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid11: TDBGrid;
    DBGrid10: TDBGrid;
    DBGrid1: TDBGrid;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    IMAberto: TMenuItem;
    IMConcluido: TMenuItem;
    Label12: TLabel;
    ImaPai: TImage;
    Label13: TLabel;
    ImaMae: TImage;
    ImaResp: TImage;
    TbAlunosQUEMBUSCA: TSmallintField;
    TbAlunosENDERECORESP: TMDOStringField;
    TbAlunosCODCIDADERESP: TSmallintField;
    TbAlunosCODBAIRRORESP: TSmallintField;
    TbAlunosESCOLARIDADERESP: TMDOStringField;
    TbAlunosHORATRABRESPMAINI: TTimeField;
    TbAlunosHORATRABRESPMAFIN: TTimeField;
    TbAlunosHORATRABRESPTAINI: TTimeField;
    TbAlunosHORATRABRESPTAFIN: TTimeField;
    TbAlunosCEPRESP: TMDOStringField;
    TbAlunosFONERESP: TMDOStringField;
    TbAlunosCELRESP: TMDOStringField;
    TbAlunosRGRESP: TMDOStringField;
    TbAlunosCPFRESP: TMDOStringField;
    TbAlunosEMAILRESP: TMDOStringField;
    TbAlunosDTNASCRESP: TDateField;
    TbAlunosNOMERESP: TMDOStringField;
    TbAlunosCODPROFRESP: TSmallintField;
    TbAlunosENDPROFRESP: TMDOStringField;
    TbAlunosTELPROFRESP: TMDOStringField;
    Relatrios1: TMenuItem;
    Simples1: TMenuItem;
    Estatstico1: TMenuItem;
    TbAlunosSEXO: TMDOStringField;
    TbAlunosIdadeMae: TStringField;
    TbAlunosIdade: TStringField;
    TbAlunosIdadePai: TStringField;
    TbAlunosIdadeResp: TStringField;
    FaixaEtria1: TMenuItem;
    N2: TMenuItem;
    FichadoAluno1: TMenuItem;
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
    procedure DSAlunosDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure SBNewRespClick(Sender: TObject);
    procedure SBAltFuncClick(Sender: TObject);
    procedure SBDelFuncClick(Sender: TObject);
    procedure TbAlunosAfterOpen(DataSet: TDataSet);
    procedure TbAlunosAfterClose(DataSet: TDataSet);
    procedure SBNewDoencaClick(Sender: TObject);
    procedure SBAltDoencaClick(Sender: TObject);
    procedure SBDelDoencaClick(Sender: TObject);
    procedure SBNewAlergiaClick(Sender: TObject);
    procedure SBAltAlergiaClick(Sender: TObject);
    procedure SBDelAlergiaClick(Sender: TObject);
    procedure SBNewRemedioClick(Sender: TObject);
    procedure SBAltRemedioClick(Sender: TObject);
    procedure SBDelRemedioClick(Sender: TObject);
    procedure SBNewProdClick(Sender: TObject);
    procedure SBAltProdClick(Sender: TObject);
    procedure SBDelProdClick(Sender: TObject);
    procedure TbAlunosProdutosAfterOpen(DataSet: TDataSet);
    procedure SpeedButton18Click(Sender: TObject);
    procedure TbAlunosCarneCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AlunosInadimplentes1Click(Sender: TObject);
    procedure SBNewTratClick(Sender: TObject);
    procedure SBAltTratClick(Sender: TObject);
    procedure SBDelTratClick(Sender: TObject);
    procedure SBNewAvClick(Sender: TObject);
    procedure SBEditAvClick(Sender: TObject);
    procedure SBDelAvClick(Sender: TObject);
    procedure TbAlunosAvCalcFields(DataSet: TDataSet);
    procedure SBNewBolClick(Sender: TObject);
    procedure TbAlunosAvalCalcFields(DataSet: TDataSet);
    procedure IMAbertoClick(Sender: TObject);
    procedure DBGrid11DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Simples1Click(Sender: TObject);
    procedure Estatstico1Click(Sender: TObject);
    procedure TbAlunosCalcFields(DataSet: TDataSet);
    procedure SBEditBolClick(Sender: TObject);
    procedure FaixaEtria1Click(Sender: TObject);
    procedure FichadoAluno1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FAlunos: TFAlunos;

const
  SQL = 'SELECT * FROM ALUNOS WHERE CODALUNO IS NOT NULL';

implementation

uses UEdAlunos, UDados, UEdAlunosFunc, UEdAlunosDoencas, UEdAlunosAlergias,
  UEdAlunosRemedios, UEdAlunosProd, ULancaCarne, UBaixaCarne, UAlunosInad,
  UEdAlunosTrat, UEdAlunosSaidas, UEdAlunosBoletim, URelatoriosSint,
  URelatoriosEst, URelatoriosFaixa, UFichaAluno;

{$R *.dfm}

procedure TFAlunos.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFAlunos.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAlunos.Append;
    TbAlunosSEXO.Value := 'M';
    QryProx.SQL.Text := 'SELECT MAX(CODALUNO) FROM ALUNOS';
    QryProx.Open;
    TbAlunosCODALUNO.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    TbAlunosDATACAD.Value := Date;
    TbAlunosPMJ.Value := 0;
    TbAlunosEMERGENCIACHAMAR.Value := 1;
    TbAlunosEMACIDENTE.Value := 1;
    TbAlunosATIVO.Value := 1;
    TbAlunosEMFERIAS.Value := 0;
    TbAlunosSEPARADOS.Value := 0;
    Application.CreateForm(TFEdAlunos, FEdAlunos);
    FEdAlunos.ShowModal;
  finally
    FreeAndNil(FEdAlunos);
  end;
end;

procedure TFAlunos.SBAlterarClick(Sender: TObject);
begin
  if TbAlunos.IsEmpty or (not VerificarPermissao('ALUNOS', 'EDI', 1)) then
    Exit;
  try
    TbAlunos.Edit;
    Application.CreateForm(TFEdAlunos, FEdAlunos);
    FEdAlunos.ShowModal;
  finally
    FreeAndNil(FEdAlunos);
  end;
end;

procedure TFAlunos.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbAlunos.Close;
  TbAlunos.SelectSQL.Text := SQL + ' ORDER BY ';
  if sender = RBCodigo then
    TbAlunos.SelectSQL.Add('CODALUNO')
  else
    TbAlunos.SelectSQL.Add('NOME');
  TbAlunos.Open;
end;

procedure TFAlunos.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbAlunos.Locate('CODALUNO', StrToInt(EdBusca.Text), [])
    else
      TbAlunos.Locate('NOME', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFAlunos.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbAlunos.Close;
    TbAlunos.SelectSQL.Text := SQL + ' and ';
    if RBDescricao.Checked then
      TbAlunos.SelectSQL.Add(' NOME CONTAINING '''+ EdBusca.Text +'''')
    else
      TbAlunos.SelectSQL.Add(' CODALUNO CONTAINING '''+ EdBusca.Text +'''');
    TbAlunos.Open;
    if TbAlunos.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbAlunos.Close;
      TbAlunos.SelectSQL.Text := SQL;
      TbAlunos.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  PnlBusca.Enabled := True;
  Panel1.Enabled := False;
  Panel3.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbAlunosCODALUNO.Value;
//  TbAlunos.EnableControls;
  PnlBusca.Visible := True;
  SpeedButton6.Enabled := True;
end;

procedure TFAlunos.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbAlunosCODALUNO.Value;
  TbAlunos.Close;
  TbAlunos.SelectSQL.Text := SQL;
  TbAlunos.Open;
  TbAlunos.Locate('CODALUNO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel3.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFAlunos.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFAlunos.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EXC', 1) then
    Exit;
  if (not TbAlunos.IsEmpty) and
    (MessageDlg(cgMsgDelAluno, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAlunosFunc.First;
      while not TbAlunosFunc.Eof do
        TbAlunosFunc.Delete;

      TbAlunosDoencas.First;
      while not TbAlunosDoencas.Eof do
        TbAlunosDoencas.Delete;


      TbAlunosAlergias.First;
      while not TbAlunosAlergias.Eof do
        TbAlunosAlergias.Delete;

      TbAlunosProdutos.First;
      while not TbAlunosProdutos.Eof do
        TbAlunosProdutos.Delete;

      TbAlunosRemedios.First;
      while not TbAlunosRemedios.Eof do
        TbAlunosRemedios.Delete;


      TbAlunos.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAlunos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFAlunos.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFAlunos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFAlunos.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbAlunos.Bof) then
    TbAlunos.First
  else if (sender = SBLast) and (not TbAlunos.Bof) then
    TbAlunos.Prior
  else if (sender = SBNext) and (not TbAlunos.Eof) then
    TbAlunos.Next
  else if (sender = SBPrior) and (not TbAlunos.Eof) then
    TbAlunos.Last
  else
    TbAlunos.Refresh;
end;

procedure TFAlunos.FormCreate(Sender: TObject);
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

procedure TFAlunos.DSAlunosDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODALUNO) FROM ALUNOS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;

  ImaAluno.Picture := nil;
  ImaPai.Picture := nil;
  ImaMae.Picture := nil;
  ImaResp.Picture := nil; 
  
  try
    ImaAluno.Picture.LoadFromFile(TbAlunosPATHFOTO.Value);
  except
  end;

  if (TbAlunosQUEMBUSCA.Value = 1) or (TbAlunosQUEMBUSCA.Value = 2) then
    try
      ImaPai.Picture.LoadFromFile(TbAlunosPATHFOTOPAI.Value);
    except
    end;

  if (TbAlunosQUEMBUSCA.Value = 1) or (TbAlunosQUEMBUSCA.Value = 3) then
    try
      ImaMae.Picture.LoadFromFile(TbAlunosPATHFOTOMAE.Value);
    except
    end;

  if (TbAlunosQUEMBUSCA.Value = 1) or (TbAlunosQUEMBUSCA.Value = 4) then
    try
      ImaResp.Picture.LoadFromFile(TbAlunosPATHFOTORESP.Value);
    except
    end;
end;

procedure TFAlunos.FormShow(Sender: TObject);
begin
  SBFirstClick(SBRefresh);
end;

procedure TFAlunos.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFAlunos.SBNewRespClick(Sender: TObject);
begin
  try
    ConfTrans(True);
    TbAlunosFunc.Append;
    TbAlunosFuncCODALUNO.Value :=  TbAlunosCODALUNO.Value;
    Application.CreateForm(TFEdAlunosFunc, FEdAlunosFunc);
    FEdAlunosFunc.ShowModal;
  finally
    FreeAndNil(FEdAlunosFunc);
  end;
end;

procedure TFAlunos.SBAltFuncClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EXC', 1) then
    Exit;
  if TbAlunosFunc.IsEmpty then
    Exit;
  try
    TbAlunosFunc.Edit;
    Application.CreateForm(TFEdAlunosFunc, FEdAlunosFunc);
    FEdAlunosFunc.ShowModal;
  finally
    FreeAndNil(FEdAlunosFunc);
  end;
end;

procedure TFAlunos.SBDelFuncClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EXC', 1) then
    Exit;
  if (not TbAlunosFunc.IsEmpty) and
    (MessageDlg(cgMsgDelRespAluno, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAlunosFunc.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAlunos.TbAlunosAfterOpen(DataSet: TDataSet);
begin
  TbAlunosFunc.Open;
  TbAlunosDoencas.Open;
  TbAlunosAlergias.Open;
  TbAlunosProdutos.Open;
  TbAlunosRemedios.Open;
  TbAlunosCarne.Open;
  TbAlunosTrat.Open;
  TbAlunosAv.Open;
  TbAlunosAval.Open;
end;

procedure TFAlunos.TbAlunosAfterClose(DataSet: TDataSet);
begin
  TbAlunosFunc.Close;
  TbAlunosDoencas.Close;
  TbAlunosAlergias.Close;
  TbAlunosProdutos.Close;
  TbAlunosRemedios.Close;
  TbAlunosCarne.Close;
  TbAlunosAv.Close;
  TbAlunosTrat.Close;
  TbAlunosAval.Close;
end;

procedure TFAlunos.SBNewDoencaClick(Sender: TObject);
begin
  try
    ConfTrans(True);
    TbAlunosDoencas.Append;
    TbAlunosDoencasCODALUNO.Value :=  TbAlunosCODALUNO.Value;
    Application.CreateForm(TFEdAlunosDoencas, FEdAlunosDoencas);
    FEdAlunosDoencas.ShowModal;
  finally
    FreeAndNil(FEdAlunosDoencas);
  end;
end;

procedure TFAlunos.SBAltDoencaClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EXC', 1) then
    Exit;
  if TbAlunosDoencas.IsEmpty then
    Exit;
  try
    TbAlunosDoencas.Edit;
    Application.CreateForm(TFEdAlunosDoencas, FEdAlunosDoencas);
    FEdAlunosDoencas.ShowModal;
  finally
    FreeAndNil(FEdAlunosDoencas);
  end;
end;

procedure TFAlunos.SBDelDoencaClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EXC', 1) then
    Exit;
  if (not TbAlunosDoencas.IsEmpty) and
    (MessageDlg(cgMsgDelDoencaAluno, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAlunosDoencas.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAlunos.SBNewAlergiaClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAlunosAlergias.Append;
    TbAlunosAlergiasCODALUNO.Value :=  TbAlunosCODALUNO.Value;
    Application.CreateForm(TFEdAlunosAlergias, FEdAlunosAlergias);
    FEdAlunosAlergias.ShowModal;
  finally
    FreeAndNil(FEdAlunosAlergias);
  end;
end;

procedure TFAlunos.SBAltAlergiaClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  if TbAlunosAlergias.IsEmpty then
    Exit;
  try
    TbAlunosAlergias.Edit;
    Application.CreateForm(TFEdAlunosAlergias, FEdAlunosAlergias);
    FEdAlunosAlergias.ShowModal;
  finally
    FreeAndNil(FEdAlunosAlergias);
  end;
end;

procedure TFAlunos.SBDelAlergiaClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EXC', 1) then
    Exit;
  if (not TbAlunosAlergias.IsEmpty) and
    (MessageDlg(cgMsgDelAlergiaAluno, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAlunosAlergias.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAlunos.SBNewRemedioClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAlunosRemedios.Append;
    TbAlunosRemediosCODALUNO.Value :=  TbAlunosCODALUNO.Value;
    Application.CreateForm(TFEdAlunosRemedios, FEdAlunosRemedios);
    FEdAlunosRemedios.ShowModal;
  finally
    FreeAndNil(FEdAlunosRemedios);
  end;
end;

procedure TFAlunos.SBAltRemedioClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  if TbAlunosRemedios.IsEmpty then
    Exit;
  try
    TbAlunosRemedios.Edit;
    Application.CreateForm(TFEdAlunosRemedios, FEdAlunosRemedios);
    FEdAlunosRemedios.ShowModal;
  finally
    FreeAndNil(FEdAlunosRemedios);
  end;
end;

procedure TFAlunos.SBDelRemedioClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EXC', 1) then
    Exit;
  if (not TbAlunosRemedios.IsEmpty) and
    (MessageDlg(cgMsgDelRemedioAluno, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAlunosRemedios.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAlunos.SBNewProdClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAlunosProdutos.Append;
    TbAlunosProdutosCODALUNO.Value :=  TbAlunosCODALUNO.Value;
    Application.CreateForm(TFEdAlunosProd, FEdAlunosProd);
    FEdAlunosProd.ShowModal;
  finally
    FreeAndNil(FEdAlunosProd);
  end;
end;

procedure TFAlunos.SBAltProdClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  if TbAlunosProdutos.IsEmpty then
    Exit;
  try
    TbAlunosProdutos.Edit;
    Application.CreateForm(TFEdAlunosProd, FEdAlunosProd);
    FEdAlunosProd.ShowModal;
  finally
    FreeAndNil(FEdAlunosProd);
  end;
end;

procedure TFAlunos.SBDelProdClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EXC', 1) then
    Exit;
  if (not TbAlunosProdutos.IsEmpty) and
    (MessageDlg(cgMsgDelConvAluno, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAlunosProdutos.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAlunos.TbAlunosProdutosAfterOpen(DataSet: TDataSet);
begin
  Dados.LKProdutos(True);
end;

procedure TFAlunos.SpeedButton18Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFLancaCarne, FLancaCarne);
    FLancaCarne.ShowModal;
  finally
    FreeAndNil(FLancaCarne);
  end;
end;

procedure TFAlunos.TbAlunosCarneCalcFields(DataSet: TDataSet);
begin
  if TbAlunosCarneSTATUS.Value = 'A' then
    TbAlunosCarneStatusStr.Value := 'Aberto'
  else
    TbAlunosCarneStatusStr.Value := 'Pago'
end;

procedure TFAlunos.SpeedButton1Click(Sender: TObject);
begin
  QryAux.SQL.Text := 'select CODALUNO from alunoscarne where DTVCTO < '''+  FormatDateTime('dd.mm.yyyy',
    TbAlunosCarneDTVCTO.Value) + ''' and STATUS = ''A''';
  QryAux.Open;
  if not QryAux.IsEmpty then begin
    MessageDlg('Existem outros carnês a serem pagos! Operação Abortada!',  mtWarning, [mbOk], 0);
    Qryaux.Close;
    Exit;
  end;
  Qryaux.Close;
  if TbAlunosCarneSTATUS.Value = 'P' then
    MessageDlg('Este carnê já foi pago!', MtWarning, [mbOk], 0)
  else
    try
      FAlunos.TbAlunosCarne.Edit;
      Application.CreateForm(TFBaixaCarne, FBaixaCarne);
      FBaixaCarne.ShowModal;
    finally
      FreeAndNil(FBaixaCarne);
    end;
end;

procedure TFAlunos.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if TbAlunosCarneSTATUS.Value = 'A' then
    DBGrid4.Canvas.Font.color := ClRed
  else
    DBGrid4.Canvas.Font.color := ClGreen;
  DBGrid4.DefaultDrawColumnCell(Rect, Datacol, Column, State);
  with TDBGrid(Sender) do
   if odd(DataSource.DataSet.RecNo) then // Se for número impar
   begin
     Canvas.Brush.Color := clMoneyGreen; // Cor da linha da linha "Zebrada"
     Canvas.FillRect(Rect);
     DefaultDrawDataCell(Rect,Column.Field,State);
     if gdFocused in state then
     begin
       Canvas.Brush.Color := ClWhite; // Cor de seleção
       Canvas.FillRect(Rect);
       DefaultDrawDataCell(Rect,Column.Field,State);
     end;
   end;
end;

procedure TFAlunos.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if TbAlunosDoencasCODDOENCA.Value > 2 then
    DBGrid6.Canvas.Font.color := ClRed
  else
    DBGrid6.Canvas.Font.Color := ClGreen;
  DBGrid6.DefaultDrawColumnCell(Rect, Datacol, Column, State);
  with TDBGrid(Sender) do
   if odd(DataSource.DataSet.RecNo) then // Se for número impar
   begin
     Canvas.Brush.Color := clMoneyGreen; // Cor da linha da linha "Zebrada"
     Canvas.FillRect(Rect);
     DefaultDrawDataCell(Rect,Column.Field,State);
     if gdFocused in state then
     begin
       Canvas.Brush.Color := ClWhite; // Cor de seleção
       Canvas.FillRect(Rect);
       DefaultDrawDataCell(Rect,Column.Field,State);
     end;
   end;
end;

procedure TFAlunos.AlunosInadimplentes1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFAlunosInad, FAlunosInad);
    FAlunosInad.ShowModal;
  finally
    FreeAndNil(FAlunosInad);
  end;
end;

procedure TFAlunos.SBNewTratClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAlunosTrat.Append;
    TbAlunosTratCODALUNO.Value :=  TbAlunosCODALUNO.Value;
    Application.CreateForm(TFEdAlunosTrat, FEdAlunosTrat);
    FEdAlunosTrat.ShowModal;
  finally
    FreeAndNil(FEdAlunosTrat);
  end;
end;

procedure TFAlunos.SBAltTratClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  if TbAlunosTrat.IsEmpty then
    Exit;
  try
    TbAlunosTrat.Edit;
    Application.CreateForm(TFEdAlunosTrat, FEdAlunosTrat);
    FEdAlunosTrat.ShowModal;
  finally
    FreeAndNil(FEdAlunosTrat);
  end;
end;

procedure TFAlunos.SBDelTratClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EXC', 1) then
    Exit;
  if (not TbAlunosFunc.IsEmpty) and
    (MessageDlg('Deseja excluir o tratamento do aluno selecionado?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAlunosTrat.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAlunos.SBNewAvClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAlunosAv.Append;
    TbAlunosAvDTHRINS.Value := Now;
    TbAlunosAvCODALUNO.Value :=  TbAlunosCODALUNO.Value;
    TbAlunosAvSTATUS.Value := 1;
    
    QryProx.SQL.Text := 'SELECT MAX(CODAVISO) FROM ALUNOSAVISO where CODALUNO = '+  IntToStr(FAlunos.TbAlunosCODALUNO.Value);
    QryProx.Open;
    TbAlunosAvCODAVISO.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdAlunosSaidas, FEdAlunosSaidas);
    FEdAlunosSaidas.ShowModal;
  finally
    FreeAndNil(FEdAlunosSaidas);
  end;
end;

procedure TFAlunos.SBEditAvClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  if TbAlunosAv.IsEmpty then
    Exit;
  try
    TbAlunosAv.Edit;
    Application.CreateForm(TFEdAlunosSaidas, FEdAlunosSaidas);
    FEdAlunosSaidas.ShowModal;
  finally
    FreeAndNil(FEdAlunosSaidas);
  end;
end;

procedure TFAlunos.SBDelAvClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EXC', 1) then
    Exit;
  if (not TbAlunosAv.IsEmpty) and
    (MessageDlg('Deseja excluir a saída antecipada do aluno selecionado?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbAlunosAv.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFAlunos.TbAlunosAvCalcFields(DataSet: TDataSet);
begin
  case TbAlunosAvSTATUS.Value of
    0: TbAlunosAvStatusSTR.Value := 'Concluído';
    1: TbAlunosAvStatusSTR.Value := 'Aberto';
  end;
end;

procedure TFAlunos.SBNewBolClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAlunosAval.Append;
    TbAlunosAvalCODALUNO.Value := TbAlunosCODALUNO.Value;
    TbAlunosAvalPERIODO.Value := IntToStr(MonthOf(Date)) +'/'+  IntToStr(YearOf(Date));
    Application.CreateForm(TFEdAlunosBoletim, FEdAlunosBoletim);
    FEdAlunosBoletim.ShowModal;
  finally
    FreeAndNil(FEdAlunosBoletim);
  end;
end;

procedure TFAlunos.TbAlunosAvalCalcFields(DataSet: TDataSet);
begin
  case TbAlunosAvalCOMP.Value of
    0: TbAlunosAvalComportamento.Value := '';
    1: TbAlunosAvalComportamento.Value := 'NS - Não Satisfatório';
    2: TbAlunosAvalComportamento.Value := 'R - Regular';
    3: TbAlunosAvalComportamento.Value := 'B - Bom';
    4: TbAlunosAvalComportamento.Value := 'MB - Muito Bom';
    5: TbAlunosAvalComportamento.Value := 'E - Excelente';
  end;

  case TbAlunosAvalHIG.Value of
    0: TbAlunosAvalHigiene.Value := '';
    1: TbAlunosAvalHigiene.Value := 'NS - Não Satisfatório';
    2: TbAlunosAvalHigiene.Value := 'R - Regular';
    3: TbAlunosAvalHigiene.Value := 'B - Bom';
    4: TbAlunosAvalHigiene.Value := 'MB - Muito Bom';
    5: TbAlunosAvalHigiene.Value := 'E - Excelente';
  end;

  case TbAlunosAvalATE.Value of
    0: TbAlunosAvalAtencao.Value := '';
    1: TbAlunosAvalAtencao.Value := 'NS - Não Satisfatório';
    2: TbAlunosAvalAtencao.Value := 'R - Regular';
    3: TbAlunosAvalAtencao.Value := 'B - Bom';
    4: TbAlunosAvalAtencao.Value := 'MB - Muito Bom';
    5: TbAlunosAvalAtencao.Value := 'E - Excelente';
  end;

  case TbAlunosAvalASD.Value of
    0: TbAlunosAvalAssiduidade.Value := '';
    1: TbAlunosAvalAssiduidade.Value := 'NS - Não Satisfatório';
    2: TbAlunosAvalAssiduidade.Value := 'R - Regular';
    3: TbAlunosAvalAssiduidade.Value := 'B - Bom';
    4: TbAlunosAvalAssiduidade.Value := 'MB - Muito Bom';
    5: TbAlunosAvalAssiduidade.Value := 'E - Excelente';
  end;

  case TbAlunosAvalDM.Value of
    0: TbAlunosAvalDesenMot.Value := '';
    1: TbAlunosAvalDesenMot.Value := 'NS - Não Satisfatório';
    2: TbAlunosAvalDesenMot.Value := 'R - Regular';
    3: TbAlunosAvalDesenMot.Value := 'B - Bom';
    4: TbAlunosAvalDesenMot.Value := 'MB - Muito Bom';
    5: TbAlunosAvalDesenMot.Value := 'E - Excelente';
  end;
end;

procedure TFAlunos.IMAbertoClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  TbAlunosAv.Edit;
  if (sender = IMAberto) and (TbAlunosAvSTATUS.Value = 0)then
    TbAlunosAvSTATUS.Value := 1
  else if (sender = IMConcluido) and (TbAlunosAvSTATUS.Value = 1) then
    TbAlunosAvSTATUS.Value := 0;
  TbAlunosAv.Post;
  ConfTrans(True);
end;

procedure TFAlunos.DBGrid11DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if TbAlunosAvSTATUS.Value = 1 then
    DBGrid11.Canvas.Font.color := clGreen
  else
    DBGrid11.Canvas.Font.color := clRed;
  DBGrid11.DefaultDrawColumnCell(Rect, Datacol, Column, State);
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

procedure TFAlunos.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFAlunos.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFAlunos.Simples1Click(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    FRelatoriosSint.Caption := 'Relatório Sintético de Alunos';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

procedure TFAlunos.Estatstico1Click(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosEst, FRelatoriosEst);
    FRelatoriosEst.ShowModal;
  finally
    FreeAndnil(FRelatoriosEst);
  end;
end;

procedure TFAlunos.TbAlunosCalcFields(DataSet: TDataSet);
begin
  TbAlunosIdade.Clear;
  TbAlunosIdadePai.Clear;
  TbAlunosIdadeMae.Clear;
  TbAlunosIdadeResp.Clear;
  if not TbAlunosDTNASC.IsNull then
    TbAlunosIdade.Value := IntToStr(YearsBetween(Date, TbAlunosDTNASC.Value)) + ' anos';
  if not TbAlunosDTNASCPAI.IsNull then
    TbAlunosIdadePai.Value := IntToStr(YearsBetween(Date, TbAlunosDTNASCPAI.Value)) + ' anos';
  if not TbAlunosDTNASCMAE.IsNull then
    TbAlunosIdadeMae.Value := IntToStr(YearsBetween(Date, TbAlunosDTNASCMAE.Value)) + ' anos';
  if not TbAlunosDTNASCRESP.IsNull then
    TbAlunosIdadeResp.Value := IntToStr(YearsBetween(Date, TbAlunosDTNASCRESP.Value)) + ' anos';
end;

procedure TFAlunos.SBEditBolClick(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbAlunosAval.Edit;
    Application.CreateForm(TFEdAlunosBoletim, FEdAlunosBoletim);
    FEdAlunosBoletim.ShowModal;
  finally
    FreeAndNil(FEdAlunosBoletim);
  end;
end;

procedure TFAlunos.FaixaEtria1Click(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosFaixa, FRelatoriosFaixa);
    FRelatoriosFaixa.Caption := 'Relatório por Faixa Etária';
    FRelatoriosFaixa.ShowModal;
  finally
    FreeAndNil(FRelatoriosFaixa);
  end;
end;

procedure TFAlunos.FichadoAluno1Click(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFFichaAluno, FFichaAluno);
    FFichaAluno.ShowModal;
  finally
    FreeAndNil(FFichaAluno);
  end;
end;

end.
