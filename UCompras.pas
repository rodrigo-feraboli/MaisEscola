unit UCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls,
  Menus, ComCtrls, DB, MDODatabase,
  MDOCustomDataSet, MDOQuery;

type
  TFCompras = class(TForm)
    PnlInfo: TPanel;
    PnlSup: TPanel;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    N1: TMenuItem;
    ImportarOramento1: TMenuItem;
    Fornecedores1: TMenuItem;
    N2: TMenuItem;
    CFOP1: TMenuItem;
    Transportadora1: TMenuItem;
    CondiesdePagamento1: TMenuItem;
    Relatrios1: TMenuItem;
    Vendas1: TMenuItem;
    BitImporta: TBitBtn;
    DSCompras: TDataSource;
    DSComprasItens: TDataSource;
    QryProx: TMDOQuery;
    Trans: TMDOTransaction;
    TbCompras: TMDODataSet;
    TbComprasItens: TMDODataSet;
    SBRefresh: TSpeedButton;
    SBPrior: TSpeedButton;
    SBNext: TSpeedButton;
    SBLast: TSpeedButton;
    SBFirst: TSpeedButton;
    SBNovo: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBExcluir: TSpeedButton;
    SBSair: TSpeedButton;
    StatusBar1: TStatusBar;
    SBBusca: TSpeedButton;
    Label9: TLabel;
    LblQtde: TLabel;
    RBCodigo: TRadioButton;
    RBDescricao: TRadioButton;
    EdBusca: TEdit;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    PCItens: TPageControl;
    TSItens: TTabSheet;
    TSParc: TTabSheet;
    SBNewItem: TSpeedButton;
    SBDelItem: TSpeedButton;
    SBAltItem: TSpeedButton;
    DBGrid3: TDBGrid;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    Label12: TLabel;
    SpeedButton3: TSpeedButton;
    DBEdit11: TDBEdit;
    DBLCBCond: TDBLookupComboBox;
    LblVlrItens: TStaticText;
    LblQtdeItens: TStaticText;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    TbComprasNROCOMPRA: TIntegerField;
    TbComprasDATACOMPRA: TDateField;
    TbComprasTIPONOTA: TMDOStringField;
    TbComprasNRONF: TLargeintField;
    TbComprasDATAEMISSAONF: TDateField;
    TbComprasCODFORNGEN: TIntegerField;
    TbComprasCODCFOP: TIntegerField;
    TbComprasCODCONDPGTO: TIntegerField;
    TbComprasCODTRANSP: TIntegerField;
    TbComprasCODORDEMCOMPRA: TIntegerField;
    TbComprasFRETEPORCONTA: TMDOStringField;
    TbComprasVLR1: TMDOBCDField;
    TbComprasDTVCTO1: TDateField;
    TbComprasVLR2: TMDOBCDField;
    TbComprasDTVCTO2: TDateField;
    TbComprasVLR3: TMDOBCDField;
    TbComprasDTVCTO3: TDateField;
    TbComprasVLR4: TMDOBCDField;
    TbComprasDTVCTO4: TDateField;
    TbComprasVLR5: TMDOBCDField;
    TbComprasDTVCTO5: TDateField;
    TbComprasVLR6: TMDOBCDField;
    TbComprasDTVCTO6: TDateField;
    TbComprasVLR7: TMDOBCDField;
    TbComprasDTVCTO7: TDateField;
    TbComprasVLR8: TMDOBCDField;
    TbComprasDTVCTO8: TDateField;
    TbComprasItensNROCOMPRA: TIntegerField;
    TbComprasItensNROITEM: TIntegerField;
    TbComprasItensCODPRODUTO: TIntegerField;
    TbComprasItensQUANT: TMDOBCDField;
    TbComprasItensVLRUNIT: TMDOBCDField;
    TbComprasItensPERCICMS: TSmallintField;
    TbComprasItensPERCIPI: TSmallintField;
    TbComprasItensVLRIPI: TMDOBCDField;
    TbComprasItensVlrTot: TCurrencyField;
    TbComprasDTINI: TDateField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    TbComprasTipoNotaStr: TStringField;
    PnlSearch: TPanel;
    LblQtde2: TLabel;
    SBOK: TSpeedButton;
    SBCanc: TSpeedButton;
    SpeedButton2: TSpeedButton;
    DBLCBForn: TDBLookupComboBox;
    DBLCBCFOP: TDBLookupComboBox;
    DBTST1: TEdit;
    DBTST: TEdit;
    CBForn: TCheckBox;
    CBCFOP: TCheckBox;
    DBGridSearch: TDBGrid;
    GroupBox1: TGroupBox;
    CBDtComIni: TCheckBox;
    DTPDtIni: TDateTimePicker;
    CBDtComFin: TCheckBox;
    DTPDtFin: TDateTimePicker;
    GroupBox2: TGroupBox;
    CBEmiIni: TCheckBox;
    DTPEmiIni: TDateTimePicker;
    CBEmiFin: TCheckBox;
    DTPEmiFin: TDateTimePicker;
    RGTipo: TRadioGroup;
    DBLCBCondPgto: TDBLookupComboBox;
    DBTST2: TEdit;
    CBCondPgto: TCheckBox;
    STAbertas: TStaticText;
    STPagas: TStaticText;
    STNPagas: TStaticText;
    DSSearch: TDataSource;
    QrySearch: TMDOQuery;
    QrySearchNROCOMPRA: TIntegerField;
    QrySearchFORN: TMDOStringField;
    QrySearchCLASS: TMDOStringField;
    QrySearchCOMPRA: TDateField;
    QrySearchEMISS: TDateField;
    QrySearchTIPO: TMDOStringField;
    TbComprasItensProduto: TStringField;
    TbComprasFornecedor: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure TbComprasAfterOpen(DataSet: TDataSet);
    procedure DSComprasDataChange(Sender: TObject; Field: TField);
    procedure SBNovoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RBCodigoClick(Sender: TObject);
    procedure SBNewItemClick(Sender: TObject);
    procedure SBDelItemClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBSairClick(Sender: TObject);
    procedure TbComprasItensCalcFields(DataSet: TDataSet);
    procedure SBFirstClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBAltItemClick(Sender: TObject);
    procedure DBLCBCondExit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Vendas1Click(Sender: TObject);
    procedure TbComprasCalcFields(DataSet: TDataSet);
    procedure SBBuscaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SBOKClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PCItensChange(Sender: TObject);
  private
    { Private declarations }
    vlVlrTot: Currency;
    procedure CalcTot;
  public
    { Public declarations }
    procedure LKTela;
    procedure ConfTrans(Conf: Boolean);
  end;

