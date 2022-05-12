unit UBackUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ShellCtrls, ExtCtrls, Buttons, ShellApi, IniFiles,
  Grids, Outline, DirOutln, AbBase, AbBrowse, AbZBrows, AbZipper, AbZipKit,
  AbMeter, AbArcTyp, AbView, AbZView, AbUtils;

type
  TFBackUp = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    AbVCLMeterLink1: TAbVCLMeterLink;
    AbMeter1: TAbMeter;
    AbZipKit1: TAbZipKit;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBackUp: TFBackUp;

implementation

uses UDados, DB, USistema;

{$R *.dfm}

procedure TFBackUp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFBackUp.BitBtn1Click(Sender: TObject);
var
  vlIni : TIniFile;
  vlDataBase, vlPath: String;
  FileHandle: Integer;
begin
  SaveDialog1.FileName := 'BANCODADOS '+
      FormatDateTime('dd mm yyyy', Date) + ' '+ FormatDateTime('hh mm', Time)+'.zip';
  if not SaveDialog1.Execute then
    Exit;
//  Dados.TransactionLK.Active := False;
  Dados.CloseAll;
  vlPath := '';
  AbZipKit1.FileName := '';
  vlIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'MaisEscola.ini');
  vlDataBase := vlIni.ReadString('Config', 'Banco', '');

  try
    Cursor := crHourGlass;
    FileHandle :=  FileCreate(SaveDialog1.FileName);
    FileClose(FileHandle);
    AbZipKit1.Filename := SaveDialog1.Filename;
    vlPath := ExtractFilePath(vlDataBase);
    AbZipKit1.BaseDirectory := StringToOleStr(vlPath);
    try
      AbZipKit1.AddFiles('*.FDB', 0);
      AbZipKit1.Save;
    finally
      AbZipKit1.CloseArchive;
    end;
    Cursor := crDefault;
    MessageDlg('Banco de Dados copiado com sucesso!',mtInformation, [mbOk], 0);
  except
    MessageDlg('Erro ao copiar Banco de Dados - Verifique outro aplicativo está utilizando-o!',mtInformation, [mbOk], 0);
  end;

  Dados.Database.DatabaseName := vlDataBase;
  Dados.Database.Connected := True;
  Dados.TransactionLK.Active := true;
  Dados.Transaction.Active := true;
  Dados.TbConfig.Open;
  Close;

{var
  vlIni : TIniFile;
  vlDataBase, vlPath, vlNomeFile: String;
  FileHandle: Integer;
begin
  vlNomeFile := 'BANCODADOS '+
      FormatDateTime('dd mm yyyy', Date) + ' '+ FormatDateTime('hh mm', Time)+'.zip';
  SaveDialog1.FileName :=  vlNomeFile;

  if not FSistema.vpGerarBackUp then begin
    if not SaveDialog1.Execute then
      Exit;
  end;

  Dados.CloseAll;
  
  vlPath := '';
  AbZipKit1.FileName := '';
  vlIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'MaisEscola.ini');
  vlDataBase := vlIni.ReadString('Config', 'Banco', '');

  try
    Cursor := crHourGlass;
    FileHandle :=  FileCreate(SaveDialog1.FileName);
    FileClose(FileHandle);
    if not FSistema.vpGerarBackUp then

    // verificar para a tabela ficar aberta
      AbZipKit1.Filename := SaveDialog1.Filename
    else
      AbZipKit1.Filename := FSistema.vpPathBackUp + '\' + vlNomeFile;

    vlPath := ExtractFilePath(vlDataBase);
    AbZipKit1.BaseDirectory := StringToOleStr(vlPath);
    try
      AbZipKit1.AddFiles('*.FDB', 0 );
      AbZipKit1.Save;
    finally
      AbZipKit1.CloseArchive;
    end;

//  try
      Hint := ExtractFilePath(Application.ExeName);
//        DeleteFile(Hint + vlNomeFile);
//  except
//  end;
    Cursor := crDefault;
    MessageDlg(cgMsgBancoDadosCopy,mtInformation, [mbOk], 0);
  except
    MessageDlg(cgMsgBancoDadosError,mtInformation, [mbOk], 0);
  end;

  Dados.Database.DatabaseName := vlDataBase;
  Dados.Database.Connected := True;
  Dados.TransactionLK.Active := true;
  Dados.Transaction.Active := true;
  Dados.TbConfig.Open;
//  Close;
  if FSistema.vpGerarBackUp then begin
    FSistema.vpGerarBackUp := False;
//  FBackUp.Close;
    ModalResult := mrCancel;
  end; }

end;

procedure TFBackUp.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
   Close;
end;

procedure TFBackUp.FormCreate(Sender: TObject);
begin
  if not Dados.TbConfig.Active then
    Dados.TbConfig.Open;
  SaveDialog1.InitialDir := Dados.TbConfigPATHSAVEBACKUP.AsString;
  if not FSistema.vpGerarBackUp then
    ShowModal;
end;

procedure TFBackUp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1 then
    AbreAjuda;
end;

procedure TFBackUp.FormShow(Sender: TObject);
var
  i: integer;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then begin
      if (TPanel(Components[i]).Tag <> 1) then
        TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
    end;
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);    
  if FSistema.vpGerarBackUp then
    BitBtn1Click(nil);
end;

end.
