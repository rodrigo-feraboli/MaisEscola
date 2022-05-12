unit URelatoriosEst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery, DBClient;

type
  TFRelatoriosEst = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QryGenerica: TMDOQuery;
    DSGenerica: TDataSource;
    RGOrd: TRadioGroup;
    RGTipoOrd: TRadioGroup;
    Prosseguir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    RGExib: TRadioGroup;
    QryGenericaQTOS: TIntegerField;
    QryGenericaDESCR: TMDOStringField;
    QryGenericaPerc: TFloatField;
    QryGenericaDescAux: TStringField;
    RGAl: TRadioGroup;
    RLEst: TRLReport;
    RLBand1: TRLBand;
    RLLCabecalho: TRLLabel;
    RLLDescricao: TRLLabel;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    RLDBText3: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLLabel3: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLRodape: TRLLabel;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ProsseguirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure QryGenericaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    vpTipoRel: String;
    vpCountGeral: Smallint;
    procedure ParametrosRel(plCab, plDescricao: String);
  public
    { Public declarations }
  end;

var
  FRelatoriosEst: TFRelatoriosEst;

implementation

uses UDados;

{$R *.dfm}

procedure TFRelatoriosEst.ParametrosRel(plCab, plDescricao: String);
begin
  RLLCabecalho.Caption := plCab;
  RLLDescricao.Caption := plDescricao;
  RLLRodape.Caption := cgNomeEmp;
end;

procedure TFRelatoriosEst.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFRelatoriosEst.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFRelatoriosEst.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  ClientHeight := 215;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  //QryGenerica.Open;
end;

procedure TFRelatoriosEst.ProsseguirClick(Sender: TObject);
begin
  Hint := 'NOME IS NOT NULL';
  Panel2.Hint := 'Todos';
  case RGAl.ItemIndex of
    1: begin
        Hint := 'ATIVO = 1';
        Panel2.Hint := 'Ativos';
       end;
    2: begin
        Hint := 'ATIVO = 0';
        Panel2.Hint := 'Inativos';
       end;
  end;


  vpCountGeral := 0;
  Dados.QryAux.SQL.Text := 'SELECT COUNT(CODALUNO) FROM ALUNOS WHERE '+ Hint;
  Dados.QryAux.Open;
  vpCountGeral := Dados.QryAux.Fields[0].AsInteger;
  Dados.QryAux.Close;

  case RGExib.ItemIndex of
    0: begin
        vpTipoRel := 'Sexo';
        ParametrosRel('Relatório Estatístico por Sexo - '+ Panel2.Hint, 'Descrição');
        QryGenerica.SQL.Text := 'SELECT COUNT(CODALUNO) AS QTOS, SEXO AS DESCR FROM ALUNOS WHERE '+ Hint +' GROUP BY 2 ';
       end;
    1: begin
        vpTipoRel := 'Idade';
        ParametrosRel('Relatório Estatístico por Idade - '+ Panel2.Hint, 'Descrição');
        QryGenerica.SQL.Text := 'select COUNT(CODALUNO) AS QTOS, CAST((CURRENT_DATE - DTNASC) / 365 AS VARCHAR(3)) AS DESCR '+
          'FROM ALUNOS WHERE '+ Hint +' GROUP BY 2'
       end;
  end;  
  QryGenerica.SQL.Add('ORDER BY '+ IntToStr(RGOrd.ItemIndex + 2));

  if RGTipoOrd.Itemindex = 0 then
    QryGenerica.SQL.Add(' ASC')
  else
    QryGenerica.SQL.Add(' DESC');
  QryGenerica.open;
  if QryGenerica.IsEmpty then begin
    MessageDlg('Seleção sem registros!', mtWarning, [mbOk], 0);
    QryGenerica.Close;
    Exit;
  end;
  RLEst.Preview;
  QryGenerica.Close;
end;

procedure TFRelatoriosEst.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFRelatoriosEst.QryGenericaCalcFields(DataSet: TDataSet);
begin
  if vpCountGeral > 0 then
    QryGenericaPerc.Value := ((QryGenericaQTOS.Value * 100)/ vpCountGeral) ;
  if vpTipoRel = 'Sexo' then begin
    if QryGenericaDESCR.Value = 'F' then
      QryGenericaDescAux.Value := 'Feminino'
    else
      QryGenericaDescAux.Value := 'Masculino';
  end else if vpTipoRel = 'Idade' then
    if QryGenericaDESCR.Value < '2' then
      QryGenericaDescAux.Value :=  QryGenericaDESCR.Value + ' ano'
    else
      QryGenericaDescAux.Value :=  QryGenericaDESCR.Value + ' anos'
end;

end.
