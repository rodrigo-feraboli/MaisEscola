unit URelatoriosFaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery, DBClient, RpRender, RpRenderCanvas, RpRenderPreview, RpBase,
  RpSystem, RpRave, RpDefine, RpCon, RpConDS;

type
  TFRelatoriosFaixa = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QryEst: TMDOQuery;
    DSEst: TDataSource;
    Prosseguir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    QryEstTIPO: TMDOStringField;
    QryEstTOT: TIntegerField;
    RgTipo: TRadioGroup;
    QryEstPerc: TFloatField;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLCabecalho: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand7: TRLBand;
    RLLRodape: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLBand3: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText1: TRLDBText;
    RLBand2: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLLabel4: TRLLabel;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ProsseguirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure QryEstCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    vpCountGeral: Smallint;
    procedure ParametrosRel(plCab, plDescricao: String);
  public
    { Public declarations }
  end;

var
  FRelatoriosFaixa: TFRelatoriosFaixa;

implementation

uses UDados;

{$R *.dfm}

procedure TFRelatoriosFaixa.ParametrosRel(plCab, plDescricao: String);
begin
  RLLCabecalho.Caption := plCab;
//  RLLDescricao.Caption := plDescricao;
  RLLRodape.Caption := cgNomeEmp;
end;

procedure TFRelatoriosFaixa.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFRelatoriosFaixa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFRelatoriosFaixa.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  ClientHeight := 100;
  ClientWidth := 268;
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Dados.ConfTrans(True);
end;

procedure TFRelatoriosFaixa.ProsseguirClick(Sender: TObject);
var
  vlTipoRel: String;
begin
  ParametrosRel(Caption, 'Nome');
  // colocar CDS

  vlTipoRel := '';
  case RgTipo.ItemIndex of
    0: vlTipoRel := 'DTNASCPAI';
    1: vlTipoRel := 'DTNASCMAE';
    2: vlTipoRel := 'DTNASCRESP';
  end;

  vpCountGeral := 0;
  Dados.QryAux.SQL.Text := 'SELECT count (A.CODALUNO) from Alunos A where A.'+ vlTipoRel+ ' is not null';
  Dados.QryAux.Open;
  vpCountGeral := Dados.QryAux.Fields[0].AsInteger;
  Dados.QryAux.Close;
  // fazer um count para descobrir todos os que vão para o relatório
  if Caption = 'Relatório por Faixa Etária' then begin
    QryEst.SQL.Text := 'select case '+
        'WHEN (((CURRENT_DATE - '+ vlTipoRel + ') / 365) IN (15, 16,17,18,19)) THEN '+
            '''ENTRE 15-19 ANOS''' +
        'WHEN (((CURRENT_DATE - '+ vlTipoRel + ') / 365) IN (20,21,22,23,24)) THEN '+
            '''ENTRE 20-24 ANOS''' +
        'WHEN (((CURRENT_DATE - '+ vlTipoRel + ') / 365) IN (25,26,27,28,29)) THEN '+
            '''ENTRE 25-29 ANOS''' +
        'WHEN (((CURRENT_DATE - '+ vlTipoRel + ') / 365) IN (30,31,32,33,34)) THEN '+
            '''ENTRE 30-34 ANOS''' +
        'WHEN (((CURRENT_DATE - '+ vlTipoRel + ') / 365) IN (35,36,37,38,39)) THEN '+
            '''ENTRE 35-39 ANOS''' +
        'WHEN (((CURRENT_DATE - '+ vlTipoRel + ') / 365) IN (40,41,42,43,44)) THEN '+
            '''ENTRE 40-44 ANOS''' +
        'WHEN (((CURRENT_DATE - '+ vlTipoRel + ') / 365) IN (45,46,47,48,49)) THEN '+
            '''ENTRE 45-49 ANOS''' +
        'WHEN (((CURRENT_DATE - '+ vlTipoRel + ') / 365) IN (50,51,52,53,54)) THEN '+
            '''ENTRE 50-54 ANOS''' +
        'WHEN (((CURRENT_DATE - '+ vlTipoRel + ') / 365) IN (55,56,57,58,59)) THEN '+
            '''ENTRE 55-59 ANOS''' +
        'WHEN (((CURRENT_DATE - '+ vlTipoRel + ') / 365) IN (60, 61, 62, 63, 64)) THEN '+
            '''ENTRE 60-64 ANOS''' +
        'WHEN (((CURRENT_DATE - '+ vlTipoRel + ') / 365) IN (65, 66, 67, 68, 69)) THEN '+
            '''ENTRE 65-69 ANOS''' +
        'ELSE '+
            '''FAIXA FORA''' +
        'END AS TIPO, COUNT(*) AS TOT '+
        'FROM ALUNOS A WHERE '+ vlTipoRel + ' IS NOT null GROUP BY 1';
  end;
  QryEst.open;
  if QryEst.IsEmpty then begin
    MessageDlg('Seleção sem registros!', mtWarning, [mbOk], 0);
    Exit;
  end;
  RLReport1.Preview;
end;

procedure TFRelatoriosFaixa.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFRelatoriosFaixa.QryEstCalcFields(DataSet: TDataSet);
begin
  if vpCountGeral > 0 then
    QryEstPerc.Value := ((QryEstTOT.Value * 100)/ vpCountGeral) ;
end;

end.
