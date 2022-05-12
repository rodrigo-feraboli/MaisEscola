unit UEdTurmasLancaDias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ComCtrls, Grids, DBGrids, ExtCtrls,
  Mask, DB;

type
  TFEdTurmasLancaDias = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel3: TPanel;
    SBGravar: TSpeedButton;
    SBCancelar: TSpeedButton;
    StatusBar1: TStatusBar;
    DBText1: TDBText;
    Label5: TLabel;
    DTPIni: TDateTimePicker;
    DTPFin: TDateTimePicker;
    Label3: TLabel;
    EdNum: TEdit;
    procedure SBGravarClick(Sender: TObject);
    procedure EdNumChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEdTurmasLancaDias: TFEdTurmasLancaDias;

implementation

uses UTurmas, UDados, URefeicoes, DateUtils;

{$R *.dfm}


procedure TFEdTurmasLancaDias.SBGravarClick(Sender: TObject);
var
  vpData: Tdate;
  i: Smallint;
begin
  if DTPFin.Date < DTPIni.Date then begin
    MessageDlg('A data final não pode ser maior que a inicial!', mtWarning, [mbOK], 0);
    DTPIni.SetFocus;
    Exit;
  end;


  if MessageDlg('Tem certeza que deseja lançar os cardápios?', mtConfirmation, [mbYes, mbNo], 0) = IDYES then begin
    try
       vpData := DTPIni.Date;
       while vpdata <= DTPFin.Date do begin
         for i:= 1 to StrToInt(EdNum.text) do begin
           FTurmas.TbTurmasCardapiosItens.Append;
           FTurmas.TbTurmasCardapiosItensCODTURMA.Value := FTurmas.TbTurmasCODTURMA.Value;
           FTurmas.TbTurmasCardapiosItensDATA.Value := vpdata;
           FTurmas.TbTurmasCardapiosItensNROITEM.Value := i;
           FTurmas.TbTurmasCardapiosItens.Post;
         end;
         vpData := vpData + 1;
       end;
       MessageDlg('Cardápios lançados!', mtInformation, [mbOK], 0);
       FTurmas.ConfTrans(True);
    except
       MessageDlg('Erro ao lançar os cardápios!', mtWarning, [mbOK], 0);
       FTurmas.ConfTrans(False);
    end;
    Close;
  end;
end;

procedure TFEdTurmasLancaDias.EdNumChange(Sender: TObject);
begin
  try
    StrToInt(EdNum.Text);
  except
    EdNum.Clear;
  end;
end;

end.
