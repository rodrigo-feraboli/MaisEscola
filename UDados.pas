unit UDados;

interface

uses
  SysUtils, Classes, DB, MDODatabase, MDOCustomDataSet, MDOTable, MDOQuery, IniFiles, Forms, Dialogs,
  ShellAPI, MAPI, Windows, ImgList, Controls, Graphics, RpBase, RpSystem,
  RpRender, RpRenderCanvas, RpRenderPreview, RpDefine, RpCon, RpConDS,
  RLXLSFilter, RLPDFFilter, RLHTMLFilter, RLFilters, RLRichFilter,
  MDOScript;

type
  TConsisteInscricaoEstadual  = function (const Insc, UF: String): Integer; stdcall;
  TVersaoDLL                  = function : Integer; stdcall;

type
  TDados = class(TDataModule)
    Database: TMDODatabase;
    TransactionLK: TMDOTransaction;
    QryCidadesLK: TMDOQuery;
    QryAux: TMDOQuery;
    QryBairrosLK: TMDOQuery;
    QryConveniosLK: TMDOQuery;
    QryDoencasLK: TMDOQuery;
    QryEstadosLK: TMDOQuery;
    QryTurmasLK: TMDOQuery;
    Transaction: TMDOTransaction;
    QryProxCod: TMDOQuery;
    TbConfig: TMDODataSet;
    QryLogin: TMDOQuery;
    QryLoginCODUSUARIO: TIntegerField;
    QryLoginLOGIN: TMDOStringField;
    QryLoginSENHA: TMDOStringField;
    QryModulosLK: TMDOQuery;
    QryModulosLKCODMODULO: TIntegerField;
    QryModulosLKDESCRICAO: TMDOStringField;
    ODFotos: TOpenDialog;
    QryProfissoesLK: TMDOQuery;
    QryNiver: TMDOQuery;
    QryNiverTIPO: TMDOStringField;
    QryNiverNOME: TMDOStringField;
    QryNiverDIA: TSmallintField;
    QryNiverMES: TSmallintField;
    QryFornLK: TMDOQuery;
    QryRefeicoesLK: TMDOQuery;
    QryRel: TMDOQuery;
    ILSistema: TImageList;
    QryExecSQL: TMDOQuery;
    DSRefeicoesLK: TDataSource;
    DSProfissoesLK: TDataSource;
    DSFornLK: TDataSource;
    DSDoencasLK: TDataSource;
    DSConveniosLK: TDataSource;
    DSTurmasLK: TDataSource;
    DSCidadesLK: TDataSource;
    DSEstadosLK: TDataSource;
    DSBairrosLK: TDataSource;
    QryAlunosLK: TMDOQuery;
    DSAlunosLK: TDataSource;
    QryAutoresLK: TMDOQuery;
    DSAutoresLK: TDataSource;
    QryDiscLK: TMDOQuery;
    DSDiscLK: TDataSource;
    QryEditorasLK: TMDOQuery;
    DSEditorasLK: TDataSource;
    QryFuncLK: TMDOQuery;
    DSFuncLK: TDataSource;
    QryGenerosLK: TMDOQuery;
    DSGenerosLK: TDataSource;
    QryRemediosLK: TMDOQuery;
    DSRemediosLK: TDataSource;
    QryProdutosLK: TMDOQuery;
    DSProdutosLK: TDataSource;
    QryProdutosAlunosLK: TMDOQuery;
    DSProdutosAlunosLK: TDataSource;
    QryAlergiasLK: TMDOQuery;
    DSAlergiasLK: TDataSource;
    TbAcesso: TMDODataSet;
    TbAcessoCODUSUARIO: TSmallintField;
    TbAcessoDATAHORA: TDateTimeField;
    TbAcessoMODULO: TMDOStringField;
    TbAcessoTIPO: TSmallintField;
    TbAcessoACESSO: TMDOStringField;
    QryAtividadesLK: TMDOQuery;
    DSAtividadesLK: TDataSource;
    TbConfigCODEMPRESA: TSmallintField;
    TbConfigNOMESISTEMA: TMDOStringField;
    TbConfigEMPRESA: TMDOStringField;
    TbConfigVERSAO: TMDOStringField;
    TbConfigCORSISTEMA: TMDOStringField;
    TbConfigPATHSAVEBACKUP: TMDOStringField;
    TbConfigDATAULTBACKUP: TDateField;
    TbConfigMAILSMTP: TMDOStringField;
    TbConfigMAILPASS: TMDOStringField;
    TbConfigMAILAUTENTICA: TSmallintField;
    TbConfigMAILPORTA: TSmallintField;
    TbConfigMAILPRIORITY: TSmallintField;
    TbConfigMAILFROM: TMDOStringField;
    TbConfigMAILNAME: TMDOStringField;
    TbConfigOPT: TMDOStringField;
    TbConfigOPTPERC: TMDOBCDField;
    TbConfigOPTVALOR: TMDOBCDField;
    DSTratLK: TDataSource;
    QryTratLK: TMDOQuery;
    TbConfigENDERECO: TMDOStringField;
    TbConfigCODCIDADE: TSmallintField;
    TbConfigCODBAIRRO: TSmallintField;
    TbConfigCEP: TMDOStringField;
    QryCondPgtoLK: TMDOQuery;
    QryCFOPLK: TMDOQuery;
    DSCFOPLK: TDataSource;
    DSCondPgtoLK: TDataSource;
    QryAcervosLK: TMDOQuery;
    DSAcervosLK: TDataSource;
    TbConfigMULTA: TMDOStringField;
    TbConfigMULTAPERC: TMDOBCDField;
    TbConfigMULTAVALOR: TMDOBCDField;
    QryTranspLK: TMDOQuery;
    DSTranspLK: TDataSource;
    TbConfigCODCONDPGTO: TSmallintField;
    QryBancosLK: TMDOQuery;
    DSBancosLK: TDataSource;
    QryCCLK: TMDOQuery;
    DSCCLK: TDataSource;
    RLRichFilter1: TRLRichFilter;
    RLHTMLFilter1: TRLHTMLFilter;
    RLPDFFilter1: TRLPDFFilter;
    RLXLSFilter1: TRLXLSFilter;
    TbConfigCODCC: TSmallintField;
    ScriptSQL: TMDOScript;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure QryEstadosLKAfterOpen(DataSet: TDataSet);
    procedure QryBairrosLKAfterOpen(DataSet: TDataSet);
    procedure QryCidadesLKAfterOpen(DataSet: TDataSet);
    procedure QryConveniosLKAfterOpen(DataSet: TDataSet);
    procedure QryDoencasLKAfterOpen(DataSet: TDataSet);
    procedure QryTurmasLKAfterOpen(DataSet: TDataSet);
    procedure QryProfissoesLKAfterOpen(DataSet: TDataSet);
    procedure QryFornLKAfterOpen(DataSet: TDataSet);
    procedure QryRefeicoesLKAfterOpen(DataSet: TDataSet);
    procedure QryAlunosLKAfterOpen(DataSet: TDataSet);
    procedure QryAutoresLKAfterOpen(DataSet: TDataSet);
    procedure QryDiscLKAfterOpen(DataSet: TDataSet);
    procedure QryEditorasLKAfterOpen(DataSet: TDataSet);
    procedure QryFuncLKAfterOpen(DataSet: TDataSet);
    procedure QryGenerosLKAfterOpen(DataSet: TDataSet);
    procedure QryProdutosLKAfterOpen(DataSet: TDataSet);
    procedure QryProdutosAlunosLKAfterOpen(DataSet: TDataSet);
    procedure QryAlergiasLKAfterOpen(DataSet: TDataSet);
    procedure QryRemediosLKAfterOpen(DataSet: TDataSet);
    procedure QryAtividadesLKAfterOpen(DataSet: TDataSet);
    procedure QryTratLKAfterOpen(DataSet: TDataSet);
    procedure QryCondPgtoLKAfterOpen(DataSet: TDataSet);
    procedure QryCFOPLKAfterOpen(DataSet: TDataSet);
    procedure QryAcervosLKAfterOpen(DataSet: TDataSet);
    procedure QryTranspLKAfterOpen(DataSet: TDataSet);
    procedure QryBancosLKAfterOpen(DataSet: TDataSet);
    procedure QryCCLKAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure LancarPassar(ppModulo: String);
    procedure CapturaErro (Sender: TObject; E: Exception);
  public
    { Public declarations }
    vgTeste: Boolean;
    vgCorGrid, vgCorBusca, vgCorFoco: TColor;
    procedure ConfTrans(Conf: Boolean);
    procedure CloseAll;
    procedure LKBairros(Opt: Boolean);
    procedure LKCidades(Opt: Boolean);
    procedure LKConvenios(Opt: Boolean);
    procedure LKDoencas(Opt: Boolean);
    procedure LKEstados(Opt: Boolean);
    procedure LKTurmas(Opt: Boolean);
    procedure LKProfissoes(Opt: Boolean);
    procedure LKFuncionarios(Opt: Boolean);
    procedure LKEditoras(Opt: Boolean);
    procedure LKGeneros(Opt: Boolean);
    procedure LKRemedios(Opt: Boolean);
    procedure LKDisc(Opt: Boolean);
    procedure LKAutores(Opt: Boolean);
    procedure LKAlunos(Opt: Boolean);
    procedure LKFornecedores(Opt: Boolean);
    procedure LKRefeicoes(Opt: Boolean);
    procedure LKProdutos(Opt: Boolean);
    procedure LKAlergias(Opt: Boolean);
    procedure LKAtividades(Opt: Boolean);
    procedure LKTratamentos(Opt: Boolean);
    procedure ExibirNivers;
    procedure AbreConfig;
    procedure ControleAcesso(ppModulo, ppTipo: String; Opt: Boolean);
    function VerificaCNPJ(vfCNPJ: String): Boolean;
    function VerificaCPF(vfCPF: String): Boolean;
    function VerificaIE(vfIE, vfUF: String): Integer;
    procedure Atualizacoes;
  end;

