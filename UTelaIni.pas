unit UTelaIni;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, ExtCtrls, jpeg, IniFiles, DateUtils, Registry;

type
  TFTelaIni = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    PBTot: TProgressBar;
    LblVersao: TLabel;
    Image1: TImage;
    SBSair: TSpeedButton;
    SBEntrar: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    EdLogin: TEdit;
    EdSenha: TEdit;
    SBLimpar: TSpeedButton;
    LblNome: TLabel;
    StatusBar1: TStatusBar;
    PnlRegistro: TPanel;
    Label3: TLabel;
    EdRegistro: TEdit;
    PBParc: TProgressBar;
    LblEtapa: TLabel;
    procedure SBLimparClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure EdRegistroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vlRegistro: String;
    vlErro: Boolean;
    procedure Registro(plDiaVcto: TDate);
    function VerifReg: Boolean;
  public
    { Public declarations }
  end;

var
  FTelaIni: TFTelaIni;

implementation

uses UDados, USistema;

{$R *.dfm}

function TFTelaIni.VerifReg: Boolean;
var
  Reg : TRegistry;
  vlData, vlDataC, vlDataAux: TDate;
begin
  Result := False;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('\SOFTWARE', True);
  if Reg.KeyExists('\VINHEDOS SISTEMAS') then
    Reg.CreateKey('\VINHEDOS SISTEMAS');
  Reg.OpenKey('\VINHEDOS SISTEMAS', True);
  try
    vlData := Reg.ReadDate('VDR');
    vlDataC := Reg.ReadDate('CDR');
  except
    Reg.Destroy;
    Result := True;
    Exit;
  end;

{  vlDataAux := Date;
  if (vlDataAux < VlDataC) or (vlData < vlDataAux) or (vlData - Date <= 0) then begin
    Reg.Destroy;
    Result := True;
    Exit;
  end;

  if (vlData - Date > 0) and (vlData - Date < 16)  then begin
    if MessageDlg('Falta(m) '+ IntToStr(DaysBetween(vlData, Date)) +' dias para informar o novo registro! Deseja informar agora?', mtConfirmation,
      [mbYes, MbNo], 0) = IDYes then
      Result := True;
  end; }
  Reg.Destroy;
end;

procedure TFTelaIni.Registro(plDiaVcto: TDate);
var
  Reg : TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CURRENT_USER;
  Reg.OpenKey('\SOFTWARE', True);
  if Reg.KeyExists('\VINHEDOS SISTEMAS') then
    Reg.CreateKey('\VINHEDOS SISTEMAS');
  Reg.OpenKey('\VINHEDOS SISTEMAS', True);
  if plDiaVcto > 0 then
    Reg.WriteDate('VDR', plDiaVcto);
  Reg.WriteDate('CDR', Date);
  Reg.CloseKey;
  Reg.Destroy;
end;

procedure TFTelaIni.SBLimparClick(Sender: TObject);
begin
  if sender = SBLimpar then begin
    EdLogin.Clear;
    EdSenha.Clear;
  end else if sender = SBSair then begin
    try
      Dados.OnDestroy(nil);
      Dados.Free;
      Application.Terminate;
    except
    end;
  end else begin 
    if EdLogin.Text = '' then begin
      MessageDlg(cgMsgEspLogin, mtWarning, [MbOk], 0);
      EdLogin.SetFocus;
    end else if EdSenha.Text = '' then begin
      MessageDlg(cgMsgEspSenha, mtWarning, [MbOk], 0);
      EdSenha.SetFocus;
    end else begin
      Dados.QryLogin.Close;
      Dados.QryLogin.SQL.Text := 'select codusuario, login, senha from usuarios where login = :pllogin';
      Dados.QryLogin.ParamByName('pllogin').AsString := EdLogin.Text;
      Dados.QryLogin.Prepare;
      Dados.QryLogin.Open;
      if (Dados.QryLogin.IsEmpty) or (EdSenha.Text <> Dados.QryLogin.FieldByName('senha').AsString) then begin
        MessageDlg(cgMsgEspLoginSenha, mtWarning, [MbOk], 0);
        Dados.ControleAcesso('ACESSO AO SISTEMA NEGADO - L: '+ EdLogin.Text +' - S: '+ EdSenha.Text , 'ACES', False);
        EdLogin.SetFocus;
      end else if EdSenha.Text = Dados.QryLogin.FieldByName('senha').AsString then begin
        Application.CreateForm(TFSistema, FSistema);
        Dados.ControleAcesso('ACESSO AO SISTEMA', 'AC', True);
        EdLogin.Enabled := False;
        EdSenha.Enabled := False;
        SBSair.Enabled := False;
        SBLimpar.Enabled := False;
        SBEntrar.Enabled := False;
        Dados.Atualizacoes;
        FSistema.ShowModal;
      end;
    end;
  end;
