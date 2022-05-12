object FBaixaCarne: TFBaixaCarne
  Left = 225
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Baixa de Carn'#234
  ClientHeight = 259
  ClientWidth = 299
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Prosseguir: TSpeedButton
    Left = 34
    Top = 216
    Width = 105
    Height = 22
    Caption = 'Prosseguir'
    Flat = True
    OnClick = ProsseguirClick
  end
  object SpeedButton1: TSpeedButton
    Left = 162
    Top = 216
    Width = 105
    Height = 22
    Caption = 'Voltar'
    Flat = True
    OnClick = ProsseguirClick
  end
  object Label1: TLabel
    Left = 54
    Top = 17
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Prev. Vcto.'
  end
  object Label2: TLabel
    Left = 53
    Top = 88
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Pagamento'
  end
  object Label3: TLabel
    Left = 107
    Top = 120
    Width = 26
    Height = 13
    Alignment = taRightJustify
    Caption = 'Multa'
  end
  object Label4: TLabel
    Left = 69
    Top = 184
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = 'Total a Pagar'
  end
  object SpeedButton2: TSpeedButton
    Left = 237
    Top = 116
    Width = 23
    Height = 55
    Caption = 'C'
    Flat = True
    OnClick = SpeedButton2Click
  end
  object Label5: TLabel
    Left = 175
    Top = 120
    Width = 8
    Height = 13
    Caption = '%'
  end
  object DBEdit1: TDBText
    Left = 142
    Top = 17
    Width = 115
    Height = 13
    DataField = 'DTVCTO'
    DataSource = FAlunos.DSAlunosCarne
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 87
    Top = 152
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Desconto'
  end
  object Label8: TLabel
    Left = 175
    Top = 152
    Width = 8
    Height = 13
    Caption = '%'
  end
  object Label9: TLabel
    Left = 56
    Top = 49
    Width = 77
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor Orig. Parc.'
  end
  object DBText1: TDBText
    Left = 142
    Top = 49
    Width = 115
    Height = 13
    DataField = 'VALOR'
    DataSource = FAlunos.DSAlunosCarne
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DTPPgto: TDateTimePicker
    Left = 138
    Top = 84
    Width = 102
    Height = 21
    Date = 39262.429867615740000000
    Time = 39262.429867615740000000
    TabOrder = 7
    OnChange = DTPPgtoChange
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 240
    Width = 299
    Height = 19
    Color = 2025694
    Panels = <
      item
        Alignment = taCenter
        Text = 'Esc - Sair'
        Width = 110
      end>
  end
  object DBEdit2: TDBEdit
    Left = 141
    Top = 87
    Width = 80
    Height = 15
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    DataField = 'DTPGTO'
    DataSource = FAlunos.DSAlunosCarne
    TabOrder = 0
    OnChange = DBEdit2Change
    OnExit = DBEdit2Exit
  end
  object DBEdit3: TDBEdit
    Left = 139
    Top = 116
    Width = 32
    Height = 21
    DataField = 'PERCMULTA'
    DataSource = FAlunos.DSAlunosCarne
    TabOrder = 1
    OnChange = DBEdit3Change
  end
  object DBEdit4: TDBEdit
    Left = 139
    Top = 180
    Width = 121
    Height = 21
    DataField = 'VALORPAGO'
    DataSource = FAlunos.DSAlunosCarne
    TabOrder = 5
  end
  object DBEdit5: TDBEdit
    Left = 190
    Top = 116
    Width = 46
    Height = 21
    DataField = 'VALORMULTA'
    DataSource = FAlunos.DSAlunosCarne
    TabOrder = 2
    OnChange = DBEdit5Change
  end
  object DBEdit7: TDBEdit
    Left = 139
    Top = 148
    Width = 32
    Height = 21
    DataField = 'PERCDESC'
    DataSource = FAlunos.DSAlunosCarne
    TabOrder = 3
    OnChange = DBEdit7Change
  end
  object DBEdit8: TDBEdit
    Left = 190
    Top = 148
    Width = 46
    Height = 21
    DataField = 'VALORDESC'
    DataSource = FAlunos.DSAlunosCarne
    TabOrder = 4
    OnChange = DBEdit5Change
  end
end