var
  Dados: TDados;
  function VerificarPermissao (vfPermissao: String; vfTipo: String; vfMsg:Smallint): Boolean;
  procedure AbreAjuda;
  procedure ExecSQL(vlSQL: String);

const
  cgNomeEmp: String[30] = 'Vinhedos Sistemas Ltda.';
  cgVersao: String[5] = '1.0.1';
  cgMsgCancel: String = 'Deseja cancelar a edição do registro?';
  cgMsgErroPost: String = 'Erro ao tentar gerar registro!';
  cgMsgErroCancel: String = 'Erro ao tentar cancelar registro!';
  cgMsgNotFound: String = 'Consulta sem registros!';
  cgMsgErroDel: String = 'Erro ao tentar apagar o registro!';
  cgMsgFinalizaSis: String = 'Deseja finalizar o Sistema?';
  cgMsgErroAcesso: String = 'Erro ao tentar passar novos módulos - Código: ';
  cgMsgEspDescTurma: String = 'Especifique a descrição da turma!';
  cgMsgEspLogin: String = 'Especifique um login!';
  cgMsgEspSenha: String = 'Especifique uma senha!';
  cgMsgEspLoginSenha: String = 'Especifique um login e/ou senha válidos!';
  cgMsgBancoDadosCopy: String = 'Banco de Dados copiado com sucesso!';
  cgMsgBancoDadosError: String = 'Erro ao copiar Banco de Dados - Verifique outro aplicativo está utilizando-o!';
  cgEspData: String = 'Especifique a data!';
  cgEspDataCom: String = 'Especifique a descrição da data comemorativa!';
  cgEspDescBairro: String = 'Especifique a descrição do bairro!';
  cgEspDescDoenca: String = 'Especifique a descrição da doença!';
  cgEspDescCC: String = 'Especifique a descrição do centro de custo!';
  cgEspDescCondPgto: String = 'Especifique a descrição da condição de pagamento!';
  cgEspDescCFOP: String = 'Especifique a descrição da CFOP!';
  cgEspDescRemedio: String = 'Especifique a descrição do remédio!';
  cgEspDescProf: String = 'Especifique a descrição da profissão!';
  cgEspDescEst: String = 'Especifique a descrição do estado!';
  cgEspDescEstUF: String = 'Especifique o UF do estado!';
  cgEspDescMatriculaAluno: String = 'Especifique a matrícula do aluno!';
  cgEspDescNomeAluno: String = 'Especifique o nome do aluno!';
  cgEspDescDtNascAluno: String = 'Especifique a data de nascimento do aluno!';
  cgEspDescFunc: String = 'Especifique o nome do funcionário!';
  cgEspDescForn: String = 'Especifique o nome do fornecedor!';
  cgEspDescCidadeIEForn: String = 'Especifique a cidade do fornecedor e após a IE!';
  cgEspDescFuncRespAluno: String = 'Especifique o funcionário responsável pelo aluno!';
  cgEspFuncAlunoJa: String = 'Este funcionário já foi adicionado a este aluno!';
  cgEspLogUsu: String = 'Especifique o login do usuário!';
  cgEspNomeAcervo: String = 'Especifique o nome do acervo!';
  cgEspNomeEditora: String = 'Especifique a descrição da editora!';
  cgEspNomeGenero: String = 'Especifique a descrição do gênero!';
  cgEspNomeAutor: String = 'Especifique nome do autor!';
  cgEspNomeDisc: String = 'Especifique a descrição da disciplina!';
  cgEspNomeProd: String = 'Especifique a descrição do produto!';
  cgEspNomeAlergia: String = 'Especifique a descrição da alergia!';
  cgEspAlergiaAluno: String = 'Especifique a alergia do aluno!';
  cgEspRemedioAluno: String = 'Especifique o remédio do aluno!';
  cgEspConvAluno: String = 'Especifique a conveniência do aluno!';
  cgMsgDelTurma : String = 'Deseja excluir a turma selecionada?';
  cgMsgDelUsuario : String = 'Deseja excluir o usúario selecionado?';
  cgMsgDelAtTurma: String = 'Deseja excluir a atividade da turma selecionada?';
  cgMsgDelDtCom: String = 'Deseja excluir a data comemorativa selecionada?';
  cgMsgDelDoenca: String = 'Deseja excluir a doença selecionada?';
  cgMsgDelCC: String = 'Deseja excluir o centro de custo selecionada?';
  cgMsgDelBanco: String = 'Deseja excluir o banco selecionado?';
  cgMsgDelCFOP: String = 'Deseja excluir a CFOP selecionada?';
  cgMsgDelCondPgto: String = 'Deseja excluir a condição de pagamento selecionada?';
  cgMsgDelRemedio: String = 'Deseja excluir o remédio selecionado?';
  cgMsgDelProfissao: String = 'Deseja excluir a profissão selecionada?';
  cgMsgDelEstado: String = 'Deseja excluir o estado selecionado?';
  cgMsgDelCidade: String = 'Deseja excluir a cidade selecionada?';
  cgMsgDelAluno: String = 'Deseja excluir o aluno selecionado?';
  cgMsgDelCP: String = 'Deseja excluir a Conta a Pagar?';
  cgMsgDelCompra: String = 'Deseja excluir a venda selecionada?';
  cgMsgDelItemCompra: String = 'Deseja excluir o item da venda selecionada?';
  cgMsgDelRespAluno: String = 'Deseja excluir o responsável do aluno?';
  cgMsgDelDoencaAluno: String = 'Deseja excluir a doença do aluno selecionada?';
  cgMsgDelAlergiaAluno: String = 'Deseja excluir a alergia do aluno selecionada?';
  cgMsgDelCPParc: String = 'Deseja excluir a parcela da conta a pagar?';
  cgMsgDelCRParc: String = 'Deseja excluir a parcela da conta a receber?';
  cgMsgDelRemedioAluno: String = 'Deseja excluir o remédio do aluno selecionada?';
  cgMsgDelConvAluno: String = 'Deseja excluir a convêniencia do aluno selecionada?';
  cgMsgDelFunc: String = 'Deseja excluir o funcionário selecionado?';
  cgMsgDelForn: String = 'Deseja excluir o fornecedor selecionado?';
  cgMsgDigiteCNPJ: String = 'Digite o CNPJ!';

