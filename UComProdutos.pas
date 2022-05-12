unit UComProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, ComCtrls;

type
  TFComProdutos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBLCBProduto: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar2: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SBCancelarClick(Sender: TObject);
    procedure DBLCBProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FComProdutos: TFComProdutos;

implementation

uses UCompras, UDados, UProdutos, DB;

{$R *.dfm}

procedure TFComProdutos.FormCreate(Sender: TObject);
var
  i: smallint;
begin
  Dados.AbreConfig;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TPanel) then
      TPanel(Components[i]).Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  StatusBar2.Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
  Color := StringToColor(Dados.TbConfigCORSISTEMA.Value);
end;

procedure TFComProdutos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFComProdutos.SBCancelarClick(Sender: TObject);
begin
//  
end;

procedure TFComProdutos.DBLCBProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = '+' then
    SpeedButton1Click(nil);    
end;

procedure TFComProdutos.SpeedButton1Click(Sender: TObject);
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

end.