var
  FCompras: TFCompras;

const
  SQL = 'SELECT * FROM COMPRAS WHERE NROCOMPRA IS NOT NULL';

implementation

uses UComProdutos, UDados, UCondPgto, UEdCompras, UEdComprasItens, UCPagar,
  URelatoriosCompras;

{$R *.dfm}

procedure TFCompras.CalcTot;
begin
  QryProx.SQL.Text := 'select count(NROITEM), SUM(QUANT * VLRUNIT) from COMPRASITENS where NROCOMPRA = '+
    inttoStr(TbComprasNROCOMPRA.Value) ;
  QryProx.Open;
  LblQtdeItens.Caption := QryProx.Fields[0].AsString;
  vlVlrTot :=  QryProx.Fields[1].AsCurrency;
  LblVlrItens.Caption := 'R$ ' + FormatCurr('#,##0.00', QryProx.Fields[1].AsCurrency);
  QryProx.close;
end;

procedure TFCompras.ConfTrans(Conf: Boolean);
begin
  if Conf then
    Trans.CommitRetaining
  else
    Trans.RollbackRetaining;
end;

procedure TFCompras.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryCondPgtoLK.Open;
  Dados.QryCFOPLK.Open;
  Dados.QryFornLK.Open;

//  Dados.QryFornLK.Open;
end;

procedure TFCompras.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  RBCodigoClick(nil);
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
end;

