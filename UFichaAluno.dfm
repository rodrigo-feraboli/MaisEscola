object FFichaAluno: TFFichaAluno
  Left = 492
  Top = 167
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Emiss'#227'o da Ficha do Aluno'
  ClientHeight = 56
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
    Left = 41
    Top = 117
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
      object RLLabel1: TRLLabel
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
      Height = 482
      BeforePrint = RLBand2BeforePrint
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
        Left = 113
        Top = 79
        Width = 64
        Height = 16
        Alignment = taRightJustify
        Caption = 'Matr'#237'cula'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 143
        Top = 98
        Width = 34
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fone'
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
      object RLDPai1: TRLDraw
        Tag = 2
        Left = 5
        Top = 189
        Width = 709
        Height = 1
        DrawKind = dkLine
        HoldStyle = hsVertically
      end
      object RLLPai1: TRLLabel
        Tag = 2
        Left = 75
        Top = 192
        Width = 300
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Dados do Pai do Aluno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLPai2: TRLLabel
        Tag = 2
        Left = 138
        Top = 211
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
      object RLLPai3: TRLLabel
        Tag = 2
        Left = 113
        Top = 230
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
      object RLLPai4: TRLLabel
        Tag = 2
        Left = 143
        Top = 250
        Width = 34
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDPai2: TRLDraw
        Tag = 2
        Left = 5
        Top = 283
        Width = 709
        Height = 1
        DrawKind = dkLine
        HoldStyle = hsVertically
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
        Width = 72
        Height = 16
        DataField = 'MATRICULA'
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
        Width = 35
        Height = 16
        DataField = 'FONE'
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
      object RLDBPai1: TRLDBText
        Tag = 2
        Left = 188
        Top = 211
        Width = 453
        Height = 16
        AutoSize = False
        DataField = 'NOMEPAI'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBPai3: TRLDBText
        Tag = 2
        Left = 188
        Top = 250
        Width = 450
        Height = 16
        AutoSize = False
        DataField = 'FONEPAI'
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
      object RLDBPai2: TRLDBText
        Tag = 2
        Left = 188
        Top = 230
        Width = 450
        Height = 16
        AutoSize = False
        DataField = 'ENDERECOPAI'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDMae1: TRLDraw
        Tag = 3
        Left = 5
        Top = 286
        Width = 709
        Height = 1
        DrawKind = dkLine
        HoldStyle = hsVertically
      end
      object RLLMae1: TRLLabel
        Tag = 3
        Left = 74
        Top = 289
        Width = 300
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Dados da M'#227'e do Aluno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLMae2: TRLLabel
        Tag = 3
        Left = 138
        Top = 308
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
      object RLLMae3: TRLLabel
        Tag = 3
        Left = 113
        Top = 327
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
      object RLLMae4: TRLLabel
        Tag = 3
        Left = 143
        Top = 347
        Width = 34
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDMae2: TRLDraw
        Tag = 3
        Left = 5
        Top = 380
        Width = 709
        Height = 1
        DrawKind = dkLine
        HoldStyle = hsVertically
      end
      object RLDBMae1: TRLDBText
        Tag = 3
        Left = 188
        Top = 308
        Width = 500
        Height = 16
        AutoSize = False
        DataField = 'NOMEMAE'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBMae3: TRLDBText
        Tag = 3
        Left = 188
        Top = 347
        Width = 500
        Height = 16
        AutoSize = False
        DataField = 'FONEMAE'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBMae2: TRLDBText
        Tag = 3
        Left = 188
        Top = 327
        Width = 500
        Height = 16
        AutoSize = False
        DataField = 'ENDERECOMAE'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDResp1: TRLDraw
        Tag = 4
        Left = 6
        Top = 383
        Width = 709
        Height = 1
        DrawKind = dkLine
        HoldStyle = hsVertically
      end
      object RLLResp1: TRLLabel
        Tag = 4
        Left = 75
        Top = 386
        Width = 300
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'Dados do Respons'#225'vel do Aluno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLResp2: TRLLabel
        Tag = 4
        Left = 138
        Top = 405
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
      object RLLResp3: TRLLabel
        Tag = 4
        Left = 113
        Top = 424
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
      object RLLResp4: TRLLabel
        Tag = 4
        Left = 143
        Top = 444
        Width = 34
        Height = 16
        Alignment = taRightJustify
        Caption = 'Fone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDLResp2: TRLDraw
        Tag = 4
        Left = 6
        Top = 477
        Width = 709
        Height = 1
        DrawKind = dkLine
        HoldStyle = hsVertically
      end
      object RLDBResp1: TRLDBText
        Tag = 4
        Left = 188
        Top = 405
        Width = 500
        Height = 16
        AutoSize = False
        DataField = 'NOMERESP'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBResp2: TRLDBText
        Tag = 4
        Left = 188
        Top = 424
        Width = 500
        Height = 16
        AutoSize = False
        DataField = 'ENDERECORESP'
        DataSource = DSEst
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object RLDBResp3: TRLDBText
        Tag = 4
        Left = 188
        Top = 444
        Width = 500
        Height = 16
        AutoSize = False
        DataField = 'FONERESP'
        DataSource = DSEst
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
      Top = 522
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
      
        'SELECT A.CODALUNO, A.DTNASC, A.MATRICULA, A.NOME, A.ENDERECO, C.' +
        'DESCRICAO AS CID,'
      
        'B.DESCRICAO AS BAIRRO, A.FONE, A.NOMEPAI, A.ENDERECOPAI , A.FONE' +
        'PAI, A.NOMEMAE, A.ENDERECOMAE , A.FONEMAE,'
      'A.NOMERESP, A.ENDERECORESP , A.FONERESP   FROM ALUNOS A'
      'INNER JOIN CIDADES C ON C.CODCIDADE = A.CODCIDADE'
      'INNER JOIN BAIRROS B ON B.CODBAIRRO = A.CODBAIRRO'
      'WHERE A.CODALUNO  =:PLCOD')
    Left = 20
    Top = 83
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PLCOD'
        ParamType = ptUnknown
      end>
    object QryFichaCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
      Required = True
    end
    object QryFichaDTNASC: TDateField
      FieldName = 'DTNASC'
    end
    object QryFichaMATRICULA: TIntegerField
      FieldName = 'MATRICULA'
    end
    object QryFichaNOME: TMDOStringField
      FieldName = 'NOME'
      Size = 100
    end
    object QryFichaENDERECO: TMDOStringField
      FieldName = 'ENDERECO'
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
    object QryFichaFONE: TMDOStringField
      FieldName = 'FONE'
    end
    object QryFichaNOMEPAI: TMDOStringField
      FieldName = 'NOMEPAI'
      Size = 100
    end
    object QryFichaENDERECOPAI: TMDOStringField
      FieldName = 'ENDERECOPAI'
      Size = 100
    end
    object QryFichaFONEPAI: TMDOStringField
      FieldName = 'FONEPAI'
    end
    object QryFichaNOMEMAE: TMDOStringField
      FieldName = 'NOMEMAE'
      Size = 100
    end
    object QryFichaENDERECOMAE: TMDOStringField
      FieldName = 'ENDERECOMAE'
      Size = 100
    end
    object QryFichaFONEMAE: TMDOStringField
      FieldName = 'FONEMAE'
    end
    object QryFichaNOMERESP: TMDOStringField
      FieldName = 'NOMERESP'
      Size = 100
    end
    object QryFichaENDERECORESP: TMDOStringField
      FieldName = 'ENDERECORESP'
      Size = 100
    end
    object QryFichaFONERESP: TMDOStringField
      FieldName = 'FONERESP'
    end
  end
  object DSEst: TDataSource
    DataSet = QryFicha
    Left = 50
    Top = 83
  end
end
