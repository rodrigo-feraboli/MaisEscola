unit URelatoriosCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery, DBClient,  QRCtrls, QuickRpt;

type
  TFRelatoriosCompras = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QryRel: TMDOQuery;
    DsRel: TDataSource;
    Prosseguir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBLCBForn: TDBLookupComboBox;
    CBForn: TCheckBox;
    GroupBox1: TGroupBox;
    CBDTIni: TCheckBox;
    DTPDtIni: TDateTimePicker;
    CBDtFin: TCheckBox;
    DTPDtFin: TDateTimePicker;
    QryRelVALOR: TFloatField;
    QryRelQTDE: TIntegerField;
    QryRelTIPONOTA: TMDOStringField;
    QryRelNRONF: TLargeintField;
    QryRelDATAEMISSAONF: TDateField;
    QryRelFORNEC: TMDOStringField;
    RGTipoOrd: TRadioGroup;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLCabecalho: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand2: TRLBand;
    RLLPeriodo: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand4: TRLBand;
    RLLabel7: TRLLabel;
    RLDBText1: TRLDBText;
    RLBand5: TRLBand;
    RLLabel8: TRLLabel;
    RLBand6: TRLBand;
    RLLabel9: TRLLabel;
    RLBand7: TRLBand;
    RLLRodape: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
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
  FRelatoriosCompras: TFRelatoriosCompras;

implementation

uses UDados;

{$R *.dfm}

procedure TFRelatoriosCompras.ParametrosRel(plCab, plDescricao: String);
begin
  RLLCabecalho.Caption := plCab;
//  RLLDescricao.Caption := plDescricao;
  RLLRodape.Caption := cgNomeEmp;
  RLLPeriodo.Caption := 'Período: ';
  if CBDTIni.Checked and CBDtFin.Checked then
    RLLPeriodo.Caption := RLLPeriodo.Caption + 'Entre '+ DateToStr(DTPDtIni.DateTime) +' e '+ DateToStr(DTPDtFin.DateTime)
  else if CBDTIni.Checked then
    RLLPeriodo.Caption := RLLPeriodo.Caption + 'A partir de '+ DateToStr(DTPDtIni.DateTime)
  else if CBDtFin.Checked then
    RLLPeriodo.Caption := RLLPeriodo.Caption + 'Até '+ DateToStr(DTPDtFin.DateTime)
  else
    RLLPeriodo.Caption := RLLPeriodo.Caption + 'Geral';
end;

procedure TFRelatoriosCompras.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFRelatoriosCompras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFRelatoriosCompras.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  ClientHeight := 200;
  ClientWidth := 384;
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Dados.ConfTrans(True);
  Dados.LKFornecedores(True);
  DTPDtIni.Date := Date - 30;
  DTPDtFin.Date := Date;
end;

procedure TFRelatoriosCompras.ProsseguirClick(Sender: TObject);
begin
  if Caption = 'Relatório de Compras' then begin
    ParametrosRel(Caption, 'Nome');
    QryRel.SQL.Text := ' select SUM(CI.quant * CI.vlrunit) AS VALOR, COUNT(CI.nroitem) AS QTDE,  TIPONOTA, NRONF, DATAEMISSAONF, '+
      ' G.NOME AS FORNEC '+
      ' FROM COMPRAS C '+
      ' INNER JOIN COMPRASITENS CI ON CI.NROCOMPRA = C.NROCOMPRA '+
      ' INNER JOIN GEN G ON G.codgen = C.codforngen  WHERE C.NROCOMPRA IS NOT NULL ';
    if (CBForn.Checked) and (DBLCBForn.Text <> '') then begin
      QryRel.SQL.Add(' AND CODFORNGEN =:plCodForn');
      QryRel.ParamByName('plCodForn').AsInteger := DBLCBForn.KeyValue;
    end;
    if CBDTIni.Checked then begin
      QryRel.SQL.Add(' AND DATAEMISSAONF >=: plDataIni');
      QryRel.ParamByName('plDataIni').AsDate := DTPDtIni.Date;
    end;
    if CBDtFin.Checked then begin
      QryRel.SQL.Add(' AND DATAEMISSAONF <=: plDataFin');
      QryRel.ParamByName('plDataFin').AsDate := DTPDtFin.Date;
    end;
  end;
  QryRel.SQL.Add('GROUP By 3,4,5,6  ORDER BY 6');
  if RGTipoOrd.Itemindex = 0 then
    QryRel.SQL.Add(' ASC')
  else
    QryRel.SQL.Add(' DESC');
  QryRel.open;
  if QryRel.IsEmpty then begin
    MessageDlg('Seleção sem registros!', mtWarning, [mbOk], 0);
    Exit;
  end;
  RLReport1.Preview;
  QryRel.Close;
end;

procedure TFRelatoriosCompras.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
