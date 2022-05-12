unit UCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Menus, ExtCtrls, Grids, DBGrids,
  ComCtrls, DB, MDODatabase, MDOCustomDataSet, MDOQuery;

type
  TFCheques = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Panel1: TPanel;
    SBBusca: TSpeedButton;
    Label1: TLabel;
    RBCodigo: TRadioButton;
    RBDescricao: TRadioButton;
    EdBusca: TEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DSCheques: TDataSource;
    PnlBusca: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    DBGrid2: TDBGrid;
    TbCheques: TMDODataSet;
    Trans: TMDOTransaction;
    StatusBar1: TStatusBar;
    LblQtde: TLabel;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    QryProx: TMDOQuery;
    N1: TMenuItem;
    AlterarCidade1: TMenuItem;
    DSBancosLK: TDataSource;
    SBRefresh: TSpeedButton;
    SBPrior: TSpeedButton;
    SBNext: TSpeedButton;
    SBLast: TSpeedButton;
    SBFirst: TSpeedButton;
    Relatrios1: TMenuItem;
    Cheques1: TMenuItem;
    TbChequesCODIGO: TSmallintField;
    TbChequesCODBANCO: TSmallintField;
    TbChequesAGENCIA: TMDOStringField;
    TbChequesCONTA: TMDOStringField;
    TbChequesNUMERO: TMDOStringField;
    TbChequesBOMPARA: TDateField;
    TbChequesVALOR: TMDOBCDField;
    TbChequesOBS: TMemoField;
    TbChequesCODALUNO: TSmallintField;
    TbChequesEMITENTE: TMDOStringField;
    TbChequesPREDAT: TSmallintField;
    TbChequesBAIXADO: TSmallintField;
    TbChequesCANCELADO: TSmallintField;
    PopupMenu1: TPopupMenu;
    Cancelar1: TMenuItem;
    N2: TMenuItem;
    Baixar1: TMenuItem;
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
    procedure DSChequesDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Cheques1Click(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure Baixar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfTrans(Conf: Boolean);
    procedure AbrirLKs;
  end;

var
  FCheques: TFCheques;

const
  SQL = 'Select C.* from CHEQUES C WHERE C.CODIGO IS NOT NULL';

implementation

uses UEdCheques, UDados, URelatoriosCheques;

{$R *.dfm}

procedure TFCheques.AbrirLKs;
begin
  if not Dados.QryBancosLK.Active then
    Dados.QryBancosLK.Open;
end;

procedure TFCheques.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFCheques.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('CHEQUES', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbCheques.Append;
    QryProx.SQL.Text := 'SELECT MAX(CODIGO) FROM CHEQUES';
    QryProx.Open;
    TbChequesCODIGO.Value := QryProx.Fields[0].AsInteger + 1;
    TbChequesPREDAT.Value := 0;
    TbChequesBAIXADO.Value := 0;
    TbChequesCANCELADO.Value := 0;    
    QryProx.Close;
    Application.CreateForm(TFEdCheques, FEdCheques);
    FEdCheques.ShowModal;
  finally
    FreeAndNil(FEdCheques);
  end;
end;

procedure TFCheques.SBAlterarClick(Sender: TObject);
begin
  if (not VerificarPermissao('CHEQUES', 'EDI', 1)) or (TbCheques.IsEmpty) then
    Exit;
  try
    TbCheques.Edit;
    Application.CreateForm(TFEdCheques, FEdCheques);
    FEdCheques.ShowModal;
  finally
    FreeAndNil(FEdCheques);
  end;
end;

procedure TFCheques.RBCodigoClick(Sender: TObject);
begin
  EdBusca.Clear;
  TbCheques.Close;
  TbCheques.SelectSQL.Text := SQL +' ORDER BY ';
  if RBCodigo.Checked then
    TbCheques.SelectSQL.Add('C.CODIGO')
  else
    TbCheques.SelectSQL.Add('C.VALOR');
  TbCheques.Open;
end;

procedure TFCheques.EdBuscaChange(Sender: TObject);
begin
  if EdBusca.Text <> '' then begin
    if RBCodigo.Checked then
      TbCheques.Locate('CODIGO', StrToInt(EdBusca.Text), [])
    else
      TbCheques.Locate('VALOR', EdBusca.Text, [loPartialKey, loCaseInsensitive]);
  end;
end;

procedure TFCheques.SBBuscaClick(Sender: TObject);
begin
  StatusBar1.Tag := TbChequesCODIGO.Value;
  if (EdBusca.Text <> '') then begin
    TbCheques.Close;
    TbCheques.SelectSQL.Text := SQL +' AND ';
    if RBDescricao.Checked then
      TbCheques.SelectSQL.Add(' C.VALOR CONTAINING '''+ EdBusca.Text +'''')
    else
      TbCheques.SelectSQL.Add(' C.CODIGO CONTAINING '''+ EdBusca.Text +'''');
    TbCheques.Open;
    if TbCheques.IsEmpty then begin
      MessageDlg(cgMsgNotFound, mtWarning, [mbOK], 0);
      TbCheques.Close;
      TbCheques.SelectSQL.Text := SQL;
      TbCheques.Open;
      Exit;
    end;
  end;
  PnlBusca.Top := 106;
  PnlBusca.Left := 0;
  Panel1.Enabled := False;
  Panel2.Enabled := False;
  SBBusca.Tag := TbChequesCODIGO.Value;
  PnlBusca.Visible := True;

end;

procedure TFCheques.SpeedButton6Click(Sender: TObject);
begin
  if sender = SpeedButton6 then
    SBBusca.Tag :=  TbChequesCODIGO.Value
  else
    SBBusca.Tag := StatusBar1.Tag;
  RBCodigoClick(nil);
  TbCheques.Locate('CODIGO', SBBusca.Tag, []);
  Panel1.Enabled := True;
  Panel2.Enabled := True;
  SBBusca.Enabled := True;
  PnlBusca.Visible := False;
end;

procedure TFCheques.SBSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFCheques.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('CHEQUES', 'EXC', 1) then
    Exit;
  if (not TbCheques.IsEmpty) and
    (MessageDlg('Deseja excluir o cheque selecionado?', mtConfirmation, [mbyes, mbno], 0) = IDYES) then
    try
      TbCheques.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then begin
    if PnlBusca.Visible then
      SpeedButton6Click(SpeedButton7)
    else
      Close;
  end;
end;

procedure TFCheques.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlBusca.Visible;
end;

procedure TFCheques.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
{  if Key = vk_F1 then
    AbreAjuda }

  if not PnlBusca.Visible then begin
    if (Key = 78 {n}) and (Shift = [ssCtrl]) then
      SBNovoClick(nil)
    else if (Key = 65 {a}) and (Shift = [ssCtrl]) then
      SBAlterarClick(nil)
    else if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
      SBExcluirClick(nil)
    else if (Key = Vk_F3) then
      SBBuscaClick(nil);
  end;

  // verificar pq deixa inserir tmb saindo da tela do cadastro (esc não cancela)
end;

procedure TFCheques.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbCheques.Bof) then
    TbCheques.First
  else if (sender = SBLast) and (not TbCheques.Bof) then
    TbCheques.Prior
  else if (sender = SBNext) and (not TbCheques.Eof) then
    TbCheques.Next
  else if (sender = SBPrior) and (not TbCheques.Eof) then
    TbCheques.Last
  else
    TbCheques.Refresh;
end;

procedure TFCheques.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);

  Dados.ILSistema.GetBitmap(0, SBFirst.Glyph);
  Dados.ILSistema.GetBitmap(1, SBLast.Glyph);
  Dados.ILSistema.GetBitmap(2, SBNext.Glyph);
  Dados.ILSistema.GetBitmap(3, SBPrior.Glyph);
  Dados.ILSistema.GetBitmap(4, SBRefresh.Glyph);
  Dados.ILSistema.GetBitmap(5, SBBusca.Glyph);  
    
  Trans.StartTransaction;
  RBCodigo.Checked;
  RBCodigoClick(RBCodigo);
end;

procedure TFCheques.DSChequesDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT COUNT(CODIGO) FROM CHEQUES';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Open;
end;

procedure TFCheques.FormShow(Sender: TObject);
begin
  SBFirstClick(SBRefresh);
  AbrirLKs;
end;

procedure TFCheques.DBGrid2DblClick(Sender: TObject);
begin
  SpeedButton6Click(SpeedButton6);
end;

procedure TFCheques.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  with TDBGrid(Sender) do
    if odd(DataSource.DataSet.RecNo) then begin
      Canvas.Brush.Color := Dados.vgCorBusca;
      Canvas.FillRect(Rect);
      DefaultDrawDataCell(Rect,Column.Field,State);
      if gdFocused in state then begin
        Canvas.Brush.Color := Dados.vgCorFoco;
        Canvas.FillRect(Rect);
        DefaultDrawDataCell(Rect,Column.Field,State);
      end;
    end;
end;

procedure TFCheques.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFCheques.Cheques1Click(Sender: TObject);
begin
  if not VerificarPermissao('CHEQUES', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosCheques, FRelatoriosCheques);
    FRelatoriosCheques.ShowModal;
  finally
    FreeAndNil(FRelatoriosCheques);
  end;
end;

procedure TFCheques.Cancelar1Click(Sender: TObject);
begin
  if (TbChequesCANCELADO.Value = 0) and (TbChequesBAIXADO.Value = 0)
    and (MessageDlg('Deseja cancelar o cheque selecionado?', mtconfirmation, [mbYes, mbNo], 0) = IDYES) then begin
    TbCheques.Edit;
    TbChequesCANCELADO.Value := 1;
    TbCheques.Post;
  end;
end;

procedure TFCheques.Baixar1Click(Sender: TObject);
begin
  if (TbChequesCANCELADO.Value = 0) and (TbChequesBAIXADO.Value = 0)
    and (MessageDlg('Deseja baixar o cheque selecionado?', mtconfirmation, [mbYes, mbNo], 0) = IDYES) then begin
    TbCheques.Edit;
    TbChequesBAIXADO.Value := 1;
    TbCheques.Post;
  end;
end;

end.
