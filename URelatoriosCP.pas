unit URelatoriosCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery, DBClient;

type
  TFRelatoriosCP = class(TForm)
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
    RGTipoOrd: TRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    RGExib: TRadioGroup;
    QryRelNROCPAGAR: TSmallintField;
    QryRelNROPARC: TSmallintField;
    QryRelFORN: TMDOStringField;
    QryRelLCTO: TDateField;
    QryRelVCTO: TDateField;
    QryRelSTATUS: TMDOStringField;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLCabecalho: TRLLabel;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand2: TRLBand;
    QRLPeriodo: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    VlrPago: TRLLabel;
    VlrAberto: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand4: TRLBand;
    RLLabel5: TRLLabel;
    RLDBText1: TRLDBText;
    RLBand5: TRLBand;
    VlrAbertoDia: TRLLabel;
    VlrPagoDia: TRLLabel;
    RLLabel8: TRLLabel;
    RLBand6: TRLBand;
    RLLabel6: TRLLabel;
    VlrAbertoTot: TRLLabel;
    VlrPagoTot: TRLLabel;
    RLBand7: TRLBand;
    RLLRodape: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ProsseguirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLGroup1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vpTipoRel: String;
    vpCountGeral, vpPrintBand: Smallint;
    vpValorAbTot, vpValorPgTot, vpValorAbDia, vpValorPgDia: Currency;
    procedure ParametrosRel(plCab, plDescricao: String);
  public
    { Public declarations }
    vpTabelaMae, vpTabelaFilha, vpCampoPrinc, vlTbGen, vlCampoGen: String;
  end;

var
  FRelatoriosCP: TFRelatoriosCP;

implementation

uses UDados;

{$R *.dfm}

procedure TFRelatoriosCP.ParametrosRel(plCab, plDescricao: String);
begin
  RLLCabecalho.Caption := plCab;
//  RLLDescricao.Caption := plDescricao;
  RLLRodape.Caption := cgNomeEmp;
  QRLPeriodo.Caption := 'Período: ';
  if CBDTIni.Checked and CBDtFin.Checked then
    QRLPeriodo.Caption := QRLPeriodo.Caption + 'Entre '+ DateToStr(DTPDtIni.DateTime) +' e '+ DateToStr(DTPDtFin.DateTime)
  else if CBDTIni.Checked then
    QRLPeriodo.Caption := QRLPeriodo.Caption + 'A partir de '+ DateToStr(DTPDtIni.DateTime)
  else if CBDtFin.Checked then
    QRLPeriodo.Caption := QRLPeriodo.Caption + 'Até '+ DateToStr(DTPDtFin.DateTime)
  else
    QRLPeriodo.Caption := QRLPeriodo.Caption + 'Geral';
end;

procedure TFRelatoriosCP.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFRelatoriosCP.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFRelatoriosCP.FormCreate(Sender: TObject);
var
  i: smallint;
begin
//  Dados.RvDS.DataSet := QryRel;
  ClientHeight := 240;
  ClientWidth := 384;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
//  QryRel.Open;
  Dados.ConfTrans(True);


//  Dados.LKFornecedores(True);
  DTPDtIni.Date := Date - 30;
  DTPDtFin.Date := Date;
end;

procedure TFRelatoriosCP.ProsseguirClick(Sender: TObject);
begin
  ParametrosRel(Caption, 'Nome');

  QryRel.SQL.Text := ' SELECT G.NOME AS FORN, CPP.DATAGERA AS LCTO, CPP.VCTOPARC AS VCTO, '+
    ' CAST (CASE CPP.SITUACAO WHEN ''A'' THEN ''Aberta'' '+
    ' WHEN ''C'' THEN ''Cancelada'' '+
    ' ELSE ''Paga'' end '+
    ' AS VARCHAR(16)) as STATUS,  CPP.'+ vpCampoPrinc +' AS NROCPAGAR, CPP.NROPARC '+
    ' FROM '+ vpTabelaFilha +' CPP INNER JOIN '+ vpTabelaMae +' CP ON CP.'+ vpCampoPrinc +' = CPP.'+ vpCampoPrinc +' '+
    ' INNER JOIN '+ vlTbGen +' G ON G.'+ vlCampoGen +' = CP.CODGEN '+
    ' INNER JOIN CC C ON C.CODCC = CP.CODCC  WHERE G.NOME IS NOT NULL ';
  if (CBForn.Checked) and (DBLCBForn.Text <> '') then begin
    QryRel.SQL.Add(' AND CP.CODGEN =:plCodForn');
    QryRel.ParamByName('plCodForn').AsInteger := DBLCBForn.KeyValue;
  end;
  if CBDTIni.Checked then begin
    QryRel.SQL.Add(' AND CPP.VCTOPARC >=:plDataIni');
    QryRel.ParamByName('plDataIni').AsDate := DTPDtIni.Date;
  end;
  if CBDtFin.Checked then begin
    QryRel.SQL.Add(' AND CPP.VCTOPARC <=:plDataFin');
    QryRel.ParamByName('plDataFin').AsDate := DTPDtFin.Date;
  end;
  case RGExib.ItemIndex of
    1: QryRel.SQL.Add(' AND SITUACAO = ''P''');
    2: QryRel.SQL.Add(' AND SITUACAO = ''A''');
    3: QryRel.SQL.Add(' AND SITUACAO = ''C''');
  end;


  QryRel.SQL.Add(' ORDER BY 3, 1');
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

