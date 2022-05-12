object FEdAlunosRemedios: TFEdAlunosRemedios
  Left = 280
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Rem'#233'dio do Aluno'
  ClientHeight = 271
  ClientWidth = 520
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
    Width = 520
    Height = 216
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
      Left = 35
      Top = 48
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Rem'#233'dio'
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
    object SBRem: TSpeedButton
      Left = 441
      Top = 44
      Width = 23
      Height = 22
      Hint = 'Cadastro de Rem'#233'dios'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBRemClick
    end
    object Label3: TLabel
      Left = 9
      Top = 80
      Width = 67
      Height = 30
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Modo de Aplica'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label4: TLabel
      Left = 10
      Top = 184
      Width = 66
      Height = 26
      Alignment = taRightJustify
      Caption = 'Repeti'#231#227'o ao Dia'
      Color = 2025694
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      WordWrap = True
    end
    object DBEdit8: TDBEdit
      Left = 79
      Top = 45
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODREMEDIO'
      DataSource = FAlunos.DSAlunosRemedios
      TabOrder = 0
    end
    object DBLCBRemedios: TDBLookupComboBox
      Left = 112
      Top = 45
      Width = 328
      Height = 21
      DataField = 'CODREMEDIO'
      DataSource = FAlunos.DSAlunosRemedios
      KeyField = 'CODREMEDIO'
      ListField = 'CODREMEDIO;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSRemediosLK
      TabOrder = 1
      OnKeyPress = DBLCBRemediosKeyPress
    end
    object DBEdit1: TDBMemo
      Left = 79
      Top = 77
      Width = 362
      Height = 96
      DataField = 'MODOAPLIC'
      DataSource = FAlunos.DSAlunosRemedios
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 181
      Width = 186
      Height = 21
      CharCase = ecUpperCase
      DataField = 'REPETDIA'
      DataSource = FAlunos.DSAlunosRemedios
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 216
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
      OnClick = SBCancelarClick
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
