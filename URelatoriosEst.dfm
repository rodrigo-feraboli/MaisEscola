object FRelatoriosEst: TFRelatoriosEst
  Left = 225
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Relat'#243'rios Estat'#237'sticos'
  ClientHeight = 520
  ClientWidth = 844
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
    Width = 844
    Height = 215
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
      Left = 75
      Top = 167
      Width = 105
      Height = 22
      Caption = 'Prosseguir'
      OnClick = ProsseguirClick
    end
    object SpeedButton1: TSpeedButton
      Left = 203
      Top = 167
      Width = 105
      Height = 22
      Caption = 'Voltar'
      OnClick = SpeedButton1Click
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 194
      Width = 840
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
      Left = 5
      Top = 83
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
      Left = 5
      Top = 123
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
    object RGExib: TRadioGroup
      Left = 5
      Top = 38
      Width = 375
      Height = 43
      Caption = 'Exibir Estat'#237'ticas sobre'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sexo'
        'Idade')
      TabOrder = 3
    end
    object RGAl: TRadioGroup
      Left = 5
      Top = 4
      Width = 375
      Height = 33
      Caption = 'Alunos'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Ativos'
        'Inativos')
      TabOrder = 4
    end
  end
  object RLEst: TRLReport
    Left = 48
    Top = 222
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
        Left = 217
        Top = 26
        Width = 376
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
        Left = 73
        Top = 26
        Width = 98
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 601
        Top = 26
        Width = 111
        Height = 17
        AutoSize = False
        Caption = 'Percentual'
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
        Left = 73
        Top = 0
        Width = 98
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'QTOS'
        DataSource = DSGenerica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 217
        Top = 0
        Width = 344
        Height = 16
        AutoSize = False
        DataField = 'DescAux'
        DataSource = DSGenerica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText3: TRLDBText
        Left = 601
        Top = 0
        Width = 110
        Height = 16
        AutoSize = False
        DataField = 'Perc'
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
      Top = 118
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
    object RLBand4: TRLBand
      Left = 38
      Top = 100
      Width = 718
      Height = 18
      BandType = btSummary
      object RLDBResult1: TRLDBResult
        Left = 601
        Top = 0
        Width = 110
        Height = 17
        AutoSize = False
        DataField = 'Perc'
        DataSource = DSGenerica
        DisplayMask = '##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Holder = RLDBText3
        Info = riSum
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
        Left = 73
        Top = 0
        Width = 98
        Height = 17
        Alignment = taCenter
        AutoSize = False
        DataField = 'QTOS'
        DataSource = DSGenerica
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Holder = RLDBText1
        Info = riSum
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 20
        Top = 0
        Width = 50
        Height = 16
        Alignment = taCenter
        AutoSize = False
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
  object QryGenerica: TMDOQuery
    Database = Dados.Database
    OnCalcFields = QryGenericaCalcFields
    Transaction = Dados.TransactionLK
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      
        'SELECT CAST('#39'Relat'#243'rio Estat'#237'stico de Alunos - Por Sexo'#39' AS VARC' +
        'HAR(50)) as TITULO, '
      
        'COUNT(CODALUNO) AS QTOS, SEXO AS DESCR FROM ALUNOS WHERE CODALUN' +
        'O IS NOT NULL GROUP BY 3')
    Left = 36
    Top = 235
    object QryGenericaQTOS: TIntegerField
      FieldName = 'QTOS'
      Required = True
    end
    object QryGenericaDESCR: TMDOStringField
      FieldName = 'DESCR'
      Size = 1
    end
    object QryGenericaPerc: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Perc'
      DisplayFormat = '##.00'
      Calculated = True
    end
    object QryGenericaDescAux: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescAux'
      Calculated = True
    end
  end
  object DSGenerica: TDataSource
    DataSet = QryGenerica
    Left = 66
    Top = 235
  end
end
