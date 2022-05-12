unit UFichaAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, MDOQuery,
  RLReport;

type
  TFFichaAluno = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QryFicha: TMDOQuery;
    DSEst: TDataSource;
    Prosseguir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    QryFichaCODALUNO: TSmallintField;
    QryFichaDTNASC: TDateField;
    QryFichaMATRICULA: TIntegerField;
    QryFichaNOME: TMDOStringField;
    QryFichaENDERECO: TMDOStringField;
    QryFichaCID: TMDOStringField;
    QryFichaBAIRRO: TMDOStringField;
    QryFichaFONE: TMDOStringField;
    QryFichaNOMEPAI: TMDOStringField;
    QryFichaENDERECOPAI: TMDOStringField;
    QryFichaFONEPAI: TMDOStringField;
    QryFichaNOMEMAE: TMDOStringField;
    QryFichaENDERECOMAE: TMDOStringField;
    QryFichaFONEMAE: TMDOStringField;
    QryFichaNOMERESP: TMDOStringField;
    QryFichaENDERECORESP: TMDOStringField;
    QryFichaFONERESP: TMDOStringField;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDPai1: TRLDraw;
    RLLPai1: TRLLabel;
    RLLPai2: TRLLabel;
    RLLPai3: TRLLabel;
    RLLPai4: TRLLabel;
    RLDPai2: TRLDraw;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBPai1: TRLDBText;
    RLDBPai3: TRLDBText;
    RLBand3: TRLBand;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel10: TRLLabel;
    RLLIdade: TRLLabel;
    RLDBPai2: TRLDBText;
    RLDMae1: TRLDraw;
    RLLMae1: TRLLabel;
    RLLMae2: TRLLabel;
    RLLMae3: TRLLabel;
    RLLMae4: TRLLabel;
    RLDMae2: TRLDraw;
    RLDBMae1: TRLDBText;
    RLDBMae3: TRLDBText;
    RLDBMae2: TRLDBText;
    RLDResp1: TRLDraw;
    RLLResp1: TRLLabel;
    RLLResp2: TRLLabel;
    RLLResp3: TRLLabel;
    RLLResp4: TRLLabel;
    RLDLResp2: TRLDraw;
    RLDBResp1: TRLDBText;
    RLDBResp2: TRLDBText;
    RLDBResp3: TRLDBText;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ProsseguirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    vpCountGeral: Smallint;
  public
    { Public declarations }
  end;

var
  FFichaAluno: TFFichaAluno;

implementation

uses UDados, URelatoriosFaixa, UAlunos;

{$R *.dfm}

procedure TFFichaAluno.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFFichaAluno.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFFichaAluno.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  ClientHeight := 56;
  ClientWidth := 268;
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Dados.ConfTrans(True);
end;

procedure TFFichaAluno.ProsseguirClick(Sender: TObject);
var
  vlTipoRel: String;
begin
  QryFicha.ParamByName('plCod').AsInteger := FAlunos.TbAlunosCodAluno.Value;
  QryFicha.Open;
  RLReport1.Preview;
end;

procedure TFFichaAluno.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFFichaAluno.RLBand2BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLIdade.Caption := FAlunos.TbAlunosIdade.Value;
  if QryFichaNOMEPAI.IsNull then
    RLDPai1.Visible := False;
  if QryFichaNOMEMAE.IsNull then
    RLDMae1.Visible := False;
  if QryFichaNOMERESP.IsNull then
    RLDResp1.Visible := False;
  RLLPai1.Visible := RLDPai1.Visible;
  RLLPai2.Visible := RLDPai1.Visible;
  RLLPai3.Visible := RLDPai1.Visible;
  RLLPai4.Visible := RLDPai1.Visible;
  RLDBPai1.Visible := RLDPai1.Visible;
  RLDBPai2.Visible := RLDPai1.Visible;
  RLDBPai3.Visible := RLDPai1.Visible;
  RLDPai2.Visible := RLDPai1.Visible;

  RLLMae1.Visible := RLDMae1.Visible;
  RLLMae2.Visible := RLDMae1.Visible;
  RLLMae3.Visible := RLDMae1.Visible;
  RLLMae4.Visible := RLDMae1.Visible;
  RLDBMae1.Visible := RLDMae1.Visible;
  RLDBMae2.Visible := RLDMae1.Visible;
  RLDBMae3.Visible := RLDMae1.Visible;
  RLDMae2.Visible := RLDMae1.Visible;

  RLDLResp2.Visible := RLDResp1.Visible;
  RLLResp1.Visible := RLDResp1.Visible;
  RLLResp2.Visible := RLDResp1.Visible;
  RLLResp3.Visible := RLDResp1.Visible;
  RLLResp4.Visible := RLDResp1.Visible;
  RLDBResp1.Visible := RLDResp1.Visible;
  RLDBResp2.Visible := RLDResp1.Visible;
  RLDBResp3.Visible := RLDResp1.Visible;
end;

end.
