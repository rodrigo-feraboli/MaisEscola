object FEdAlunosBoletim: TFEdAlunosBoletim
  Left = 280
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Boletim do Aluno'
  ClientHeight = 361
  ClientWidth = 439
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 439
    Height = 306
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
      Left = 48
      Top = 16
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aluno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 18
      Top = 48
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Per'#237'odo/ano'
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
      Width = 368
      Height = 17
      DataField = 'NOME'
      DataSource = FAlunos.DSAlunos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit8: TDBEdit
      Left = 79
      Top = 45
      Width = 113
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PERIODO'
      DataSource = FAlunos.DSAlunosAval
      TabOrder = 0
    end
    object RGComp: TDBRadioGroup
      Left = 296
      Top = 80
      Width = 132
      Height = 106
      Caption = 'Comportamento'
      DataField = 'COMP'
      DataSource = FAlunos.DSAlunosAval
      Items.Strings = (
        'N'#227'o Satisfat'#243'rio (NS)'
        'Regular (R)'
        'Bom (B)'
        'Muito Bom (MB)'
        'Excelente (E)')
      TabOrder = 3
      Values.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
    object RGHig: TDBRadioGroup
      Left = 155
      Top = 192
      Width = 132
      Height = 106
      Caption = 'Higiene'
      DataField = 'HIG'
      DataSource = FAlunos.DSAlunosAval
      Items.Strings = (
        'N'#227'o Satisfat'#243'rio (NS)'
        'Regular (R)'
        'Bom (B)'
        'Muito Bom (MB)'
        'Excelente (E)')
      TabOrder = 5
      Values.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
    object RGAss: TDBRadioGroup
      Left = 11
      Top = 80
      Width = 132
      Height = 106
      Caption = 'Assiduidade'
      DataField = 'ASD'
      DataSource = FAlunos.DSAlunosAval
      Items.Strings = (
        'N'#227'o Satisfat'#243'rio (NS)'
        'Regular (R)'
        'Bom (B)'
        'Muito Bom (MB)'
        'Excelente (E)')
      TabOrder = 1
      Values.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
    object RGDESM: TDBRadioGroup
      Left = 11
      Top = 192
      Width = 132
      Height = 106
      Caption = 'Desenvolvimento Motor'
      DataField = 'DM'
      DataSource = FAlunos.DSAlunosAval
      Items.Strings = (
        'N'#227'o Satisfat'#243'rio (NS)'
        'Regular (R)'
        'Bom (B)'
        'Muito Bom (MB)'
        'Excelente (E)')
      TabOrder = 4
      Values.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
    object RGAte: TDBRadioGroup
      Left = 155
      Top = 80
      Width = 132
      Height = 106
      Caption = 'Aten'#231#227'o'
      DataField = 'ATE'
      DataSource = FAlunos.DSAlunosAval
      Items.Strings = (
        'N'#227'o Satisfat'#243'rio (NS)'
        'Regular (R)'
        'Bom (B)'
        'Muito Bom (MB)'
        'Excelente (E)')
      TabOrder = 2
      Values.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 306
    Width = 439
    Height = 55
    Align = alBottom
    BevelInner = bvLowered
    Color = 2025694
    TabOrder = 1
    object SBGravar: TSpeedButton
      Left = 193
      Top = 7
      Width = 120
      Height = 25
      Caption = 'Gravar'
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
      Left = 313
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
      OnClick = SBCancelarClick
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 34
      Width = 435
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
