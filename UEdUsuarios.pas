unit UEdUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdUsuarios = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DBGrid1: TDBGrid;
    procedure SBCancelarClick(Sender: TObject);
    procedure SBGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdUsuarios: TFEdUsuarios;

implementation

uses UUsuarios, UDados;

{$R *.dfm}

procedure TFEdUsuarios.SBCancelarClick(Sender: TObject);
begin
  if MessageDlg(cgMsgCancel, mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
      FUsuarios.TbUsuarios.Cancel;
      FUsuarios.ConfTrans(False);
    except
      MessageDlg(cgMsgErroCancel, mtError, [mbOk], 0);
    end;
    Close;
  end;
end;

procedure TFEdUsuarios.SBGravarClick(Sender: TObject);
begin
  Panel3.SetFocus;
  if FUsuarios.TbUsuariosLOGIN.isNull then begin
    MessageDlg(cgEspLogUsu, mtWarning, [mbOk], 0);
    DBEdit2.SetFocus;
    exit;
  end;

  if FUsuarios.TbUsuariosSENHA.isNull then begin
    MessageDlg('Especifique a senha!', mtWarning, [mbOk], 0);
    DBEdit3.SetFocus;
    exit;
  end;

  try
    Tag := 0;
    if FUsuarios.TbUsuarios.State in [dsInsert] then
      Tag := 1;
    FUsuarios.TbUsuarios.Post;
    if Tag = 1 then
      FUsuarios.CopiarModulos;
    FUsuarios.ConfTrans(True);
  except
    FUsuarios.ConfTrans(False);
    MessageDlg(cgMsgErroPost, mtError, [mbOk], 0);
  end;

  Close;
end;

procedure TFEdUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    SBCancelarClick(nil);
end;

procedure TFEdUsuarios.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FUsuarios.TbUsuarios.State in [dsInsert, dsEdit]) then
    FUsuarios.TbUsuarios.Cancel;
end;

procedure TFEdUsuarios.FormCreate(Sender: TObject);
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

procedure TFEdUsuarios.DBGrid1CellClick(Column: TColumn);
procedure Cons;
begin
  if FUsuarios.TbUsuModulosNIVELCONS.Value = 'T' then
    FUsuarios.TbUsuModulosNIVELCONS.Value := 'F'
  else
    FUsuarios.TbUsuModulosNIVELCONS.Value := 'T';
end;
procedure Edi;
begin
  if FUsuarios.TbUsuModulosNIVELEDI.Value = 'T' then
    FUsuarios.TbUsuModulosNIVELEDI.Value := 'F'
  else
    FUsuarios.TbUsuModulosNIVELEDI.Value := 'T';
end;
procedure Exc;
begin
  if FUsuarios.TbUsuModulosNIVELEXC.Value = 'T' then
    FUsuarios.TbUsuModulosNIVELEXC.Value := 'F'
  else
    FUsuarios.TbUsuModulosNIVELEXC.Value := 'T';
end;
procedure Rel;
begin
  if FUsuarios.TbUsuModulosNIVELREL.Value = 'T' then
    FUsuarios.TbUsuModulosNIVELREL.Value := 'F'
  else
    FUsuarios.TbUsuModulosNIVELREL.Value := 'T';
end;
begin
//  if not (FUsuarios.TbUsuarios.State in [dsedit]) then
//    Exit;
  if not (FUsuarios.TbUsuModulos.State in [dsedit]) then
    FUsuarios.TbUsuModulos.Edit;
  if Column.Title.Caption = 'Consulta' then
    Cons
  else if Column.Title.Caption = 'Edição' then
    Edi
  else if Column.Title.Caption = 'Exclusão' then
    Exc
  else if Column.Title.Caption = 'Relatórios' then
    Rel;
end;

procedure TFEdUsuarios.DBGrid1Exit(Sender: TObject);
begin
  if FUsuarios.TbUsuModulos.State in [dsedit , dsinsert] then
    FUsuarios.TbUsuModulos.Post;
end;

procedure TFEdUsuarios.DBEdit2Exit(Sender: TObject);
begin
  if FUsuarios.TbUsuarios.State in [dsInsert] then begin
    Tag := 0;
    FUsuarios.QryProx.SQL.Text := 'select LOGIN from USUARIOS WHERE LOGIN = '''+ FUsuarios.TbUsuariosLOGIN.Value + '''';
    FUsuarios.QryProx.Open;
    if not FUsuarios.QryProx.IsEmpty then
      Tag := 1;
    FUsuarios.QryProx.Close;
    if Tag = 1 then begin
      MessageDlg('Este usuário já existe no cadastro! Informe outro usuário!', mtWarning, [MbOK], 0);
      FUsuarios.TbUsuariosLOGIN.Clear;
    end;
  end;
end;

end.