end;

procedure TFTelaIni.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((key = VK_F4) and (Shift = [ssAlt])) or (Key = 27) then
    SBLimparClick(SBSair)
end;

procedure TFTelaIni.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FTelaIni.Free;
  FTelaIni := nil;
end;

procedure TFTelaIni.FormCreate(Sender: TObject);
var
  i, vlQtdeC, vlSemanaAno, vlDiaDaSemana, vlDiaMes, vlSoma, vlSoma2, vlSomaAux: smallint;
  vlDataBase, vlDtAtual, vlNomeVol, vlSisArq, vlDrive, vlSerial, vlRegInfo, vlPrim, vlSec, vlTQQ, vlSexta, VlSO, vlDias,
  vlPrimL, vlVerif: String;
  Ini : TIniFile;
  vlNS, vlTM, vlFgs : DWord;
  vlDtMod, vlDtAct, vlNSI : LongInt;
  vlDt: TDateTime;
  vlLenght, vlLenght2: Integer;
  vlData: TDate;
begin
  vlDrive := ExtractFileDrive(ExtractFilePath(Application.ExeName)) + '\';
  vlDtAct := Trunc(Now);
  SetLength(vlNomeVol, 255);
  SetLength(vlSisArq, 255);
  GetVolumeInformation( pchar(vlDrive), pchar(vlNomeVol), 255,
    @vlNS, vlTM, vlFgs, pchar(vlSisArq), 255);
  vlSerial := IntToHex(vlNS, 8);

//  vlDataBase := '11/08/2008';
//  vlDtAtual := DateToStr(Date);
  // verifica se tem registro
{  if (vlDtAtual > vlDataBase) then  begin
    MessageDlg('Licença expirada para rodar o sistema neste computador! O Sistema será encerrado!', mtWarning, [mbOk], 0);
    Application.Terminate;
    Exit;
  end;}
  

{  if (vlSerial <> '64869758') NOTEBOOK RODRIGO EM E:
    and (vlSerial <> 'C8608A5E') NOTEBOOK RODRIGO EM D:
    and (vlSerial <> 'F471F866') NOTEBOOK EM C:
    and (vlSerial <> 'CC509CB9')  then begin PINGUINHO DE GENTE C:
    MessageDlg('Sem licença para rodar o sistema neste computador! O Sistema será encerrado!', mtWarning, [mbOk], 0);
    Application.Terminate;
    Exit;
  end; }
  
  // verifica se o MaisEscola.ini existe
  if not FileExists(ExtractFilePath(Application.ExeName)+'MaisEscola.ini') then begin
    MessageDlg('Sem arquivo MaisEscola.ini na pasta do sistema! O Sistema será encerrado!', mtWarning, [mbOk], 0);
    vlErro := true;
    Application.Terminate;
    Exit;
  end;
  // verifica se o banco existe 
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'MaisEscola.ini');
  vlDataBase := Ini.ReadString('Config', 'Banco', '');
  if not FileExists(vlDataBase) then begin
    MessageDlg('Sem arquivo de banco de dados, verifique o arquivo MaisEscola.ini! O Sistema será encerrado!', mtWarning, [mbOk], 0);
    vlErro := true;
    Application.Terminate;
    Exit;
  end;

  Application.HelpFile := Ini.ReadString('Config', 'Help', '');
  Ini.Free;


  if Dados = nil then
    Application.CreateForm(TDados, Dados);

//  Dados.Atualizacoes;

{  Dados.TbConfig.Open;
  Dados.TbConfig.Edit;
  Dados.TbConfigVERSAO.Value := cgVersao;
  Dados.TbConfig.Post;
  Dados.ConfTrans(True);
  Dados.TbConfig.Open;}

