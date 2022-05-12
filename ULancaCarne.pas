unit ULancaCarne;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery, DBClient, Mask;

type
  TFLancaCarne = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Prosseguir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    RBCada: TRadioButton;
    RBSempre: TRadioButton;
    EdCada: TEdit;
    EdSempre: TEdit;
    EdLanctos: TEdit;
    DTPData: TDateTimePicker;
    MEmoney: TMaskEdit;
    PBAndamento: TProgressBar;
    QryProx: TMDOQuery;
    QryProxDIA: TSmallintField;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RBCadaClick(Sender: TObject);
    procedure ProsseguirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLancaCarne: TFLancaCarne;

implementation

uses UDados, UAlunos, DateUtils, UCReceber;

{$R *.dfm}

procedure TFLancaCarne.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFLancaCarne.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFLancaCarne.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  PBAndamento.Visible := False;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  DTPData.Date := Date;
  RBCadaClick(nil);
end;

procedure TFLancaCarne.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TFLancaCarne.RBCadaClick(Sender: TObject);
begin
  EdCada.Visible := RBCada.Checked;
  EdSempre.Visible := RBSempre.Checked;
end;

procedure TFLancaCarne.ProsseguirClick(Sender: TObject);
var
  vpNumCR, i, vpQtde, DiaPgto, vpControle, vlPerIni, vlPerFin: Smallint;
  vpData, vpDataAux, vpDtIni, vpDtFin: TDate;
begin
  try
//    FAlunos.ConfTrans(True);
    Application.CreateForm(TFCReceber, FCReceber);
    vpQtde := StrToInt(EdLanctos.Text);
    PBAndamento.Max :=  vpQtde;
    PBAndamento.Position := 0;
    PBAndamento.Visible := true;
    if not RBCada.Checked then
      vpData := StartOfTheMonth(DTPData.Date) + StrToInt(EdSempre.Text)
    else
      vpData := DTPData.Date;
    FLancaCarne.Enabled := False;

    FCReceber.TbCR.Last;
    vpNumCR := FCReceber.TbCRNROCRECEBER.Value + 1;

    FCReceber.TbCR.Append;
    FCReceber.TbCRNROCRECEBER.Value := VpNumCR;
    FCReceber.TbCRCODCC.Value := 1;
    FCReceber.TbCRCODGEN.Value := FAlunos.TbAlunosCODALUNO.Value;
    FCreceber.TbCRDATA.Value := Date;
    FCReceber.TbCROBS.Value := 'Lançamento de Carnê dos Alunos';
    FCReceber.TbCR.Post;

    for i:= 1 to vpQtde do begin
      FAlunos.TbAlunosCarne.Append;
      FAlunos.TbAlunosCarneCODALUNO.Value := FAlunos.TbAlunosCODALUNO.Value;
      FAlunos.QryProx.SQL.Text := 'SELECT MAX(CODCARNE) FROM ALUNOSCARNE WHERE CODALUNO = '+ IntToStr(FAlunos.TbAlunosCODALUNO.Value);
      FAlunos.QryProx.Open;
      FAlunos.TbAlunosCarneCODCARNE.Value := FAlunos.QryProx.Fields[0].AsInteger + 1;
      FAlunos.QryProx.Close;
      FAlunos.TbAlunosCarneDTVCTO.Value :=  vpData;
      FAlunos.TbAlunosCarneVALOR.Value := StrToCurr(MEmoney.Text);
      FAlunos.TbAlunosCarneSTATUS.Value := 'A';
      if RBCada.Checked then
        vpData := FAlunos.TbAlunosCarneDTVCTO.Value + StrToInt(EdCada.Text)
      else begin
        vpData := IncMonth(vpData, 1);
        vpDataAux := StartOfTheMonth(vpData);
        VpDtIni := vpDataAux;
        vpDtFin := EndOfTheMonth(vpDataAux);
        vlPerIni := StrToInt(FormatDateTime('MM', VpDtIni)) * 100 + StrToInt(FormatDateTime('dd', VpDtIni));
        vlPerFin := StrToInt(FormatDateTime('MM', vpDtFin)) * 100 + StrToInt(FormatDateTime('dd', vpDtFin));
        QryProx.SQL.Text := 'select EXTRACT(DAY FROM DATA) as DIA from dtcom  where feriadoletivo = 1 and '+
          '((CAST(EXTRACT(MONTH FROM DATA) AS SMALLINT) * 100) +  '+
          'CAST(EXTRACT(DAY FROM DATA) AS SMALLINT)) BETWEEN :plPerIni AND :plPerFin ';
        QryProx.ParamByName('plPerIni').AsInteger := vlPerIni;
        QryProx.ParamByName('plPerFin').AsInteger := vlPerFin;
        QryProx.Open;
        vpControle := 0;
        while vpControle + 1 < StrToInt(EdSempre.Text) do begin
          Tag := DayOfTheMonth(vpDataAux);
          if not (QryProx.Locate('DIA', Tag, [])) then
            if (DayOfTheWeek(vpDataAux) <> 6) and (DayOfTheWeek(vpDataAux) <> 7) then
              Inc(vpControle);
          vpDataAux := IncDay(vpDataAux, 1);

          if vpControle = StrToInt(EdSempre.Text) then begin
            if (DayOfTheWeek(vpDataAux) = 6) THEN
              vpDataAux := vpDataAux + 2;
            if (FAlunos.QryProx.Locate('DIA', DayOfTheMonth(vpDataAux), [])) then
              vpDataAux := vpDataAux + 1;
          end;
        end;
        FAlunos.TbAlunosCarneDTVCTO.Value :=  vpDataAux;
        QryProx.Close;
      end;

      FAlunos.TbAlunosCarne.Post;
      FCReceber.TbCRParcs.Append;
      FCReceber.TbCRParcsNROCRECEBER.Value := FCReceber.TbCRNROCRECEBER.Value;

      FCReceber.QryAux.SQL.Text := 'SELECT MAX(NROPARC) FROM CRECEBERPARCS WHERE NROCRECEBER = '+ IntToStr(FCReceber.TbCRNROCRECEBER.Value);
      FCReceber.QryAux.Open;
      FCReceber.TbCRParcsNROPARC.Value := FCReceber.QryAux.Fields[0].AsInteger + 1;
      FCReceber.QryAux.Close;

