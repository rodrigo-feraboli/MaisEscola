unit UEdTurmasCalRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB, DBClient, RLReport;

type
  TFEdTurmasCalRef = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    DTPIni: TDateTimePicker;
    StatusBar1: TStatusBar;
    SBGravar: TSpeedButton;
    Label6: TLabel;
    DBLCBTurma: TDBLookupComboBox;
    CDSCardapio: TClientDataSet;
    CDSCardapioDomingoStr: TStringField;
    CDSCardapioSegundaStr: TStringField;
    CDSCardapioTercaStr: TStringField;
    CDSCardapioQuartaStr: TStringField;
    CDSCardapioQuintaStr: TStringField;
    CDSCardapioSextaStr: TStringField;
    CDSCardapioSabadoStr: TStringField;
    DSCardapio: TDataSource;
    DBGrid1: TDBGrid;
    SpeedButton1: TSpeedButton;
    RLPCalend: TRLReport;
    RLBand6: TRLBand;
    RLLabel9: TRLLabel;
    RLLabel13: TRLLabel;
    RLBand3: TRLBand;
    RLLabel19: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel20: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDQuadrado: TRLDraw;
    RLD1: TRLDraw;
    RLD2: TRLDraw;
    RLD3: TRLDraw;
    RLD4: TRLDraw;
    RLD5: TRLDraw;
    RLD6: TRLDraw;
    RLDBAIXO: TRLDraw;
    procedure SBGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RLBand6BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLDetailGrid1BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLDetailGrid1AfterPrint(Sender: TObject);
  private
    { Private declarations }
    vpMax: Smallint;
  public
    { Public declarations }
  end;

var
  FEdTurmasCalRef: TFEdTurmasCalRef;

implementation

uses UTurmas, UDados, DateUtils;

{$R *.dfm}