implementation

uses UTelaIni, USistema;

{$R *.dfm}

procedure ExecSQL(vlSQL: String);
begin
  try
    Dados.ScriptSQL.Script.Text := vlSQL;
    Dados.ScriptSQL.ExecuteScript;
    Dados.ConfTrans(True);
    FtelaIni.PBParc.StepBy(1);
    Application.ProcessMessages;
  except
    Dados.ConfTrans(False);
  end;
end;

procedure TDados.Atualizacoes;
var
  vlVersao, vlVersaoAnt: Smallint;
  procedure Versao101;
  var
    i: smallint;
  begin
    i:= 40;
    FTelaIni.PBParc.Max := i;
    FTelaIni.PBParc.Position := 0;
    FTelaIni.LblEtapa.Caption := 'Etapa '+ IntToStr(FTelaIni.PBTot.Position + 1) +' de '+ IntToStr(FTelaIni.PBTot.Max);
    FTelaIni.LblVersao.Caption := 'Aguarde... Atualizando o Sistema para a Versão 1.0.1';
    ExecSQL('CREATE TABLE CHEQUES ( '+
      'CODIGO     SMALLINT NOT NULL, '+
      'CODBANCO   SMALLINT, '+
      'AGENCIA    VARCHAR(10) COLLATE PXW_INTL850, '+
      'CONTA      VARCHAR(20) COLLATE PXW_INTL850, '+
      'NUMERO     VARCHAR(20) COLLATE PXW_INTL850, '+
      'BOMPARA    DATE, '+
      'VALOR      DINHEIRO, '+
      'OBS        MEMO , '+
      'CODALUNO   SMALLINT, '+
      'EMITENTE   VARCHAR(80) COLLATE PXW_INTL850, '+
      'PREDAT     SMALLINT, '+
      'BAIXADO    SMALLINT, '+
      'CANCELADO  SMALLINT, '+
      'CONSTRAINT PK_CHEQUES PRIMARY KEY (CODIGO))');
    LancarPassar('CHEQUES');
    ExecSQL('CREATE INDEX IN_CHEQUES_NOME ON CHEQUES (BOMPARA)');
    ExecSQL('CREATE INDEX IN_CHEQUES_EMITENTE ON CHEQUES (EMITENTE)');
    ExecSQL('CREATE INDEX IN_CPAGAR_DATA ON CPAGAR (DATA)');
    ExecSQL('CREATE INDEX IN_CRECEBER_DATA ON CRECEBER (DATA)');
    ExecSQL('ALTER TABLE ACERVO ADD TITULO2 VARCHAR(80) CHARACTER SET WIN1252 COLLATE PXW_INTL850  ');
    ExecSQL('UPDATE ACERVO SET TITULO2 = TITULO');
    ExecSQL('ALTER TABLE ACERVO DROP TITULO');
    ExecSQL('ALTER TABLE ACERVO ADD TITULO VARCHAR(80) CHARACTER SET WIN1252 COLLATE PXW_INTL850  ');
    ExecSQL('UPDATE ACERVO SET TITULO = TITULO2');
    ExecSQL('ALTER TABLE ACERVO DROP TITULO2');
    ExecSQL('CREATE INDEX IN_ACERVO_TITULO ON ACERVO (titulo)');
    ExecSQL('ALTER TABLE TURMAS ADD DESCRICAO2 VARCHAR(80) CHARACTER SET WIN1252 COLLATE PXW_INTL850');
    ExecSQL('UPDATE TURMAS SET DESCRICAO2 = DESCRICAO');
    ExecSQL('ALTER TABLE TURMAS DROP DESCRICAO');
    ExecSQL('ALTER TABLE TURMAS ADD DESCRICAO VARCHAR(80) CHARACTER SET WIN1252 COLLATE PXW_INTL850');
    ExecSQL('UPDATE TURMAS SET DESCRICAO = DESCRICAO2');
    ExecSQL('CREATE INDEX IN_TURMAS_DESCRICAO ON TURMAS (DESCRICAO)');
    ExecSQL('ALTER TABLE TURMAS DROP DESCRICAO2');
    ExecSQL('CREATE INDEX IN_COMPRAS_DATA ON COMPRAS (DATACOMPRA)');
    ExecSQL('CREATE INDEX IN_COMPRAS_FORN ON COMPRAS (CODFORNGEN)');
    ExecSQL('CREATE INDEX IN_PRODUTOS_DESCRICAO ON PRODUTOS (DESCRICAO)');
    ExecSQL('ALTER TABLE GEN ADD NOME2 VARCHAR(80) CHARACTER SET WIN1252 COLLATE PXW_INTL850 ');
    ExecSQL('UPDATE GEN SET NOME2 = NOME');
    ExecSQL('ALTER TABLE GEN DROP NOME');
    ExecSQL('ALTER TABLE GEN ADD NOME VARCHAR(80) CHARACTER SET WIN1252 COLLATE PXW_INTL850 ');
    ExecSQL('UPDATE GEN SET NOME = NOME2');
    ExecSQL('ALTER TABLE GEN DROP NOME2');
    ExecSQL('CREATE INDEX IN_GEN_NOME ON GEN (NOME)');
    ExecSQL('ALTER TABLE ALUNOS ADD NOME2 VARCHAR(80) CHARACTER SET WIN1252 COLLATE PXW_INTL850 ');
    ExecSQL('UPDATE ALUNOS SET NOME2 = NOME');
    ExecSQL('ALTER TABLE ALUNOS DROP NOME');
    ExecSQL('ALTER TABLE ALUNOS ADD NOME VARCHAR(80) CHARACTER SET WIN1252 COLLATE PXW_INTL850 ');
    ExecSQL('UPDATE ALUNOS SET NOME = NOME2');    
    ExecSQL('ALTER TABLE ALUNOS DROP NOME2');
    ExecSQL('CREATE INDEX IN_ALUNOS_NOME ON ALUNOS (NOME)');
    ExecSQL('ALTER TABLE CONFIG ADD CODCC SMALLINT');
    ExecSQL('ALTER TABLE CONFIG ADD CONSTRAINT FK_CONFIG_CC FOREIGN KEY (CODCC) REFERENCES CC(CODCC)');
    FTelaIni.PBTot.StepBy(1);
  end;

