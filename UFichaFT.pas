unit UFichaFT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery, DBClient, RpRender, RpRenderCanvas, RpRenderPreview, RpBase,
  RpSystem, RpRave, RpDefine, RpCon, RpConDS;

type
  TFFichaFT = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QryFicha: TMDOQuery;
    DSEst: TDataSource;
    Prosseguir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    QryFichaCODGEN: TSmallintField;
    QryFichaDTFUND: TDateField;
    QryFichaNOME: TMDOStringField;
    QryFichaFANTASIA: TMDOStringField;
    QryFichaCID: TMDOStringField;
    QryFichaBAIRRO: TMDOStringField;
    QryFichaFONE1: TMDOStringField;
    QryFichaFONE2: TMDOStringField;
    QryFichaENDERECO: TMDOStringField;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLCabecalho: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel10: TRLLabel;
    RLLIdade: TRLLabel;
    RLBand3: TRLBand;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLDBText9: TRLDBText;
    RLLabel1: TRLLabel;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure ProsseguirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    vpCountGeral: Smallint;
  public
    { Public declarations }
  end;

var
  FFichaFT: TFFichaFT;

implementation

uses UDados, URelatoriosFaixa, UGen;

{$R *.dfm}

procedure TFFichaFT.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFFichaFT.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFFichaFT.FormCreate(Sender: TObject);
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

procedure TFFichaFT.ProsseguirClick(Sender: TObject);
var
  vlTipoRel: String;
begin
  QryFicha.ParamByName('plCod').AsInteger := FGen.TbGenCODGEN.Value;
  QryFicha.Open;
  RLReport1.Preview;
end;

procedure TFFichaFT.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.
