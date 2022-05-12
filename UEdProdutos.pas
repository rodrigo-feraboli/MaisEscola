unit UEdProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdProdutos = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label10: TLabel;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdProdutos: TFEdProdutos;

implementation

uses UProdutos, UDados;

{$R *.dfm}

procedure TFEdProdutos.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FProdutos.TbProdutos.Cancel;
      FProdutos.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdProdutos.SBGravarClick(Sender: TObject);
begin
  DBCheckBox1.SetFocus;
  if FProdutos.TbProdutosDESCRICAO.IsNull then begin
    MessageDlg(cgEspNomeProd, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  try
    FProdutos.TbProdutos.Post;
    FProdutos.ConfTrans(True);
  except
    FProdutos.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FProdutos.TbProdutos.State in [dsInsert, dsEdit]) then
    FProdutos.TbProdutos.Cancel;
end;

procedure TFEdProdutos.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar1.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFEdProdutos.DBEdit2Exit(Sender: TObject);
begin
  if FProdutos.TbProdutos.State in [dsInsert] then begin
    Tag := 0;
    FProdutos.QryProx.SQL.Text := 'select descricao from PRODUTOS WHERE descricao = '''+ FProdutos.TbProdutosDESCRICAO.Value + '''';
    FProdutos.QryProx.Open;
    if not FProdutos.QryProx.IsEmpty then
      Tag := 1;
    FProdutos.QryProx.Close;
    if Tag = 1 then
      if MessageDlg('Este produto já existe no cadastro! Deseja realmente manter o produto informado?', MtConfirmation, [mbYes, MbNo], 0) = IDNO then
        FProdutos.TbProdutosDESCRICAO.Clear;
  end;
end;

end.