{  procedure Versao102;
  var
    i: smallint;
  begin
    i:= 50;
    FTelaIni.PBParc.Max := i;
    FTelaIni.PBParc.Position := 0;
    FTelaIni.LblVersao.Caption := 'Aguarde... Atualizando o Sistema para a Versão 1.0.2';
    FTelaIni.LblEtapa.Caption := 'Etapa '+ IntToStr(FTelaIni.PBTot.Position + 1) +' de '+ IntToStr(FTelaIni.PBTot.Max);
    for i:= 1 to  50 do begin
      FTelaIni.PBParc.StepBy(1);
      Application.ProcessMessages;
      Sleep(200);
    end;
    FTelaIni.PBTot.StepBy(1);
  end;

  procedure Versao103;
  var
    i: smallint;
  begin
    i:= 50;
    FTelaIni.PBParc.Max := i;
    FTelaIni.PBParc.Position := 0;
    FTelaIni.LblVersao.Caption := 'Aguarde... Atualizando o Sistema para a Versão 1.0.3';
    FTelaIni.LblEtapa.Caption := 'Etapa '+ IntToStr(FTelaIni.PBTot.Position + 1) +' de '+ IntToStr(FTelaIni.PBTot.Max);
    for i:= 1 to  50 do begin
      FTelaIni.PBParc.StepBy(1);
      Application.ProcessMessages;
      Sleep(150);
    end;
    FTelaIni.PBTot.StepBy(1);
  end;

  procedure Versao104;
  var
    i: smallint;
  begin
    i:= 50;
    FTelaIni.PBParc.Max := i;
    FTelaIni.PBParc.Position := 0;
    FTelaIni.LblVersao.Caption := 'Aguarde... Atualizando o Sistema para a Versão 1.0.4';
    FTelaIni.LblEtapa.Caption := 'Etapa '+ IntToStr(FTelaIni.PBTot.Position + 1) +' de '+ IntToStr(FTelaIni.PBTot.Max);
    for i:= 1 to  50 do begin
      FTelaIni.PBParc.StepBy(1);
      Application.ProcessMessages;
      Sleep(85);
    end;
    FTelaIni.PBTot.StepBy(1);
  end;

  procedure Versao105;
  var
    i: smallint;
  begin
    i:= 50;
    FTelaIni.PBParc.Max := i;
    FTelaIni.PBParc.Position := 0;
    FTelaIni.LblVersao.Caption := 'Aguarde... Atualizando o Sistema para a Versão 1.0.5';
    FTelaIni.LblEtapa.Caption := 'Etapa '+ IntToStr(FTelaIni.PBTot.Position + 1) +' de '+ IntToStr(FTelaIni.PBTot.Max);
    for i:= 1 to  50 do begin
      FTelaIni.PBParc.StepBy(1);
      Application.ProcessMessages;
      Sleep(75);
    end;
    FTelaIni.PBTot.StepBy(1);
  end;    }

  // Versões antigas (deixar aqui)