procedure TFCompras.DBGrid2DrawColumnCell(Sender: TObject;
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

procedure TFCompras.TbComprasAfterOpen(DataSet: TDataSet);
begin
  TbComprasItens.Open;
end;

procedure TFCompras.DSComprasDataChange(Sender: TObject; Field: TField);
begin
  QryProx.SQL.Text := 'SELECT NROCOMPRA FROM CPAGAR WHERE NROCOMPRA = '+ IntToStr (TbComprasNROCOMPRA.Value);
  QryProx.Open;
  if not QryProx.IsEmpty then
    Label3.Caption := 'Contas a Pagar Lançadas'
  else
    Label3.Caption := 'Contas a Pagar não Lançadas';
  QryProx.close;   
  QryProx.SQL.Text := 'SELECT COUNT(NROCOMPRA) FROM COMPRAS';
  QryProx.Open;
  LblQtde.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;
  CalcTot;
end;

procedure TFCompras.SBNovoClick(Sender: TObject);
begin
  if not VerificarPermissao('COMPRAS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbCompras.Append;
    QryProx.SQL.Text := 'SELECT MAX(NROCOMPRA) FROM COMPRAS';
    QryProx.Open;
    TbComprasNROCOMPRA.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    TbComprasDATACOMPRA.Value := Date;
    TbComprasTIPONOTA.Value := 'S';
    Application.CreateForm(TFEdCompras, FEdCompras);
    FEdCompras.ShowModal;
  finally
    FreeAndNil(FEdCompras);
    LKTela;
  end;
end;

procedure TFCompras.SpeedButton3Click(Sender: TObject);
begin
  if not VerificarPermissao('CONDIÇÕES DE PAGAMENTO', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCondPgto, FCondPgto);
    FCondPgto.ShowModal;
  finally
    FreeAndNil(FCondPgto);
    LKTela;
  end;
end;

procedure TFCompras.FormShow(Sender: TObject);
begin
  PCItens.ActivePage := TSItens;
  LKTela;
end;

procedure TFCompras.RBCodigoClick(Sender: TObject);
begin
  TbCompras.Close;
  TbCompras.SelectSQL.Text := SQL;
  TbCompras.Open;
end;

procedure TFCompras.SBNewItemClick(Sender: TObject);
begin
  if not VerificarPermissao('COMPRAS', 'EDI', 1) then
    Exit;
  try
    ConfTrans(True);
    TbComprasItens.Append;
    TbComprasItensNROCOMPRA.Value := TbComprasNROCOMPRA.Value; 
    QryProx.SQL.Text := 'SELECT MAX(NROITEM) FROM COMPRASITENS WHERE NROCOMPRA = '+ IntToStr(TbComprasNROCOMPRA.Value);
    QryProx.Open;
    TbComprasItensNROITEM.Value := QryProx.Fields[0].AsInteger + 1;
    QryProx.Close;
    Application.CreateForm(TFEdComprasItens, FEdComprasItens);
    FEdComprasItens.ShowModal;
  finally
    FreeAndNil(FEdComprasItens);
    LKTela;
    CalcTot;
  end;
end;

procedure TFCompras.SBDelItemClick(Sender: TObject);
begin
  if not VerificarPermissao('COMPRAS', 'EXC', 1) then
    Exit;
  if TbComprasItens.IsEmpty then
    Exit;
  if MessageDlg(cgMsgDelCompra, mtConfirmation, [mbYes, mbNo], 0) = IDYes then
    try
      TbComprasItens.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
  CalcTot;    
end;

procedure TFCompras.SBExcluirClick(Sender: TObject);
begin
  if not VerificarPermissao('COMPRAS', 'EXC', 1) then
    Exit;
  if TbCompras.IsEmpty then
    Exit;
  if MessageDlg(cgMsgDelItemCompra, mtConfirmation, [mbYes, mbNo], 0) = IDYes then
    try
      TbComprasItens.First;
      while not TbComprasItens.Eof do
        TbComprasItens.Delete;
      TbCompras.Delete;
    except
      ConfTrans(False);
      MessageDlg(cgMsgErroDel, mtError, [mbOk], 0);
    end;
end;

procedure TFCompras.SBSairClick(Sender: TObject);
begin
  close;
end;

procedure TFCompras.TbComprasItensCalcFields(DataSet: TDataSet);
begin
  TbComprasItensVlrTot.Value := TbComprasItensQUANT.Value * TbComprasItensVLRUNIT.Value;
end;

procedure TFCompras.SBFirstClick(Sender: TObject);
begin
  if (sender = SBFirst) and (not TbCompras.Bof) then
    TbCompras.First
  else if (sender = SBLast) and (not TbCompras.Bof) then
    TbCompras.Prior
  else if (sender = SBNext) and (not TbCompras.Eof) then
    TbCompras.Next
  else if (sender = SBPrior) and (not TbCompras.Eof) then
    TbCompras.Last
  else
    TbCompras.Refresh;
end;

procedure TFCompras.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1 then
    AbreAjuda
//  if not PnlBusca.Visible then begin
//    if (Key = 78 {n}) and (Shift = [ssCtrl]) then
//      SBNovoClick(nil)
//    else if (Key = 65 {a}) and (Shift = [ssCtrl]) then
//      SBAlterarClick(nil)
//    else if (Key = VK_DELETE) and (Shift = [ssCtrl]) then
//      SBExcluirClick(nil)
//    else if (Key = Vk_F3) then
//      SBBuscaClick(nil);
//  end;  
end;

procedure TFCompras.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Canclose := not PnlSearch.Visible;
  if CanClose = True then begin
    if (TbComprasItens.IsEmpty) and not (TbCompras.IsEmpty) then begin
      MessageDlg('Especifique os itens da compra, antes de sair de Compras!', mtWarning, [mbok], 0);
      PCItens.ActivePage := TSItens;
      CanClose := False;
    end;
  end;
end;

procedure TFCompras.SBAlterarClick(Sender: TObject);
begin
  if not VerificarPermissao('COMPRAS', 'EDI', 1) then
    Exit;
  if TbCompras.IsEmpty then
    Exit;
  try
    TbCompras.Edit;
    Application.CreateForm(TFEdCompras, FEdCompras);
    FEdCompras.ShowModal;
  finally
    FreeAndNil(FEdCompras);
    CalcTot;
    LKTela;
  end;
end;

procedure TFCompras.SBAltItemClick(Sender: TObject);
begin
  if not VerificarPermissao('COMPRAS', 'EDI', 1) then
    Exit;
  if TbComprasItens.IsEmpty then
    Exit;
  try
    TbComprasItens.Edit;
    Application.CreateForm(TFEdComprasItens, FEdComprasItens);
    FEdComprasItens.ShowModal;
  finally
    CalcTot;
    FreeAndNil(FEdComprasItens);
    LKTela;
  end;
end;

procedure TFCompras.DBLCBCondExit(Sender: TObject);
begin
  if TbCompras.State in [dsBrowse] then
    Tbcompras.Edit;
  if TbComprasDTINI.IsNull then
    TbComprasDTINI.value := Date;
end;

procedure TFCompras.DBEdit1Exit(Sender: TObject);
  var
    vlVlrParc: Currency;
    vlVlrStr: String;
    vlDias: array [1..8] of Smallint;
    vlParc: array [1..8] of Currency;
    i: smallint;
  procedure CalcularDif(pNum: Smallint);
  var
    y: Smallint;
    vpSoma, vpFalta, vpSobra: Currency;
  begin
    for y := 1 to 8 do
      vlParc[y] := 0;
    vlVlrStr := FormatCurr('###0.00', (vlVlrTot/pNum));
    vpSoma := 0;
    for y := 1 to pNum do begin
      vlParc[y] := StrToCurr(vlVlrStr);
      vpSoma := vpSoma + StrToCurr(vlVlrStr);
    end;
    if vpSoma = vlVlrTot then
      exit;
    if vpSoma < vlVlrTot then begin
      vpFalta := vlVlrTot - vpSoma;
      vlParc[1] := vlParc[1] + vpFalta
    end else if vpSoma > vlVlrTot then begin
      vpSobra := vpSoma - vlVlrTot;
      vlParc[1] := vlParc[1] - vpSobra;
    end;
  end;

begin
  vlVlrParc := 0;
  if MessageDlg('Deseja (Re)Calcular os períodos das parcelas?', mtConfirmation, [mbYes, MbNo], 0)= IDYes then begin
    try
      if TbCompras.State in [dsBrowse] then
        Tbcompras.Edit;
      TbComprasVLR1.Clear;
      TbComprasVLR2.Clear;
      TbComprasVLR3.Clear;
      TbComprasVLR4.Clear;
      TbComprasVLR5.Clear;
      TbComprasVLR6.Clear;
      TbComprasVLR7.Clear;
      TbComprasVLR8.Clear;
      TbComprasDTVCTO1.Clear;
      TbComprasDTVCTO2.Clear;
      TbComprasDTVCTO3.Clear;
      TbComprasDTVCTO4.Clear;
      TbComprasDTVCTO5.Clear;
      TbComprasDTVCTO6.Clear;
      TbComprasDTVCTO7.Clear;
      TbComprasDTVCTO8.Clear;

      QryProx.SQL.Text := 'SELECT PRAZO1, PRAZO2, PRAZO3, PRAZO4, PRAZO5, PRAZO6, PRAZO7, PRAZO8 FROM CONDPGTO WHERE CODCONDPGTO = '+
         IntToStr(TbComprasCODCONDPGTO.Value);
      QryProx.Open;
      for i:= 1 to 8 do
        vlDias[i] :=  QryProx.Fields[i - 1].AsInteger;
      QryProx.Close;

      if vlDias[1] > 0 then begin
        TbComprasDTVCTO1.Value := TbComprasDTINI.value + vlDias[1];
        if vlDias[2] = 0 then
          CalcularDif(1);
      end;
      if vlDias[2] > 0 then begin
        TbComprasDTVCTO2.Value := TbComprasDTVCTO1.Value + vlDias[2];
        if vlDias[3] = 0 then
          CalcularDif(2);
      end;
      if vlDias[3] > 0 then begin
        TbComprasDTVCTO3.Value := TbComprasDTVCTO2.Value + vlDias[3];
        if vlDias[4] = 0 then
          CalcularDif(3);
      end;
      if vlDias[4] > 0 then begin
        TbComprasDTVCTO4.Value := TbComprasDTVCTO3.Value  + vlDias[4];
        if vlDias[5] = 0 then
          CalcularDif(4);
      end;
      if vlDias[5] > 0 then begin
        TbComprasDTVCTO5.Value := TbComprasDTVCTO4.Value + vlDias[5];
        if vlDias[6] = 0 then
          CalcularDif(5);
      end;
      if vlDias[6] > 0 then begin
        TbComprasDTVCTO6.Value := TbComprasDTVCTO5.Value +  vlDias[6];
        if vlDias[7] = 0 then
          CalcularDif(6);
      end;
      if vlDias[7] > 0  then begin
        TbComprasDTVCTO7.Value := TbComprasDTVCTO6.Value +  vlDias[7];
        if vlDias[8] = 0 then
          CalcularDif(7);
      end;
      if  vlDias[8] > 0 then begin
        TbComprasDTVCTO8.Value := TbComprasDTVCTO7.Value  +  vlDias[8];
          CalcularDif(8);
      end;

      if vlDias[1] > 0 then
        TbComprasVLR1.Value := vlParc[1];
      if vlDias[2] > 0 then
        TbComprasVLR2.Value := vlParc[2];
      if vlDias[3] > 0 then
        TbComprasVLR3.Value := vlParc[3];
      if vlDias[4] > 0 then
        TbComprasVLR4.Value := vlParc[4];
      if vlDias[5] > 0 then
        TbComprasVLR5.Value := vlParc[5];
      if vlDias[6] > 0 then
        TbComprasVLR6.Value := vlParc[6];//vlVlrParc;
      if vlDias[7] > 0 then
        TbComprasVLR7.Value := vlParc[7];//vlVlrParc;
      if vlDias[8] > 0 then
        TbComprasVLR8.Value := vlParc[8];//vlVlrParc;

      Tbcompras.Post;
      ConfTrans(True);
    except
      ShowMessage('Erro');
      ConfTrans(False);
    end;
  end;  
end;

procedure TFCompras.SpeedButton1Click(Sender: TObject);
  procedure Lanca(pNum: Smallint; pDt: TDateTime; pVlr: Currency);
  begin
    FCPagar.TbCPParcs.Append;
    FCPagar.TbCPParcsNROCPAGAR.Value := FCPagar.TbCPNROCPAGAR.Value;
    FCPagar.TbCPParcsNROPARC.Value := pNum;
    FCPagar.TbCPParcsVLRPARC.Value := pVlr;
    FCPagar.TbCPParcsVLRPAGO.Value := 0;
    FCPagar.TbCPParcsSITUACAO.Value := 'A';
    FCPagar.TbCPParcsDATAGERA.Value := Date;
    FCPagar.TbCPParcsVCTOPARC.Value := pDt;
    FCPagar.TbCPParcs.Post;
  end;
begin
  if TbComprasCODCONDPGTO.IsNull then begin
    MessageDlg('Especifique uma condição de pagamento!', mtWarning, [mbOk], 0);
    DBLCBCond.SetFocus;
    Exit;
  end;

  if TbComprasDTINI.IsNull then begin
    MessageDlg('Especifique a data inicial das parcelas!', mtWarning, [mbOk], 0);
    DBEdit1.SetFocus;
    Exit;
  end;

  if (TbComprasVLR1.Value + TbComprasVLR2.Value + TbComprasVLR3.Value + TbComprasVLR4.Value + TbComprasVLR5.Value +
      TbComprasVLR6.Value + TbComprasVLR7.Value + TbComprasVLR8.Value) <> vlVlrTot then begin
    MessageDlg('A soma das parcelas não combina com o valor total da venda, verifique!', mtWarning, [mbOk], 0);
    DBEdit1.SetFocus;
    Exit;
  end;

  QryProx.SQL.Text := 'SELECT NROCOMPRA FROM CPAGAR WHERE NROCOMPRA = '+ IntToStr (TbComprasNROCOMPRA.Value);
  QryProx.Open;
  if not QryProx.IsEmpty then begin
    MessageDlg('As contas a pagar desta compra já foram lançadas!', mtWarning, [mbOk], 0);
    QryProx.close;
    Exit;
  end;
  QryProx.close;

  if not (TbComprasVLR1.IsNull) and
    (MessageDlg('Deseja lançar as contas a receber?', mtConfirmation, [mbYes, mbNo], 0) = IDYes) then
    try
      Application.CreateForm(TFCPagar, FCPagar);
      FCPagar.TbCP.Append;
      FCPagar.QryAux.SQL.Text := 'SELECT MAX(NROCPAGAR) FROM CPAGAR';
      FCPagar.QryAux.Open;
      FCPagar.TbCPNROCPAGAR.Value := FCPagar.QryAux.Fields[0].AsInteger + 1;
      FCPagar.QryAux.Close;
      FCPagar.TbCPDATA.Value := Date;
      FCPagar.TbCPCODGEN.Value := TbComprasCODFORNGEN.Value;
      FCPagar.TbCPCODCONDPGTO.Value := TbComprasCODCONDPGTO.Value;
      FCPagar.TbCPNROCOMPRA.Value := TbComprasNROCOMPRA.Value;
      FCPagar.TbCPCODCC.Value := Dados.TbConfigCODCC.Value;
      FCPagar.TbCP.Post;
      Lanca(1, TbComprasDTVCTO1.Value, TbComprasVLR1.Value);
      if not TbComprasDTVCTO2.IsNull then
        Lanca(2, TbComprasDTVCTO2.Value, TbComprasVLR2.Value);
      if not TbComprasDTVCTO3.IsNull then
        Lanca(3, TbComprasDTVCTO3.Value, TbComprasVLR3.Value);
      if not TbComprasDTVCTO4.IsNull then
        Lanca(4, TbComprasDTVCTO4.Value, TbComprasVLR4.Value);
      if not TbComprasDTVCTO5.IsNull then
        Lanca(5, TbComprasDTVCTO5.Value, TbComprasVLR5.Value);
      if not TbComprasDTVCTO6.IsNull then
        Lanca(6, TbComprasDTVCTO6.Value, TbComprasVLR6.Value);
      if not TbComprasDTVCTO7.IsNull then
        Lanca(7, TbComprasDTVCTO7.Value, TbComprasVLR7.Value);
      if not TbComprasDTVCTO8.IsNull then
        Lanca(8, TbComprasDTVCTO8.Value, TbComprasVLR8.Value);
      FCPagar.ConfTrans(True);
      MessageDlg('Contas a Receber lançadas com sucesso!', mtInformation, [mbOk], 0);
      FreeAndNil(FCPagar);
    except
      FCPagar.ConfTrans(False);
      MessageDlg('Erro ao lançar as Contas a Receber!', mtInformation, [mbOk], 0);
      FreeAndNil(FCPagar);
    end;
end;

procedure TFCompras.Vendas1Click(Sender: TObject);
begin
  if not VerificarPermissao('COMPRAS', 'REL', 1) then
    Exit;
  try
    Application.CreateForm(TFRelatoriosCompras, FRelatoriosCompras);
    FRelatoriosCompras.Caption := 'Relatório de Compras';
    FRelatoriosCompras.ShowModal;
  finally
    FreeAndNil(FRelatoriosCompras);
  end;
end;

procedure TFCompras.TbComprasCalcFields(DataSet: TDataSet);
begin
  if TbComprasTIPONOTA.Value = 'E' then
    TbComprasTipoNotaStr.value := 'Entrada'
  else
    TbComprasTipoNotaStr.value := 'Saída';
end;

procedure TFCompras.SBBuscaClick(Sender: TObject);
begin
  DTPDtIni.Date := Date;
  DTPDtFin.Date := Date - 30;
  DTPEmiIni.Date := Date;
  DTPEmiFin.Date := Date - 30; 
  PnlSearch.Top := 0;
  PnlSearch.Left := 0;
  PnlSup.Enabled := False;
  Arquivo1.Enabled := PnlSup.Enabled;
  Relatrios1.Enabled := PnlSup.Enabled;
  PnlInfo.Enabled := PnlSup.Visible;
  LblQtde2.Caption := '';
  Caption := 'Busca de Compras';
  LKTela;
  PnlSearch.Visible := not Arquivo1.Visible;   
end;

procedure TFCompras.SpeedButton2Click(Sender: TObject);
  var
    vlSQLFiltro: String;
begin
  vlSQLFiltro := 'WHERE C.NROCOMPRA IS NOT NULL ';

  if (CBForn.Checked) and (DBLCBForn.Text <> '') then
    vlSQLFiltro := vlSQLFiltro + ' AND C.CODFORNGEN = :PLCODFORN ';
  if (CBCFOP.Checked) and (DBLCBCFOP.Text <> '') then
    vlSQLFiltro := vlSQLFiltro + ' AND C.CODCFOP = :PLCODCFOP ';
  if (CBCondPgto.Checked) and (DBLCBCondPgto.Text <> '') then
    vlSQLFiltro := vlSQLFiltro + ' AND C.CODCONDPGTO = :PLCODCONDPGTO ';
  if (CBDtComIni.Checked) then
    vlSQLFiltro := vlSQLFiltro + ' AND C.DATACOMPRA >= :PLDTINI ';
  if (CBDtComFin.Checked) then
    vlSQLFiltro := vlSQLFiltro + ' AND C.DATACOMPRA <= :PLDTFIN ';
  if (CBEmiIni.Checked) then
    vlSQLFiltro := vlSQLFiltro + ' AND C.DATAEMISSAONF >= :PLDTINI ';
  if (CBEmiFin.Checked) then
    vlSQLFiltro := vlSQLFiltro + ' AND C.DATAEMISSAONF <= :PLDTFIN ';
  case RGTipo.ItemIndex of
    1:  vlSQLFiltro := vlSQLFiltro + ' AND C.TIPONOTA = ''E'' ';
    2:  vlSQLFiltro := vlSQLFiltro + ' AND C.TIPONOTA = ''S'' ';
  end;
  QryProx.SQL.Text := 'SELECT COUNT(C.NROCOMPRA) FROM COMPRAS C  ';
  QryProx.SQL.Add(vlSQLFiltro);
  if (CBForn.Checked) and (DBLCBForn.Text <> '') then
    QryProx.ParamByName('PLCODFORN').AsInteger := DBLCBForn.KeyValue ;
  if (CBCFOP.Checked) and (DBLCBCFOP.Text <> '') then
    QryProx.ParamByName('PLCODCFOP').AsInteger := DBLCBCFOP.KeyValue;
  if (CBCondPgto.Checked) and (DBLCBCondPgto.Text <> '') then
    QryProx.ParamByName('PLCODCONDPGTO').AsInteger := DBLCBCondPgto.KeyValue;

  if (CBDtComIni.Checked) then
    QryProx.ParamByName('PLDTINI').AsDate := DTPDtIni.Date;
  if (CBDtComFin.Checked) then
    QryProx.ParamByName('PLDTFIN').AsDate := DTPDtFin.Date;

  if (CBEmiIni.Checked) then
    QryProx.ParamByName('PLDTINI').AsDate := DTPEmiIni.Date;
  if (CBEmiFin.Checked) then
    QryProx.ParamByName('PLDTFIN').AsDate := DTPEmiFin.Date;
  QryProx.Open;
  LblQtde2.Caption :=  IntToStr(QryProx.Fields[0].AsInteger) + ' registros encontrados';
  QryProx.Close;

  QrySearch.Close;
  QrySearch.SQL.Text := 'SELECT C.NROCOMPRA, G.NOME AS FORN, CF.DESCRICAO AS CLASS, '+
    'C.DATACOMPRA AS COMPRA, C.DATAEMISSAONF AS EMISS, '+
    'CAST (CASE C.TIPONOTA WHEN ''E'' THEN ''Entrada'' '+
    'ELSE ''Saída'' end AS VARCHAR(7)) as TIPO '+
    'FROM COMPRAS C '+
    'INNER JOIN GEN G ON G.CODGEN = C.CODFORNGEN '+
    'INNER JOIN CFOP CF ON CF.CODCFOP = C.CODCFOP '+
    'LEFT JOIN  CONDPGTO  CP ON CP.CODCONDPGTO = C.CODCONDPGTO  ';
  QrySearch.SQL.Add(vlSQLFiltro);

  if (CBForn.Checked) and (DBLCBForn.Text <> '') then
    QrySearch.ParamByName('PLCODFORN').AsInteger := DBLCBForn.KeyValue ;
  if (CBCFOP.Checked) and (DBLCBCFOP.Text <> '') then
    QrySearch.ParamByName('PLCODCFOP').AsInteger := DBLCBCFOP.KeyValue;
  if (CBCondPgto.Checked) and (DBLCBCondPgto.Text <> '') then
    QrySearch.ParamByName('PLCODCONDPGTO').AsInteger := DBLCBCondPgto.KeyValue;

  if (CBDtComIni.Checked) then
    QrySearch.ParamByName('PLDTINI').AsDate := DTPDtIni.Date;
  if (CBDtComFin.Checked) then
    QrySearch.ParamByName('PLDTFIN').AsDate := DTPDtFin.Date;
  if (CBEmiIni.Checked) then
    QrySearch.ParamByName('PLDTINI').AsDate := DTPEmiIni.Date;
  if (CBEmiFin.Checked) then
    QrySearch.ParamByName('PLDTFIN').AsDate := DTPEmiFin.Date;
  QrySearch.Open;
end;

procedure TFCompras.SBOKClick(Sender: TObject);
begin
  if (sender = SBOK) or (Sender = DBGridSearch) then
    TbCompras.Locate('NROCOMPRA', QrySearchNROCOMPRA.Value, []);

  Arquivo1.Visible := True;
  Relatrios1.Visible := Arquivo1.Visible;
  PnlSup.Enabled := Arquivo1.Visible;
  PnlInfo.Enabled := Arquivo1.Visible;
  Caption := 'Cadastro de Contas a Pagar';
  PnlSearch.Visible := not Arquivo1.Visible;
end;

procedure TFCompras.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFCompras.PCItensChange(Sender: TObject);
begin
  if (PCItens.ActivePage = TSParc) and (TbComprasItens.IsEmpty) then begin
    MessageDlg('Especifique primeiro os itens da compra, antes de verificar as parcelas da compra!', mtWarning, [mbOk], 0);
    PCItens.ActivePage := TSItens;
  end;
end;

end.
