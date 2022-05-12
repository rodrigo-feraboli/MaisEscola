object FRelatoriosAn: TFRelatoriosAn
  Left = 225
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Relat'#243'rios Sint'#233'ticos'
  ClientHeight = 367
  ClientWidth = 797
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 797
    Height = 145
    Align = alTop
    BevelInner = bvLowered
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Prosseguir: TSpeedButton
      Left = 56
      Top = 96
      Width = 105
      Height = 22
      Caption = 'Prosseguir'
      OnClick = ProsseguirClick
    end
    object SpeedButton1: TSpeedButton
      Left = 184
      Top = 96
      Width = 105
      Height = 22
      Caption = 'Voltar'
      OnClick = SpeedButton1Click
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 124
      Width = 793
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 110
        end>
    end
    object RGOrd: TRadioGroup
      Left = 2
      Top = 3
      Width = 375
      Height = 38
      Caption = 'Ordena'#231#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Nome/Descri'#231#227'o')
      TabOrder = 1
    end
    object RGTipoOrd: TRadioGroup
      Left = 2
      Top = 43
      Width = 375
      Height = 38
      Caption = 'Tipo de Ordena'#231#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Ascendente'
        'Descendente')
      TabOrder = 2
    end
  end
  object RLAn: TRLReport
    Left = 30
    Top = 188
    Width = 794
    Height = 1123
    DataSource = DSGenerica
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 45
      BandType = btHeader
      object RLLCabecalho: TRLLabel
        Left = 8
        Top = 3
        Width = 706
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLDescricao: TRLLabel
        Left = 225
        Top = 26
        Width = 222
        Height = 17
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 12
        Top = 26
        Width = 158
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 83
      Width = 718
      Height = 17
      object RLDBText1: TRLDBText
        Left = 11
        Top = 0
        Width = 158
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'CODIGO'
        DataSource = DSGenerica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 224
        Top = 0
        Width = 457
        Height = 16
        AutoSize = False
        DataField = 'DESCRICAO'
        DataSource = DSGenerica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 100
      Width = 718
      Height = 20
      BandType = btFooter
      object RLSystemInfo1: TRLSystemInfo
        Left = 591
        Top = 0
        Width = 135
        Height = 16
        Info = itPageNumber
        Text = 'P'#225'gina: '
      end
      object RLLRodape: TRLLabel
        Left = 2
        Top = 0
        Width = 422
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object QryGenerica: TMDOQuery
    Database = Dados.Database
    Transaction = Dados.TransactionLK
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      '')
    Left = 28
    Top = 131
    object QryGenericaCODIGO: TSmallintField
      FieldName = 'CODIGO'
      Required = True
    end
    object QryGenericaDESCRICAO: TMDOStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object DSGenerica: TDataSource
    DataSet = QryGenerica
    Left = 58
    Top = 131
  end
end
