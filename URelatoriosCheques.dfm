object FRelatoriosCheques: TFRelatoriosCheques
  Left = 265
  Top = 121
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Cheques'
  ClientHeight = 549
  ClientWidth = 877
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
    Width = 877
    Height = 201
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
      Top = 154
      Width = 105
      Height = 22
      Caption = 'Prosseguir'
      OnClick = ProsseguirClick
    end
    object SpeedButton1: TSpeedButton
      Left = 184
      Top = 154
      Width = 105
      Height = 22
      Caption = 'Voltar'
      OnClick = SpeedButton1Click
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 180
      Width = 873
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 110
        end>
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 3
      Width = 375
      Height = 40
      Caption = 'Data de Bom Para do cheque'
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
      Top = 112
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
    object DBLCBAluno: TDBLookupComboBox
      Left = 111
      Top = 48
      Width = 242
      Height = 21
      KeyField = 'CODALUNO'
      ListField = 'CODALUNO;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSAlunosLK
      TabOrder = 3
    end
    object CbAluno: TCheckBox
      Left = 51
      Top = 50
      Width = 52
      Height = 15
      Alignment = taLeftJustify
      Caption = 'Aluno'
      TabOrder = 4
    end
    object GroupBox2: TGroupBox
      Left = 2
      Top = 72
      Width = 377
      Height = 38
      Caption = 'Exibir'
      TabOrder = 5
      object CBPre: TCheckBox
        Left = 11
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Pr'#233'-Datados'
        TabOrder = 0
      end
      object CBBaix: TCheckBox
        Left = 136
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Baixados'
        TabOrder = 1
      end
      object CBCancelado: TCheckBox
        Left = 256
        Top = 16
        Width = 97
        Height = 17
        Caption = 'Cancelados'
        TabOrder = 2
      end
    end
  end
  object RLReport1: TRLReport
    Left = 24
    Top = 248
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
      object RLLabel3: TRLLabel
        Left = 624
        Top = 32
        Width = 90
        Height = 16
        Caption = 'Valor Cheque'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 381
        Top = 32
        Width = 59
        Height = 16
        Caption = 'Pr'#233'-Dat.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 530
        Top = 32
        Width = 39
        Height = 16
        Caption = 'Canc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 571
        Top = 32
        Width = 34
        Height = 16
        Caption = 'Baix.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 451
        Top = 32
        Width = 66
        Height = 16
        Alignment = taCenter
        Caption = 'Bom Para'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 13
        Top = 32
        Width = 43
        Height = 16
        Caption = 'Banco'
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
      DataFields = 'EMITENTE'
      object RLBand3: TRLBand
        Left = 0
        Top = 17
        Width = 718
        Height = 17
        BeforePrint = RLBand3BeforePrint
        object RLDBText2: TRLDBText
          Left = 8
          Top = 0
          Width = 305
          Height = 16
          AutoSize = False
          DataField = 'NOME'
          DataSource = DsRel
        end
        object RLLPreD: TRLLabel
          Left = 381
          Top = 0
          Width = 59
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'X'
          Holder = RLLabel2
        end
        object RLLCanc: TRLLabel
          Left = 530
          Top = 0
          Width = 39
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'X'
          Holder = RLLabel5
        end
        object RLLBaix: TRLLabel
          Left = 571
          Top = 0
          Width = 34
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'X'
          Holder = RLLabel7
        end
        object RLDBText3: TRLDBText
          Left = 451
          Top = 0
          Width = 66
          Height = 16
          Alignment = taCenter
          AutoSize = False
          DataField = 'BOMPARA'
          DataSource = DsRel
          Holder = RLLabel9
        end
        object RLDBText4: TRLDBText
          Left = 624
          Top = 0
          Width = 90
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'VALOR'
          DataSource = DsRel
          Holder = RLLabel3
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 17
        BandType = btHeader
        object RLDBText1: TRLDBText
          Left = 90
          Top = 0
          Width = 439
          Height = 16
          AutoSize = False
          DataField = 'EMITENTE'
          DataSource = DsRel
        end
        object RLLabel1: TRLLabel
          Left = 24
          Top = 0
          Width = 61
          Height = 16
          Caption = 'Emitente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 34
        Width = 718
        Height = 17
        BandType = btFooter
        object RLLabel8: TRLLabel
          Left = 523
          Top = 0
          Width = 97
          Height = 16
          Caption = 'Total Emitente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 631
          Top = 1
          Width = 83
          Height = 16
          Alignment = taRightJustify
          DataField = 'VALOR'
          DataSource = DsRel
          Holder = RLDBText4
          Info = riSum
        end
      end
    end
    object RLBand6: TRLBand
      Left = 38
      Top = 156
      Width = 718
      Height = 17
      BandType = btSummary
      object RLLabel6: TRLLabel
        Left = 547
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
        Left = 631
        Top = 1
        Width = 83
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = DsRel
        Holder = RLDBText4
        Info = riSum
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
      
        'select B.nome, C.BOMPARA, C.VALOR, C.OBS, C.EMITENTE, C.predat, ' +
        'c.baixado, c.cancelado from cheques c'
      'inner join bancos b on b.codbanco = c.codbanco')
    Left = 36
    Top = 211
    object QryRelNOME: TMDOStringField
      FieldName = 'NOME'
      Size = 75
    end
    object QryRelBOMPARA: TDateField
      FieldName = 'BOMPARA'
    end
    object QryRelVALOR: TMDOBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object QryRelOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object QryRelEMITENTE: TMDOStringField
      FieldName = 'EMITENTE'
      Size = 100
    end
    object QryRelPREDAT: TSmallintField
      FieldName = 'PREDAT'
    end
    object QryRelBAIXADO: TSmallintField
      FieldName = 'BAIXADO'
    end
    object QryRelCANCELADO: TSmallintField
      FieldName = 'CANCELADO'
    end
  end
  object DsRel: TDataSource
    DataSet = QryRel
    Left = 66
    Top = 211
  end
end
