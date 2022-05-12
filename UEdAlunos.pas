unit UEdAlunos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB, ShellApi;

type
  TFEdAlunos = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    StatusBar1: TStatusBar;
    PCRaiz: TPageControl;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    TSPM: TTabSheet;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    PCResp: TPageControl;
    TSPai: TTabSheet;
    TSMae: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    SpeedButton2: TSpeedButton;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    GroupBox1: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBLCBBairroPai: TDBLookupComboBox;
    DBLCBCidadePai: TDBLookupComboBox;
    DBLCBProfPai: TDBLookupComboBox;
    SBBairroPai: TSpeedButton;
    SBCidadePai: TSpeedButton;
    SBProfPai: TSpeedButton;
    TSExtras: TTabSheet;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    ImaAluno: TImage;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    SBBairro: TSpeedButton;
    SBCidade: TSpeedButton;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBLCBBairro: TDBLookupComboBox;
    DBLCBCidade: TDBLookupComboBox;
    RGChamar: TDBRadioGroup;
    Label26: TLabel;
    Label27: TLabel;
    RGAcid: TDBRadioGroup;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    Label29: TLabel;
    DBEdit29: TDBEdit;
    Label30: TLabel;
    DBMemo1: TDBMemo;
    Label31: TLabel;
    Label32: TLabel;
    SpeedButton3: TSpeedButton;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    SBBairroMae: TSpeedButton;
    SBCidadeMae: TSpeedButton;
    SBProfMae: TSpeedButton;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    GroupBox2: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBLCBBairroMae: TDBLookupComboBox;
    DBLCBCidadeMae: TDBLookupComboBox;
    DBLCBProfMae: TDBLookupComboBox;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    Label49: TLabel;
    DBEdit48: TDBEdit;
    Label50: TLabel;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    Label52: TLabel;
    Label53: TLabel;
    DBEdit52: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    SBMail: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ImPai: TImage;
    ImMae: TImage;
    Label51: TLabel;
    SBTurmas: TSpeedButton;
    DBEdit51: TDBEdit;
    DBLCBTurma: TDBLookupComboBox;
    SBCancelar: TSpeedButton;
    TSResp: TTabSheet;
    Label54: TLabel;
    Label55: TLabel;
    SpeedButton5: TSpeedButton;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    SpeedButton9: TSpeedButton;
    ImResp: TImage;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit61: TDBEdit;
    GroupBox3: TGroupBox;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBLCBBairroResp: TDBLookupComboBox;
    DBLCBCidadeResp: TDBLookupComboBox;
    DBLCBProfResp: TDBLookupComboBox;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DTPIngresso: TDateTimePicker;
    DTPNasc: TDateTimePicker;
    DTPDtNascPai: TDateTimePicker;
    DTPDtNascMae: TDateTimePicker;
    DTPDtAnivRe: TDateTimePicker;
    DBRadioGroup3: TDBRadioGroup;
    Label73: TLabel;
    DBText1: TDBText;
    Label74: TLabel;
    DBText2: TDBText;
    Label75: TLabel;
    DBText3: TDBText;
    Label76: TLabel;
    DBText4: TDBText;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBBairroPaiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SBMailClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DTPIngressoChange(Sender: TObject);
    procedure DTPNascChange(Sender: TObject);
    procedure DBEdit52Enter(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DTPDtNascPaiChange(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DTPDtNascMaeChange(Sender: TObject);
    procedure DBEdit31Enter(Sender: TObject);
    procedure DTPDtAnivReChange(Sender: TObject);
    procedure DBEdit54Enter(Sender: TObject);
    procedure DBLCBCidadePaiExit(Sender: TObject);
    procedure DBLCBCidadeMaeExit(Sender: TObject);
    procedure DBLCBCidadeRespExit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure RGChamarChange(Sender: TObject);
    procedure RGAcidChange(Sender: TObject);
    procedure DBLCBBairroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdAlunos: TFEdAlunos;

implementation

uses UAlunos, UDados, UBairros, UCidades, UProfissoes, UTurmas;

{$R *.dfm}

procedure TFEdAlunos.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryBairrosLK.Open;
  Dados.QryCidadesLK.Open;
  Dados.QryProfissoesLK.Open;
  Dados.QryTurmasLK.Open;
end;

procedure TFEdAlunos.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAlunos.TbAlunos.Cancel;
      FAlunos.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAlunos.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FAlunos.TbAlunosMATRICULA.IsNull then begin
    MessageDlg(cgEspDescMatriculaAluno, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    Exit;
  end;

  if FAlunos.TbAlunosNOME.IsNull then begin
    MessageDlg(cgEspDescNomeAluno, mtWarning, [mbOk], 0);
    DBEdit3.SetFocus;
    Exit;
  end; 

  if FAlunos.TbAlunosDTNASC.IsNull then begin
    MessageDlg(cgEspDescDtNascAluno, mtWarning, [mbOk], 0);
    DBEdit4.SetFocus;
    Exit;
  end;

  if FAlunos.TbAlunosQUEMBUSCA.IsNull then begin
    PCRaiz.ActivePage := TSExtras;
    MessageDlg('Especifique quem irá buscar o aluno!', mtWarning, [mbOk], 0);
    DBRadioGroup3.SetFocus;
    Exit;
  end;

  if FAlunos.TbAlunosCODBAIRRO.IsNull then begin
    PCRaiz.ActivePage := TSExtras;
    MessageDlg('Especifique o bairro do aluno!', mtWarning, [mbOk], 0);
    DBLCBBairro.SetFocus;
    Exit;
  end;


  if FAlunos.TbAlunosCODCIDADE.IsNull then begin
    PCRaiz.ActivePage := TSExtras;
    MessageDlg('Especifique a cidade do aluno!', mtWarning, [mbOk], 0);
    DBLCBCidade.SetFocus;
    Exit;
  end;

  if FAlunos.TbAlunosCODTURMA.IsNull then begin
    PCRaiz.ActivePage := TSExtras;
    MessageDlg('Especifique a turma do aluno!', mtWarning, [mbOk], 0);
    DBLCBTurma.SetFocus;
    Exit;
  end;

  // colocar o nome do pai e da mãe como obrigatórios

  if FAlunos.TbAlunosNOMEPAI.IsNull then begin
    MessageDlg('Especifique o nome do pai!', mtWarning, [mbOk], 0);
    PCRaiz.ActivePage := TSPM;
    PCResp.ActivePage := TSPai;
    DBEdit5.SetFocus;
    Exit;
  end;

  if FAlunos.TbAlunosNOMEMAE.IsNull then begin
    MessageDlg('Especifique o nome da mãe!', mtWarning, [mbOk], 0);
    PCRaiz.ActivePage := TSPM;
    PCResp.ActivePage := TSMae;
    DBEdit30.SetFocus;
    Exit;
  end;

  if ((FAlunos.TbAlunosQUEMBUSCA.Value = 1) or (FAlunos.TbAlunosQUEMBUSCA.Value = 4)) and FAlunos.TbAlunosNOMERESP.IsNull then begin
    MessageDlg('Especifique o nome do responsável!', mtWarning, [mbOk], 0);
    PCRaiz.ActivePage := TSPM;
    PCResp.ActivePage := TSResp;
    DBEdit53.SetFocus;
    Exit;
  end;

  if (FAlunos.TbAlunosPATHFOTO.IsNull)
    and (MessageDlg('Foto do aluno não informada, deseja informar agora?', mtConfirmation, [MbYes, MbNo], 0) = IDYES) then begin
    SpeedButton1Click(nil);
    Exit;
  end;

  if ((FAlunos.TbAlunosQUEMBUSCA.Value = 1) or (FAlunos.TbAlunosQUEMBUSCA.Value = 2)) and (FAlunos.TbAlunosPATHFOTOPAI.IsNull)
    and (MessageDlg('Foto do pai não informada (é um dos responsáveis a buscar e/ou entregar o aluno), deseja informar agora?', mtConfirmation,
      [MbYes, MbNo], 0) = IDYES) then begin
    SpeedButton2Click(nil);
    Exit;
  end;

  if ((FAlunos.TbAlunosQUEMBUSCA.Value = 1) or (FAlunos.TbAlunosQUEMBUSCA.Value = 3)) and (FAlunos.TbAlunosPATHFOTOMAE.IsNull)
    and (MessageDlg('Foto da mãe não informada (é um dos responsáveis a buscar e/ou entregar o aluno), deseja informar agora?', mtConfirmation,
      [MbYes, MbNo], 0) = IDYES) then begin
    SpeedButton3Click(nil);
    Exit;
  end;

  if ((FAlunos.TbAlunosQUEMBUSCA.Value = 1) or (FAlunos.TbAlunosQUEMBUSCA.Value = 4)) and (FAlunos.TbAlunosPATHFOTORESP.IsNull)
    and (MessageDlg('Foto do responsável não informada (é um dos responsáveis a buscar e/ou entregar o aluno), deseja informar agora?', mtConfirmation,
      [MbYes, MbNo], 0) = IDYES) then begin
    SpeedButton5Click(nil);
    Exit;
  end;

  try
    FAlunos.TbAlunos.Post;
    FAlunos.ConfTrans(True);
  except
    FAlunos.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;
  Close;
end;

procedure TFEdAlunos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAlunos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAlunos.TbAlunos.State in [dsInsert, dsEdit]) then
    FAlunos.TbAlunos.Cancel;
end;

procedure TFEdAlunos.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  LKTela;
end;

procedure TFEdAlunos.SBBairroPaiClick(Sender: TObject);
begin
  if (sender = SBBairroPai) or (Sender = SBBairroMae) or (Sender = SBBairro) then begin
    if not VerificarPermissao('BAIRROS', 'CONS', 1) then
      Exit;
    try
      Application.CreateForm(TFBairros, FBairros);
      FBairros.ShowModal;
    finally
      FreeAndNil(FBairros);
    end;
  end else if (sender = SBCidadePai) or (Sender = SBCidadeMae)  or (Sender = SBCidade) then begin
    if not VerificarPermissao('CIDADES', 'CONS', 1) then
      Exit;
    try
      Application.CreateForm(TFCidades, FCidades);
      FCidades.ShowModal;
    finally
      FreeAndNil(FCidades);
    end;
  end else if (sender = SBProfPai) or (Sender = SBProfMae) then begin
    if not VerificarPermissao('PROFISSÕES', 'CONS', 1) then
      Exit;
    try
      Application.CreateForm(TFProfissoes, FProfissoes);
      FProfissoes.ShowModal;
    finally
      FreeAndNil(FProfissoes);
    end
  end else if sender = SBTurmas then
    if not VerificarPermissao('TURMAS', 'CONS', 1) then
      Exit;
    try
      Application.CreateForm(TFTurmas, FTurmas);
      FTurmas.ShowModal;
    finally
      FreeAndNil(FTurmas);
    end;
  LKTela;
end;

procedure TFEdAlunos.FormShow(Sender: TObject);
begin
  PCResp.ActivePageIndex := 0;
  PCRaiz.ActivePageIndex := 0;
  try
    ImaAluno.Picture.LoadFromFile(FAlunos.TbAlunosPATHFOTO.Value);
  except
  end;
  try
    ImPai.Picture.LoadFromFile(FAlunos.TbAlunosPATHFOTOPAI.Value);
  except
  end;
  try
    ImMae.Picture.LoadFromFile(FAlunos.TbAlunosPATHFOTOMAE.Value);
  except
  end;
  try
    ImResp.Picture.LoadFromFile(FAlunos.TbAlunosPATHFOTORESP.Value);
  except
  end;
  DBEdit52Enter(nil);
  DBEdit4Exit(nil);
  DBEdit6Enter(nil);
  DBEdit31Enter(nil);
  DBEdit54Enter(nil);
  RGChamarChange(nil);
  RGAcidChange(nil);
end;

procedure TFEdAlunos.SpeedButton4Click(Sender: TObject);
begin
  if not FAlunos.TbAlunosEMAILMAE.IsNull then
  ShellExecute(handle, 'open', PChar('mailto:'+ FAlunos.TbAlunosEMAILMAE.Value), '', '', SW_SHOW);
end;

procedure TFEdAlunos.SBMailClick(Sender: TObject);
begin
  if not FAlunos.TbAlunosEMAILPAI.IsNull then
    ShellExecute(handle, 'open', PChar('mailto:'+ FAlunos.TbAlunosEMAILPAI.Value), '', '', SW_SHOW);
end;

procedure TFEdAlunos.SpeedButton1Click(Sender: TObject);
begin
  if Dados.ODFotos.Execute then
    FAlunos.TbAlunosPATHFOTO.Value := Dados.ODFotos.FileName;
  try
    ImaAluno.Picture.LoadFromFile(FAlunos.TbAlunosPATHFOTO.Value);
  except
  end;
end;

procedure TFEdAlunos.SpeedButton2Click(Sender: TObject);
begin
  if Dados.ODFotos.Execute then
    FAlunos.TbAlunosPATHFOTOPAI.Value := Dados.ODFotos.FileName;
  try
    ImPai.Picture.LoadFromFile(FAlunos.TbAlunosPATHFOTOPAI.Value);
  except
  end;
end;

procedure TFEdAlunos.SpeedButton3Click(Sender: TObject);
begin
  if Dados.ODFotos.Execute then
    FAlunos.TbAlunosPATHFOTOMAE.Value := Dados.ODFotos.FileName;
  try
    ImMae.Picture.LoadFromFile(FAlunos.TbAlunosPATHFOTOMAE.Value);
  except
  end;
end;

procedure TFEdAlunos.SpeedButton5Click(Sender: TObject);
begin
  if Dados.ODFotos.Execute then
    FAlunos.TbAlunosPATHFOTORESP.Value := Dados.ODFotos.FileName;
  try
    ImResp.Picture.LoadFromFile(FAlunos.TbAlunosPATHFOTORESP.Value);
  except
  end;
end;

procedure TFEdAlunos.SpeedButton9Click(Sender: TObject);
begin
  if not FAlunos.TbAlunosEMAILRESP.IsNull then
  ShellExecute(handle, 'open', PChar('mailto:'+ FAlunos.TbAlunosEMAILRESP.Value), '', '', SW_SHOW);
end;

procedure TFEdAlunos.DTPIngressoChange(Sender: TObject);
begin
  FAlunos.TbAlunosDATAINGRESSO.Value := DTPIngresso.Date;
end;

procedure TFEdAlunos.DTPNascChange(Sender: TObject);
begin
  FAlunos.TbAlunosDTNASC.Value := DTPNasc.Date;
end;

procedure TFEdAlunos.DBEdit52Enter(Sender: TObject);
begin
  try
    DTPIngresso.Date := FAlunos.TbAlunosDATAINGRESSO.Value;
  except
    DTPIngresso.Date := Date;
  end;
end;

procedure TFEdAlunos.DBEdit4Exit(Sender: TObject);
begin
  try
    DTPNasc.Date := FAlunos.TbAlunosDTNASC.Value;
  except
    DTPNasc.Date := Date;
  end;
end;

procedure TFEdAlunos.DTPDtNascPaiChange(Sender: TObject);
begin
  FAlunos.TbAlunosDTNASCPAI.Value := DTPDtNascPai.Date;
end;

procedure TFEdAlunos.DBEdit6Enter(Sender: TObject);
begin
  try
    DTPDtNascPai.Date := FAlunos.TbAlunosDTNASCPAI.Value;
  except
    DTPDtNascPai.Date := Date;
  end;
end;

procedure TFEdAlunos.DTPDtNascMaeChange(Sender: TObject);
begin
  FAlunos.TbAlunosDTNASCMAE.Value := DTPDtNascMae.Date;
end;

procedure TFEdAlunos.DBEdit31Enter(Sender: TObject);
begin
  try
    DTPDtNascMae.Date := FAlunos.TbAlunosDTNASCMAE.Value;
  except
    DTPDtNascMae.Date := Date;
  end;
end;

procedure TFEdAlunos.DTPDtAnivReChange(Sender: TObject);
begin
  FAlunos.TbAlunosDTNASCRESP.Value := DTPDtAnivRe.Date;
end;

procedure TFEdAlunos.DBEdit54Enter(Sender: TObject);
begin
  try
    DTPDtAnivRe.Date := FAlunos.TbAlunosDTNASCRESP.Value;
  except
    DTPDtAnivRe.Date := Date;
  end;
end;

procedure TFEdAlunos.DBLCBCidadePaiExit(Sender: TObject);
begin
  if FAlunos.TbAlunosCEPPAI.IsNull then begin
    FAlunos.QryProx.SQL.Text := 'select CEP from cidades where codcidade = '+ IntToStr(DBLCBCidadePai.KeyValue);
    FAlunos.QryProx.Open;
    FAlunos.TbAlunosCEPPAI.Value := FAlunos.QryProx.Fields[0].AsString;
    FAlunos.QryProx.Close;
  end;
end;

procedure TFEdAlunos.DBLCBCidadeMaeExit(Sender: TObject);
begin
  if FAlunos.TbAlunosCEPMAE.IsNull then begin
    FAlunos.QryProx.SQL.Text := 'select CEP from cidades where codcidade = '+ IntToStr(DBLCBCidadeMae.KeyValue);
    FAlunos.QryProx.Open;
    FAlunos.TbAlunosCEPMAE.Value := FAlunos.QryProx.Fields[0].AsString;
    FAlunos.QryProx.Close;
  end;
end;

procedure TFEdAlunos.DBLCBCidadeRespExit(Sender: TObject);
begin
  if FAlunos.TbAlunosCEPRESP.IsNull then begin
    FAlunos.QryProx.SQL.Text := 'select CEP from cidades where codcidade = '+ IntToStr(DBLCBCidadeResp.KeyValue);
    FAlunos.QryProx.Open;
    FAlunos.TbAlunosCEPRESP.Value := FAlunos.QryProx.Fields[0].AsString;
    FAlunos.QryProx.Close;
  end;
end;

procedure TFEdAlunos.DBEdit3Exit(Sender: TObject);
begin
  if FAlunos.TbAlunos.State in [dsInsert] then begin
    Tag := 0;
    FAlunos.QryProx.SQL.Text := 'select NOME from ALUNOS WHERE NOME = '''+ FAlunos.TbAlunosNOME.Value + '''';
    FAlunos.QryProx.Open;
    if not FAlunos.QryProx.IsEmpty then
      Tag := 1;
    FAlunos.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este aluno já existe no cadastro! Deseja realmente manter o aluno informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FAlunos.TbAlunosNOME.Clear;
  end;
end;

procedure TFEdAlunos.RGChamarChange(Sender: TObject);
begin
  Label26.Visible :=  RGChamar.ItemIndex = 4;
  DBEdit26.Visible := Label26.Visible;
  Label27.Visible := Label26.Visible;
  DBEdit27.Visible := Label26.Visible;
end;

procedure TFEdAlunos.RGAcidChange(Sender: TObject);
begin
  Label50.Visible := RGAcid.ItemIndex = 3;
  DBEdit49.Visible := Label50.Visible;
  Label30.Visible := Label50.Visible;
  DBMemo1.Visible := Label50.Visible;
end;

procedure TFEdAlunos.DBLCBBairroKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then
    if (sender = DBLCBBairro) or (sender = DBLCBBairroPai) or (sender = DBLCBBairroResp) then
      SBBairroPaiClick(SBBairroPai)
    else if (sender = DBLCBCidade) or (sender = DBLCBCidadePai) or (sender = DBLCBCidadeResp) then
      SBBairroPaiClick(SBCidadePai)
    else if sender = DBLCBTurma then
      SBBairroPaiClick(SBTurmas);
end;

end.
