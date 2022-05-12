unit USistema;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  ActnMan, ActnColorMaps, XPMan, DB, jpeg, DateUtils, IniFiles;

type
  TFSistema = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    ManutenesAH1: TMenuItem;
    ManutenesHZ1: TMenuItem;
    Relatrios1: TMenuItem;
    Sobre1: TMenuItem;
    Configuraes1: TMenuItem;
    N1: TMenuItem;
    CpiadeSegurana1: TMenuItem;
    Sair1: TMenuItem;
    Bairros1: TMenuItem;
    Cidades1: TMenuItem;
    Profissos1: TMenuItem;
    Doenas1: TMenuItem;
    Remdios1: TMenuItem;
    Principais1: TMenuItem;
    Alunos2: TMenuItem;
    Controle1: TMenuItem;
    EntradaSadaAlunos1: TMenuItem;
    EntradaSadaFuncionrios1: TMenuItem;
    Sistema1: TMenuItem;
    N2: TMenuItem;
    ChamadaMesnal1: TMenuItem;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    PnlAlunos: TPanel;
    LblAlunos: TLabel;
    PnlForn: TPanel;
    LblForn: TLabel;
    PnlAtas: TPanel;
    LblAtas: TLabel;
    PnlBackup: TPanel;
    LblBack: TLabel;
    PnlSair: TPanel;
    LblSair: TLabel;
    urmas1: TMenuItem;
    PnlProfe: TPanel;
    LblProf: TLabel;
    Usurios1: TMenuItem;
    DatasComemorativas1: TMenuItem;
    Estados1: TMenuItem;
    Fornecedores1: TMenuItem;
    Funcionrios2: TMenuItem;
    InventrioImobiliario1: TMenuItem;
    Alimentaes1: TMenuItem;
    EnviodeMalaDireta1: TMenuItem;
    Relatrios2: TMenuItem;
    AcervoLiterrio1: TMenuItem;
    Editoras1: TMenuItem;
    Autores1: TMenuItem;
    Disciplinas1: TMenuItem;
    Gneros1: TMenuItem;
    Produtos1: TMenuItem;
    Alergias1: TMenuItem;
    ipodeAtividade1: TMenuItem;
    Correspondncias1: TMenuItem;
    ratamentos1: TMenuItem;
    MovimentaodeEstoque1: TMenuItem;
    Consultas1: TMenuItem;
    Aniversarintes1: TMenuItem;
    Image1: TImage;
    SadasAntecipadas1: TMenuItem;
    Etiquetas1: TMenuItem;
    CondiesdePagamento1: TMenuItem;
    CFOP1: TMenuItem;
    Compras1: TMenuItem;
    ransportadoras1: TMenuItem;
    Administrativo1: TMenuItem;
    Matrculas1: TMenuItem;
    N3: TMenuItem;
    contasapagar1: TMenuItem;
    contasareceber1: TMenuItem;
    STUser: TStaticText;
    Bancos1: TMenuItem;
    CentrodeCustos1: TMenuItem;
    Cheques1: TMenuItem;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    procedure Configuraes1Click(Sender: TObject);
    procedure urmas1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Sair1Click(Sender: TObject);
    procedure Sistema1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CpiadeSegurana1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DatasComemorativas1Click(Sender: TObject);
    procedure Bairros1Click(Sender: TObject);
    procedure Doenas1Click(Sender: TObject);
    procedure Remdios1Click(Sender: TObject);
    procedure Profissos1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Alunos2Click(Sender: TObject);
    procedure Funcionrios2Click(Sender: TObject);
    procedure Alimentaes1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure EnviodeMalaDireta1Click(Sender: TObject);
    procedure AcervoLiterrio1Click(Sender: TObject);
    procedure Editoras1Click(Sender: TObject);
    procedure Autores1Click(Sender: TObject);
    procedure Disciplinas1Click(Sender: TObject);
    procedure Gneros1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Alergias1Click(Sender: TObject);
    procedure ipodeAtividade1Click(Sender: TObject);
    procedure Correspondncias1Click(Sender: TObject);
    procedure ratamentos1Click(Sender: TObject);
    procedure MovimentaodeEstoque1Click(Sender: TObject);
    procedure Aniversarintes1Click(Sender: TObject);
    procedure SadasAntecipadas1Click(Sender: TObject);
    procedure Etiquetas1Click(Sender: TObject);
    procedure CFOP1Click(Sender: TObject);
    procedure CondiesdePagamento1Click(Sender: TObject);
    procedure Compras1Click(Sender: TObject);
    procedure ransportadoras1Click(Sender: TObject);
    procedure contasapagar1Click(Sender: TObject);
    procedure contasareceber1Click(Sender: TObject);
    procedure Bancos1Click(Sender: TObject);
    procedure CentrodeCustos1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Cheques1Click(Sender: TObject);
  private
    { Private declarations }
    vpData, vpDataPrim:TDate;
  public
    { Public declarations }
    vpGerarBackUp: Boolean;
    vpPathBackUp: String;
  end;

