unit UEdAcervo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdAcervo = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label6: TLabel;
    SBGeneros: TSpeedButton;
    DBEdit33: TDBEdit;
    DBLCBGenero: TDBLookupComboBox;
    Autores: TLabel;
    SBAutor1: TSpeedButton;
    DBEdit6: TDBEdit;
    DBLCBAutor: TDBLookupComboBox;
    Label7: TLabel;
    SBAutor2: TSpeedButton;
    DBEdit7: TDBEdit;
    DBLCBAutor2: TDBLookupComboBox;
    Label8: TLabel;
    SBAutor3: TSpeedButton;
    DBEdit8: TDBEdit;
    DBLCBAutor3: TDBLookupComboBox;
    Label9: TLabel;
    SBEditora: TSpeedButton;
    DBEdit9: TDBEdit;
    DBLCBEditora: TDBLookupComboBox;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure SBGenerosClick(Sender: TObject);
    procedure SBAutor3Click(Sender: TObject);
    procedure SBEditoraClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBLCBGeneroKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure LKTela;
  public
    { Public declarations }
  end;

var
  FEdAcervo: TFEdAcervo;

implementation

uses UAcervo, UDados, UGeneros, UAutores, UEditoras;

{$R *.dfm}

procedure TFEdAcervo.LKTela;
begin
  Dados.ConfTrans(True);
  Dados.QryGenerosLK.Open;
  Dados.QryAutoresLK.Open;
  Dados.QryEditorasLK.Open;
end;

procedure TFEdAcervo.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FAcervo.TbAcervo.Cancel;
      FAcervo.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdAcervo.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;


  if FAcervo.TbAcervoTITULO.IsNull then begin
    MessageDlg(cgEspNomeAcervo, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  if FAcervo.TbAcervoPRECO.IsNull then begin
    MessageDlg('Especifique o preço de compra!', mtWarning, [mbOk], 0);
    DBEdit5.SetFocus;
    exit;
  end;

  if DBLCBGenero.Text = '' then begin
    MessageDlg('Especifique o gênero do livro!', mtWarning, [mbOk], 0);
    DBLCBGenero.SetFocus;
    exit;
  end;

  if DBLCBEditora.Text = '' then begin
    MessageDlg('Especifique a editora do livro!', mtWarning, [mbOk], 0);
    DBLCBEditora.SetFocus;
    exit;
  end;

  if DBLCBAutor.Text = '' then begin
    MessageDlg('Especifique o autor do livro!', mtWarning, [mbOk], 0);
    DBLCBAutor.SetFocus;
    exit;
  end;

{ colocar nos itens
  if FAcervo.TbAcervoCODBARRAS.IsNull then begin
    MessageDlg('Especifique o código de barras do livro!', mtWarning, [mbOk], 0);
    DBEdit10.SetFocus;
    exit;
  end; }

  try
    FAcervo.TbAcervo.Post;
    FAcervo.ConfTrans(True);
  except
    FAcervo.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdAcervo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdAcervo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FAcervo.TbAcervo.State in [dsInsert, dsEdit]) then
    FAcervo.TbAcervo.Cancel;
end;

procedure TFEdAcervo.FormCreate(Sender: TObject);
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

procedure TFEdAcervo.SBGenerosClick(Sender: TObject);
begin
  if not VerificarPermissao('GÊNEROS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFGeneros, FGeneros);
    FGeneros.ShowModal;
  finally
    LKTela;
    FreeAndNil(FGeneros);
  end;
end;

procedure TFEdAcervo.SBAutor3Click(Sender: TObject);
begin
  if not VerificarPermissao('AUTORES', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFAutores, FAutores);
    FAutores.ShowModal;
  finally
    LKTela;
    FreeAndNil(FAutores);
  end;
end;

procedure TFEdAcervo.SBEditoraClick(Sender: TObject);
begin
  if not VerificarPermissao('EDITORAS', 'CONS', 1) then
    Exit;
  try
    Application.CreateForm(TFEditoras, FEditoras);
    FEditoras.ShowModal;
  finally
    LKTela;
    FreeAndNil(FEditoras);
  end;
end;

procedure TFEdAcervo.DBEdit2Exit(Sender: TObject);
begin
  if FAcervo.TbAcervo.State in [dsInsert] then begin
    Tag := 0;
    FAcervo.QryProx.SQL.Text := 'select TITULO from acervo WHERE TITULO = '''+ FAcervo.TbAcervoTITULO.Value + '''';
    FAcervo.QryProx.Open;
    if not FAcervo.QryProx.IsEmpty then
      Tag := 1;
    FAcervo.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este título já existe no cadastro! Deseja realmente manter o título informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FAcervo.TbAcervoTITULO.Clear;
  end;
end;

procedure TFEdAcervo.DBLCBGeneroKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '+') then begin
    if sender = DBLCBGenero then
      SBGenerosClick(nil)
    else if sender = DBLCBEditora then
      SBEditoraClick(nil)
    else if sender = DBLCBAutor then
      SBAutor3Click(nil)
    else if sender = DBLCBAutor2 then
      SBAutor3Click(nil)
    else if sender = DBLCBAutor3 then
      SBAutor3Click(nil);
  end;
end;

end.
