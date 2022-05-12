object FEdTurmasCalRef: TFEdTurmasCalRef
  Left = 54
  Top = 156
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Card'#225'pio para Semana'
  ClientHeight = 423
  ClientWidth = 1205
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1205
    Height = 423
    Align = alClient
    BevelInner = bvLowered
    Color = 2025694
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 14
      Top = 51
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Semana do dia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBGravar: TSpeedButton
      Left = 425
      Top = 39
      Width = 120
      Height = 25
      Caption = 'Card'#225'pio'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SBGravarClick
    end
    object Label6: TLabel
      Left = 46
      Top = 16
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Turma'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 553
      Top = 39
      Width = 120
      Height = 25
      Caption = 'Relat'#243'rio para Imp.'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object DTPIni: TDateTimePicker
      Left = 88
      Top = 46
      Width = 81
      Height = 21
      Date = 39256.493047951390000000
      Time = 39256.493047951390000000
      TabOrder = 0
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 402
      Width = 1201
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 125
        end>
    end
    object DBLCBTurma: TDBLookupComboBox
      Left = 88
      Top = 14
      Width = 328
      Height = 21
      DataField = 'CODGENERO'
      DataSource = FAcervo.DSAcervo
      KeyField = 'CODTURMA'
      ListField = 'CODTURMA;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSTurmasLK
      TabOrder = 2
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 69
      Width = 1201
      Height = 333
      Align = alBottom
      DataSource = DSCardapio
      TabOrder = 3
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DomingoStr'
          Title.Caption = 'Domingo'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SegundaStr'
          Title.Caption = 'Segunda'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TercaStr'
          Title.Caption = 'Ter'#231'a'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QuartaStr'
          Title.Caption = 'Quarta'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QuintaStr'
          Title.Caption = 'Quinta'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SextaStr'
          Title.Caption = 'Sexta'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SabadoStr'
          Title.Caption = 'S'#225'bado'
          Width = 150
          Visible = True
        end>
    end
    object RLPCalend: TRLReport
      Left = 1184
      Top = 407
      Width = 1123
      Height = 794
      DataSource = DSCardapio
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Margins.TopMargin = 5.000000000000000000
      Margins.BottomMargin = 5.000000000000000000
      PageSetup.Orientation = poLandscape
      object RLBand6: TRLBand
        Left = 38
        Top = 19
        Width = 1047
        Height = 54
        BandType = btColumnHeader
        BeforePrint = RLBand6BeforePrint
        object RLLabel9: TRLLabel
          Left = 305
          Top = 0
          Width = 197
          Height = 16
          Caption = 'CARD'#193'PIO SEMANAL - TURMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 1
          Top = 36
          Width = 150
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'DOMINGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel1: TRLLabel
          Left = 150
          Top = 36
          Width = 150
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'SEGUNDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 299
          Top = 36
          Width = 150
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'TER'#199'A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 448
          Top = 36
          Width = 150
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'QUARTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 597
          Top = 36
          Width = 150
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'QUINTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 746
          Top = 36
          Width = 150
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'SEXTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 895
          Top = 36
          Width = 150
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'S'#193'BADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand3: TRLBand
        Left = 38
        Top = 115
        Width = 1047
        Height = 17
        BandType = btFooter
        object RLLabel19: TRLLabel
          Left = 8
          Top = 0
          Width = 132
          Height = 16
          Caption = 'Data/Hora do Sistema'
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 227
          Top = 0
          Width = 39
          Height = 16
          Info = itHour
        end
        object RLLabel20: TRLLabel
          Left = 893
          Top = 0
          Width = 44
          Height = 16
          Caption = 'P'#225'gina'
        end
        object RLSystemInfo2: TRLSystemInfo
          Left = 958
          Top = 0
          Width = 87
          Height = 16
          Info = itPageNumber
        end
        object RLSystemInfo3: TRLSystemInfo
          Left = 153
          Top = 0
          Width = 39
          Height = 16
        end
      end
      object RLDetailGrid1: TRLDetailGrid
        Left = 38
        Top = 73
        Width = 1047
        Height = 42
        RealBounds.UsedUnit = buMilimeters
        AfterPrint = RLDetailGrid1AfterPrint
        BeforePrint = RLDetailGrid1BeforePrint
        object RLDQuadrado: TRLDraw
          Left = 0
          Top = 0
          Width = 1047
          Height = 18
          Align = faTop
        end
        object RLDBText1: TRLDBText
          Left = 1
          Top = 1
          Width = 147
          Height = 16
          AutoSize = False
          DataField = 'DomingoStr'
          DataSource = DSCardapio
        end
        object RLDBText2: TRLDBText
          Left = 150
          Top = 1
          Width = 147
          Height = 16
          AutoSize = False
          DataField = 'SegundaStr'
          DataSource = DSCardapio
        end
        object RLDBText3: TRLDBText
          Left = 299
          Top = 1
          Width = 147
          Height = 16
          AutoSize = False
          DataField = 'TercaStr'
          DataSource = DSCardapio
        end
        object RLDBText4: TRLDBText
          Left = 448
          Top = 1
          Width = 147
          Height = 16
          AutoSize = False
          DataField = 'QuartaStr'
          DataSource = DSCardapio
        end
        object RLDBText5: TRLDBText
          Left = 597
          Top = 1
          Width = 147
          Height = 16
          AutoSize = False
          DataField = 'QuintaStr'
          DataSource = DSCardapio
        end
        object RLDBText6: TRLDBText
          Left = 746
          Top = 1
          Width = 147
          Height = 16
          AutoSize = False
          DataField = 'SextaStr'
          DataSource = DSCardapio
        end
        object RLDBText7: TRLDBText
          Left = 895
          Top = 1
          Width = 150
          Height = 16
          AutoSize = False
          DataField = 'SabadoStr'
          DataSource = DSCardapio
        end
        object RLD1: TRLDraw
          Left = 148
          Top = 0
          Width = 3
          Height = 17
          Angle = 90.000000000000000000
          DrawHeight = 0
          DrawKind = dkLine
          DrawWidth = 20
          HoldStyle = hsVertically
        end
        object RLD2: TRLDraw
          Left = 297
          Top = 0
          Width = 3
          Height = 17
          Angle = 90.000000000000000000
          DrawHeight = 0
          DrawKind = dkLine
          DrawWidth = 20
          HoldStyle = hsVertically
        end
        object RLD3: TRLDraw
          Left = 446
          Top = 0
          Width = 3
          Height = 17
          Angle = 90.000000000000000000
          DrawHeight = 0
          DrawKind = dkLine
          DrawWidth = 20
          HoldStyle = hsVertically
        end
        object RLD4: TRLDraw
          Left = 594
          Top = 0
          Width = 3
          Height = 17
          Angle = 90.000000000000000000
          DrawHeight = 0
          DrawKind = dkLine
          DrawWidth = 20
          HoldStyle = hsVertically
        end
        object RLD5: TRLDraw
          Left = 743
          Top = 0
          Width = 3
          Height = 17
          Angle = 90.000000000000000000
          DrawHeight = 0
          DrawKind = dkLine
          DrawWidth = 20
          HoldStyle = hsVertically
        end
        object RLD6: TRLDraw
          Left = 894
          Top = 0
          Width = 3
          Height = 17
          Angle = 90.000000000000000000
          DrawHeight = 0
          DrawKind = dkLine
          DrawWidth = 20
          HoldStyle = hsVertically
        end
        object RLDBAIXO: TRLDraw
          Left = 0
          Top = 24
          Width = 1046
          Height = 1
          DrawKind = dkLine
        end
      end
    end
  end
  object CDSCardapio: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 32
    object CDSCardapioDomingoStr: TStringField
      FieldName = 'DomingoStr'
      Size = 100
    end
    object CDSCardapioSegundaStr: TStringField
      FieldName = 'SegundaStr'
      Size = 100
    end
    object CDSCardapioTercaStr: TStringField
      FieldName = 'TercaStr'
      Size = 100
    end
    object CDSCardapioQuartaStr: TStringField
      FieldName = 'QuartaStr'
      Size = 100
    end
    object CDSCardapioQuintaStr: TStringField
      FieldName = 'QuintaStr'
      Size = 100
    end
    object CDSCardapioSextaStr: TStringField
      FieldName = 'SextaStr'
      Size = 100
    end
    object CDSCardapioSabadoStr: TStringField
      FieldName = 'SabadoStr'
      Size = 100
    end
  end
  object DSCardapio: TDataSource
    DataSet = CDSCardapio
    Left = 24
    Top = 72
  end
end
