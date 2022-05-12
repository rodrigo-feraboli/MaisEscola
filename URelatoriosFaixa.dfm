object FRelatoriosFaixa: TFRelatoriosFaixa
  Left = 225
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Relat'#243'rios por Faixa Et'#225'ria'
  ClientHeight = 354
  ClientWidth = 1044
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
    Width = 1044
    Height = 99
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
      Left = 16
      Top = 50
      Width = 105
      Height = 22
      Caption = 'Prosseguir'
      OnClick = ProsseguirClick
    end
    object SpeedButton1: TSpeedButton
      Left = 144
      Top = 50
      Width = 105
      Height = 22
      Caption = 'Voltar'
      OnClick = SpeedButton1Click
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 78
      Width = 1040
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 110
        end>
    end
    object RgTipo: TRadioGroup
      Left = 2
      Top = 2
      Width = 1040
      Height = 43
      Align = alTop
      Caption = 'Por'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Pai'
        'M'#227'e'
        'Respons'#225'vel')
      TabOrder = 1
    end
  end
  object RLReport1: TRLReport
    Left = 186
    Top = 111
    Width = 794
    Height = 1123
    DataSource = DSEst
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 49
      BandType = btHeader
      object RLLCabecalho: TRLLabel
        Left = 0
        Top = 0
        Width = 722
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
      object RLLabel1: TRLLabel
        Left = 24
        Top = 32
        Width = 78
        Height = 16
        Caption = 'Faixa Et'#225'ria'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 265
        Top = 32
        Width = 78
        Height = 16
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 544
        Top = 32
        Width = 74
        Height = 16
        Caption = 'Percentual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 121
      Width = 718
      Height = 20
      BandType = btFooter
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
      object RLSystemInfo1: TRLSystemInfo
        Left = 605
        Top = 0
        Width = 134
        Height = 16
        Info = itPageNumber
        Text = 'P'#225'gina: '
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 87
      Width = 718
      Height = 18
      object RLDBText3: TRLDBText
        Left = 264
        Top = 1
        Width = 121
        Height = 16
        AutoSize = False
        DataField = 'TOT'
        DataSource = DSEst
      end
      object RLDBText2: TRLDBText
        Left = 8
        Top = 1
        Width = 217
        Height = 16
        AutoSize = False
        DataField = 'TIPO'
        DataSource = DSEst
      end
      object RLDBText1: TRLDBText
        Left = 543
        Top = 1
        Width = 121
        Height = 16
        AutoSize = False
        DataField = 'Perc'
        DataSource = DSEst
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 16
      BandType = btSummary
      object RLDBResult1: TRLDBResult
        Left = 264
        Top = 0
        Width = 121
        Height = 16
        AutoSize = False
        DataField = 'TOT'
        DataSource = DSEst
        Holder = RLDBText3
        Info = riSum
      end
      object RLDBResult2: TRLDBResult
        Left = 543
        Top = 0
        Width = 121
        Height = 16
        AutoSize = False
        DataField = 'Perc'
        DataSource = DSEst
        Holder = RLDBText1
        Info = riSum
      end
      object RLLabel4: TRLLabel
        Left = 176
        Top = 0
        Width = 43
        Height = 16
        Caption = 'Totais'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object QryEst: TMDOQuery
    Database = Dados.Database
    OnCalcFields = QryEstCalcFields
    Transaction = Dados.TransactionLK
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      'select case'
      
        'WHEN (((CURRENT_DATE - DTNASCPAI) / 365) IN (15, 16,17,18,19)) T' +
        'HEN '#39'ENTRE 15-19 ANOS'#39
      
        'WHEN (((CURRENT_DATE - DTNASCPAI) / 365) IN (20,21,22,23,24)) TH' +
        'EN '#39'ENTRE 20-24 ANOS'#39
      
        'WHEN (((CURRENT_DATE - DTNASCPAI) / 365) IN (25,26,27,28,29)) TH' +
        'EN '#39'ENTRE 25-29 ANOS'#39
      
        'WHEN (((CURRENT_DATE - DTNASCPAI) / 365) IN (30,31,32,33,34)) TH' +
        'EN '#39'ENTRE 30-34 ANOS'#39
      
        'WHEN (((CURRENT_DATE - DTNASCPAI) / 365) IN (35,36,37,38,39)) TH' +
        'EN '#39'ENTRE 35-39 ANOS'#39
      
        'WHEN (((CURRENT_DATE - DTNASCPAI) / 365) IN (40,41,42,43,44)) TH' +
        'EN '#39'ENTRE 40-44 ANOS'#39
      
        'WHEN (((CURRENT_DATE - DTNASCPAI) / 365) IN (45,46,47,48,49)) TH' +
        'EN '#39'ENTRE 45-49 ANOS'#39
      
        'WHEN (((CURRENT_DATE - DTNASCPAI) / 365) IN (50,51,52,53,54)) TH' +
        'EN '#39'ENTRE 50-54 ANOS'#39
      
        'WHEN (((CURRENT_DATE - DTNASCPAI) / 365) IN (55,56,57,58,59)) TH' +
        'EN '#39'ENTRE 55-59 ANOS'#39
      
        'ELSE '#39'FAIXA FORA'#39'END AS TIPO, COUNT(*) AS TOT FROM ALUNOS A GROU' +
        'P BY 1')
    Left = 28
    Top = 131
    object QryEstTIPO: TMDOStringField
      DisplayWidth = 24
      FieldName = 'TIPO'
      Size = 16
    end
    object QryEstTOT: TIntegerField
      DisplayWidth = 12
      FieldName = 'TOT'
      Required = True
    end
    object QryEstPerc: TFloatField
      DisplayWidth = 12
      FieldKind = fkCalculated
      FieldName = 'Perc'
      DisplayFormat = '##.00'
      Calculated = True
    end
  end
  object DSEst: TDataSource
    DataSet = QryEst
    Left = 58
    Top = 131
  end
end