//      FCReceber.TbCRParcsNROPARC.Value := FAlunos.TbAlunosCarneCODCARNE.Value;
      FCreceber.TbCRParcsDATAGERA.Value := Date;
      FCReceber.TbCRParcsVCTOPARC.Value :=  FAlunos.TbAlunosCarneDTVCTO.Value;
      FCReceber.TbCRParcsVLRPARC.Value := FAlunos.TbAlunosCarneVALOR.Value;
      FCReceber.TbCRParcsSITUACAO.Value := 'A';
      FCReceber.TbCRParcsDATAGERA.Value := Date;
      FCReceber.TbCRParcs.Post;

      PBAndamento.StepBy(1);
      Application.ProcessMessages;
    end;
    MessageDlg('Carnê lançado com sucesso!', mtInformation, [mbOk], 0);
    FAlunos.ConfTrans(True);
    if FCReceber <> nil then
      FCReceber.ConfTrans(True);
    FreeAndNil(FCReceber);
  except
    MessageDlg('Erro ao lançar as parcelas!', mtWarning, [mbOK], 0);
    FAlunos.ConfTrans(True);
    if FCReceber <> nil then
      FCReceber.ConfTrans(True);
    FreeAndNil(FCReceber);      
  end;
  Close;
//
end;

procedure TFLancaCarne.FormShow(Sender: TObject);
begin
  if not FAlunos.TbAlunosCODALUNO.IsNull then begin
    Dados.QryTurmasLK.Open;
    Dados.QryTurmasLK.Locate('CODTURMA', FAlunos.TbAlunosCODTURMA.Value, []);
    MEmoney.Text := FormatFloat ('##0.00', Dados.QryTurmasLK.fieldByName('VLRCARNE').AsCurrency);
  end;
end;

end.