var
  FSistema: TFSistema;

implementation

uses UConfig, UTurmas, UAbout, UDados, UUsuarios, UTelaIni, UBackUp,
  UDatasCom, UBairros, UDoencas, URemedios, UProfissoes, UEstados,
  UCidades, UAlunos, UFunc, URefeicoes, UGen, UMalaDireta,
  UAcervo, UEditoras, UAutores, UDisciplinas, UGeneros, UProdutos,
  UAlergias, UAtividades, UCorresp, UTrat, UMovEst, UAniv, Usaidas,
  UEtiquetas, UCFOP, UCondPgto, UCompras, UCPagar, UBancos, UCC, UCReceber,
  UCheques;

{$R *.dfm}

procedure TFSistema.Configuraes1Click(Sender: TObject);
var
  i: integer;
begin
  if not VerificarPermissao('CONFIGURAÇÕES DO SISTEMA', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFConfig, FConfig);
    Dados.TbConfig.Edit;
    FConfig.ShowModal;
  finally
    FreeAndNil(FConfig);
    StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
    Dados.AbreConfig;
    for i := 0 to ComponentCount - 1 do
      if (Components[i] is TPanel) then begin
        if (TPanel(Components[i]).Tag = 0) then begin
          TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
        end;
      end;
  end;
end;

procedure TFSistema.urmas1Click(Sender: TObject);
begin
  if not VerificarPermissao('TURMAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFTurmas, FTurmas);
    FTurmas.ShowModal;
  finally
    FreeAndNil(FTurmas);
  end;
end;

procedure TFSistema.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    Close;
end;

procedure TFSistema.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := MessageDlg(cgMsgFinalizaSis, mtConfirmation, [mbYes, MbNo], 0) = IDYES;
  if CanClose and (MessageDlg('Deseja gerar backup do Banco de Dados?',mtInformation, [mbYes, mbNo], 0) = IDYES) then
    CpiadeSegurana1Click(nil);
  if CanClose then begin
    close;
    Dados.OnDestroy(nil);
  end;
end;

procedure TFSistema.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TFSistema.Sistema1Click(Sender: TObject);
begin
  try
    Application.CreateForm(TFAbout, FAbout);
    FAbout.ShowModal;
  finally
    FreeAndNil(FAbout);
  end;
end;

procedure TFSistema.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  if (Screen.Height = 600) and (Screen.Width = 800) then begin
    PnlAlunos.Height := 68;
    LblAlunos.Top := 48;
    ClientHeight := 585;
    ClientWidth := 790;
  end else if (Screen.Height = 768) and (Screen.Width = 1024) then begin
    PnlAlunos.Height := 91;
    LblAlunos.Top := 73;
    ClientHeight := 753;
    ClientWidth := 1014;
  end else begin // Resolução máxima 1280 x 800
    PnlAlunos.Height := 95; // 102
    LblAlunos.Top := 81;// 87
    Top := 0;
    ClientHeight := 685;
    ClientWidth := 1270;
  end;
 // FSistema.Top := -150;

  PnlProfe.Height := PnlAlunos.Height;
  PnlForn.Height := PnlAlunos.Height;
  PnlAtas.Height := PnlAlunos.Height;
  PnlBackup.Height := PnlAlunos.Height;
  PnlSair.Height := PnlAlunos.Height;
  LblProf.Top := LblAlunos.Top;
  LblForn.Top := LblAlunos.Top;
  LblAtas.Top := LblAlunos.Top;
  LblBack.Top := LblAlunos.Top;
  LblSair.Top := LblAlunos.Top;


//  Dados.AbreConfig;

{    for i := 0 to ComponentCount - 1 do
      if (Components[i] is TPanel)  then
        TPanel(Components[i]).Color := );
    Color := StringToColor(Dados.QryAux.Fields[0].AsString);
    StatusBar1.Color := Color;
    LblNome.Caption := Dados.QryAux.Fields[1].AsString;  }



  Dados.QryAux.SQL.Text := 'SELECT CORSISTEMA, EMPRESA, VERSAO FROM CONFIG';
  Dados.QryAux.Open;

  Caption := Caption + '  Versão : '+ Dados.QryAux.Fields[2].AsString +' - '+ Dados.QryAux.Fields[1].AsString ;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then begin
      if (TPanel(Components[i]).Tag = 1) then
        TPanel(Components[i]).Caption := '';
      if (TPanel(Components[i]).Tag = 0) then
        TPanel(Components[i]).Color := StringToColor(Dados.QryAux.Fields[0].AsString);
    end;
  StatusBar1.Color := StringToColor(Dados.QryAux.Fields[0].AsString);

  Dados.QryAux.Close;
