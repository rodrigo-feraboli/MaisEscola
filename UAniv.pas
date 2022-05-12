unit UAniv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery;

type
  TFAniv = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QryAniv: TMDOQuery;
    DSAniv: TDataSource;
    DBGrid1: TDBGrid;
    LblQtde: TLabel;
    QryAnivNOME: TMDOStringField;
    QryAnivDIA: TSmallintField;
    QryAnivMES: TSmallintField;
    QryAnivData: TStringField;
    QryAnivTIPO: TMDOStringField;
    PnlMes: TPanel;
    CBIni: TCheckBox;
    CBMesIn: TComboBox;
    CBFin: TCheckBox;
    CBMesFi: TComboBox;
    PageControl1: TPageControl;
    TSSemana: TTabSheet;
    TSMes: TTabSheet;
    TSPeriodo: TTabSheet;
    PnlPeriodo: TPanel;
    CBDtIni: TCheckBox;
    CBDtFin: TCheckBox;
    DTPIni: TDateTimePicker;
    DTPFin: TDateTimePicker;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    RLAniv: TRLReport;
    RLBand1: TRLBand;
    RLLCabecalho: TRLLabel;
    RLLDescricao: TRLLabel;
    RLLabel1: TRLLabel;
    na: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    RLDBText3: TRLDBText;
    RLBand2: TRLBand;
    RLDBResult1: TRLDBResult;
    RLSystemInfo1: TRLSystemInfo;
    RLLRodape: TRLLabel;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure QryAnivCalcFields(DataSet: TDataSet);
    procedure CBIniClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ParametrosRel(plCab: String);
  public
    { Public declarations }
  end;

var
  FAniv: TFAniv;

implementation

uses UDados, UAlunos, DateUtils;

{$R *.dfm}

procedure TFAniv.ParametrosRel(plCab: String);
begin
  RLLCabecalho.Caption := plCab;
  RLLRodape.Caption := cgNomeEmp;
end;

procedure TFAniv.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFAniv.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFAniv.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.ConfTrans(True);
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  
  CBMesIn.ItemIndex := MonthOfTheYear(Date) - 1;
  CBMesFi.ItemIndex := MonthOfTheYear(Date) - 1;
  CBIniClick(nil);
end;

procedure TFAniv.QryAnivCalcFields(DataSet: TDataSet);
begin
  QryAnivData.Value := FormatFloat('00', QryAnivDIA.Value) +'/'+ FormatFloat('00', QryAnivMES.Value);
end;

procedure TFAniv.CBIniClick(Sender: TObject);
var
  vlPerIni, vlPerFin: Smallint;
  vl1, vl2: Boolean;
  VlDtIni, vlDtFin: TDate;
