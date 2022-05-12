unit UBaixaCarne;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery, DBClient, Mask;

type
  TFBaixaCarne = class(TForm)
    StatusBar1: TStatusBar;
    Prosseguir: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBText;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBText1: TDBText;
    DTPPgto: TDateTimePicker;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ProsseguirClick(Sender: TObject);
    procedure DTPPgtoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure DBEdit7Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBaixaCarne: TFBaixaCarne;

implementation

uses UDados, UAlunos, DateUtils;

{$R *.dfm}

procedure TFBaixaCarne.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFBaixaCarne.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFBaixaCarne.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFBaixaCarne.SpeedButton2Click(Sender: TObject);
begin
  WinExec('calc.exe', SW_SHOW)
end;

procedure TFBaixaCarne.ProsseguirClick(Sender: TObject);
begin
  if sender = Prosseguir then begin
    if FAlunos.TbAlunosCarneDTPGTO.Value = FAlunos.TbAlunosCarneDTVCTO.Value then
      FAlunos.TbAlunosCarneSTATUS.Value := 'P'
    else if FAlunos.TbAlunosCarneDTPGTO.Value < FAlunos.TbAlunosCarneDTVCTO.Value then
      FAlunos.TbAlunosCarneSTATUS.Value := 'C'
    else if FAlunos.TbAlunosCarneDTPGTO.Value > FAlunos.TbAlunosCarneDTVCTO.Value then
      FAlunos.TbAlunosCarneSTATUS.Value := 'T';
    FAlunos.TbAlunosCarne.Post
  end else
    FAlunos.TbAlunosCarne.Cancel;
  Close;
end;

procedure TFBaixaCarne.DTPPgtoChange(Sender: TObject);
begin
  FAlunos.TbAlunosCarneDTPGTO.Value := DTPPgto.Date;
end;

procedure TFBaixaCarne.FormShow(Sender: TObject);
begin
  FAlunos.TbAlunosCarneDTPGTO.Value := Date;
end;

procedure TFBaixaCarne.DBEdit2Change(Sender: TObject);
begin
  try
    DTPPgto.Date := FAlunos.TbAlunosCarneDTPGTO.Value;
  except
    DTPPgto.Date := Date;
  end;
end;

procedure TFBaixaCarne.DBEdit2Exit(Sender: TObject);
begin
  if FAlunos.TbAlunosCarneDTPGTO.Value > FAlunos.TbAlunosCarneDTVCTO.Value then begin
    if Dados.TbConfigOPT.Value = 'P' then
      FAlunos.TbAlunosCarnePERCMULTA.Value := Dados.TbConfigOPTPERC.Value * DaysBetween(FAlunos.TbAlunosCarneDTVCTO.AsDateTime, DTPPgto.Date)
    else
      FAlunos.TbAlunosCarneVALORMULTA.Value := Dados.TbConfigOPTVALOR.Value * DaysBetween(FAlunos.TbAlunosCarneDTVCTO.AsDateTime, DTPPgto.Date);
  end;
end;

procedure TFBaixaCarne.DBEdit3Change(Sender: TObject);
begin
  if FAlunos.TbAlunosCarnePERCMULTA.Value > 0 then
    FAlunos.TbAlunosCarneVALORMULTA.Value := (FAlunos.TbAlunosCarnePERCMULTA.Value / 100);
end;

procedure TFBaixaCarne.DBEdit5Change(Sender: TObject);
begin
  FAlunos.TbAlunosCarneVALORPAGO.value := FAlunos.TbAlunosCarneVALOR.Value +
     FAlunos.TbAlunosCarneVALORMULTA.Value - FAlunos.TbAlunosCarneVALORDESC.Value;
end;

procedure TFBaixaCarne.DBEdit7Change(Sender: TObject);
begin
  if FAlunos.TbAlunosCarnePERCDESC.Value > 0 then
    FAlunos.TbAlunosCarneVALORDESC.Value := (FAlunos.TbAlunosCarnePERCDESC.Value / 100);
end;

end.
