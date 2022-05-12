object FEdTurmasLancaDias: TFEdTurmasLancaDias
  Left = 280
  Top = 175
  Width = 528
  Height = 189
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Lan'#231'amento de Dias para o Card'#225'pio'
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 102
    Align = alClient
    BevelInner = bvLowered
    Color = 2025694
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 45
      Top = 16
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Turma'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 23
      Top = 48
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Inicial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 81
      Top = 16
      Width = 192
      Height = 17
      DataField = 'DESCRICAO'
      DataSource = FTurmas.DSTurmas
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 324
      Top = 48
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Final'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 243
      Top = 80
      Width = 129
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' de Lan'#231'amentos por dia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DTPIni: TDateTimePicker
      Left = 80
      Top = 43
      Width = 81
      Height = 21
      Date = 39256.493047951390000000
      Time = 39256.493047951390000000
      TabOrder = 0
    end
    object DTPFin: TDateTimePicker
      Left = 376
      Top = 43
      Width = 81
      Height = 21
      Date = 39256.493047951390000000
      Time = 39256.493047951390000000
      TabOrder = 1
    end
    object EdNum: TEdit
      Left = 376
      Top = 75
      Width = 30
      Height = 21
      TabOrder = 2
      OnChange = EdNumChange
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 102
    Width = 520
    Height = 55
    Align = alBottom
    BevelInner = bvLowered
    Color = 2025694
    TabOrder = 1
    object SBGravar: TSpeedButton
      Left = 257
      Top = 7
      Width = 120
      Height = 25
      Caption = 'Lan'#231'ar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SBGravarClick
    end
    object SBCancelar: TSpeedButton
      Left = 377
      Top = 7
      Width = 120
      Height = 25
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 34
      Width = 516
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 125
        end>
    end
  end
end
