unit UEtiquetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLXLSFilter, RLFilters, RLPDFFilter, DB,
  MDOCustomDataSet, MDOQuery, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  DBClient, Grids, DBGrids;

type
  TFEtiquetas = class(TForm)
    RL20Etiq: TRLReport;
    QryEtiquetas: TMDOQuery;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText2: TRLDBText;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    DSCDS: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    CBEtiq: TCheckBox;
    CBQdo: TCheckBox;
    EdQdo: TEdit;
    RLLabel1: TRLLabel;
    Label1: TLabel;
    Edit3: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    CBAlunos: TCheckBox;
    CBPais: TCheckBox;
    CBMaes: TCheckBox;
    CBResp: TCheckBox;
    CBFunc: TCheckBox;
    CBForn: TCheckBox;
    Button2: TButton;
    EdBairro: TEdit;
    Label3: TLabel;
    DBLCBBairro: TDBLookupComboBox;
    Label4: TLabel;
    EdCity: TEdit;
    DBLCBCity: TDBLookupComboBox;
    QryEtiquetasTIPO: TIntegerField;
    QryEtiquetasNOME: TMDOStringField;
    QryEtiquetasENDERECO: TMDOStringField;
    QryEtiquetasCITY: TMDOStringField;
    QryEtiquetasCEP: TMDOStringField;
    QryEtiquetasCad: TStringField;
    QryEtiquetasBAIRRO: TMDOStringField;
    CDSEtiq: TClientDataSet;
    CDSEtiqNOME: TStringField;
    CDSEtiqENDERECO: TStringField;
    CDSEtiqBAIRRO: TStringField;
    CDSEtiqCITY: TStringField;
    CDSEtiqCEP: TStringField;
    CDSEtiqCAD: TStringField;
    CDSEtiqMARC: TStringField;
    CDSEtiqCIDBAI: TStringField;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdQdoExit(Sender: TObject);
    procedure CBQdoClick(Sender: TObject);
    procedure RLDetailGrid1BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure Edit3Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdBairroChange(Sender: TObject);
    procedure EdCityChange(Sender: TObject);
    procedure DBLCBBairroEnter(Sender: TObject);
    procedure DBLCBCityEnter(Sender: TObject);
    procedure QryEtiquetasCalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure DSCDSDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure ContaReg(plTipo:String);
  public
    { Public declarations }
  end;

var
  FEtiquetas: TFEtiquetas;

implementation

uses UDados;

{$R *.dfm}

procedure TFEtiquetas.ContaReg(plTipo: String);
var
  vlReg: String;  
begin
{ if plTipo = 'CLI' then begin
    vlReg := CDSCliNOMECADASTRO.Value;
    CDSCli.DisableControls;
    CDSCli.Filter := 'MARC = ''X''';
    CDSCli.Filtered := True;
    Label2.Caption := IntToStr(CDSCli.RecordCount) +' selecionados';
    CDSCli.Filtered := False;
    CDSCli.Locate('NOMECADASTRO', vlReg, [loPartialKey, loCaseInsensitive]);
    CDSCli.EnableControls;
  end else begin
    vlReg := CDSFornNOMECADASTRO.Value;
    CDSForn.DisableControls;
    CDSForn.Filter := 'MARC = ''X''';
    CDSForn.Filtered := True;
    Label2.Caption := IntToStr(CDSForn.RecordCount) +' selecionados';
    CDSForn.Filtered := False;
    CDSForn.Locate('NOMECADASTRO', vlReg, [loPartialKey, loCaseInsensitive]);
    CDSForn.EnableControls;
  end;  }
end;

procedure TFEtiquetas.DBGrid1DblClick(Sender: TObject);
begin
  CDSEtiq.edit;
  if CDSEtiqMARC.Value = '' then
    CDSEtiqMARC.Value := 'X'
  else
    CDSEtiqMARC.Value := '';
  CDSEtiq.Post;
end;

procedure TFEtiquetas.BitBtn3Click(Sender: TObject);
var
  vlNumRec, i, vlQtde: Integer;
