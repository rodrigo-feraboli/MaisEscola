object FRelatoriosCompras: TFRelatoriosCompras
  Left = 314
  Top = 186
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o de Relat'#243'rios de Compras'
  ClientHeight = 455
  ClientWidth = 837
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 837
    Height = 200
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
      Top = 115
      Width = 105
      Height = 22
      Caption = 'Prosseguir'
      OnClick = ProsseguirClick
    end
    object SpeedButton1: TSpeedButton
      Left = 184
      Top = 115
      Width = 105
      Height = 22
      Caption = 'Voltar'
      OnClick = SpeedButton1Click
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 179
      Width = 833
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 110
        end>
    end
    object DBLCBForn: TDBLookupComboBox
      Left = 111
      Top = 50
      Width = 242
      Height = 21
      KeyField = 'CODGEN'
      ListField = 'CODGEN;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSFornLK
      TabOrder = 2
    end
    object CBForn: TCheckBox
      Left = 35
      Top = 52
      Width = 72
      Height = 15
      Alignment = taLeftJustify
      Caption = 'Fornecedor'
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 3
      Width = 375
      Height = 40
      Caption = 'Data de Emiss'#227'o da NF'
      TabOrder = 0
      object CBDTIni: TCheckBox
        Left = 53
        Top = 17
        Width = 70
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Data Inicial'
        TabOrder = 0
      end
      object DTPDtIni: TDateTimePicker
        Left = 126
        Top = 16
        Width = 83
        Height = 21
        Date = 39311.656525601850000000
        Time = 39311.656525601850000000
        TabOrder = 1
      end
      object CBDtFin: TCheckBox
        Left = 213
        Top = 17
        Width = 70
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Data Inicial'
        TabOrder = 2
      end
      object DTPDtFin: TDateTimePicker
        Left = 286
        Top = 16
        Width = 83
        Height = 21
        Date = 39311.656525601850000000
        Time = 39311.656525601850000000
        TabOrder = 3
      end
    end
    object RGTipoOrd: TRadioGroup
      Left = 2
      Top = 74
      Width = 375
      Height = 38
      Caption = 'Tipo de Ordena'#231#227'o'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Ascendente'
        'Descendente')
      TabOrder = 4
    end
  end
  object RLReport1: TRLReport
    Left = 48
    Top = 230
    Width = 794
    Height = 1123
    DataSource = DsRel
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
      object RLLabel2: TRLLabel
        Left = 7
        Top = 32
        Width = 35
        Height = 16
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 170
        Top = 32
        Width = 48
        Height = 16
        Caption = 'Nro. NF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 342
        Top = 32
        Width = 92
        Height = 16
        Caption = 'Itens da Nota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 567
        Top = 32
        Width = 105
        Height = 16
        Caption = 'Valor Tot. Prod.'
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
      Top = 87
      Width = 718
      Height = 17
      BandType = btTitle
      object RLLPeriodo: TRLLabel
        Left = 8
        Top = 0
        Width = 47
        Height = 16
        Caption = 'Per'#237'odo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 104
      Width = 718
      Height = 51
      DataFields = 'FORNEC'
      object RLBand3: TRLBand
        Left = 0
        Top = 17
        Width = 718
        Height = 17
        object RLDBText3: TRLDBText
          Left = 170
          Top = 0
          Width = 48
          Height = 16
          AutoSize = False
          DataField = 'NRONF'
          DataSource = DsRel
          Holder = RLLabel3
        end
        object RLDBText2: TRLDBText
          Left = 7
          Top = 0
          Width = 35
          Height = 16
          AutoSize = False
          DataField = 'DATAEMISSAONF'
          DataSource = DsRel
          Holder = RLLabel2
        end
        object RLDBText4: TRLDBText
          Left = 342
          Top = 0
          Width = 92
          Height = 16
          AutoSize = False
          DataField = 'QTDE'
          DataSource = DsRel
          Holder = RLLabel4
        end
        object RLDBText5: TRLDBText
          Left = 567
          Top = 0
          Width = 105
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = DsRel
          Holder = RLLabel5
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        BandType = btHeader
        object RLLabel7: TRLLabel
          Left = 8
          Top = 0
          Width = 77
          Height = 16
          Caption = 'Fornecedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 95
          Top = 0
          Width = 539
          Height = 16
          AutoSize = False
          DataField = 'FORNEC'
          DataSource = DsRel
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 34
        Width = 718
        Height = 17
        BandType = btFooter
        object RLLabel8: TRLLabel
          Left = 448
          Top = 0
          Width = 113
          Height = 16
          Caption = 'Total Fornecedor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 567
          Top = 1
          Width = 105
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = DsRel
          Holder = RLDBText5
          Info = riSum
          Layout = tlCenter
        end
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 155
      Width = 718
      Height = 17
      BandType = btSummary
      object RLLabel9: TRLLabel
        Left = 488
        Top = 0
        Width = 73
        Height = 16
        Alignment = taRightJustify
        Caption = 'Total Geral'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Holder = RLLabel8
        ParentFont = False
      end
      object RLDBResult2: TRLDBResult
        Left = 567
        Top = 1
        Width = 105
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'VALOR'
        DataSource = DsRel
        Holder = RLDBText5
        Info = riSum
        Layout = tlCenter
      end
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 172
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
  end
  object QryRel: TMDOQuery
    Database = Dados.Database
    Transaction = Dados.TransactionLK
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      'select SUM(CI.quant * CI.vlrunit) AS VALOR,'
      
        ' COUNT(CI.nroitem) AS QTDE,  TIPONOTA, NRONF, DATAEMISSAONF, G.N' +
        'OME AS FORNEC'
      'FROM COMPRAS C'
      ' INNER JOIN COMPRASITENS CI ON CI.NROCOMPRA = C.NROCOMPRA'
      
        ' INNER JOIN GEN G ON G.codgen = C.codforngen  WHERE C.NROCOMPRA ' +
        'IS NOT NULL GROUP By'
      ' 3,4,5,6 ORDER BY 2, 1  ASC')
    Left = 28
    Top = 131
    object QryRelVALOR: TFloatField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object QryRelQTDE: TIntegerField
      FieldName = 'QTDE'
      Required = True
    end
    object QryRelTIPONOTA: TMDOStringField
      FieldName = 'TIPONOTA'
      Size = 1
    end
    object QryRelNRONF: TLargeintField
      FieldName = 'NRONF'
    end
    object QryRelDATAEMISSAONF: TDateField
      FieldName = 'DATAEMISSAONF'
    end
    object QryRelFORNEC: TMDOStringField
      FieldName = 'FORNEC'
      Size = 100
    end
  end
  object DsRel: TDataSource
    DataSet = QryRel
    Left = 58
    Top = 131
  end
end