end;

procedure TFSistema.CpiadeSegurana1Click(Sender: TObject);
var
  vlf:TextFile;
  vlForm, vlPasta, vlArq: String;

  procedure Envia(Form:string);
  begin
    vlPasta := ExtractFilePath(Application.ExeName);
    vlArq := 'Formularos.txt';
    if not FileExists(vlPasta + vlArq) then
      FileCreate(vlPasta + vlArq);
    AssignFile(vlf, vlPasta + vlArq);
    Append(vlf);
    Writeln(vlf, FormatDateTime('dd/MM/yyy - hh:mm:ss', Now)+ ' - '+ Form);
    CloseFile(vlf);
    ShowMessage(Form);
  end;
begin
  // Testar todos os formulários na memória

{  vlForm := '';
  if FConfig <> nil then
    vlForm := vlForm + ' FConfig ';
  if FTurmas <> nil then
    vlForm := vlForm + ' FTurmas ';
  if FAbout <> nil then
    vlForm := vlForm + ' FAbout ';
  if Dados <> nil then
    vlForm := vlForm + ' FDados ';
  if FUsuarios <> nil then
    vlForm := vlForm + ' FUsuarios ';
  if FTelaIni <> nil then
    vlForm := vlForm + ' FTelaIni ';
  if FBackUp <> nil then
    vlForm := vlForm + ' FBackUp ';
  if FDatasCom <> nil then
    vlForm := vlForm + ' FDatasCom ';
  if FBairros <> nil then
    vlForm := vlForm + ' FBairros ';
  if FDoencas <> nil then
    vlForm := vlForm + ' FDoencas ';
  if FRemedios <> nil then
    vlForm := vlForm + ' FRemedios ';
  if FProfissoes <> nil then
    vlForm := vlForm + ' FProfissoes ';
  if FEstados <> nil then
    vlForm := vlForm + ' FEstados ';
  if FCidades <> nil then
    vlForm := vlForm + ' FCidades ';
  if FAlunos <> nil then
    vlForm := vlForm + ' FAlunos ';
  if FFunc <> nil then
    vlForm := vlForm + ' FFunc ';
  if FRefeicoes <> nil then
    vlForm := vlForm + ' FRefeicoes ';
  if FGen <> nil then
    vlForm := vlForm + ' FGen ';
  if FMalaDireta <> nil then
    vlForm := vlForm + ' FMalaDireta ';
  if FAcervo <> nil then
    vlForm := vlForm + ' FAcervo ';
  if FEditoras <> nil then
    vlForm := vlForm + ' FEditoras ';
  if FAutores <> nil then
    vlForm := vlForm + ' FAutores ';
  if FDisciplinas <> nil then
    vlForm := vlForm + ' FDisciplinas ';
  if FGeneros <> nil then
    vlForm := vlForm + ' FGeneros ';
  if FProdutos <> nil then
    vlForm := vlForm + ' FProdutos ';
  if FAlergias <> nil then
    vlForm := vlForm + ' FAlergias ';
  if FAtividades <> nil then
    vlForm := vlForm + ' FAtividades ';
  if FCorresp <> nil then
    vlForm := vlForm + ' FCorresp ';
  if FTrat <> nil then
    vlForm := vlForm + ' FTrat ';
  if FMovEst <> nil then
    vlForm := vlForm + ' FMovEst ';
  if FAniv <> nil then
    vlForm := vlForm + ' FAniv ';
  if Fsaidas <> nil then
    vlForm := vlForm + ' Fsaidas ';
  if FEtiquetas <> nil then
    vlForm := vlForm + ' FEtiquetas ';
  if FCFOP <> nil then
    vlForm := vlForm + ' FCFOP ';
  if FCondPgto <> nil then
    vlForm := vlForm + ' FCondPgto ';
  if FCompras <> nil then
    vlForm := vlForm + ' FCompras ';
  if FCPagar <> nil then
    vlForm := vlForm + ' FCPagar ';
  if FBancos <> nil then
    vlForm := vlForm + ' FBancos ';
  if FCC <> nil then
    vlForm := vlForm + ' FCC ';
  if FCReceber <> nil then
    vlForm := vlForm + ' FCReceber ';
  if vlForm <> '' then
    Envia(vlForm);   }
  Application.CreateForm(TFBackUp, FBackUp);
  FBackUp := nil;