begin
  CDSEtiq.Filter := 'MARC = ''X''';
  CDSEtiq.Filtered := True;

  if QryEtiquetas.IsEmpty then begin
    MessageDlg('Consulta sem registros!', mtWarning, [mbOk], 0);
    Exit;
  end;

  CDSEtiq.DisableControls;
  vlQtde := CDSEtiq.RecordCount;
  if EdQdo.Text <> '' then
    vlNumRec := StrToInt(EdQdo.Text)
  else
    vlNumRec := 0;
  if (CBQdo.Checked) and (EdQdo.Text <> '') then begin
    CDSEtiq.First;
    for i := 1 to vlNumRec do begin
      CDSEtiq.Insert;
      CDSEtiqMARC.Value := 'X';
      CDSEtiq.Post;
    end;
    CDSEtiq.First;
  end;
  if CBEtiq.Checked then begin
    Dados.ConfTrans(True);
    Dados.QryCidadesLK.Open;
    Dados.QryBairrosLK.open;
    Dados.QryEstadosLK.Open;
    Dados.QryCidadesLK.Locate('CODCIDADE', Dados.TbConfigCODCIDADE.Value, []);
    Dados.QryBairrosLK.Locate('CODBAIRRO', Dados.TbConfigCODBAIRRO.Value, []);
    Dados.QryEstadosLK.Locate('CODESTADO', Dados.QryCidadesLK.FieldByName('CODESTADO').AsInteger , []);
    for i:= 1 to vlQtde do begin
      CDSEtiq.Append;
      CDSEtiqMARC.Value := 'X';
      CDSEtiqNOME.Value := Dados.TbConfigEMPRESA.Value;
      CDSEtiqENDERECO.Value := Dados.TbConfigENDERECO.Value;
      if not Dados.QryCidadesLK.FieldByName('DESCRICAO').IsNull then
        CDSEtiqCIDBAI.Value := Dados.QryBairrosLK.FieldByName('DESCRICAO').AsString +' - '+
          Dados.QryCidadesLK.FieldByName('DESCRICAO').AsString +'/'+ Dados.QryEstadosLK.FieldByName('UF').AsString
      else
        CDSEtiqCIDBAI.Value := Dados.QryCidadesLK.FieldByName('DESCRICAO').AsString +'/'+
          Dados.QryEstadosLK.FieldByName('UF').AsString;
      CDSEtiqCEP.Value := Dados.TbConfigCEP.Value;
      CDSEtiq.Post;
    end;
  end;
  Dados.ConfTrans(True);  
  RL20Etiq.Preview;
  CDSEtiq.EnableControls;
  Close;
end;

procedure TFEtiquetas.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFEtiquetas.EdQdoExit(Sender: TObject);
begin
  if (EdQdo.Text = '') and (CBQdo.Checked) then begin
    MessageDlg('Especifique o começo da impressão!', mtWarning, [mbOk], 0);
    EdQdo.SetFocus;
  end else if (StrToInt(EdQdo.Text) > 20) or (StrToInt(EdQdo.Text) < 1) then begin
    MessageDlg('Especifique o começo da impressão entre 1 e 20!', mtWarning, [mbOk], 0);
    EdQdo.Clear;
    EdQdo.SetFocus;
  end else
  begin
    try
      StrToInt(EdQdo.Text);
    except
      MessageDlg('Digite somente números!', mtWarning, [mbOk], 0);
      EdQdo.Clear;
      EdQdo.SetFocus;
    end;
  end;
end;

procedure TFEtiquetas.CBQdoClick(Sender: TObject);
begin
  EdQdo.SetFocus;
end;

procedure TFEtiquetas.RLDetailGrid1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  CEPGERAL: String;
  CEP1, CEP2, CEP3, CEP4, CEP5, CEP6, CEP7, CEP8 : Integer;
begin
  RLLabel1.Caption := CDSEtiqCEP.Value;
end;

