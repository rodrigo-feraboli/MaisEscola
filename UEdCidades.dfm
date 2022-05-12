object FEdCidades: TFEdCidades
  Left = 309
  Top = 135
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Cidade'
  ClientHeight = 201
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 146
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
      Left = 42
      Top = 16
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 30
      Top = 76
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 42
      Top = 46
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Estado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 57
      Top = 108
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'CEP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 418
      Top = 42
      Width = 22
      Height = 22
      Caption = '+'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object DBEdit1: TDBEdit
      Left = 79
      Top = 13
      Width = 50
      Height = 21
      DataField = 'CODCIDADE'
      DataSource = FCidades.DSCidades
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 73
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = FCidades.DSCidades
      TabOrder = 3
      OnExit = DBEdit2Exit
    end
    object DBEdit3: TDBEdit
      Left = 79
      Top = 43
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODESTADO'
      DataSource = FCidades.DSCidades
      TabOrder = 1
    end
    object DBLCBEstados: TDBLookupComboBox
      Left = 131
      Top = 43
      Width = 285
      Height = 21
      DataField = 'CODESTADO'
      DataSource = FCidades.DSCidades
      KeyField = 'CODESTADO'
      ListField = 'UF;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSEstadosLK
      TabOrder = 2
      OnKeyPress = DBLCBEstadosKeyPress
    end
    object DBEdit4: TDBEdit
      Left = 79
      Top = 105
      Width = 66
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CEP'
      DataSource = FCidades.DSCidades
      TabOrder = 4
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 146
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
