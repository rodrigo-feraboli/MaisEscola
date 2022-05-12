unit UGen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFGen = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSGen: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbGen: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    TbGenNOME: TMDOStringField;
    TbGenFANTASIA: TMDOStringField;
    TbGenDTCAD: TDateField;
    TbGenDTFUND: TDateField;
    TbGenENDERECO: TMDOStringField;
    TbGenCODBAIRRO: TSmallintField;
    TbGenCODCIDADE: TSmallintField;
    TbGenCEP: TMDOStringField;
    TbGenCAIXAPOSTAL: TSmallintField;
    TbGenCONTATO1: TMDOStringField;
    TbGenCONTATO2: TMDOStringField;
    TbGenFONE1: TMDOStringField;
    TbGenFONE2: TMDOStringField;
    TbGenFAX: TMDOStringField;
    TbGenCELULAR: TMDOStringField;
    TbGenEMAIL: TMDOStringField;
    TbGenSITE: TMDOStringField;
    TbGenCNPJ: TMDOStringField;
    TbGenIE: TMDOStringField;
    TbGenOBS: TMemoField;
    QryProx: TMDOQuery;
    Label1: TLabel;
    LblQtde: TLabel;
    RBCodigo: TRadioButton;
    RBDescricao: TRadioButton;
    EdBusca: TEdit;
    SBFirst: TSpeedButton;
    SBLast: TSpeedButton;
    SBNext: TSpeedButton;
    SBPrior: TSpeedButton;
    SBRefresh: TSpeedButton;
    TbGenTIPO: TMDOStringField;
    TbGenCODGEN: TSmallintField;
    TbGenTIPOFORN: TMDOStringField;
    TbGenTIPOTRAN: TMDOStringField;
    Relatrios1: TMenuItem;
    Sinttico1: TMenuItem;
    N1: TMenuItem;
    Ficha: TMenuItem;
    procedure SBNovoClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure RBCodigoClick(Sender: TObject);
    procedure EdBuscaChange(Sender: TObject);
    procedure SBBuscaClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SBSairClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SBFirstClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSGenDataChange(Sender: TObject; Field: TField);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure Sinttico1Click(Sender: TObject);
    procedure FichaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FGen: TFGen;

const
  SQL = 'SELECT * FROM GEN WHERE CODGEN IS NOT NULL';

implementation

uses UEdGen, UDados, URelatoriosSint, UFichaFT;

{$R *.dfm}

procedure TFGen.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFGen.SBNovoClick(Sender: TObject);
begin
  if (Caption = 'Cadastro de Fornecedores') and  (not VerificarPermissao('FORNECEDORES', 'EDI', 1)) then
    Exit
  else if (Caption = 'Cadastro de Transportadoras') and  (not VerificarPermissao('TRANSPORTADORAS', 'EDI', 1))  then 
    Exit;
  try
    ConfTrans(True);
    TbGen.Append;
    TbGenTIPO.Value := 'J';
    QryProx.SQL.Text := 'SELECT MAX(CODGEN) FROM GEN';
    QryProx.Open;
    TbGenCODGEN.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    TbGenDTCAD.Value := Date;
    Application.CreateForm(TFEdGen, FEdGen);
    if Caption = 'Cadastro de Fornecedores' then begin
      FEdGen.Caption := 'Edição de Fornecedores';
      TbGenTIPOFORN.Value := 'T';
      TbGenTIPOTRAN.Value := 'F';
      FEdgen.CBForn.ReadOnly;
    end else if Caption = 'Cadastro de Transportadoras' then begin
      FEdGen.Caption := 'Edição de Transportadoras';
      TbGenTIPOTRAN.Value := 'T';
      TbGenTIPOFORN.Value := 'F';
      FEdgen.CBTrans.ReadOnly;
    end;


    FEdGen.ShowModal;
  finally
    FreeAndNil(FEdGen);
  end;
end;

procedure TFGen.SBAlterarClick(Sender: TObject);
begin
  if (Caption = 'Cadastro de Fornecedores') and  (not VerificarPermissao('FORNECEDORES', 'EDI', 1)) then
    Exit
  else if (Caption = 'Cadastro de Transportadoras') and  (not VerificarPermissao('TRANSPORTADORAS', 'EDI', 1))  then
    Exit;
  try
    TbGen.Edit;
    Application.CreateForm(TFEdGen, FEdGen);
    if Caption = 'Edição de Fornecedores' then
      FEdGen.CBForn.ReadOnly
    else if Caption = 'Edição de Transportadoras' then
      FEdGen.CBTrans.ReadOnly;
    FEdGen.ShowModal;
  finally
    FreeAndNil(FEdGen);
  end;
end;

procedure TFGen.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbGen.Close;
       TbGen.SelectSQL.Text := SQL;
  if caption = 'Cadastro de Fornecedores' then
    TbGen.SelectSQL.Add(' AND TIPOFORN = ''T'' ')
  else
    TbGen.SelectSQL.Add(' AND TIPOTRAN = ''T'' ');
  TbGen.SelectSQL.Add(' ORDER BY ');
  if sender = RBCodigo then
    TbGen.SelectSQL.Add('CODGEN')
  else
    TbGen.SelectSQL.Add('NOME');
  TbGen.Open;
end;

