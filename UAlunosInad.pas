unit UAlunosInad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, ToolWin, ImgList, RLReport,
  MDOQuery;

type
  TFAlunosInad = class(TForm)
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    QryMestre: TMDOQuery;
    DSMestre: TDataSource;
    DSDetalhe: TDataSource;
    QryDetalhe: TMDOQuery;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    QryMestreCODALUNO: TSmallintField;
    QryMestreNOME: TMDOStringField;
    QryMestreNOMEPAI: TMDOStringField;
    QryMestreNOMEMAE: TMDOStringField;
    QryMestreFONE: TMDOStringField;
    LblMestre: TLabel;
    LblDetalhe: TLabel;
    QryDetalheDTVCTO: TDateField;
    QryDetalheVALOR: TMDOBCDField;
    QryDetalheDIAS: TIntegerField;
    QryDetalheTotal: TCurrencyField;
    QryDetalheJUROS: TMDOBCDField;
    procedure SBSairClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DSMestreDataChange(Sender: TObject; Field: TField);
    procedure DSDetalheDataChange(Sender: TObject; Field: TField);
    procedure QryDetalheCalcFields(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAlunosInad: TFAlunosInad;

implementation

uses UDados, UAlunos;

{$R *.dfm}

procedure TFAlunosInad.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFAlunosInad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFAlunosInad.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.ConfTrans(True);
  Dados.AbreConfig;  
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  QryMestre.ParamByName('plData').AsDate := Date;
  if Dados.TbConfigOPT.Value = 'V' then
    QryDetalhe.SQL.Text := 'SELECT DTVCTO, VALOR, CURRENT_DATE - DTVCTO AS DIAS, CAST((SELECT OPTVALOR FROM CONFIG) '+
      '* ((CURRENT_DATE - DTVCTO)) AS DECIMAL (15,2)) AS JUROS  FROM ALUNOSCARNE AC WHERE CODALUNO = :CODALUNO AND '+
      'DTVCTO <:PLDATA'
  else
    QryDetalhe.SQL.Text := 'SELECT DTVCTO, VALOR, CURRENT_DATE - DTVCTO AS DIAS, CAST(VALOR * (SELECT OPTPERC FROM CONFIG) '+
      '* ((CURRENT_DATE - DTVCTO)) AS DECIMAL (15,2)) AS JUROS  FROM ALUNOSCARNE AC WHERE CODALUNO = :CODALUNO AND '+
      'DTVCTO <:PLDATA';
  QryDetalhe.ParamByName('plData').AsDate := Date;
  QryMestre.Open;
  QryDetalhe.Open;
end;

procedure TFAlunosInad.DSMestreDataChange(Sender: TObject; Field: TField);
begin
  LblMestre.Caption := IntToStr(QryMestre.RecordCount) + ' aluno(s) encontrado(s)';
end;

procedure TFAlunosInad.DSDetalheDataChange(Sender: TObject; Field: TField);
begin
  LblDetalhe.Caption := IntToStr(QryDetalhe.RecordCount) + ' carnê(s) atrasado(s)';
end;

procedure TFAlunosInad.QryDetalheCalcFields(DataSet: TDataSet);
begin
  QryDetalheTotal.Value := QryDetalheVALOR.Value + QryDetalheJUROS.Value;
end;

procedure TFAlunosInad.DBGrid1DrawColumnCell(Sender: TObject;
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
