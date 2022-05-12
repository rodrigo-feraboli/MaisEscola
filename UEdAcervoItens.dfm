object FEdAcervoItens: TFEdAcervoItens
  Left = 284
  Top = 123
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Item do Acervo Liter'#225'rio'
  ClientHeight = 385
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
    Height = 330
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
      Left = 20
      Top = 16
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 48
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Imprenta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 10
      Top = 144
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Registro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 45
      Top = 112
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Edi'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 118
      Top = 112
      Width = 5
      Height = 13
      Caption = #170
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 18
      Top = 256
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observa'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 19
      Top = 80
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'd. Barras'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object CJVBarCode1: TCJVBarCode
      Left = 356
      Top = 80
      Width = 77
      Height = 74
      Texto = '8181'
      Tipo = btCode128C
      Esquerda = 10
      Superior = 10
      Altura = 60
      Legenda = True
      LegendaFont.Charset = DEFAULT_CHARSET
      LegendaFont.Color = clWindowText
      LegendaFont.Height = -11
      LegendaFont.Name = 'MS Sans Serif'
      LegendaFont.Style = []
      LegendaPos = 10
    end
    object DTPRegistro: TDateTimePicker
      Left = 79
      Top = 141
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 5
      OnChange = DTPRegistroChange
    end
    object DBEdit1: TDBEdit
      Left = 79
      Top = 13
      Width = 50
      Height = 21
      DataField = 'NUMREG'
      DataSource = FAcervo.DSAcervoItens
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 45
      Width = 386
      Height = 21
      CharCase = ecUpperCase
      DataField = 'IMPRENTA'
      DataSource = FAcervo.DSAcervoItens
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 82
      Top = 144
      Width = 62
      Height = 14
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTREG'
      DataSource = FAcervo.DSAcervoItens
      TabOrder = 4
      OnEnter = DBEdit3Enter
      OnExit = DBEdit3Enter
    end
    object DBEdit4: TDBEdit
      Left = 79
      Top = 109
      Width = 35
      Height = 21
      CharCase = ecUpperCase
      DataField = 'EDICAO'
      DataSource = FAcervo.DSAcervoItens
      TabOrder = 3
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 79
      Top = 173
      Width = 386
      Height = 32
      Caption = 'Estado'
      Columns = 3
      DataField = 'ESTADO'
      DataSource = FAcervo.DSAcervoItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'Bem Conservado'
        'Conservado'
        'Mal Conservado')
      ParentFont = False
      TabOrder = 6
      Values.Strings = (
        '1'
        '2'
        '3')
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 79
      Top = 213
      Width = 386
      Height = 32
      Caption = 'Forma de Aquisi'#231#227'o'
      Columns = 2
      DataField = 'FORMA'
      DataSource = FAcervo.DSAcervoItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'Doa'#231#227'o'
        'Compra')
      ParentFont = False
      TabOrder = 7
      Values.Strings = (
        '1'
        '2'
        '3')
    end
    object DBMemo1: TDBMemo
      Left = 78
      Top = 253
      Width = 388
      Height = 62
      DataField = 'OBS'
      DataSource = FAcervo.DSAcervoItens
      ScrollBars = ssVertical
      TabOrder = 8
    end
    object DBEdit5: TDBEdit
      Left = 79
      Top = 77
      Width = 138
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODBARRAS'
      DataSource = FAcervo.DSAcervoItens
      TabOrder = 2
      OnChange = DBEdit5Change
      OnExit = DBEdit5Change
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 330
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