//  vlNome := LblNome.Caption;
  vlQtdeC := Length(LblNome.Caption);
  Tag := vlQtdeC;
  i := 60 - (StrToInt(FormatDateTime('ss', Now)));
  vlQtdeC := vlQtdeC + i;
  // Obter Número a ser passado

  Tag := vlQtdeC;
  vlPrimL := Copy(LblNome.Caption, 1, 1);
  vlDrive := 'C:\';
  SetLength(vlNomeVol, 255);
  SetLength(vlSisArq, 255);
  GetVolumeInformation( pchar(vlDrive), pchar(vlNomeVol), 255,
    @vlNS, vlTM, vlFgs, pchar(vlSisArq), 255);
  VlSerial :=  IntToStr(vlNS);
  vlLenght := Length(VlSerial );
  vlSoma := 0;
  for i := 1 to vlLenght do
    vlSoma := vlSoma + StrToInt(Copy(VlSerial, i, 1));
  vlSemanaAno := WeekOfTheYear(Date);
  vlDiaDaSemana := DayOfTheWeek(Date);
  case vlDiaDaSemana of
    1: Hint:= 'M';
    2: Hint:= 'A';
    3: Hint:= 'I';
    4: Hint:= 'S';
    5: Hint:= 'T';
    6: Hint:= 'E';
    7: Hint:= 'L';
  end;
  EdRegistro.Text :=  FormatFloat('00',vlQtdeC) + vlPrimL +
    FormatFloat('00', vlSoma)+ FormatFloat('00', vlSemanaAno)+ Hint;
  vlRegistro := EdRegistro.Text;

//  Dados.Atualizacoes;
//  Testar Registro .... e se necess[ario exibir painel
{ if VerifReg then begin
    Panel1.Enabled := False;
    PnlRegistro.Top := 32;
    PnlRegistro.Left := 173;
    PnlRegistro.Visible := True;
  end; }

end;

procedure TFTelaIni.EdRegistroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: smallint;
  vlRegInfo, vlPrim, vlSec, vlTQQ, vlSS, vlOitava, vlDias, vlDiasAux: String;
