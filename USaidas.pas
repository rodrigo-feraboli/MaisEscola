unit USaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery;

type
  TFSaidas = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QrySaidas: TMDOQuery;
    DSAniv: TDataSource;
    DBGrid1: TDBGrid;
    LblQtde: TLabel;
    CBIni: TCheckBox;
    CBFin: TCheckBox;
    QrySaidasStatusStr: TStringField;
    DTPIni: TDateTimePicker;
    DTPFin: TDateTimePicker;
    QrySaidasMotivoStr: TStringField;
    QrySaidasNOME: TMDOStringField;
    QrySaidasHRSAI: TTimeField;
    QrySaidasMOTIVO: TMemoField;
    QrySaidasSTATUS: TSmallintField;
    QrySaidasDIA: TDateField;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure QrySaidasCalcFields(DataSet: TDataSet);
    procedure CBIniClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSaidas: TFSaidas;

implementation

uses UDados, UAlunos, DateUtils;

{$R *.dfm}

procedure TFSaidas.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFSaidas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFSaidas.FormCreate(Sender: TObject);
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

  DTPIni.Date := Date;
  DTPFin.Date := Date + 30;
  CBIniClick(nil);
end;

procedure TFSaidas.QrySaidasCalcFields(DataSet: TDataSet);
begin
  case QrySaidasSTATUS.Value of
    0: QrySaidasStatusStr.Value := 'Concluído';
    1: QrySaidasStatusStr.Value := 'Aberto';
  end;
  QrySaidasMotivoStr.Value := QrySaidasMOTIVO.Value;
end;

procedure TFSaidas.CBIniClick(Sender: TObject);
var
  vlPerIni, vlPerFin: Smallint;
begin
  vlPerIni := 101;
  vlPerFin := 1231;
  if CbIni.Checked and CbFin.Checked then begin
    vlPerIni := StrToInt(FormatDateTime('MM', DTPIni.Date)) * 100 + StrToInt(FormatDateTime('dd', DTPIni.Date));
    vlPerFin := StrToInt(FormatDateTime('MM', DTPFin.Date)) * 100 + StrToInt(FormatDateTime('dd', DTPFin.Date));
  end else if CbIni.Checked then
    vlPerIni := StrToInt(FormatDateTime('MM', DTPIni.Date)) * 100 + StrToInt(FormatDateTime('dd', DTPIni.Date))
  else if CbFin.Checked then
    vlPerFin := StrToInt(FormatDateTime('MM', DTPFin.Date)) * 100 + StrToInt(FormatDateTime('dd', DTPFin.Date));
  QrySaidas.Close;
  Dados.Transaction.CommitRetaining;
  QrySaidas.SQL.Text :=  'SELECT A.NOME, AA.DTSAI '+
    ' as Dia, AA.HRSAI, AA.MOTIVO, AA.STATUS FROM ALUNOS A INNER JOIN ALUNOSAVISO AA ON AA.CODALUNO = A.CODALUNO '+
    ' WHERE MOTIVO IS NOT NULL  and ((cast(extract(month from AA.DTSAI) as smallint) * 100) +  '+
    ' cast(extract(day from AA.DTSAI) as smallint)) between :plPerIni and  :plPerFin order by 2,3 ';
  QrySaidas.ParamByName('plPerIni').AsInteger :=  vlPerIni;
  QrySaidas.ParamByName('plPerFin').AsInteger :=  vlPerFin;
  QrySaidas.Open;

  QrySaidas.DisableControls;
  Tag := 0;
  while not QrySaidas.Eof do begin
    Tag := Tag + 1;
    QrySaidas.Next;
  end;

  QrySaidas.First;
  LblQtde.Caption := IntToStr(Tag) + ' registro(s) encontrado(s)';
  QrySaidas.EnableControls;
end;

procedure TFSaidas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with TDBGrid(Sender) do
    if odd(DataSource.DataSet.RecNo) then begin
      Canvas.Brush.Color := Dados.vgCorGrid;
      Canvas.FillRect(Rect);
      DefaultDrawDataCell(Rect,Column.Field,State);
      if gdFocused in state then begin
        Canvas.Brush.Color := Dados.vgCorFoco;
        Canvas.FillRect(Rect);
        DefaultDrawDataCell(Rect,Column.Field,State);
      end;
    end;
end;

end.