procedure TFRelatoriosCP.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFRelatoriosCP.FormShow(Sender: TObject);
begin
  Dados.QryCCLK.Open;
  Dados.QryFornLK.Open;
  Dados.QryAlunosLK.Open;
end;

procedure TFRelatoriosCP.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  vlVlrPg, vlVlrAb: Currency;
  vlParCP, vlParNro: Smallint;
  vlSit: String;
begin
{  if vpPrintBand = 1 then begin
    RLDBText2.Top := 0;
    RLDBText3.Top := 0;
    VlrAberto.Top := 0;
    VlrPago.Top := 0;
  end;  }
  vlVlrPg := 0;
  vlVlrAb := 0;
  vlParCP := QryRelNROCPAGAR.Value;
  vlParNro := QryRelNROPARC.Value;
  vlSit := 'A';
  Dados.QryAux.SQL.Text := 'SELECT CPP.VLRPARC FROM '+ vpTabelaFilha +' CPP WHERE CPP.'+ vpCampoPrinc +' =:PLCP AND CPP.NROPARC =:PLNRO '+
    'And CPP.SITUACAO =:PLSIT ';
  Dados.QryAux.ParamByName('PLCP').AsInteger := vlParCP;
  Dados.QryAux.ParamByName('PLNRO').AsInteger := vlParNro;
  Dados.QryAux.ParamByName('PLSIT').AsString := vlSit;
  Dados.QryAux.Open;
  if not Dados.QryAux.IsEmpty then
    vlVlrAb := Dados.QryAux.Fields[0].AsCurrency;
  Dados.QryAux.Close;

  vlSit := 'P';
  Dados.QryAux.SQL.Text := 'SELECT CPP.VLRPARC FROM '+ vpTabelaFilha +' CPP WHERE CPP.'+ vpCampoPrinc +' =:PLCP AND CPP.NROPARC =:PLNRO '+
    'And CPP.SITUACAO =:PLSIT ';
  Dados.QryAux.ParamByName('PLCP').AsInteger := vlParCP;
  Dados.QryAux.ParamByName('PLNRO').AsInteger := vlParNro;
  Dados.QryAux.ParamByName('PLSIT').AsString := vlSit;
  Dados.QryAux.Open;
  if not Dados.QryAux.IsEmpty then
    vlVlrPg := Dados.QryAux.Fields[0].AsCurrency;
  Dados.QryAux.Close;

  VlrAberto.Caption := FormatFloat('#,##0.00', vlVlrAb);
  VlrPago.Caption := FormatFloat('#,##0.00', vlVlrPg);
  vpValorAbDia := vpValorAbDia + vlVlrAb;
  vpValorPgDia := vpValorPgDia + vlVlrPg;
end;

procedure TFRelatoriosCP.RLGroup1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  vpPrintBand := 1;
  vpValorAbDia  := 0;
  vpValorPgDia  := 0;
end;

procedure TFRelatoriosCP.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  VlrAbertoDia.Caption := FormatFloat('#,##0.00', vpValorAbDia);
  VlrPagoDia.Caption := FormatFloat('#,##0.00', vpValorPgDia);

  vpValorAbTot := vpValorAbTot + vpValorAbDia;
  vpValorPgTot := vpValorPgTot + vpValorPgDia;
end;

procedure TFRelatoriosCP.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  vpValorAbTot := 0;
  vpValorPgTot := 0;
  vpValorAbDia := 0;
  vpValorPgDia := 0;
end;

procedure TFRelatoriosCP.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  VlrAbertoTot.Caption := FormatFloat('#,##0.00', vpValorAbTot);
  VlrPagoTot.Caption := FormatFloat('#,##0.00', vpValorPgTot);
end;

end.