begin
  QryAniv.Close;
  Dados.Transaction.Active := False;
  Dados.Transaction.StartTransaction;
  vlPerIni := 101;
  vlPerFin := 1231;
  if PageControl1.ActivePage = TSSemana then begin
    vl1 := true;
    vl2 := true;
    VlDtIni := StartOfTheWeek(Date);
    vlDtFin := EndOfTheWeek(Date);
  end else if PageControl1.ActivePage = TSMes then begin
    vl1 := CBIni.Checked;
    vl2 := CBFin.Checked;
    if CBIni.Checked then
      VlDtIni := StartOfTheMonth(StrToDate('01/'+ IntToStr(CBMesIn.ItemIndex + 1)+ '/2000'));
    if CBFin.Checked then
      vlDtFin := EndOfTheMonth(StrToDate('01/'+ IntToStr(CBMesFi.ItemIndex + 1)+ '/2000'));
  end else begin
    vl1 := CBDtIni.Checked;
    vl2 := CBDtFin.Checked;
    if CBDtIni.Checked then
      VlDtIni := DTPIni.Date;
    if CBDtFin.Checked then
      vlDtFin := DTPFin.Date;
  end;
  if vl1 then
    vlPerIni := StrToInt(FormatDateTime('MM', VlDtIni)) * 100 + StrToInt(FormatDateTime('dd', VlDtIni));
  if vl2 then
    vlPerFin := StrToInt(FormatDateTime('MM', vlDtFin)) * 100 + StrToInt(FormatDateTime('dd', vlDtFin));
  Dados.ConfTrans(True);
  // ALUNOS
  QryAniv.SQL.Text := 'SELECT CAST(''ALUNO'' AS VARCHAR(15)) AS TIPO, CAST(NOME AS VARCHAR(100)) AS NOME,  '+
    'CAST(EXTRACT (DAY FROM DTNASC) AS SMALLINT) AS DIA, CAST(EXTRACT (MONTH FROM DTNASC) AS SMALLINT) AS MES '+
    'FROM ALUNOS WHERE NOME IS NOT NULL AND ((CAST(EXTRACT(MONTH FROM DTNASC) AS SMALLINT) * 100) +  '+
    ' CAST(EXTRACT(DAY FROM DTNASC) AS SMALLINT)) BETWEEN :plPerIni AND  :plPerFin';
  // PAIS
  QryAniv.SQL.Add('UNION SELECT CAST(''PAI'' AS VARCHAR(15)), CAST(NOMEPAI AS VARCHAR(100)),  '+
    'CAST(EXTRACT (DAY FROM DTNASCPAI) AS SMALLINT), CAST(EXTRACT (MONTH FROM DTNASCPAI) AS SMALLINT) '+
    'FROM ALUNOS WHERE NOMEPAI IS NOT NULL AND ((CAST(EXTRACT(MONTH FROM DTNASCPAI) AS SMALLINT) * 100) +  '+
    ' CAST(EXTRACT(DAY FROM DTNASCPAI) AS SMALLINT)) BETWEEN :plPerIni AND  :plPerFin');
  // MAES
  QryAniv.SQL.Add('UNION SELECT CAST(''MÃE'' AS VARCHAR(15)), CAST(NOMEMAE AS VARCHAR(100)),  '+
    'CAST(EXTRACT (DAY FROM DTNASCMAE) AS SMALLINT), CAST(EXTRACT (MONTH FROM DTNASCMAE) AS SMALLINT) '+
    'FROM ALUNOS WHERE NOMEMAE IS NOT NULL AND ((CAST(EXTRACT(MONTH FROM DTNASCMAE) AS SMALLINT) * 100) +  '+
    ' CAST(EXTRACT(DAY FROM DTNASCMAE) AS SMALLINT)) BETWEEN :plPerIni AND  :plPerFin');
  // RESPONSAVEIS
  QryAniv.SQL.Add('UNION SELECT CAST(''RESPONSÁVEL'' AS VARCHAR(15)), CAST(NOMERESP AS VARCHAR(100)),  '+
    'CAST(EXTRACT (DAY FROM DTNASCRESP) AS SMALLINT), CAST(EXTRACT (MONTH FROM DTNASCRESP) AS SMALLINT) '+
    'FROM ALUNOS WHERE NOMERESP IS NOT NULL AND ((CAST(EXTRACT(MONTH FROM DTNASCRESP) AS SMALLINT) * 100) +  '+
    ' CAST(EXTRACT(DAY FROM DTNASCRESP) AS SMALLINT)) BETWEEN :plPerIni AND  :plPerFin');
  // FUNCIONÁRIOS
  QryAniv.SQL.Add('UNION SELECT CAST(''FUNCIONÁRIO'' AS VARCHAR(15)), CAST(NOME AS VARCHAR(100)), '+
    'CAST(EXTRACT (DAY FROM DTNASC) AS SMALLINT),  '+
    'CAST(EXTRACT (MONTH FROM DTNASC) AS SMALLINT) FROM FUNC WHERE NOME IS NOT NULL AND '+
    '((CAST(EXTRACT(MONTH FROM DTNASC) AS SMALLINT) * 100) +  '+
    ' CAST(EXTRACT(DAY FROM DTNASC) AS SMALLINT)) BETWEEN :plPerIni AND  :plPerFin');
  // FORNECEDORES
  QryAniv.SQL.Add('UNION SELECT CAST(''FORNECEDOR'' AS VARCHAR(15)), CAST(NOME AS VARCHAR(100)), '+
    'CAST(EXTRACT (DAY FROM DTFUND) AS SMALLINT),  '+
    'CAST(EXTRACT (MONTH FROM DTFUND) AS SMALLINT) FROM GEN WHERE TIPOFORN = ''T'' AND NOME IS NOT NULL  AND '+
    '((CAST(EXTRACT(MONTH FROM DTFUND) AS SMALLINT) * 100) +  '+
    ' CAST(EXTRACT(DAY FROM DTFUND) AS SMALLINT)) BETWEEN :plPerIni AND  :plPerFin');

    // TRANSPORTADORAS


  QryAniv.SQL.Add('order by 4,3');
  QryAniv.ParamByName('plPerIni').AsInteger :=  vlPerIni;
  QryAniv.ParamByName('plPerFin').AsInteger :=  vlPerFin;
  QryAniv.Open;

  QryAniv.DisableControls;
  Tag := 0;
  while not QryAniv.Eof do begin
    Tag := Tag + 1;
    QryAniv.Next;
  end;

  QryAniv.First;
  LblQtde.Caption := IntToStr(Tag) + ' registro(s) encontrado(s)';
  QryAniv.EnableControls;
end;

procedure TFAniv.PageControl1Change(Sender: TObject);
begin
  PnlPeriodo.Visible := PageControl1.ActivePage = TSPeriodo;
  PnlMes.Visible := PageControl1.ActivePage = TSMes;
end;

procedure TFAniv.FormShow(Sender: TObject);
begin
  RLAniv.Hide;
  PageControl1.ActivePage := TSSemana;
  PageControl1Change(nil);
end;

procedure TFAniv.SpeedButton1Click(Sender: TObject);
begin
  if QryAniv.IsEmpty then
    Exit;
  ParametrosRel(Caption);
  RLAniv.Preview;
  RLAniv.Hide;
end;

end.
