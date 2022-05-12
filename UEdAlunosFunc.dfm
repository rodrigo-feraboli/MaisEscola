object FEdAlunosFunc: TFEdAlunosFunc
  Left = 280
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Funcion'#225'rio Respons'#225'vel'
  ClientHeight = 135
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
    Height = 80
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
      Left = 21
      Top = 48
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Funcion'#225'rio'
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
    object SBFunc: TSpeedButton
      Left = 441
      Top = 44
      Width = 23
      Height = 22
      Hint = 'Cadastro de Funcion'#225'rios'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBFuncClick
    end
    object DBEdit8: TDBEdit
      Left = 79
      Top = 45
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODFUNC'
      DataSource = FAlunos.DSAlunosFunc
      TabOrder = 0
    end
    object DBLCBFunc: TDBLookupComboBox
      Left = 112
      Top = 45
      Width = 328
      Height = 21
      DataField = 'CODFUNC'
      DataSource = FAlunos.DSAlunosFunc
      KeyField = 'CODFUNC'
      ListField = 'CODFUNC;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSFuncLK
      TabOrder = 1
      OnKeyPress = DBLCBFuncKeyPress
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 80
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