procedure TFEtiquetas.Edit3Change(Sender: TObject);
begin
  CDSEtiq.Locate('NOME', Edit3.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TFEtiquetas.SpeedButton1Click(Sender: TObject);
begin
  CDSEtiq.DisableControls;
  CDSEtiq.First;
  while not CDSEtiq.Eof do begin
    if sender = SpeedButton1 then begin
      if CDSEtiqMARC.Value = 'X' then begin
        CDSEtiq.Edit;
        CDSEtiqMARC.Value := '';
        CDSEtiq.Post;
      end
    end else begin
      if CDSEtiqMARC.Value = '' then begin
        CDSEtiq.Edit;
        CDSEtiqMARC.Value := 'X';
        CDSEtiq.Post;
      end;
    end;
    CDSEtiq.Next;
  end;
  CDSEtiq.First;
  CDSEtiq.EnableControls;
end;

procedure TFEtiquetas.Button2Click(Sender: TObject);
begin
  if (not CBAlunos.Checked) and (not CBPais.Checked) and (not CBMaes.Checked) and (not CBResp.Checked) and
   (not CBForn.Checked) and (not CBFunc.Checked) then begin
    MessageDlg('Especifique um tipo para prosseguir!', mtWarning, [mbOk], 0);
    CBAlunos.Checked;
    Exit;
  end;
  QryEtiquetas.Close;
  QryEtiquetas.SQL.Clear;
  if CBAlunos.Checked then begin
    QryEtiquetas.SQL.Text := '/* ALUNOS */ '+
      'SELECT 1 AS TIPO, CAST(A.NOME AS VARCHAR(100)) AS NOME, A.ENDERECO AS ENDERECO, B.DESCRICAO AS BAIRRO, '+
      'C.DESCRICAO||''/''|| E.UF AS CITY, C.CEP FROM ALUNOS A '+
      'LEFT JOIN BAIRROS B ON A.CODBAIRRO = B.CODBAIRRO '+
      'INNER JOIN CIDADES C ON C.CODCIDADE = A.CODCIDADE '+
      'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO '+
      'WHERE A.NOME IS NOT NULL AND A.ENDERECO IS NOT NULL ';
    if DBLCBBairro.Text <> '' then
      QryEtiquetas.SQL.Add('AND B.CODBAIRRO = '+ IntToStr(DBLCBBairro.KeyValue));
    if DBLCBCity.Text <> '' then
      QryEtiquetas.SQL.Add('AND C.CODCIDADE = '+ IntToStr(DBLCBCity.KeyValue));
  end;

  if CBPais.Checked then begin
    if QryEtiquetas.SQL.Text <> '' then
      QryEtiquetas.SQL.Add('UNION');
    QryEtiquetas.SQL.Add('/* PAIS */ '+
    'SELECT 2  AS TIPO, CAST(A.NOMEPAI AS VARCHAR(100)) AS NOME, A.ENDERECOPAI AS ENDERECO, B.DESCRICAO AS BAIRRO, '+
    'C.DESCRICAO||''/''|| E.UF as CITY, C.CEP FROM ALUNOS A '+
    'LEFT JOIN BAIRROS B ON B.CODBAIRRO = A.CODBAIRROPAI '+
    'INNER JOIN CIDADES C ON C.CODCIDADE = A.CODCIDADE '+
    'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO '+
    'WHERE A.NOMEPAI IS NOT NULL AND A.ENDERECOPAI IS NOT NULL ');
    if DBLCBBairro.Text <> '' then
      QryEtiquetas.SQL.Add('AND B.CODBAIRRO = '+ IntToStr(DBLCBBairro.KeyValue));
    if DBLCBCity.Text <> '' then
      QryEtiquetas.SQL.Add('AND C.CODCIDADE = '+ IntToStr(DBLCBCity.KeyValue));
  end;

  if CBMaes.Checked then begin
    if QryEtiquetas.SQL.Text <> '' then
      QryEtiquetas.SQL.Add('UNION');
    QryEtiquetas.SQL.Add('/* MÃES */ '+
      'SELECT 3 AS TIPO, CAST(A.NOMEMAE AS VARCHAR(100)) AS NOME, A.ENDERECOMAE AS ENDERECO,  B.DESCRICAO  AS BAIRRO, '+
      ' C.DESCRICAO||''/''|| E.UF  as CITY, C.CEP FROM ALUNOS A  '+
      'LEFT JOIN BAIRROS B ON B.CODBAIRRO = A.CODBAIRROMAE  '+
      'INNER JOIN CIDADES C ON C.CODCIDADE = A.CODCIDADE  '+
      'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO  '+
      'WHERE A.NOMEMAE IS NOT NULL AND A.ENDERECOMAE IS NOT NULL  ');
    if DBLCBBairro.Text <> '' then
      QryEtiquetas.SQL.Add('AND B.CODBAIRRO = '+ IntToStr(DBLCBBairro.KeyValue));
    if DBLCBCity.Text <> '' then
      QryEtiquetas.SQL.Add('AND C.CODCIDADE = '+ IntToStr(DBLCBCity.KeyValue));
  end;

  if CBResp.Checked then begin
    if QryEtiquetas.SQL.Text <> '' then
      QryEtiquetas.SQL.Add('UNION');
    QryEtiquetas.SQL.Add('/* RESPONSÁVEIS */  '+
      'SELECT 4 AS TIPO, CAST(A.NOMERESP AS VARCHAR(100)) AS NOME, A.ENDERECORESP AS ENDERECO, B.DESCRICAO  AS BAIRRO, '+
      'C.DESCRICAO||''/''|| E.UF  as CITY , C.CEP FROM ALUNOS A '+
      'LEFT JOIN BAIRROS B ON B.CODBAIRRO = A.CODBAIRRORESP '+
      'INNER JOIN CIDADES C ON C.CODCIDADE = A.CODCIDADE '+
      'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO '+
      'WHERE A.NOMERESP IS NOT NULL AND A.ENDERECORESP IS NOT NULL ');
    if DBLCBBairro.Text <> '' then
      QryEtiquetas.SQL.Add('AND B.CODBAIRRO = '+ IntToStr(DBLCBBairro.KeyValue));
    if DBLCBCity.Text <> '' then
      QryEtiquetas.SQL.Add('AND C.CODCIDADE = '+ IntToStr(DBLCBCity.KeyValue));
  end;

  if CBForn.Checked then  begin
    if QryEtiquetas.SQL.Text <> '' then
      QryEtiquetas.SQL.Add('UNION');
    QryEtiquetas.SQL.Add('/* FORNECEDORES */ '+
      'SELECT 5 AS TIPO, CAST(F.NOME AS VARCHAR(100)) AS NOME, CAST(F.ENDERECO AS VARCHAR(100)) AS ENDERECO, B.DESCRICAO  AS BAIRRO, '+
      'C.DESCRICAO||''/''|| E.UF  as CITY, F.CEP FROM GEN F '+
      'LEFT JOIN BAIRROS B ON B.CODBAIRRO = F.CODBAIRRO  '+
      'INNER JOIN CIDADES C ON C.CODCIDADE = F.CODCIDADE  '+
      'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO  '+
      'WHERE F.NOME IS NOT NULL AND F.ENDERECO IS NOT NULL AND TIPOFORN = 1');
    if DBLCBBairro.Text <> '' then
      QryEtiquetas.SQL.Add('AND B.CODBAIRRO = '+ IntToStr(DBLCBBairro.KeyValue));
    if DBLCBCity.Text <> '' then
      QryEtiquetas.SQL.Add('AND C.CODCIDADE = '+ IntToStr(DBLCBCity.KeyValue));
  end;

  if CBFunc.Checked then begin
    if QryEtiquetas.SQL.Text <> '' then
      QryEtiquetas.SQL.Add('UNION');
    QryEtiquetas.SQL.Add('/* FUNCIONÁRIOS  */ '+
      'SELECT 6 AS TIPO, CAST(F.NOME AS VARCHAR(100)) AS NOME, F.ENDERECO AS ENDERECO,  B.DESCRICAO AS BAIRRO, '+
      'C.DESCRICAO||''/''|| E.UF  as CITY, F.CEP FROM FUNC F '+
      'LEFT JOIN BAIRROS B ON B.CODBAIRRO = F.CODBAIRRO '+
      'INNER JOIN CIDADES C ON C.CODCIDADE = F.CODCIDADE '+
      'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO '+
      'WHERE F.NOME IS NOT NULL AND F.ENDERECO IS NOT NULL ');
    if DBLCBBairro.Text <> '' then
      QryEtiquetas.SQL.Add('AND B.CODBAIRRO = '+ IntToStr(DBLCBBairro.KeyValue));
    if DBLCBCity.Text <> '' then
      QryEtiquetas.SQL.Add('AND C.CODCIDADE = '+ IntToStr(DBLCBCity.KeyValue));
  end;
  QryEtiquetas.Open;

  if QryEtiquetas.IsEmpty then begin
    MessageDlg('Consulta sem registros!', mtWarning, [mbOk], 0);
    Exit;
  end;
  
  CDSEtiq.EmptyDataSet;
  CDSEtiq.DisableConstraints;
  QryEtiquetas.First;
  while not QryEtiquetas.Eof do begin
    CDSEtiq.Append;
    CDSEtiqCad.Value := QryEtiquetasCad.Value;
    CDSEtiqNOME.Value := QryEtiquetasNOME.Value;
    CDSEtiqENDERECO.Value := QryEtiquetasENDERECO.Value;
    if not QryEtiquetasBAIRRO.IsNull then
      CDSEtiqCIDBAI.Value := QryEtiquetasBAIRRO.Value +' - '+ QryEtiquetasCITY.Value
    else
      CDSEtiqCIDBAI.Value := QryEtiquetasCITY.Value;

    //CDSEtiqCITY.Value := QryEtiquetasCITY.Value;
    //CDSEtiqBAIRRO.Value := QryEtiquetasBAIRRO.Value;
    CDSEtiqCEP.Value := QryEtiquetasCEP.Value;
    CDSEtiqMARC.Value := 'X';
    CDSEtiq.Post;
    QryEtiquetas.Next;
  end;
  CDSEtiq.First;
  CDSEtiq.EnableControls;
  GroupBox2.Visible := True;
  GroupBox1.Visible := False;
  ClientHeight := 272;
end;

procedure TFEtiquetas.FormCreate(Sender: TObject);
begin
  ClientWidth := 475;
  ClientHeight := 136;
  GroupBox2.Top := 0;
  GroupBox1.Top := 0;
  GroupBox2.Visible := False;
  Dados.ConfTrans(true);
  Dados.QryBairrosLK.Open;
  Dados.QryCidadesLK.Open;
  CDSEtiq.CreateDataSet;
end;

procedure TFEtiquetas.EdBairroChange(Sender: TObject);
begin
  try
    DBLCBBairro.KeyValue := StrToInt(EdBairro.Text);
  except
  end;
end;

procedure TFEtiquetas.EdCityChange(Sender: TObject);
begin
  try
    DBLCBCity.KeyValue := StrToInt(EdCity.Text);
  except
  end;
end;

procedure TFEtiquetas.DBLCBBairroEnter(Sender: TObject);
begin
  try
    EdBairro.Text := IntToStr(DBLCBBairro.KeyValue);
  except
    EdBairro.Clear;
  end;
end;

procedure TFEtiquetas.DBLCBCityEnter(Sender: TObject);
begin
  try
    EdCity.Text := IntToStr(DBLCBBairro.KeyValue);
  except
    EdCity.Clear;
  end;
end;

procedure TFEtiquetas.QryEtiquetasCalcFields(DataSet: TDataSet);
begin
  case QryEtiquetasTIPO.Value  of
    1: QryEtiquetasCad.Value := 'Alunos';
    2: QryEtiquetasCad.Value := 'Pais';
    3: QryEtiquetasCad.Value := 'Mães';
    4: QryEtiquetasCad.Value := 'Responsáveis';
    5: QryEtiquetasCad.Value := 'Fornecedores';
    6: QryEtiquetasCad.Value := 'Funcionários';
  end;  
end;

procedure TFEtiquetas.BitBtn1Click(Sender: TObject);
begin
  ClientWidth := 475;
  ClientHeight := 136;
  GroupBox2.Visible := False;
  GroupBox1.Visible := True;
end;

procedure TFEtiquetas.DSCDSDataChange(Sender: TObject; Field: TField);
begin
// idem
  Label2.Caption := IntToStr(CDSEtiq.RecordCount) + ' registros encontrados';
end;

procedure TFEtiquetas.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFEtiquetas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

end.





