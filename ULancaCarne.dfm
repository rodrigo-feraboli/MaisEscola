object FLancaCarne: TFLancaCarne
  Left = 226
  Top = 213
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Lan'#231'amento de Carn'#234
  ClientHeight = 238
  ClientWidth = 300
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 219
    Width = 300
    Height = 19
    Color = 2025694
    Panels = <
      item
        Alignment = taCenter
        Text = 'Esc - Sair'
        Width = 110
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 300
    Height = 219
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Prosseguir: TSpeedButton
      Left = 34
      Top = 177
      Width = 103
      Height = 22
      Caption = 'Prosseguir'
      OnClick = ProsseguirClick
    end
    object SpeedButton1: TSpeedButton
      Left = 162
      Top = 177
      Width = 103
      Height = 22
      Caption = 'Voltar'
      OnClick = SpeedButton1Click
    end
    object Label1: TLabel
      Left = 64
      Top = 118
      Width = 122
      Height = 13
      Caption = 'N'#250'mero de Lan'#231'amentos '
    end
    object Label2: TLabel
      Left = 64
      Top = 149
      Width = 80
      Height = 13
      Caption = 'Lan'#231'ar apartir de'
    end
    object Label3: TLabel
      Left = 90
      Top = 86
      Width = 93
      Height = 13
      Caption = 'Valor do Carn'#234' (R$)'
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 300
      Height = 69
      Align = alTop
      Caption = 'Especifique o modo de lan'#231'amento'
      TabOrder = 0
      object RBCada: TRadioButton
        Left = 16
        Top = 17
        Width = 233
        Height = 17
        Caption = 'A cada                   dias'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RBCadaClick
      end
      object RBSempre: TRadioButton
        Left = 16
        Top = 44
        Width = 234
        Height = 17
        Caption = 'Sempre no              '#186' dia '#250'til de cada m'#234's'
        TabOrder = 3
        OnClick = RBCadaClick
      end
      object EdCada: TEdit
        Left = 72
        Top = 16
        Width = 45
        Height = 21
        TabOrder = 1
      end
      object EdSempre: TEdit
        Left = 92
        Top = 42
        Width = 30
        Height = 21
        TabOrder = 2
      end
    end
    object EdLanctos: TEdit
      Left = 191
      Top = 114
      Width = 43
      Height = 21
      TabOrder = 3
    end
    object DTPData: TDateTimePicker
      Left = 152
      Top = 146
      Width = 83
      Height = 21
      Date = 39261.601893981480000000
      Time = 39261.601893981480000000
      TabOrder = 4
    end
    object MEmoney: TMaskEdit
      Left = 191
      Top = 82
      Width = 44
      Height = 21
      EditMask = '999,99;1;_'
      MaxLength = 6
      TabOrder = 1
      Text = '999,99'
    end
    object PBAndamento: TProgressBar
      Left = 0
      Top = 202
      Width = 300
      Height = 17
      Align = alBottom
      TabOrder = 2
    end
  end
  object QryProx: TMDOQuery
    Database = Dados.Database
    Transaction = Dados.TransactionLK
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      'select EXTRACT(DAY FROM DATA) as DIA from dtcom')
    Left = 16
    Top = 104
    object QryProxDIA: TSmallintField
      FieldName = 'DIA'
    end
  end
end