procedure TFEdTurmasCalRef.SBGravarClick(Sender: TObject);
var
  i: Smallint;
  vpData: TDate;
  procedure LancaDomingo;
  begin
     FTurmas.QryProx.SQL.Text := 'SELECT TCI.HORA, R.DESCRICAO FROM TURMASCARDAPIOSITENS TCI INNER JOIN REFEICOES R ON '+
       ' TCI.CODREFEICAO = R.CODREFEICAO  WHERE DATA = '''+ FormatDateTime('dd.mm.yyyy', vpData) + ''' AND '+
       ' TCI.CODREFEICAO IS NOT NULL AND TCI.CODTURMA = '+ IntToStr(DBLCBTurma.KeyValue)+ ' ORDER BY 1';
     FTurmas.QryProx.Open;
     CDSCardapio.First;
     while not FTurmas.QryProx.Eof do begin
       CDSCardapio.Edit;
       CDSCardapioDomingoStr.Value := FormatDateTime('hh:mm', FTurmas.QryProx.Fields[0].AsDateTime) + ' - '+ FTurmas.QryProx.Fields[1].AsString;
       CDSCardapio.Post;
       CDSCardapio.Next;
       FTurmas.QryProx.Next;
     end;
     FTurmas.QryProx.Close;
     vpData := vpData + 1;
  end;

  procedure LancaSegunda;
  begin
     FTurmas.QryProx.SQL.Text := 'SELECT TCI.HORA, R.DESCRICAO FROM TURMASCARDAPIOSITENS TCI INNER JOIN REFEICOES R ON '+
       ' TCI.CODREFEICAO = R.CODREFEICAO  WHERE DATA = '''+ FormatDateTime('dd.mm.yyyy', vpData) + ''' AND '+
       ' TCI.CODREFEICAO IS NOT NULL AND TCI.CODTURMA = '+ IntToStr(DBLCBTurma.KeyValue)+ ' ORDER BY 1';
     FTurmas.QryProx.Open;
     CDSCardapio.First;
     while not FTurmas.QryProx.Eof do begin
       CDSCardapio.Edit;
       CDSCardapioSegundaStr.Value := FormatDateTime('hh:mm', FTurmas.QryProx.Fields[0].AsDateTime) + ' - '+ FTurmas.QryProx.Fields[1].AsString;
       CDSCardapio.Post;
       CDSCardapio.Next;
       FTurmas.QryProx.Next;
     end;
     FTurmas.QryProx.Close;
     vpData := vpData + 1;
  end;

  procedure LancaTerca;
  begin
     FTurmas.QryProx.SQL.Text := 'SELECT TCI.HORA, R.DESCRICAO FROM TURMASCARDAPIOSITENS TCI INNER JOIN REFEICOES R ON '+
       ' TCI.CODREFEICAO = R.CODREFEICAO  WHERE DATA = '''+ FormatDateTime('dd.mm.yyyy', vpData) + ''' AND '+
       ' TCI.CODREFEICAO IS NOT NULL AND TCI.CODTURMA = '+ IntToStr(DBLCBTurma.KeyValue)+ ' ORDER BY 1';
     FTurmas.QryProx.Open;
     CDSCardapio.First;
     while not FTurmas.QryProx.Eof do begin
       CDSCardapio.Edit;
       CDSCardapioTercaStr.Value := FormatDateTime('hh:mm', FTurmas.QryProx.Fields[0].AsDateTime) + ' - '+ FTurmas.QryProx.Fields[1].AsString;
       CDSCardapio.Post;
       CDSCardapio.Next;
       FTurmas.QryProx.Next;
     end;
     FTurmas.QryProx.Close;
     vpData := vpData + 1;
  end;

  procedure LancaQuarta;
  begin
     FTurmas.QryProx.SQL.Text := 'SELECT TCI.HORA, R.DESCRICAO FROM TURMASCARDAPIOSITENS TCI INNER JOIN REFEICOES R ON '+
       ' TCI.CODREFEICAO = R.CODREFEICAO  WHERE DATA = '''+ FormatDateTime('dd.mm.yyyy', vpData) + ''' AND '+
       ' TCI.CODREFEICAO IS NOT NULL AND TCI.CODTURMA = '+ IntToStr(DBLCBTurma.KeyValue)+ ' ORDER BY 1';
     FTurmas.QryProx.Open;
     CDSCardapio.First;
     while not FTurmas.QryProx.Eof do begin
       CDSCardapio.Edit;
       CDSCardapioQuartaStr.Value := FormatDateTime('hh:mm', FTurmas.QryProx.Fields[0].AsDateTime) + ' - '+ FTurmas.QryProx.Fields[1].AsString;
       CDSCardapio.Post;
       CDSCardapio.Next;
       FTurmas.QryProx.Next;
     end;
     FTurmas.QryProx.Close;
     vpData := vpData + 1;
  end;

  procedure LancaQuinta;
  begin
     FTurmas.QryProx.SQL.Text := 'SELECT TCI.HORA, R.DESCRICAO FROM TURMASCARDAPIOSITENS TCI INNER JOIN REFEICOES R ON '+
       ' TCI.CODREFEICAO = R.CODREFEICAO  WHERE DATA = '''+ FormatDateTime('dd.mm.yyyy', vpData) + ''' AND '+
       ' TCI.CODREFEICAO IS NOT NULL AND TCI.CODTURMA = '+ IntToStr(DBLCBTurma.KeyValue)+ ' ORDER BY 1';
     FTurmas.QryProx.Open;
     CDSCardapio.First;
     while not FTurmas.QryProx.Eof do begin
       CDSCardapio.Edit;
       CDSCardapioQuintaStr.Value := FormatDateTime('hh:mm', FTurmas.QryProx.Fields[0].AsDateTime) + ' - '+ FTurmas.QryProx.Fields[1].AsString;
       CDSCardapio.Post;
       CDSCardapio.Next;
       FTurmas.QryProx.Next;
     end;
     FTurmas.QryProx.Close;
     vpData := vpData + 1;
  end;

  procedure LancaSexta;
  begin
     FTurmas.QryProx.SQL.Text := 'SELECT TCI.HORA, R.DESCRICAO FROM TURMASCARDAPIOSITENS TCI INNER JOIN REFEICOES R ON '+
       ' TCI.CODREFEICAO = R.CODREFEICAO  WHERE DATA = '''+ FormatDateTime('dd.mm.yyyy', vpData) + ''' AND '+
       ' TCI.CODREFEICAO IS NOT NULL AND TCI.CODTURMA = '+ IntToStr(DBLCBTurma.KeyValue)+ ' ORDER BY 1';
     FTurmas.QryProx.Open;
     CDSCardapio.First;
     while not FTurmas.QryProx.Eof do begin
       CDSCardapio.Edit;
       CDSCardapioSextaStr.Value := FormatDateTime('hh:mm', FTurmas.QryProx.Fields[0].AsDateTime) + ' - '+ FTurmas.QryProx.Fields[1].AsString;
       CDSCardapio.Post;
       CDSCardapio.Next;
       FTurmas.QryProx.Next;
     end;
     FTurmas.QryProx.Close;
     vpData := vpData + 1;
  end;

  procedure LancaSabado;
  begin
     FTurmas.QryProx.SQL.Text := 'SELECT TCI.HORA, R.DESCRICAO FROM TURMASCARDAPIOSITENS TCI INNER JOIN REFEICOES R ON '+
       ' TCI.CODREFEICAO = R.CODREFEICAO  WHERE DATA = '''+ FormatDateTime('dd.mm.yyyy', vpData) + ''' AND '+
       ' TCI.CODREFEICAO IS NOT NULL AND TCI.CODTURMA = '+ IntToStr(DBLCBTurma.KeyValue)+ ' ORDER BY 1';
     FTurmas.QryProx.Open;
     CDSCardapio.First;
     while not FTurmas.QryProx.Eof do begin
       CDSCardapio.Edit;
       CDSCardapioSabadoStr.Value := FormatDateTime('hh:mm', FTurmas.QryProx.Fields[0].AsDateTime) + ' - '+ FTurmas.QryProx.Fields[1].AsString;
       CDSCardapio.Post;
       CDSCardapio.Next;
       FTurmas.QryProx.Next;
     end;
     FTurmas.QryProx.Close;
  end;
begin
  CDSCardapio.EmptyDataSet;
  vpMax := 0;
  vpData := StartOfTheWeek(DTPIni.Date);
  for i:= 1 to 7 do begin
    FTurmas.QryProx.SQL.Text := 'select Count(NroItem) from turmascardapiositens where data = '''+
      FormatdateTime('dd.mm.yyyy', vpData)+''' AND CODREFEICAO IS NOT NULL AND CODTURMA = '+ IntToStr(DBLCBTurma.KeyValue);
    FTurmas.QryProx.open;
    if FTurmas.QryProx.Fields[0].AsInteger > vpMax then
      vpMax := FTurmas.QryProx.Fields[0].AsInteger;
    FTurmas.QryProx.Close;
    vpData := vpData + 1;
  end;

  for i:= 1 to vpMax do begin
    CDSCardapio.Append;
    CDSCardapio.Post;
  end;

  vpData := StartOfTheWeek(DTPIni.Date);
  vpData := vpData - 1;
  LancaDomingo;
  LancaSegunda;
  LancaTerca;
  LancaQuarta;
  LancaQuinta;
  LancaSexta;
  LancaSabado;
end;

procedure TFEdTurmasCalRef.FormCreate(Sender: TObject);
begin
  Dados.LKTurmas(True);
  CDSCardapio.CreateDataSet;
  CDSCardapio.Open;
end;

procedure TFEdTurmasCalRef.SpeedButton1Click(Sender: TObject);
begin
  SBGravarClick(nil);
  RLPCalend.Preview;  
end;

procedure TFEdTurmasCalRef.RLBand6BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabel9.Caption :=  'CARDÁPIO SEMANAL - TURMA '+ DBLCBTurma.Text;
end;

procedure TFEdTurmasCalRef.RLDetailGrid1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLDetailGrid1.Height := 17;
  RLDBAIXO.Color := clWhite;

  if vpMax = CDSCardapio.RecNo then
    RLDBAIXO.Color := ClBlack;
  RLDQuadrado.Top := 0;
  RLDQuadrado.Height := RLDetailGrid1.Height;
  RLDBAIXO.Top := RLDetailGrid1.Height;
  RLD1.Height := RLDetailGrid1.Height;
  RLD2.Height := RLDetailGrid1.Height;
  RLD3.Height := RLDetailGrid1.Height;
  RLD4.Height := RLDetailGrid1.Height;
  RLD5.Height := RLDetailGrid1.Height;
  RLD6.Height := RLDetailGrid1.Height;
end;

procedure TFEdTurmasCalRef.RLDetailGrid1AfterPrint(Sender: TObject);
begin
{  RLDetailGrid1.Height := 17;
  if vpMax = CDSCardapio.RecNo then
    RLDetailGrid1.Height := RLDetailGrid1.Height + 1;
  RLDBAIXO.Top := RLDetailGrid1.Height;
  RLD1.Height := RLDetailGrid1.Height;
  RLD2.Height := RLDetailGrid1.Height;
  RLD3.Height := RLDetailGrid1.Height;
  RLD4.Height := RLDetailGrid1.Height;
  RLD5.Height := RLDetailGrid1.Height;
  RLD6.Height := RLDetailGrid1.Height; }   
end;

end.