//    LancarPassar('CONSULTA A ANIVERSARIANTES');
//    LancarPassar('CONSULTA A SAÍDAS');
//    LancarPassar('GERAÇÃO DE ETIQUETAS');
//    LancarPassar('CONTAS A PAGAR');
//    LancarPassar('CONTAS A RECEBER');
//    LancarPassar('BANCOS');
//    LancarPassar('CENTRO DE CUSTOS');
begin
  vlVersao := StrToInt(StringReplace(cgVersao, '.', '', [rfReplaceAll]));
  Dados.QryAux.SQL.Text := 'SELECT VERSAO FROM CONFIG';
  Dados.QryAux.Open;
  vlVersaoAnt := StrToInt(StringReplace(Dados.QryAux.Fields[0].AsString, '.', '', [rfReplaceAll]));
  Dados.QryAux.Close;     

  if vlVersao - vlVersaoAnt > 0 then  begin
    FTelaIni.PBTot.Max := vlVersao - vlVersaoAnt;
    FtelaIni.ClientHeight := 304;
    if vlVersaoAnt < 101 then
      versao101;
  end;

  FtelaIni.ClientHeight := 209;
  if vlVersao <> vlVersaoAnt then begin
    Dados.QryAux.SQL.Text := 'UPDATE CONFIG SET VERSAO = '''+ CgVersao +'''';
    Dados.QryAux.ExecSQL;
    Dados.Transaction.CommitRetaining;
    Dados.Transaction.Active := False;
    Dados.Transaction.StartTransaction;
  end;
end;

procedure AbreAjuda;
begin
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TDados.CapturaErro(Sender: TObject; E: Exception);
var
  vlf:TextFile;
  vlPasta, vlArq: String;
begin
  vlPasta := ExtractFilePath(Application.ExeName);
  vlArq := 'Errors.txt';
  if not FileExists(vlPasta + vlArq) then
    FileCreate(vlPasta + vlArq);
  AssignFile(vlf, vlPasta + vlArq);
  Append(vlf);
  Writeln(vlf, FormatDateTime('dd/MM/yyy - hh:mm:ss', Now)+ ' - '+ screen.activeform.name +' - '+  e.message);
  CloseFile(vlf);
  MessageDlg(e.message, mtWarning, [mbOk], 0);
end;

function TDados.VerificaCNPJ(vfCNPJ: String): Boolean;
var
  vld1, vld2, vln1, vln2, vln3, vln4, vln5, vln6, vln7, vln8, vln9, vln10, vln11, vln12: Integer;
  vldigitado, vlcalculado: String;
begin
  vld1 := 0; vld2 := vld1; vln1 := vld1; vln2 := vld1;  vln3 := vld1;  vln4 := vld1;  vln5 := vld1;
  vln6 := vld1;  vln7 := vld1;  vln8 := vld1;  vln9 := vld1;  vln10 := vld1;  vln11 := vld1;
  vln12 := vld1;

  vldigitado := ''; vlcalculado := vldigitado;

  vln1:=StrToInt(vfCNPJ[1]);
  vln2:=StrToInt(vfCNPJ[2]);
  vln3:=StrToInt(vfCNPJ[3]);
  vln4:=StrToInt(vfCNPJ[4]);
  vln5:=StrToInt(vfCNPJ[5]);
  vln6:=StrToInt(vfCNPJ[6]);
  vln7:=StrToInt(vfCNPJ[7]);
  vln8:=StrToInt(vfCNPJ[8]);
  vln9:=StrToInt(vfCNPJ[9]);
  vln10:=StrToInt(vfCNPJ[10]);
  vln11:=StrToInt(vfCNPJ[11]);
  vln12:=StrToInt(vfCNPJ[12]);
  vld1:=vln12*2+vln11*3+vln10*4+vln9*5+vln8*6+vln7*7+vln6*8+vln5*9+vln4*2+vln3*3+vln2*4+vln1*5;
  vld1:=11-(vld1 mod 11);
  if vld1 >=10 then vld1:=0;
    vld2:=vld1*2+vln12*3+vln11*4+vln10*5+vln9*6+vln8*7+vln7*8+vln6*9+vln5*2+vln4*3+vln3*4+vln2*5+vln1*6;
    vld2:=11-(vld2 mod 11);
  if vld2 >=10 then vld2:=0;
  vlcalculado:= inttostr(vld1) + inttostr(vld2);
  vldigitado:= vfCNPJ[13]+vfCNPJ[14];
  if vlcalculado = vldigitado then
    Result:=True
  else
    Result:=False;
end;

function TDados.VerificaIE(vfIE, vfUF: String): Integer;
var
  LibHandle : THandle;
  ConsisteInscricaoEstadual : TConsisteInscricaoEstadual;
begin
  try
    LibHandle :=  LoadLibrary (PChar (Trim ('DllInscE32.Dll')));
    if  LibHandle <=  HINSTANCE_ERROR then
      raise Exception.Create ('Dll não carregada. Contate o desenvolvedor do sistema!');
    @ConsisteInscricaoEstadual  :=  GetProcAddress (LibHandle,'ConsisteInscricaoEstadual');
    if  @ConsisteInscricaoEstadual  = nil then
      raise Exception.Create('Entrypoint Download não encontrado na Dll');
    Result := ConsisteInscricaoEstadual (vfIE, vfUF);
  finally
    FreeLibrary (LibHandle);
  end;
end;

function TDados.VerificaCPF(vfCPF: String): Boolean;
var
  vli, vld1, vld2, vlcalc, vlResto1, vlResto2, vlNum : Integer;
  vldigitado, vlcalculado: String;
begin
  vli := 0;
  vlcalc := vli;
  vlResto1 := vli;
  vlResto2 := vli;
  vld1 := vli;
  vld2 := vli;
  VlNum := vli;
  vldigitado := '';
  vlcalculado := vldigitado;

  // soma 1º digito
  vlcalc := 0;
  for vli:= 1 to 9 do begin
    case vli of
      1: vlcalc := 10;
      2: vlcalc := 9;
      3: vlcalc := 8;
      4: vlcalc := 7;
      5: vlcalc := 6;
      6: vlcalc := 5;
      7: vlcalc := 4;
      8: vlcalc := 3;
      9: vlcalc := 2;
    end;
    vlNum := StrToInt(vfCPF[vli]);
    vld1 := vld1 + (vlNum * vlcalc);
  end;
  vlResto1 := vld1 mod 11;
  if vlResto1 = 10 then
    vld1 := 0
  else begin
    vlResto1 := 11 - vlResto1;
    vld1 := vlResto1;
  end;

 // Soma o segundo digito
  vlcalc := 0;
  for vli:= 1 to 10 do begin
    case vli of
      1: vlcalc := 11;
      2: vlcalc := 10;
      3: vlcalc := 9;
      4: vlcalc := 8;
      5: vlcalc := 7;
      6: vlcalc := 6;
      7: vlcalc := 5;
      8: vlcalc := 4;
      9: vlcalc := 3;
      10: vlcalc := 2;
    end;
    if Vli <> 10 then
      vld2 := vld2 + (StrToInt(vfCPF[vli]) * vlcalc)
    else
      vld2 := vld2 + (vld1 * vlcalc);
  end;
  vlResto2 := vld2 mod 11;
  if vlResto2 = 10 then
    vld2 := 0
  else begin
    vlResto2 := 11 - vlResto2;
    vld2 := vlResto2;
  end;

  vlcalculado := IntToStr(vld1 + vld2);
  vldigitado := IntToStr(StrToInt(vfCPF[10]) + StrToInt(vfCPF[11]));

  if vldigitado = vlcalculado then
    Result:=True
  else
    Result:=False;
end;

procedure TDados.ControleAcesso(ppModulo, ppTipo: String; Opt: Boolean);
begin
  // colocar mais uma condição na tabela de configuração para pagar a parte este módulo
  try
    if not TbAcesso.Active then
      TbAcesso.Open;
    TbAcesso.Append;
    TbAcessoCODUSUARIO.Value := Dados.QryLoginCODUSUARIO.Value;
    TbAcessoDATAHORA.Value := Now;
    TbAcessoMODULO.Value := ppModulo;
    TbAcessoACESSO.Value := ppTipo;
    if Opt then
      TbAcessoTIPO.Value := 1
    else
      TbAcessoTIPO.Value := 0;
    TbAcesso.Post;
  except

  end;
end;

procedure TDados.AbreConfig;
begin
  if not Dados.TbConfig.Active then
    Dados.TbConfig.Open;
end;

procedure TDados.LancarPassar(ppModulo: String);
var
  vlNum: Smallint;
begin
  try
    vlNum := 0;
    QryExecSQL.SQL.Text := 'INSERT INTO MODULOS (CODMODULO, DESCRICAO) VALUES (1, '''+ ppModulo +''')';
    QryExecSQL.ExecSQL;
    ConfTrans(True);
    QryAux.SQL.Text := 'SELECT CODMODULO FROM MODULOS WHERE DESCRICAO = '''+ ppModulo +'''';
    QryAux.Open;
    vlNum:= QryAux.Fields[0].AsInteger;
    QryAux.Close;
    QryAux.SQL.Text := 'SELECT CODUSUARIO FROM USUARIOS WHERE CODUSUARIO IS NOT NULL';
    QryAux.Open;
    while not Dados.QryAux.Eof do begin
      QryExecSQL.SQL.Text := 'INSERT INTO USUMODULOS (CODUSUARIO, CODMODULO, NIVELCONS, NIVELEDI, NIVELEXC, NIVELREL) VALUES ' +
        '(:CODUSUARIO, :CODMODULO, :NIVELCONS, :NIVELEDI, :NIVELEXC, :NIVELREL)';
      QryExecSQL.ParamByName('CODUSUARIO').AsInteger := Dados.QryAux.Fields[0].AsInteger;
      QryExecSQL.ParamByName('CODMODULO').AsInteger := vlNum;
      QryExecSQL.ParamByName('NIVELCONS').AsString := 'T';
      QryExecSQL.ParamByName('NIVELEDI').AsString := 'F';
      QryExecSQL.ParamByName('NIVELEXC').AsString := 'F';
      QryExecSQL.ParamByName('NIVELREL').AsString := 'F';
      QryExecSQL.ExecSQL;
      QryAux.Next;
    end;
    QryAux.Close;
    ConfTrans(True);
    FtelaIni.PBParc.StepBy(1);
    Application.ProcessMessages;    
  except
    MessageDlg(cgMsgErroAcesso + IntToStr(vlNum), mtWarning, [mbOK], 0);
    ConfTrans(False);
  end;
end;


procedure TDados.ExibirNivers;
begin
//***
end;

procedure TDados.LKBairros(Opt: Boolean);
begin
  ConfTrans(True);
  QryBairrosLK.Close;
  if Opt then
    QryBairrosLK.Open;
end;

procedure TDados.LKCidades(Opt: Boolean);
begin
  ConfTrans(True);
  QryCidadesLK.Close;
  if Opt then
    QryCidadesLK.Open;
end;

procedure TDados.LKConvenios(Opt: Boolean);
begin
  ConfTrans(True);
  QryConveniosLK.Close;
  if Opt then
    QryConveniosLK.Open;
end;

procedure TDados.LKDoencas(Opt: Boolean);
begin
  ConfTrans(True);
  QryDoencasLK.Close;
  if Opt then
    QryDoencasLK.Open;
end;

procedure TDados.LKEstados(Opt: Boolean);
begin
  ConfTrans(True);
  QryEstadosLK.Close;
  if Opt then
    QryEstadosLK.Open;
end;

procedure TDados.LKTurmas(Opt: Boolean);
begin
  ConfTrans(True);
  QryTurmasLK.Close;
  if Opt then
    QryTurmasLK.Open;
end;

procedure TDados.LKProfissoes(Opt: Boolean);
begin
  ConfTrans(True);
  QryProfissoesLK.Close;
  if Opt then
    QryProfissoesLK.Open;
end;

procedure TDados.LKFuncionarios(Opt: Boolean);
begin
  ConfTrans(True);
  QryFuncLK.Close;
  if Opt then
    QryFuncLK.Open;
end;

procedure TDados.LKEditoras(Opt: Boolean);
begin
  ConfTrans(True);
  QryEditorasLK.Close;
  if Opt then
    QryEditorasLK.Open;
end;

procedure TDados.LKGeneros(Opt: Boolean);
begin
  ConfTrans(True);
  QryGenerosLK.Close;
  if Opt then
    QryGenerosLK.Open;
end;

procedure TDados.LKRemedios(Opt: Boolean);
begin
  ConfTrans(True);
  QryRemediosLK.Close;
  if Opt then
    QryRemediosLK.Open;
end;

procedure TDados.LKDisc(Opt: Boolean);
begin
  ConfTrans(True);
  QryDiscLK.Close;
  if Opt then
    QryDiscLK.Open;
end;

procedure TDados.LKAlunos(Opt: Boolean);
begin
  ConfTrans(True);
  QryAlunosLK.Close;
  if Opt then
    QryAlunosLK.Open;
end;

procedure TDados.LKFornecedores(Opt: Boolean);
begin
  ConfTrans(True);
  QryFornLK.Close;
  if Opt then
    QryFornLK.Open;
end;

procedure TDados.LKRefeicoes(Opt: Boolean);
begin
  ConfTrans(True);
  QryRefeicoesLK.Close;
  if Opt then
    QryRefeicoesLK.Open;
end;

procedure TDados.LKProdutos(Opt: Boolean);
begin
  ConfTrans(True);
  QryProdutosLK.Close;
  QryProdutosAlunosLK.Close;
  if Opt then begin
    QryProdutosLK.Open;
    QryProdutosAlunosLK.Open;
  end;
end;

procedure TDados.LKAutores(Opt: Boolean);
begin
  ConfTrans(True);
  QryAutoresLK.Close;
  if Opt then
    QryAutoresLK.Open;
end;

procedure TDados.LKAlergias(Opt: Boolean);
begin
  ConfTrans(True);
  QryAlergiasLK.Close;
  if Opt then
    QryAlergiasLK.Open;
end;

procedure TDados.LKAtividades(Opt: Boolean);
begin
  ConfTrans(True);
  QryAtividadesLK.Close;
  if Opt then
    QryAtividadesLK.Open;
end;

procedure TDados.LKTratamentos(Opt: Boolean);
begin
  ConfTrans(True);
  QryTratLK.Close;
  if Opt then
    QryTratLK.Open;
end;

procedure TDados.CloseAll;
var
  i: integer;
  nome: String;
begin
  if TbConfig.Active then
    TbConfig.Close;
  Dados.TransactionLK.CommitRetaining;
  Dados.Transaction.CommitRetaining;
  if Dados.TransactionLK.Active then
    Dados.TransactionLK.Active := False;
  if Dados.Transaction.Active then
    Dados.Transaction.Active := False;
  Dados.Database.ForceClose;
  Dados.Database.Connected := False;
  Dados.Database.CloseDataSets;
end;

function VerificarPermissao(vfPermissao: String; vfTipo: String; vfMsg:Smallint): Boolean;
begin
  Result := False;
  if Dados.QryAux.Active then begin
    Dados.QryAux.close;
    Dados.QryAux.Unprepare;
  end;
  if not Dados.QryLogin.Active then begin
    Dados.QryLogin.Prepare;
    Dados.QryLogin.Open;
  end;
  Dados.QryAux.SQL.Text := 'select CODMODULO, NIVELCONS, NIVELEDI, NIVELEXC, NIVELREL from USUMODULOS '+
    'WHERE CODUSUARIO = :plcodusuario';
  Dados.QryAux.ParamByName('plcodusuario').AsInteger := Dados.QryLogin.Fields[0].AsInteger;
  Dados.QryAux.Prepare;
  Dados.QryAux.Open;
  if Dados.QryModulosLK.Active then begin
    Dados.QryModulosLK.Close;
    Dados.QryModulosLK.UnPrepare;
  end;
  Dados.QryModulosLK.Prepare;
  Dados.QryModulosLK.Open;
  Dados.QryModulosLK.Locate('DESCRICAO', vfPermissao, [loPartialKey, loCaseInsensitive]);
  if Dados.QryAux.Locate('CODMODULO', Dados.QryModulosLK.Fields[0].AsString, []) then
    if vfTipo = 'CONS' then begin
      if Dados.QryAux.Fields[1].AsString = 'T' then
        Result := True;
    end else if vfTipo = 'EDI' then begin
      if Dados.QryAux.Fields[2].AsString = 'T' then
        Result := True;
    end else if vfTipo = 'EXC' then begin
      if Dados.QryAux.Fields[3].AsString = 'T' then
        Result := True;
    end else if vfTipo = 'REL' then begin
      if Dados.QryAux.Fields[4].AsString = 'T' then
        Result := True;
    end;
  if (not Result) and (vfMsg = 1) then
    MessageDlg('Usuário '+ Dados.QryLogin.FieldByName('LOGIN').AsString +' sem permissão de acesso ao módulo do sistema!', mtError, [mbOk], 0);
  Dados.QryModulosLK.Close;
  Dados.QryModulosLK.UnPrepare;
  Dados.ControleAcesso(vfPermissao, vfTipo, Result);
  vfPermissao := '';
  vfTipo := '';
  vfMsg := 0;                               
end;

procedure TDados.ConfTrans(Conf: Boolean);
begin
{  if Conf then
    TransactionLK.CommitRetaining
  else
    TransactionLK.RollbackRetaining;}

  if Conf then
    TransactionLK.Commit
  else
    TransactionLK.Rollback;
  TransactionLK.StartTransaction;
end;


procedure TDados.DataModuleCreate(Sender: TObject);
var
  vlDataBase: String;
  Ini : TIniFile;
  i: Smallint;
  vlVersao: String;

begin
  Application.OnException :=  CapturaErro;
  WinExec(PChar('regsvr32 midas.dll /s'),SW_HIDE);
  Dados.vgCorGrid := clMoneyGreen;
  Dados.vgCorBusca := ClSilver;
  Dados.vgCorFoco :=  clBlue;
  ODFotos.InitialDir := ExtractFilePath(Application.ExeName);
//  if not FileExists(ExtractFilePath(Application.ExeName)+'MaisEscola.ini') then
//    MessageDlg('Sem Arquivo MaisEscola.ini na pasta do sistema!', mtWarning, [mbOk], 0);
    
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'MaisEscola.ini');
  vlDataBase := Ini.ReadString('Config', 'Banco', '');
  Database.DatabaseName := vlDataBase;
  Database.Connected := True;
  TransactionLK.StartTransaction;
  Transaction.StartTransaction;
//  TbConfig.Open;

  Dados.QryAux.SQL.Text := 'SELECT VERSAO FROM CONFIG';
  Dados.QryAux.Open;
  vlVersao := Dados.QryAux.Fields[0].AsString;
  Dados.QryAux.Close;
  
//  Atualizacoes;
end;

procedure TDados.DataModuleDestroy(Sender: TObject);
begin
  TransactionLK.Active := False;
  Transaction.Active := False;
  Database.ForceClose;
  Database.Connected := False;
  try
    Application.Terminate;
  except
  end;
end;

procedure TDados.QryEstadosLKAfterOpen(DataSet: TDataSet);
begin
  QryEstadosLK.FetchAll;
end;

procedure TDados.QryBairrosLKAfterOpen(DataSet: TDataSet);
begin
  QryBairrosLK.FetchAll;
end;

procedure TDados.QryCidadesLKAfterOpen(DataSet: TDataSet);
begin
  QryCidadesLK.FetchAll;
end;

procedure TDados.QryConveniosLKAfterOpen(DataSet: TDataSet);
begin
  QryConveniosLK.FetchAll;
end;

procedure TDados.QryDoencasLKAfterOpen(DataSet: TDataSet);
begin
  QryDoencasLK.FetchAll;
end;

procedure TDados.QryTurmasLKAfterOpen(DataSet: TDataSet);
begin
  QryTurmasLK.FetchAll;
end;

procedure TDados.QryProfissoesLKAfterOpen(DataSet: TDataSet);
begin
  QryProfissoesLK.FetchAll;
end;

procedure TDados.QryFornLKAfterOpen(DataSet: TDataSet);
begin
  QryFornLK.FetchAll;
end;

procedure TDados.QryRefeicoesLKAfterOpen(DataSet: TDataSet);
begin
  QryRefeicoesLK.FetchAll;
end;

procedure TDados.QryAlunosLKAfterOpen(DataSet: TDataSet);
begin
  QryAlunosLK.FetchAll;
end;

procedure TDados.QryAutoresLKAfterOpen(DataSet: TDataSet);
begin
  QryAutoresLK.FetchAll;
end;

procedure TDados.QryDiscLKAfterOpen(DataSet: TDataSet);
begin
  QryEditorasLK.FetchAll;
end;

procedure TDados.QryEditorasLKAfterOpen(DataSet: TDataSet);
begin
  QryEditorasLK.FetchAll;
end;

procedure TDados.QryFuncLKAfterOpen(DataSet: TDataSet);
begin
  QryFornLK.FetchAll;
end;

procedure TDados.QryGenerosLKAfterOpen(DataSet: TDataSet);
begin
  QryGenerosLK.FetchAll;
end;

procedure TDados.QryProdutosLKAfterOpen(DataSet: TDataSet);
begin
  QryProdutosLK.FetchAll;
end;

procedure TDados.QryProdutosAlunosLKAfterOpen(DataSet: TDataSet);
begin
  QryProdutosAlunosLK.FetchAll;
end;

procedure TDados.QryAlergiasLKAfterOpen(DataSet: TDataSet);
begin
  QryAlergiasLK.FetchAll;
end;

procedure TDados.QryRemediosLKAfterOpen(DataSet: TDataSet);
begin
  QryRemediosLK.FetchAll;
end;

procedure TDados.QryAtividadesLKAfterOpen(DataSet: TDataSet);
begin
  QryAtividadesLK.FetchAll;
end;

procedure TDados.QryTratLKAfterOpen(DataSet: TDataSet);
begin
  QryTratLK.FetchAll;
end;

procedure TDados.QryCondPgtoLKAfterOpen(DataSet: TDataSet);
begin
  QryCondPgtoLK.FetchAll;
end;

procedure TDados.QryCFOPLKAfterOpen(DataSet: TDataSet);
begin
  QryCFOPLk.FetchAll;
end;

procedure TDados.QryAcervosLKAfterOpen(DataSet: TDataSet);
begin
  QryAcervosLK.FetchAll;
end;

procedure TDados.QryTranspLKAfterOpen(DataSet: TDataSet);
begin
  QryTranspLK.FetchAll;
end;

procedure TDados.QryBancosLKAfterOpen(DataSet: TDataSet);
begin
  QryBancosLK.FetchAll;
end;

procedure TDados.QryCCLKAfterOpen(DataSet: TDataSet);
begin
  QryCCLK.FetchAll;
end;



end.
