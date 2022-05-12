object FFichaFT: TFFichaFT
  Left = 225
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o da Ficha do Aluno'
  ClientHeight = 320
  ClientWidth = 275
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
    Width = 275
    Height = 56
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
      Top = 7
      Width = 105
      Height = 22
      Caption = 'Prosseguir'
      OnClick = ProsseguirClick
    end
    object SpeedButton1: TSpeedButton
      Left = 144
      Top = 7
      Width = 105
      Height = 22
      Caption = 'Voltar'
      OnClick = SpeedButton1Click
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 35
      Width = 271
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 110
        end>
    end
  end
  object RLReport1: TRLReport
    Left = 89
    Top = 101
    Width = 794
    Height = 1123
    DataSource = DSEst
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Margins.TopMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    object RLBand1: TRLBand
      Left = 38
      Top = 19
      Width = 718
      Height = 21
      BandType = btColumnHeader
      object RLLCabecalho: TRLLabel
        Left = 305
        Top = 1
        Width = 124
        Height = 19
        Caption = 'Ficha do Aluno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 40
      Width = 718
      Height = 176
      object RLLabel2: TRLLabel
        Left = 130
        Top = 22
        Width = 47
        Height = 16
        Alignment = taRightJustify
        Caption = 'C'#243'digo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 138
        Top = 41
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 64
        Top = 60
        Width = 113
        Height = 16
        Alignment = taRightJustify
        Caption = 'Data Nascimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 119
        Top = 79
        Width = 58
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fantasia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 131
        Top = 98
        Width = 46
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fone 1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 113
        Top = 117
        Width = 64
        Height = 16
        Alignment = taRightJustify
        Caption = 'Endere'#231'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 134
        Top = 136
        Width = 43
        Height = 16
        Alignment = taRightJustify
        Caption = 'Bairro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 130
        Top = 155
        Width = 47
        Height = 16
        Alignment = taRightJustify
        Caption = 'Cidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText1: TRLDBText
        Left = 188
        Top = 22
        Width = 154
        Height = 16
        AutoSize = False
        DataField = 'CODALUNO'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 188
        Top = 41
        Width = 38
        Height = 16
        DataField = 'NOME'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText3: TRLDBText
        Left = 188
        Top = 60
        Width = 52
        Height = 16
        DataField = 'DTNASC'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText4: TRLDBText
        Left = 188
        Top = 79
        Width = 63
        Height = 16
        DataField = 'FANTASIA'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText5: TRLDBText
        Left = 188
        Top = 98
        Width = 42
        Height = 16
        DataField = 'FONE1'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText6: TRLDBText
        Left = 188
        Top = 117
        Width = 66
        Height = 16
        DataField = 'ENDERECO'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText7: TRLDBText
        Left = 188
        Top = 136
        Width = 48
        Height = 16
        DataField = 'BAIRRO'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText8: TRLDBText
        Left = 188
        Top = 155
        Width = 24
        Height = 16
        DataField = 'CID'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 323
        Top = 61
        Width = 46
        Height = 16
        Alignment = taRightJustify
        Caption = 'Idade:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLIdade: TRLLabel
        Left = 376
        Top = 61
        Width = 56
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBText9: TRLDBText
        Left = 379
        Top = 98
        Width = 42
        Height = 16
        DataField = 'FONE2'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 322
        Top = 98
        Width = 46
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fone 2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 216
      Width = 718
      Height = 26
      BandType = btFooter
      object RLLabel19: TRLLabel
        Left = 8
        Top = 9
        Width = 130
        Height = 16
        Caption = 'Data/Hora do Sistema'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel20: TRLLabel
        Left = 608
        Top = 9
        Width = 42
        Height = 16
        Caption = 'P'#225'gina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 653
        Top = 9
        Width = 87
        Height = 16
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 153
        Top = 9
        Width = 96
        Height = 16
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Info = itNow
        ParentFont = False
      end
    end
  end
  object QryFicha: TMDOQuery
    Database = Dados.Database
    Transaction = Dados.TransactionLK
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      
        'SELECT G.CODGEN, G.DTFUND, G.NOME, G.FANTASIA, G.ENDERECO,  C.DE' +
        'SCRICAO AS CID,'
      'B.DESCRICAO AS BAIRRO, G.FONE1, G.FONE2   FROM GEN G'
      'INNER JOIN CIDADES C ON C.CODCIDADE = G.CODCIDADE'
      'INNER JOIN BAIRROS B ON B.CODBAIRRO = G.CODBAIRRO'
      'WHERE G.CODGEN  =:PLCOD')
    Left = 20
    Top = 83
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PLCOD'
        ParamType = ptUnknown
      end>
    object QryFichaCODGEN: TSmallintField
      FieldName = 'CODGEN'
      Required = True
    end
    object QryFichaDTFUND: TDateField
      FieldName = 'DTFUND'
    end
    object QryFichaENDERECO: TMDOStringField
      FieldName = 'ENDERECO'
      Size = 200
    end
    object QryFichaNOME: TMDOStringField
      FieldName = 'NOME'
      Size = 100
    end
    object QryFichaFANTASIA: TMDOStringField
      FieldName = 'FANTASIA'
      Size = 100
    end
    object QryFichaCID: TMDOStringField
      FieldName = 'CID'
      Size = 100
    end
    object QryFichaBAIRRO: TMDOStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object QryFichaFONE1: TMDOStringField
      FieldName = 'FONE1'
    end
    object QryFichaFONE2: TMDOStringField
      FieldName = 'FONE2'
    end
  end
  object DSEst: TDataSource
    DataSet = QryFicha
    Left = 50
    Top = 83
  end
end
