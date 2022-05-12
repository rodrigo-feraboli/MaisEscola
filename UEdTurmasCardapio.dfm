object FEdTurmasCardapio: TFEdTurmasCardapio
  Left = 280
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Card'#225'pio da Turma'
  ClientHeight = 171
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
    Height = 116
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
      Left = 52
      Top = 16
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 34
      Top = 48
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Refei'#231#227'o'
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
    object SBRef: TSpeedButton
      Left = 441
      Top = 44
      Width = 23
      Height = 22
      Hint = 'Cadastro de Refei'#231#245'es'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBRefClick
    end
    object Label5: TLabel
      Left = 53
      Top = 80
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit8: TDBEdit
      Left = 79
      Top = 45
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODREFEICAO'
      DataSource = FTurmas.DSTurmasCardapiosItens
      TabOrder = 0
    end
    object DBLCBRefeicao: TDBLookupComboBox
      Left = 112
      Top = 45
      Width = 328
      Height = 21
      DataField = 'CODREFEICAO'
      DataSource = FTurmas.DSTurmasCardapiosItens
      KeyField = 'CODREFEICAO'
      ListField = 'CODREFEICAO;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSRefeicoesLK
      TabOrder = 1
      OnKeyPress = DBLCBRefeicaoKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 79
      Top = 77
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      DataField = 'HORA'
      DataSource = FTurmas.DSTurmasCardapiosItens
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 116
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