begin
  Tag := 0;
  if Key = 13 then begin
    try
      vlRegInfo := vlRegistro;
      case StrToInt(Copy(vlRegInfo, 1, 2)) of
        1..5: Hint:= 'A';
        6..10: Hint:= 'N';
        11..15: Hint:= 'C';
        16..20: Hint:= 'D';
        21..25: Hint:= 'E';
        26..30: Hint:= 'F';
        31..35: Hint:= 'G';
        36..40: Hint:= 'H';
        41..45: Hint:= 'I';
        46..50: Hint:= 'J';
        51..55: Hint:= 'L';
        56..60: Hint:= 'M';
        61..65: Hint:= 'N';
        66..70: Hint:= 'O';
        71..75: Hint:= 'P';
        76..80: Hint:= 'R';
        81..85: Hint:= 'S';
        86..90: Hint:= 'T';
        91..95: Hint:= 'U';
        96..100: Hint:= 'V';
        0: Hint := 'Z';
      end;
      vlPrim := Hint;
      Hint :=  Copy(vlRegInfo, 3, 1);
      if (Copy(vlRegInfo, 3, 1) >= 'A') and (Copy(vlRegInfo, 3, 1) <= 'D') then
        vlSec := 'J'
      else  if (Copy(vlRegInfo, 3, 1) >= 'E') and (Copy(vlRegInfo, 3, 1) <= 'H') then
        vlSec := 'G'
      else  if (Copy(vlRegInfo, 3, 1) >= 'I') and (Copy(vlRegInfo, 3, 1) <= 'O') then
        vlSec := 'K'
      else  if (Copy(vlRegInfo, 3, 1) >= 'P') and (Copy(vlRegInfo, 3, 1) <= 'T') then
        vlSec := 'T'
      else
        vlSec := 'Y';

    // Descobrir número de dias
      vlDias := '';
      for i:= 1 to 3 do begin
        if (Copy(EdRegistro.Text, i + 2, 1)) = 'E' then
          vlDias := vlDias + '0'
        else if (Copy(EdRegistro.Text, i + 2, 1)) = 'U' then
          vlDias := vlDias + '1'
        else if (Copy(EdRegistro.Text, i + 2, 1)) = 'A' then
          vlDias := vlDias + '2'
        else if (Copy(EdRegistro.Text, i + 2, 1)) = 'I' then
          vlDias := vlDias + '3'
        else if (Copy(EdRegistro.Text, i + 2, 1)) = 'O' then
          vlDias := vlDias + '4'
        else if (Copy(EdRegistro.Text, i + 2, 1)) = 'T' then
          vlDias := vlDias + '5'
        else if (Copy(EdRegistro.Text, i + 2, 1)) = 'R' then
          vlDias := vlDias + '6'
        else if (Copy(EdRegistro.Text, i + 2, 1)) = 'L' then
          vlDias := vlDias + '7'
        else if (Copy(EdRegistro.Text, i + 2, 1)) = 'S' then
          vlDias := vlDias + '8'
        else if (Copy(EdRegistro.Text, i + 2, 1)) = 'M' then
          vlDias := vlDias + '9';
      end;
      vlDiasAux := '';
      for i:= 1 to 3 do begin
        case StrToInt(Copy(vlDias, i, 1)) of
          0: vlDiasAux := vlDiasAux + 'E';
          1: vlDiasAux := vlDiasAux + 'U';
          2: vlDiasAux := vlDiasAux + 'A';
          3: vlDiasAux := vlDiasAux + 'I';
          4: vlDiasAux := vlDiasAux + 'O';
          5: vlDiasAux := vlDiasAux + 'T';
          6: vlDiasAux := vlDiasAux + 'R';
          7: vlDiasAux := vlDiasAux + 'L';
          8: vlDiasAux := vlDiasAux + 'S';
          9: vlDiasAux := vlDiasAux + 'M';
        end;
      end;

      vlTQQ := vlDiasAux;
      Tag := DayOfTheMonth(Date) + MonthOf(Date);
      Tag := Tag + StrToInt(FormatDateTime('yy', Now)) - StrToInt(FormatDateTime('dd', Now)) + StrToInt(FormatDateTime('mm', Now));
      vlSS := FormatFloat('00', Tag);

      if Copy(vlDiasAux, 3, 1) = 'E' then
        vlOitava := '9'
      else if Copy(vlDiasAux, 3, 1) = 'U' then
        vlOitava := '8'
      else if Copy(vlDiasAux, 3, 1) = 'A' then
        vlOitava := '7'
      else if Copy(vlDiasAux, 3, 1) = 'I' then
        vlOitava := '6'
      else if Copy(vlDiasAux, 3, 1) = 'O' then
        vlOitava := '5'
      else if Copy(vlDiasAux, 3, 1) = 'T' then
        vlOitava := '4'
      else if Copy(vlDiasAux, 3, 1) = 'R' then
        vlOitava := '3'
      else if Copy(vlDiasAux, 3, 1) = 'L' then
        vlOitava := '2'
      else if Copy(vlDiasAux, 3, 1) = 'S' then
        vlOitava := '1'
      else if Copy(vlDiasAux, 3, 1) = 'M' then
        vlOitava := '0';

      Hint := (vlPrim + vlSec + vlTQQ + vlSS + vlOitava );

  //    Hint := vlDias;
      if EdRegistro.Text = Hint then begin
        Registro(Date + StrToInt(vlDias));
        Panel1.Enabled := True;
        PnlRegistro]Visible := False;
        ShowMessage('Registro atualizado sucesso!');
        Tag := 1;
      end else
        ShowMessage('Erro ao informar registro, verifique novamente!');
        EdRegistro.Text := vlRegistro;
    except
      EdRegistro.Clear;
    end;
    if Tag <> 1 then
      ShowMessage('Erro ao informar registro, verifique novamente!');
    EdRegistro.Text := vlRegistro;
  end;
end;

procedure TFTelaIni.FormShow(Sender: TObject);
var
  i: smallint;
begin
  if not vlErro then begin
    Dados.QryAux.SQL.Text := 'SELECT CORSISTEMA, EMPRESA FROM CONFIG';
    Dados.QryAux.Open;
    for i := 0 to ComponentCount - 1 do
      if (Components[i] is TPanel)  then
        TPanel(Components[i]).Color := StringToColor(Dados.QryAux.Fields[0].AsString);
    Color := StringToColor(Dados.QryAux.Fields[0].AsString);
    StatusBar1.Color := Color;
    LblNome.Caption := Dados.QryAux.Fields[1].AsString;
    Dados.QryAux.Close;
  end;
end;

end.
