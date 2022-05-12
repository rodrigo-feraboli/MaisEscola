object FRelatoriosCP: TFRelatoriosCP
  Left = 265
  Top = 121
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Contas a Receber'
  ClientHeight = 454
  ClientWidth = 732
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 732
    Height = 240
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
      Top = 192
      Width = 105
      Height = 22
      Caption = 'Prosseguir'
      OnClick = ProsseguirClick
    end
    object SpeedButton1: TSpeedButton
      Left = 184
      Top = 192
      Width = 105
      Height = 22
      Caption = 'Voltar'
      OnClick = SpeedButton1Click
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 219
      Width = 728
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
      KeyField = 'CODALUNO'
      ListField = 'CODALUNO;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSAlunosLK
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
      Caption = 'Data de Vencimento da Conta a Receber'
      TabOrder = 0
      object CBDTIni: TCheckBox
        Left = 37
        Top = 17
        Width = 70
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Data Inicial'
        TabOrder = 0
      end
      object DTPDtIni: TDateTimePicker
        Left = 110
        Top = 16
        Width = 83
        Height = 21
        Date = 39311.656525601850000000
        Time = 39311.656525601850000000
        TabOrder = 1
      end
      object CBDtFin: TCheckBox
        Left = 195
        Top = 17
        Width = 70
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Data Inicial'
        TabOrder = 2
      end
      object DTPDtFin: TDateTimePicker
        Left = 268
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
      Top = 151
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
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 111
      Top = 82
      Width = 242
      Height = 21
      KeyField = 'CODGEN'
      ListField = 'CODGEN;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSFornLK
      TabOrder = 5
    end
    object CheckBox1: TCheckBox
      Left = 11
      Top = 84
      Width = 97
      Height = 15
      Alignment = taLeftJustify
      Caption = 'Centro de Custo'
      TabOrder = 6
    end
    object RGExib: TRadioGroup
      Left = 2
      Top = 107
      Width = 375
      Height = 43
      Caption = 'Exibir'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Todas'
        'Pagas'
        'Abertas'
        'Canceladas')
      TabOrder = 7
    end
  end
  object RLReport1: TRLReport
    Left = -24
    Top = 248
    Width = 794
    Height = 1123
    DataSource = DsRel
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
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
      object RLLabel2: TRLLabel
        Left = 265
        Top = 32
        Width = 60
        Height = 16
        Caption = 'Situa'#231#227'o'
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
        Width = 88
        Height = 16
        Caption = 'Valor Aberto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 638
        Top = 32
        Width = 74
        Height = 16
        Caption = 'Valor Pago'
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
      object QRLPeriodo: TRLLabel
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
      Height = 52
      DataFields = 'VCTO'
      BeforePrint = RLGroup1BeforePrint
      object RLBand3: TRLBand
        Left = 0
        Top = 17
        Width = 718
        Height = 18
        BeforePrint = RLBand3BeforePrint
        object VlrPago: TRLLabel
          Left = 638
          Top = 1
          Width = 66
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor Pago'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object VlrAberto: TRLLabel
          Left = 544
          Top = 1
          Width = 76
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor Aberto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 264
          Top = 1
          Width = 121
          Height = 16
          AutoSize = False
          DataField = 'STATUS'
          DataSource = DsRel
        end
        object RLDBText2: TRLDBText
          Left = 8
          Top = 1
          Width = 217
          Height = 16
          AutoSize = False
          DataField = 'FORN'
          DataSource = DsRel
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        BandType = btHeader
        object RLLabel5: TRLLabel
          Left = 8
          Top = 0
          Width = 135
          Height = 16
          Caption = 'Data de Vencimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBText1: TRLDBText
          Left = 146
          Top = 0
          Width = 121
          Height = 16
          AutoSize = False
          DataField = 'VCTO'
          DataSource = DsRel
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 35
        Width = 718
        Height = 17
        BandType = btFooter
        BeforePrint = RLBand5BeforePrint
        object VlrAbertoDia: TRLLabel
          Left = 544
          Top = 0
          Width = 76
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor Aberto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object VlrPagoDia: TRLLabel
          Left = 638
          Top = 0
          Width = 66
          Height = 16
          Alignment = taRightJustify
          Caption = 'Valor Pago'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel8: TRLLabel
          Left = 464
          Top = 0
          Width = 60
          Height = 16
          Caption = 'Total Dia'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 156
      Width = 718
      Height = 17
      BandType = btSummary
      BeforePrint = RLBand6BeforePrint
      object RLLabel6: TRLLabel
        Left = 451
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
        ParentFont = False
      end
      object VlrAbertoTot: TRLLabel
        Left = 544
        Top = 0
        Width = 76
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor Aberto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object VlrPagoTot: TRLLabel
        Left = 638
        Top = 0
        Width = 66
        Height = 16
        Alignment = taRightJustify
        Caption = 'Valor Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand7: TRLBand
      Left = 38
      Top = 173
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
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      
        'SELECT  CPP.nrocpagar, cpp.nroparc, G.NOME AS FORN, CPP.DATAGERA' +
        ' AS LCTO, CPP.VCTOPARC AS VCTO,'
      'CAST (CASE CPP.SITUACAO WHEN '#39'A'#39' THEN '#39'Aberta'#39
      'WHEN '#39'C'#39' THEN '#39'Cancelada'#39
      'ELSE '#39'Vencida n'#227'o paga'#39' end'
      'AS VARCHAR(16)) as STATUS'
      
        'FROM CPAGARPARCS CPP INNER JOIN CPAGAR CP ON CP.NROCPAGAR = CPP.' +
        'NROCPAGAR'
      'INNER JOIN GEN G ON G.CODGEN = CP.CODGEN'
      'ORDER BY 4, 1, 5')
    Left = 12
    Top = 251
    object QryRelNROCPAGAR: TSmallintField
      FieldName = 'NROCPAGAR'
      Required = True
    end
    object QryRelNROPARC: TSmallintField
      FieldName = 'NROPARC'
      Required = True
    end
    object QryRelFORN: TMDOStringField
      FieldName = 'FORN'
      Size = 100
    end
    object QryRelLCTO: TDateField
      FieldName = 'LCTO'
    end
    object QryRelVCTO: TDateField
      FieldName = 'VCTO'
    end
    object QryRelSTATUS: TMDOStringField
      FieldName = 'STATUS'
      Size = 16
    end
  end
  object DsRel: TDataSource
    DataSet = QryRel
    Left = 50
    Top = 251
  end
end