end;

procedure TFSistema.Usurios1Click(Sender: TObject);
begin
  if not VerificarPermissao('USUÁRIOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFUsuarios, FUsuarios);
    FUsuarios.ShowModal;
  finally
    FreeAndNil(FUsuarios);
  end;
end;

procedure TFSistema.FormShow(Sender: TObject);
var
  vlIm: String;
  Ini : TIniFile;
begin
  FTelaIni.ClientHeight := 0;
  FTelaIni.ClientWidth := 0;
 // FTelaIni := nil;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'MaisEscola.ini');
  VlIm := Ini.ReadString('Config', 'Fundo', '');
  Image1.Picture.LoadFromFile(VlIm);
{  if dados.TbConfigDATAULTBACKUP.Value <> Date then begin
    vpPathBackUp := Dados.TbConfigPATHSAVEBACKUP.Value;
    Dados.TbConfig.Edit;
    Dados.TbConfigDATAULTBACKUP.Value := Date;
    Dados.TbConfig.Post;
    Dados.ConfTrans(True);
    vpGerarBackUp := True;
//    CpiadeSegurana1Click(nil);
{    if FBackUp <> nil then begin
      FBackUp.Close;
      FBackUp := nil;
//    end; 
    Application.CreateForm(TFBackUp, FBackUp);
//  FBackUp.Close;
    FBackUp := nil;
    vpGerarBackUp := False;
  end;}
  Dados.ExibirNivers;
  if not Dados.QryLogin.Active then
    Dados.QryLogin.Open;
  STUser.Caption := 'Usuário: '+ Dados.QryLoginLOGIN.Value;
end;

procedure TFSistema.DatasComemorativas1Click(Sender: TObject);
begin
  if not VerificarPermissao('DATAS COMEMORATIVAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFDatasCom, FDatasCom);
    FDatasCom.ShowModal;
  finally
    FreeAndNil(FDatasCom);
  end;
end;

procedure TFSistema.Bairros1Click(Sender: TObject);
begin
  if not VerificarPermissao('BAIRROS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFBairros, FBairros);
    FBairros.ShowModal;
  finally
    FreeAndNil(FBairros);
  end;
end;

procedure TFSistema.Doenas1Click(Sender: TObject);
begin
  if not VerificarPermissao('DOENÇAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFDoencas, FDoencas);
    FDoencas.ShowModal;
  finally
    FreeAndNil(FDoencas);
  end;
end;

procedure TFSistema.Remdios1Click(Sender: TObject);
begin

  if not VerificarPermissao('REMÉDIOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFRemedios, FRemedios);
    FRemedios.ShowModal;
  finally
    FreeAndNil(FRemedios);
  end;

end;

procedure TFSistema.Profissos1Click(Sender: TObject);
begin
  if not VerificarPermissao('PROFISSÕES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFProfissoes, FProfissoes);
    FProfissoes.ShowModal;
  finally
    FreeAndNil(FProfissoes);
  end;
end;

procedure TFSistema.Estados1Click(Sender: TObject);
begin
  if not VerificarPermissao('ESTADOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFEstados, FEstados);
    FEstados.ShowModal;
  finally
    FreeAndNil(FEstados);
  end;
end;

procedure TFSistema.Cidades1Click(Sender: TObject);
begin
  if not VerificarPermissao('CIDADES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCidades, FCidades);
    FCidades.ShowModal;
  finally
    FreeAndNil(FCidades)
  end;
end;

procedure TFSistema.Alunos2Click(Sender: TObject);
begin
  if not VerificarPermissao('ALUNOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFAlunos, FAlunos);
    FAlunos.ShowModal;
  finally
    FreeAndNil(FAlunos);
    Dados.ExibirNivers;
  end;

end;

procedure TFSistema.Funcionrios2Click(Sender: TObject);
begin
  if not VerificarPermissao('FUNCIONÁRIOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFFunc, FFunc);
    FFunc.ShowModal;
  finally
    FreeAndNil(FFunc);
    Dados.ExibirNivers;
  end;
end;

procedure TFSistema.Alimentaes1Click(Sender: TObject);
begin
  if not VerificarPermissao('REFEIÇÕES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFRefeicoes, FRefeicoes);
    FRefeicoes.ShowModal;
  finally
    FreeAndNil(FRefeicoes);
  end;
end;

procedure TFSistema.Fornecedores1Click(Sender: TObject);
begin
  if not VerificarPermissao('FORNECEDORES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFGen, FGen);
    FGen.Caption := 'Cadastro de Fornecedores';
    FGen.SBBusca.Hint := 'Busca Avançada de Fornecedores';
    FGen.ShowModal;
  finally
    FreeAndNil(FGen);
    Dados.ExibirNivers;
  end;
end;

procedure TFSistema.EnviodeMalaDireta1Click(Sender: TObject);
begin
  if not VerificarPermissao('ENVIO DE EMAILS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFMalaDireta, FMalaDireta);
    FMalaDireta.ShowModal;
  finally
    FreeAndNil(FMalaDireta);
  end;

end;

procedure TFSistema.AcervoLiterrio1Click(Sender: TObject);
begin
  if not VerificarPermissao('ACERVO LITERÁRIO', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFAcervo, FAcervo);
    FAcervo.ShowModal;
  finally
    FreeAndNil(FAcervo);
  end;
end;

procedure TFSistema.Editoras1Click(Sender: TObject);
begin
  if not VerificarPermissao('EDITORAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFEditoras, FEditoras);
    FEditoras.ShowModal;
  finally
    FreeAndNil(FEditoras);
  end;
end;

procedure TFSistema.Autores1Click(Sender: TObject);
begin
  if not VerificarPermissao('AUTORES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFAutores, FAutores);
    FAutores.ShowModal;
  finally
    FreeAndNil(FAutores);
  end;
end;

procedure TFSistema.Disciplinas1Click(Sender: TObject);
begin
  if not VerificarPermissao('DISCIPLINAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFDisciplinas, FDisciplinas);
    FDisciplinas.ShowModal;
  finally
    FreeAndNil(FDisciplinas);
  end;
end;

procedure TFSistema.Gneros1Click(Sender: TObject);
begin
  if not VerificarPermissao('GÊNEROS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFGeneros, FGeneros);
    FGeneros.ShowModal;
  finally
    FreeAndNil(FGeneros);
  end;
end;

procedure TFSistema.Produtos1Click(Sender: TObject);
begin
  if not VerificarPermissao('PRODUTOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFProdutos, FProdutos);
    FProdutos.ShowModal;
  finally
    FreeAndNil(FProdutos);
  end;
end;

procedure TFSistema.Alergias1Click(Sender: TObject);
begin
  if not VerificarPermissao('ALERGIAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFAlergias, FAlergias);
    FAlergias.ShowModal;
  finally
    FreeAndNil(FAlergias);
  end;
end;

procedure TFSistema.ipodeAtividade1Click(Sender: TObject);
begin
  if not VerificarPermissao('ATIVIDADES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFAtividades, FAtividades);
    FAtividades.ShowModal;
  finally
    FreeAndNil(FAtividades);
  end;
end;

procedure TFSistema.Correspondncias1Click(Sender: TObject);
begin
  if not VerificarPermissao('CORRESPONDÊNCIAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCorresp, FCorresp);
    FCorresp.ShowModal;
  finally
    FreeAndNil(FCorresp);
  end;    
end;

procedure TFSistema.ratamentos1Click(Sender: TObject);
begin
  if not VerificarPermissao('TRATAMENTOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFTrat, FTrat);
    FTrat.ShowModal;
  finally
    FreeAndNil(FTrat);
  end;
end;

procedure TFSistema.MovimentaodeEstoque1Click(Sender: TObject);
begin
  if not VerificarPermissao('MOVIMENTAÇÃO DE ESTOQUE', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFMovEst, FMovEst);
    FMovEst.ShowModal;
  finally
    FreeAndNil(FMovEst);
  end;
end;

procedure TFSistema.Aniversarintes1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONSULTA A ANIVERSARIANTES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFAniv, FAniv);
    FAniv.ShowModal;
  finally
    FreeAndNil(FAniv);
  end;
end;

procedure TFSistema.SadasAntecipadas1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONSULTA A SAÍDAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFSaidas, FSaidas);
    FSaidas.ShowModal;
  finally
    FreeAndNil(FSaidas);
  end;                 
end;

procedure TFSistema.Etiquetas1Click(Sender: TObject);
begin
  if not VerificarPermissao('GERAÇÃO DE ETIQUETAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFEtiquetas, FEtiquetas);
    FEtiquetas.ShowModal;
  finally
    FreeAndNil(FEtiquetas);
  end;
end;

procedure TFSistema.CFOP1Click(Sender: TObject);
begin
  if not VerificarPermissao('CFOP', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCFOP, FCFOP);
    FCFOP.ShowModal;
  finally
    FreeAndNil(FCFOP);
  end;
end;

procedure TFSistema.CondiesdePagamento1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONDIÇÕES DE PAGAMENTO', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCondPgto, FCondPgto);
    FCondPgto.ShowModal;
  finally
    FreeAndNil(FCondPgto);
  end;
end;

procedure TFSistema.Compras1Click(Sender: TObject);
begin
  if not VerificarPermissao('COMPRAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCompras, FCompras);
    FCompras.ShowModal;
  finally
    FreeAndNil(FCompras);
  end;
end;

procedure TFSistema.ransportadoras1Click(Sender: TObject);
begin
  if not VerificarPermissao('TRANSPORTADORAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFGen, FGen);
    FGen.Caption := 'Cadastro de Transportadoras';
    FGen.SBBusca.Hint := 'Busca Avançada de Transportadoras';
    FGen.ShowModal;
  finally
    FreeAndNil(FGen);
  end;
end;

procedure TFSistema.contasapagar1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A PAGAR', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCPagar, FCPagar);
    FCPagar.ShowModal;
  finally
    FreeAndNil(FCPagar);
  end;
end;

procedure TFSistema.contasareceber1Click(Sender: TObject);
begin
  if not VerificarPermissao('CONTAS A RECEBER', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCReceber, FCReceber);
    FCReceber.ShowModal;
  finally
    FreeAndNil(FCReceber);
  end; 
end;

procedure TFSistema.Bancos1Click(Sender: TObject);
begin
  if not VerificarPermissao('BANCOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFBancos, FBancos);
    FBancos.ShowModal;
  finally
    FreeAndNil(FBancos);
  end;
end;

procedure TFSistema.CentrodeCustos1Click(Sender: TObject);
begin
  if not VerificarPermissao('CENTRO DE CUSTOS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCC, FCC);
    FCC.ShowModal;
  finally
    FreeAndNil(FCC);
  end;
end;

procedure TFSistema.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_F1 then
    AbreAjuda;
end;

procedure TFSistema.Cheques1Click(Sender: TObject);
begin
// CHEQUES NO BANCO
  if not VerificarPermissao('CHEQUES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFCheques, FCheques);
    FCheques.ShowModal;
  finally
    FreeAndNil(FCheques);
  end;
end;

end.