procedure TFGen.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbGen.Locate('CODGEN', StrToInt(EdBusca.Text), [])
    else
      TbGen.Locate('DESCRICAO', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFGen.SBBuscaClick(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    TbGen.Close;
    TbGen.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbGen.SelectSQL.Add(' DESCRICAO CONTAINING '''+ EdBusca.Text +'''')
    else
      TbGen.SelectSQL.Add(' CODGEN CONTAINING '''+ EdBusca.Text +'''');
    TbGen.Open;
    if TbGen.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbGen.Close;
      TbGen.SelectSQL.Text := SQL;
      TbGen.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Tag := TbGenCODGEN.Value;
  PnlBusca.Visible := True;

end;

procedure TFGen.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag := TbGenCODGEN.Value;
  TbGen.Close;
  TbGen.SelectSQL.Text := SQL;
  TbGen.Open;
  TbGen.Locate('CODGEN', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  Arquivo1.Enabled := Panel1.Enabled;
  Relatrios1.Enabled := Panel1.Enabled;  
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFGen.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFGen.SBExcluirClick(Sender: TObject);
begin
  if (Caption = 'Cadastro de Fornecedores') and  (not VerificarPermissao('FORNECEDORES', 'EXC', 1)) then
    Exit
  else if (Caption = 'Cadastro de Transportadoras') and  (not VerificarPermissao('TRANSPORTADORAS', 'EXC', 1))  then 
    Exit;
  if (not TbGen.IsEmpty) and
    (MessageDlg(cgMsgDelForn, mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbGen.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFGen.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFGen.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFGen.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1 then
    AbreAjuda
  else if not PnlBusca.Visible then begin
    if (Key = 78 {n}) and (Shift = [ssCtrl]) then
      SBNovoClick(nil)
    else if (Key = 65 {a}) and (Shift = [ssCtrl]) then
      SBAlterarClick(nil)
    else if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
      SBExcluirClick(nil)
    else if (Key = Vk_F3) then
      SBBuscaClick(nil);
  end;
end;

procedure TFGen.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbGen.Bof) then
    TbGen.First
  else if (sender = SBLast) and (not TbGen.Bof) then
    TbGen.Prior
  else if (sender = SBNext) and (not TbGen.Eof) then
    TbGen.Next
  else if (sender = SBPrior) and (not TbGen.Eof) then
    TbGen.Last
  else
    TbGen.Refresh;
end;

procedure TFGen.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);

  Dados.ILSistema.GetBitmap(0, SBFirst.Glyph);
  Dados.ILSistema.GetBitmap(1, SBLast.Glyph);
  Dados.ILSistema.GetBitmap(2, SBNext.Glyph);
  Dados.ILSistema.GetBitmap(3, SBPrior.Glyph);
  Dados.ILSistema.GetBitmap(4, SBRefresh.Glyph);
  Dados.ILSistema.GetBitmap(5, SBBusca.Glyph);
  
  Trans.StartTransaction;
 
end;

procedure TFGen.DSGenDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODGEN) FROM GEN';
  if caption = 'Cadastro de Fornecedores' then
    QryProx.SQL.add(' WHERE TIPOFORN = ''T'' ')
  else
    QryProx.SQL.add(' WHERE TIPOTRAN = ''T'' ');
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;  
end;

procedure TFGen.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFGen.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFGen.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

procedure TFGen.FormShow(Sender: TObject);
begin
  RBCodigo.Checked;
  RBCodigoClick(RBCodigo);
  if Caption = 'Cadastro de Fornecedores' then
    Ficha.Caption := 'Ficha do Fornecedor'
  else
    Ficha.Caption := 'Ficha da Transportadora';
end;

procedure TFGen.Sinttico1Click(Sender: TObject);
begin
  if (Caption = 'Cadastro de Fornecedores') and  (not VerificarPermissao('FORNECEDORES', 'REL', 1)) then
    Exit
  else if (Caption = 'Cadastro de Transportadoras') and  (not VerificarPermissao('TRANSPORTADORAS', 'REL', 1))  then
    Exit;
  try
    Application.CreateForm(TFRelatoriosSint, FRelatoriosSint);
    if Caption = 'Cadastro de Fornecedores' then
      FRelatoriosSint.Caption := 'Relatório Sintético de Fornecedores'
    else
      FRelatoriosSint.Caption := 'Relatório Sintético de Transportadoras';
    FRelatoriosSint.ShowModal;
  finally
    FreeAndNil(FRelatoriosSint);
  end;
end;

procedure TFGen.FichaClick(Sender: TObject);
begin
  if (Caption = 'Cadastro de Fornecedores') and  (not VerificarPermissao('FORNECEDORES', 'REL', 1)) then
    Exit
  else if (Caption = 'Cadastro de Transportadoras') and  (not VerificarPermissao('TRANSPORTADORAS', 'REL', 1))  then
    Exit;
  try
    Application.CreateForm(TFFichaFT, FFichaFT);
    if Caption = 'Cadastro de Fornecedores' then
      FFichaFT.Caption := 'Emissão da Ficha do Fornecedor'
    else
      FFichaFT.Caption := 'Emissão da Ficha da Transportadora';
    FFichaFT.ShowModal;
  finally
    FreeAndNil(FFichaFT);
  end;
end;

end.
