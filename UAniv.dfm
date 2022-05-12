object FAniv: TFAniv
  Left = 225
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pesquisa de Aniversariantes'
  ClientHeight = 331
  ClientWidth = 786
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 786
    Height = 331
    Align = alClient
    BevelInner = bvLowered
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LblQtde: TLabel
      Left = 13
      Top = 26
      Width = 622
      Height = 13
      AutoSize = False
      Caption = 'LblQtde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 672
      Top = 285
      Width = 65
      Height = 22
      Caption = 'Relat'#243'rio'
      OnClick = SpeedButton1Click
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 310
      Width = 782
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 110
        end>
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 39
      Width = 780
      Height = 243
      DataSource = DSAniv
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Caption = 'Tipo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 565
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Data'
          Width = 60
          Visible = True
        end>
    end
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 782
      Height = 24
      ActivePage = TSSemana
      Align = alTop
      Style = tsButtons
      TabOrder = 3
      OnChange = PageControl1Change
      object TSSemana: TTabSheet
        Caption = 'Semana'
      end
      object TSMes: TTabSheet
        Caption = 'M'#234's'
        ImageIndex = 1
      end
      object TSPeriodo: TTabSheet
        Caption = 'Per'#237'odo'
        ImageIndex = 2
      end
    end
    object Panel1: TPanel
      Left = 150
      Top = 0
      Width = 634
      Height = 27
      BevelOuter = bvNone
      Color = clMedGray
      TabOrder = 5
    end
    object PnlPeriodo: TPanel
      Left = 382
      Top = 1
      Width = 401
      Height = 26
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 4
      object CBDtIni: TCheckBox
        Left = 49
        Top = 5
        Width = 72
        Height = 17
        Caption = 'Data Inicial'
        TabOrder = 0
        OnClick = CBIniClick
      end
      object CBDtFin: TCheckBox
        Left = 221
        Top = 5
        Width = 68
        Height = 17
        Caption = 'Data Final'
        TabOrder = 1
        OnClick = CBIniClick
      end
      object DTPIni: TDateTimePicker
        Left = 146
        Top = 3
        Width = 54
        Height = 21
        Date = 39271.429456550920000000
        Format = 'dd/MM'
        Time = 39271.429456550920000000
        TabOrder = 2
        OnChange = CBIniClick
      end
      object DTPFin: TDateTimePicker
        Left = 315
        Top = 3
        Width = 54
        Height = 21
        Date = 39271.429456550920000000
        Format = 'dd/MM'
        Time = 39271.429456550920000000
        TabOrder = 3
        OnChange = CBIniClick
      end
    end
    object PnlMes: TPanel
      Left = 382
      Top = 0
      Width = 401
      Height = 26
      BevelOuter = bvNone
      Color = clTeal
      TabOrder = 2
      object CBIni: TCheckBox
        Left = 49
        Top = 5
        Width = 72
        Height = 17
        Caption = 'M'#234's Inicial'
        TabOrder = 0
        OnClick = CBIniClick
      end
      object CBMesIn: TComboBox
        Left = 119
        Top = 3
        Width = 81
        Height = 21
        ItemHeight = 13
        ItemIndex = 10
        TabOrder = 1
        Text = 'Novembro'
        OnChange = CBIniClick
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Mar'#231'o'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object CBFin: TCheckBox
        Left = 221
        Top = 5
        Width = 64
        Height = 17
        Caption = 'M'#234's Final'
        TabOrder = 2
        OnClick = CBIniClick
      end
      object CBMesFi: TComboBox
        Left = 288
        Top = 3
        Width = 81
        Height = 21
        ItemHeight = 13
        ItemIndex = 10
        TabOrder = 3
        Text = 'Novembro'
        OnClick = CBIniClick
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Mar'#231'o'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
    end
  end
  object RLAniv: TRLReport
    Left = 72
    Top = 80
    Width = 794
    Height = 1123
    DataSource = DSAniv
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    PrintEmpty = False
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
        Left = 232
        Top = 26
        Width = 473
        Height = 17
        AutoSize = False
        Caption = 'Aniversariante'
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
        Width = 100
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 124
        Top = 26
        Width = 100
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = 'Tipo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object na: TRLBand
      Left = 38
      Top = 83
      Width = 718
      Height = 17
      object RLDBText1: TRLDBText
        Left = 12
        Top = 0
        Width = 100
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'Data'
        DataSource = DSAniv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Holder = RLLabel1
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 232
        Top = 0
        Width = 473
        Height = 16
        AutoSize = False
        DataField = 'NOME'
        DataSource = DSAniv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Holder = RLLDescricao
        ParentFont = False
      end
      object RLDBText3: TRLDBText
        Left = 124
        Top = 1
        Width = 100
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'TIPO'
        DataSource = DSAniv
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Holder = RLLabel2
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 116
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
    object RLBand2: TRLBand
      Left = 38
      Top = 100
      Width = 718
      Height = 16
      BandType = btSummary
      object RLDBResult1: TRLDBResult
        Left = 563
        Top = 0
        Width = 142
        Height = 16
        Alignment = taRightJustify
        DataField = 'TIPO'
        DataSource = DSAniv
        Info = riCount
        Text = 'Aniversariantes: '
      end
    end
  end
  object QryAniv: TMDOQuery
    Database = Dados.Database
    OnCalcFields = QryAnivCalcFields
    Transaction = Dados.Transaction
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      'SELECT CAST('#39'Alunos'#39' as varchar(15)) as TIPO, nome as nome,'
      'cast(extract (day from DTNASC) as Smallint) as DIA,'
      'cast(extract (month from DTNASC) as Smallint) as MES'
      'from alunos'
      'where nome is not null')
    Left = 340
    Top = 131
    object QryAnivTIPO: TMDOStringField
      FieldName = 'TIPO'
      Required = True
      Size = 15
    end
    object QryAnivNOME: TMDOStringField
      FieldName = 'NOME'
      Size = 100
    end
    object QryAnivDIA: TSmallintField
      FieldName = 'DIA'
    end
    object QryAnivMES: TSmallintField
      FieldName = 'MES'
    end
    object QryAnivData: TStringField
      FieldKind = fkCalculated
      FieldName = 'Data'
      Size = 5
      Calculated = True
    end
  end
  object DSAniv: TDataSource
    DataSet = QryAniv
    Left = 378
    Top = 131
  end
end
