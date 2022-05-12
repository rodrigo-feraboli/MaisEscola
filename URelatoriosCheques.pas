unit URelatoriosCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery, DBClient;

type
  TFRelatoriosCheques = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QryRel: TMDOQuery;
    DsRel: TDataSource;
    Prosseguir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    CBDTIni: TCheckBox;
    DTPDtIni: TDateTimePicker;
    CBDtFin: TCheckBox;
    DTPDtFin: TDateTimePicker;
    RGTipoOrd: TRadioGroup;
    DBLCBAluno: TDBLookupComboBox;
    CbAluno: TCheckBox;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLCabecalho: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand2: TRLBand;
    QRLPeriodo: TRLLabel;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBText2: TRLDBText;
    RLBand4: TRLBand;
    RLDBText1: TRLDBText;
    RLBand5: TRLBand;
    RLLabel8: TRLLabel;
    RLBand6: TRLBand;
    RLLabel6: TRLLabel;
    RLBand7: TRLBand;
    RLLRodape: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    GroupBox2: TGroupBox;
    CBPre: TCheckBox;
    CBBaix: TCheckBox;
    CBCancelado: TCheckBox;
    RLLabel1: TRLLabel;
    QryRelBOMPARA: TDateField;
    QryRelVALOR: TMDOBCDField;
    QryRelOBS: TMemoField;
    QryRelEMITENTE: TMDOStringField;
    QryRelPREDAT: TSmallintField;
    QryRelBAIXADO: TSmallintField;
    QryRelCANCELADO: TSmallintField;
    RLLabel2: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel4: TRLLabel;
    QryRelNOME: TMDOStringField;
    RLLPreD: TRLLabel;
    RLLCanc: TRLLabel;
    RLLBaix: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ProsseguirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    procedure ParametrosRel(plCab, plDescricao: String);
  public
    { Public declarations }
    vpTabelaMae, vpTabelaFilha, vpCampoPrinc, vlTbGen, vlCampoGen: String;
  end;

var
  FRelatoriosCheques: TFRelatoriosCheques;

implementation

uses UDados, UCheques;

{$R *.dfm}

procedure TFRelatoriosCheques.ParametrosRel(plCab, plDescricao: String);
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

procedure TFRelatoriosCheques.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFRelatoriosCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFRelatoriosCheques.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  ClientHeight := 200;
  ClientWidth := 384;
  Dados.ConfTrans(True);
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);

  DTPDtIni.Date := Date - 30;
  DTPDtFin.Date := Date;
end;

procedure TFRelatoriosCheques.ProsseguirClick(Sender: TObject);
begin
  ParametrosRel(Caption, 'Nome');

  QryRel.SQL.Text := 'SELECT B.NOME, C.BOMPARA, C.VALOR, C.OBS, C.EMITENTE, C.PREDAT, '+
    'C.BAIXADO, C.CANCELADO FROM CHEQUES C INNER JOIN BANCOS B ON B.CODBANCO = C.CODBANCO '+
    'WHERE C.CODBANCO IS NOT NULL';

  if (CbAluno.Checked) and (DBLCBAluno.Text <> '') then begin
    QryRel.SQL.Add(' AND C.CODALUNO =:plCodAluno');
    QryRel.ParamByName('plCodAluno').AsInteger := DBLCBAluno.KeyValue;
  end;

  if CBDTIni.Checked then begin
    QryRel.SQL.Add(' AND C.BOMPARA >=:plDataIni');
    QryRel.ParamByName('plDataIni').AsDate := DTPDtIni.Date;
  end;
  if CBDtFin.Checked then begin
    QryRel.SQL.Add(' AND C.BOMPARA <=:plDataFin');
    QryRel.ParamByName('plDataFin').AsDate := DTPDtFin.Date;
  end;

  if CBPre.Checked then
    QryRel.SQL.Add(' AND C.PREDAT = 1');

  if CBBaix.Checked then
    QryRel.SQL.Add(' AND C.BAIXADO = 1');

  if CBCancelado.Checked then
    QryRel.SQL.Add(' AND C.CANCELADO = 1');


  QryRel.SQL.Add(' ORDER BY 5');
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

procedure TFRelatoriosCheques.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFRelatoriosCheques.FormShow(Sender: TObject);
begin
  Dados.QryAlunosLK.Open;
end;

procedure TFRelatoriosCheques.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLPreD.Visible := QryRelPREDAT.Value = 1;
  RLLCanc.Visible := QryRelCANCELADO.Value = 1;
  RLLBaix.Visible := QryRelBAIXADO.Value = 1;  
end;

end.
