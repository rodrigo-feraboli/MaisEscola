unit URelatoriosAn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery, DBClient;

type
  TFRelatoriosAn = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QryGenerica: TMDOQuery;
    DSGenerica: TDataSource;
    RGOrd: TRadioGroup;
    RGTipoOrd: TRadioGroup;
    Prosseguir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    QryGenericaCODIGO: TSmallintField;
    QryGenericaDESCRICAO: TMDOStringField;
    RLAn: TRLReport;
    RLBand1: TRLBand;
    RLLCabecalho: TRLLabel;
    RLLDescricao: TRLLabel;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand3: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLLRodape: TRLLabel;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ProsseguirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    vpTipoRel: String;
    vpCountGeral: Smallint;
    procedure ParametrosRel(plCab, plDescricao: String);
  public
    { Public declarations }
  end;

var
  FRelatoriosAn: TFRelatoriosAn;

implementation

uses UDados;

{$R *.dfm}

procedure TFRelatoriosAn.ParametrosRel(plCab, plDescricao: String);
begin
  RLLCabecalho.Caption := plCab;
  RLLDescricao.Caption := plDescricao;
  RLLRodape.Caption := cgNomeEmp;
end;

procedure TFRelatoriosAn.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFRelatoriosAn.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFRelatoriosAn.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  ClientHeight := 145;
  ClientWidth := 384;
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Dados.ConfTrans(True);
end;

procedure TFRelatoriosAn.ProsseguirClick(Sender: TObject);
begin
  if Caption = 'Relatório Sintético de Alunos' then begin
    ParametrosRel(Caption, 'Nome');
    QryGenerica.SQL.Text := 'SELECT CODALUNO AS CODIGO, NOME AS DESCRICAO FROM ALUNOS WHERE CODALUNO IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Acervo' then begin
    ParametrosRel(Caption, 'Título');
    QryGenerica.SQL.Text := 'SELECT CODACERVO AS CODIGO, TITULO AS DESCRICAO FROM ACERVO WHERE CODACERVO IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Alergias' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODALERGIA AS CODIGO, DESCRICAO AS DESCRICAO  FROM ALERGIAS WHERE CODALERGIA IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Autores' then begin
    ParametrosRel(Caption,'Nome');
    QryGenerica.SQL.Text := 'SELECT CODAUTOR AS CODIGO, NOME AS DESCRICAO FROM AUTORES WHERE CODAUTOR IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Atividades' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODATIVIDADE AS CODIGO, DESCRICAO AS DESCRICAO FROM ATIVIDADES WHERE CODATIVIDADE IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Bairros' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODBAIRRO AS CODIGO, DESCRICAO AS DESCRICAO FROM BAIRROS WHERE CODBAIRRO IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de CFOP' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODCFOP AS CODIGO, DESCRICAO AS DESCRICAO FROM CFOP WHERE CODCFOP IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Cidades' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODCIDADE AS CODIGO, DESCRICAO AS DESCRICAO FROM CIDADES WHERE CODCIDADE IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Disciplinas' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODDISC AS CODIGO, DESCRICAO AS DESCRICAO FROM DISCIPLINAS WHERE CODDISC IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Doenças' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODDOENCA AS CODIGO, DESCRICAO AS DESCRICAO FROM DOENCAS WHERE CODDOENCA IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Funcionários' then begin
    ParametrosRel(Caption, 'Nome');
    QryGenerica.SQL.Text := 'SELECT CODFUNC AS CODIGO, NOME AS DESCRICAO FROM FUNC WHERE CODFUNC IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Gêneros' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODGENERO AS CODIGO, DESCRICAO AS DESCRICAO FROM GENEROS WHERE CODGENERO IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Produtos' then begin
    ParametrosRel(Caption, 'Produto');
    QryGenerica.SQL.Text := 'SELECT CODPROD AS CODIGO, DESCRICAO AS DESCRICAO FROM PRODUTOS WHERE CODPROD IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Profissões' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODPROFISSAO AS CODIGO, DESCRICAO AS DESCRICAO FROM PROFISSOES WHERE CODPROFISSAO IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Refeições' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODREFEICAO AS CODIGO, DESCRICAO AS DESCRICAO FROM REFEICOES WHERE CODREFEICAO IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Tratamentos' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODTRAT AS CODIGO, DESCRICAO AS DESCRICAO FROM TRATAMENTOS WHERE CODTRAT IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Turmas' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODTURMA AS CODIGO, DESCRICAO AS DESCRICAO FROM TURMAS WHERE CODTURMA IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Remédios' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODREMEDIO AS CODIGO, DESCRICAO AS DESCRICAO FROM REMEDIOS WHERE CODREMEDIO IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Centro de Custos' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODCC AS CODIGO, DESCRICAO AS DESCRICAO FROM CC WHERE CODCC IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Condições de Pagamento' then begin
    ParametrosRel(Caption, 'Descrição');
    QryGenerica.SQL.Text := 'SELECT CODCONDPGTO AS CODIGO, DESCRICAO AS DESCRICAO FROM CONDPGTO WHERE CODCONDPGTO IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Editoras' then begin
    ParametrosRel(Caption, 'Nome');
    QryGenerica.SQL.Text := 'SELECT CODEDITORA AS CODIGO, DESCRICAO AS DESCRICAO FROM EDITORAS WHERE CODEDITORA IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Fornecedores' then begin
    ParametrosRel(Caption, 'Nome');
    QryGenerica.SQL.Text := 'SELECT CODGEN AS CODIGO, NOME AS DESCRICAO FROM GEN WHERE TIPOFORN = ''T''';
  end else if Caption = 'Relatório Sintético de Transportadoras' then begin
    ParametrosRel(Caption, 'Nome');
    QryGenerica.SQL.Text := 'SELECT CODGEN AS CODIGO, NOME AS DESCRICAO FROM GEN WHERE TIPOTRAN = ''T''';
  end else if Caption = 'Relatório Sintético de Estados' then begin
    ParametrosRel(Caption, 'Nome');
    QryGenerica.SQL.Text := 'SELECT CODESTADO AS CODIGO, DESCRICAO FROM ESTADOS WHERE CODESTADO IS NOT NULL ';
  end else if Caption = 'Relatório Sintético de Bancos' then begin
    ParametrosRel(Caption, 'Nome');
    QryGenerica.SQL.Text := 'SELECT CODBANCO AS CODIGO, NOME as DESCRICAO FROM BANCOS WHERE CODBANCO IS NOT NULL ';
  end;
  QryGenerica.SQL.Add('ORDER BY '+ IntToStr(RGOrd.ItemIndex + 1));
  if RGTipoOrd.Itemindex = 0 then
    QryGenerica.SQL.Add(' ASC')
  else
    QryGenerica.SQL.Add(' DESC');
  QryGenerica.open;
  if QryGenerica.IsEmpty then begin
    MessageDlg('Seleção sem registros!', mtWarning, [mbOk], 0);
    Exit;
  end;
  RLAn.Preview;
  QryGenerica.Close;
end;

procedure TFRelatoriosAn.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
