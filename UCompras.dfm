object FCompras: TFCompras
  Left = 384
  Top = 188
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Compras'
  ClientHeight = 412
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlInfo: TPanel
    Left = 0
    Top = 106
    Width = 672
    Height = 287
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label2: TLabel
      Left = 8
      Top = 7
      Width = 660
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Dados da Compra'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 7
      Top = 21
      Width = 661
      Height = 105
      Color = clSilver
      DataSource = DSCompras
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = SBAlterarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Fornecedor'
          Width = 310
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATACOMPRA'
          Title.Caption = 'Data Compra'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TipoNotaStr'
          Title.Caption = 'Tipo Nota'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NRONF'
          Title.Caption = 'N'#186' NF'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATAEMISSAONF'
          Title.Caption = 'Dt. Emiss'#227'o NF'
          Width = 85
          Visible = True
        end>
    end
    object PCItens: TPageControl
      Left = 2
      Top = 143
      Width = 668
      Height = 142
      ActivePage = TSItens
      Align = alBottom
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnChange = PCItensChange
      object TSItens: TTabSheet
        Caption = 'Itens da Compra'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        object SBNewItem: TSpeedButton
          Left = 1
          Top = 2
          Width = 42
          Height = 22
          Hint = 'Insere nova professora'
          Caption = 'Novo'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = SBNewItemClick
        end
        object SBDelItem: TSpeedButton
          Left = 1
          Top = 46
          Width = 42
          Height = 22
          Hint = 'Apaga registro atual'
          Caption = 'Apagar'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = SBDelItemClick
        end
        object SBAltItem: TSpeedButton
          Left = 1
          Top = 24
          Width = 42
          Height = 22
          Hint = 'Altera registro corrente'
          Caption = 'Alterar'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnClick = SBAltItemClick
        end
        object DBGrid3: TDBGrid
          Left = 45
          Top = 1
          Width = 615
          Height = 113
          Color = clSilver
          DataSource = DSComprasItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDblClick = SBAltItemClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Produto'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUANT'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLRUNIT'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERCICMS'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERCIPI'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VLRIPI'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Tahoma'
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
      object TSParc: TTabSheet
        Caption = 'Parcelas da Compra'
        ImageIndex = 1
        object Label15: TLabel
          Left = 21
          Top = 33
          Width = 32
          Height = 13
          Caption = 'Data 1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 21
          Top = 54
          Width = 32
          Height = 13
          Caption = 'Data 2'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 21
          Top = 77
          Width = 32
          Height = 13
          Caption = 'Data 3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 21
          Top = 99
          Width = 32
          Height = 13
          Caption = 'Data 4'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 140
          Top = 33
          Width = 33
          Height = 13
          Caption = 'Valor 1'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 140
          Top = 53
          Width = 33
          Height = 13
          Caption = 'Valor 2'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label26: TLabel
          Left = 140
          Top = 75
          Width = 33
          Height = 13
          Caption = 'Valor 3'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label27: TLabel
          Left = 140
          Top = 97
          Width = 33
          Height = 13
          Caption = 'Valor 4'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 349
          Top = 33
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data 5'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 349
          Top = 54
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data 6'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 349
          Top = 77
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data 7'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 349
          Top = 98
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data 8'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label28: TLabel
          Left = 468
          Top = 33
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor 5'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label29: TLabel
          Left = 468
          Top = 53
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor 6'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 468
          Top = 75
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor 7'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label31: TLabel
          Left = 468
          Top = 97
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor 8'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 19
          Top = 4
          Width = 116
          Height = 13
          Caption = 'Condi'#231#227'o de Pagamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton3: TSpeedButton
          Left = 423
          Top = 1
          Width = 23
          Height = 22
          Hint = 'Cadastro de Condi'#231#245'es de Pagamento'
          Caption = '+'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = SpeedButton3Click
        end
        object Label1: TLabel
          Left = 457
          Top = 7
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Data Inicial'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object SpeedButton1: TSpeedButton
          Left = 594
          Top = 73
          Width = 65
          Height = 41
          Caption = 'Lan'#231'ar CP'
          OnClick = SpeedButton1Click
        end
        object Label3: TLabel
          Left = 600
          Top = 1
          Width = 53
          Height = 59
          AutoSize = False
          Caption = 'Contas a Pagar Lan'#231'adas'
          WordWrap = True
        end
        object DBEdit2: TDBEdit
          Left = 56
          Top = 29
          Width = 70
          Height = 21
          DataField = 'DTVCTO1'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBEdit3: TDBEdit
          Left = 56
          Top = 51
          Width = 70
          Height = 21
          DataField = 'DTVCTO2'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object DBEdit6: TDBEdit
          Left = 56
          Top = 73
          Width = 70
          Height = 21
          DataField = 'DTVCTO3'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
        object DBEdit7: TDBEdit
          Left = 56
          Top = 96
          Width = 70
          Height = 21
          DataField = 'DTVCTO4'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object DBEdit9: TDBEdit
          Left = 176
          Top = 29
          Width = 79
          Height = 21
          DataField = 'VLR1'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object DBEdit13: TDBEdit
          Left = 176
          Top = 51
          Width = 79
          Height = 21
          DataField = 'VLR2'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object DBEdit15: TDBEdit
          Left = 176
          Top = 73
          Width = 79
          Height = 21
          DataField = 'VLR3'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
        end
        object DBEdit16: TDBEdit
          Left = 176
          Top = 93
          Width = 79
          Height = 21
          DataField = 'VLR4'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object DBEdit17: TDBEdit
          Left = 384
          Top = 30
          Width = 70
          Height = 21
          DataField = 'DTVCTO5'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object DBEdit18: TDBEdit
          Left = 384
          Top = 52
          Width = 70
          Height = 21
          DataField = 'DTVCTO6'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
        end
        object DBEdit19: TDBEdit
          Left = 384
          Top = 74
          Width = 70
          Height = 21
          DataField = 'DTVCTO7'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 15
        end
        object DBEdit20: TDBEdit
          Left = 384
          Top = 94
          Width = 70
          Height = 21
          DataField = 'DTVCTO8'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 17
        end
        object DBEdit21: TDBEdit
          Left = 504
          Top = 30
          Width = 79
          Height = 21
          DataField = 'VLR5'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
        end
        object DBEdit22: TDBEdit
          Left = 504
          Top = 52
          Width = 79
          Height = 21
          DataField = 'VLR6'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
        end
        object DBEdit23: TDBEdit
          Left = 504
          Top = 74
          Width = 79
          Height = 21
          DataField = 'VLR7'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 16
        end
        object DBEdit24: TDBEdit
          Left = 504
          Top = 94
          Width = 79
          Height = 21
          DataField = 'VLR8'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 18
        end
        object DBEdit11: TDBEdit
          Left = 139
          Top = 1
          Width = 46
          Height = 21
          DataField = 'CODCONDPGTO'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBLCBCond: TDBLookupComboBox
          Left = 187
          Top = 1
          Width = 236
          Height = 21
          DataField = 'CODCONDPGTO'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'CODCONDPGTO'
          ListField = 'CODCONDPGTO;DESCRICAO'
          ListFieldIndex = 1
          ListSource = Dados.DSCondPgtoLK
          ParentFont = False
          TabOrder = 1
          OnExit = DBLCBCondExit
        end
        object DBEdit1: TDBEdit
          Left = 513
          Top = 4
          Width = 70
          Height = 21
          DataField = 'DTINI'
          DataSource = DSCompras
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnExit = DBEdit1Exit
        end
      end
    end
    object LblVlrItens: TStaticText
      Left = 571
      Top = 144
      Width = 96
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LblVlrItens'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object LblQtdeItens: TStaticText
      Left = 571
      Top = 129
      Width = 96
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'LblQtdeItens'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object StaticText1: TStaticText
      Left = 431
      Top = 144
      Width = 150
      Height = 15
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Valor dos Produtos:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object StaticText2: TStaticText
      Left = 431
      Top = 129
      Width = 150
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Qtde de Produtos:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object PnlSup: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 106
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object SBRefresh: TSpeedButton
      Left = 243
      Top = 37
      Width = 31
      Height = 32
      Hint = 'Atualizar'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBFirstClick
    end
    object SBPrior: TSpeedButton
      Left = 213
      Top = 37
      Width = 32
      Height = 32
      Hint = #218'ltimo'
      Flat = True
      Margin = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = SBFirstClick
    end
    object SBNext: TSpeedButton
      Left = 183
      Top = 37
      Width = 32
      Height = 32
      Hint = 'Pr'#243'ximo'
      Flat = True
      Margin = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = SBFirstClick
    end
    object SBLast: TSpeedButton
      Left = 153
      Top = 37
      Width = 32
      Height = 32
      Hint = 'Anterior'
      Flat = True
      Margin = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = SBFirstClick
    end
    object SBFirst: TSpeedButton
      Left = 123
      Top = 37
      Width = 32
      Height = 32
      Hint = 'Primeiro'
      Flat = True
      Margin = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = SBFirstClick
    end
    object SBNovo: TSpeedButton
      Left = 3
      Top = 3
      Width = 120
      Height = 25
      Hint = 'Insere novo registro'
      Caption = 'Novo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNovoClick
    end
    object SBAlterar: TSpeedButton
      Left = 3
      Top = 28
      Width = 120
      Height = 25
      Hint = 'Altera registro corrente'
      Caption = 'Alterar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAlterarClick
    end
    object SBExcluir: TSpeedButton
      Left = 3
      Top = 53
      Width = 120
      Height = 25
      Hint = 'Apaga registro atual'
      Caption = 'Apagar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBExcluirClick
    end
    object SBSair: TSpeedButton
      Left = 3
      Top = 78
      Width = 120
      Height = 25
      Hint = 'Sair do cadastro'
      Caption = 'Sair'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBSairClick
    end
    object SBBusca: TSpeedButton
      Left = 610
      Top = 1
      Width = 59
      Height = 103
      Hint = 'Busca Avan'#231'ada de Compras'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBBuscaClick
    end
    object Label9: TLabel
      Left = 421
      Top = 7
      Width = 32
      Height = 13
      Caption = 'Ordem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblQtde: TLabel
      Left = 397
      Top = 80
      Width = 197
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'LblQtde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object BitImporta: TBitBtn
      Left = 258
      Top = 72
      Width = 133
      Height = 25
      Caption = 'Importar Ord. Compra'
      TabOrder = 0
      Visible = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
    end
    object RBCodigo: TRadioButton
      Left = 421
      Top = 23
      Width = 57
      Height = 17
      Caption = 'C'#243'digo'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      OnClick = RBCodigoClick
    end
    object RBDescricao: TRadioButton
      Left = 421
      Top = 39
      Width = 68
      Height = 17
      Caption = 'T'#237'tulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object EdBusca: TEdit
      Left = 418
      Top = 56
      Width = 189
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 393
    Width = 672
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'CTRL + N - Novo'
        Width = 110
      end
      item
        Alignment = taCenter
        Text = 'CTRL + A - Alterar'
        Width = 110
      end
      item
        Alignment = taCenter
        Text = 'CTRL + Del - Excluir '
        Width = 110
      end
      item
        Alignment = taCenter
        Text = 'F3 - Busca Avan'#231'ada'
        Width = 110
      end
      item
        Alignment = taCenter
        Text = 'Esc - Sair'
        Width = 110
      end>
  end
  object PnlSearch: TPanel
    Left = 608
    Top = 347
    Width = 672
    Height = 431
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Visible = False
    object LblQtde2: TLabel
      Left = 342
      Top = 159
      Width = 187
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'LblQtde2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SBOK: TSpeedButton
      Left = 496
      Top = 406
      Width = 63
      Height = 22
      Caption = 'Buscar'
      OnClick = SBOKClick
    end
    object SBCanc: TSpeedButton
      Left = 568
      Top = 406
      Width = 63
      Height = 22
      Caption = 'Cancelar'
      OnClick = SBOKClick
    end
    object SpeedButton2: TSpeedButton
      Left = 531
      Top = 155
      Width = 114
      Height = 22
      Caption = 'Pesquisar'
      OnClick = SpeedButton2Click
    end
    object DBLCBForn: TDBLookupComboBox
      Left = 172
      Top = 5
      Width = 342
      Height = 21
      KeyField = 'CODGEN'
      ListField = 'CODGEN;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSFornLK
      TabOrder = 2
    end
    object DBLCBCFOP: TDBLookupComboBox
      Left = 172
      Top = 37
      Width = 342
      Height = 21
      KeyField = 'CFOP'
      ListField = 'CFOP;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSCFOPLK
      TabOrder = 5
    end
    object DBTST1: TEdit
      Left = 124
      Top = 37
      Width = 46
      Height = 21
      TabOrder = 4
    end
    object DBTST: TEdit
      Left = 124
      Top = 5
      Width = 46
      Height = 21
      TabOrder = 1
    end
    object CBForn: TCheckBox
      Left = 49
      Top = 7
      Width = 72
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Fornecedor'
      TabOrder = 0
    end
    object CBCFOP: TCheckBox
      Left = 76
      Top = 40
      Width = 45
      Height = 17
      Alignment = taLeftJustify
      Caption = 'CFOP'
      TabOrder = 3
    end
    object DBGridSearch: TDBGrid
      Left = 8
      Top = 186
      Width = 653
      Height = 216
      Color = 8304766
      DataSource = DSSearch
      ReadOnly = True
      TabOrder = 12
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = SBOKClick
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Caption = 'Tipo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NROCOMPRA'
          Title.Caption = 'N'#186' Compra'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORN'
          Title.Caption = 'Fornecedor'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLASS'
          Title.Caption = 'CFOP'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPRA'
          Title.Caption = 'Dt. Compra'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMISS'
          Title.Caption = 'Dt. Emiss.'
          Width = 65
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 23
      Top = 101
      Width = 305
      Height = 40
      Caption = 'Data da Compra'
      TabOrder = 9
      object CBDtComIni: TCheckBox
        Left = 8
        Top = 16
        Width = 49
        Height = 17
        Caption = 'Inicial'
        TabOrder = 0
      end
      object DTPDtIni: TDateTimePicker
        Left = 56
        Top = 13
        Width = 87
        Height = 21
        Date = 38606.580457419000000000
        Time = 38606.580457419000000000
        TabOrder = 1
      end
      object CBDtComFin: TCheckBox
        Left = 161
        Top = 15
        Width = 43
        Height = 17
        Caption = 'Final'
        TabOrder = 2
      end
      object DTPDtFin: TDateTimePicker
        Left = 208
        Top = 13
        Width = 87
        Height = 21
        Date = 38606.580457419000000000
        Time = 38606.580457419000000000
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 342
      Top = 101
      Width = 306
      Height = 40
      Caption = 'Data de Emiss'#227'o da NF'
      TabOrder = 10
      object CBEmiIni: TCheckBox
        Left = 8
        Top = 16
        Width = 49
        Height = 17
        Caption = 'Inicial'
        TabOrder = 0
      end
      object DTPEmiIni: TDateTimePicker
        Left = 56
        Top = 13
        Width = 87
        Height = 21
        Date = 38606.580457419000000000
        Time = 38606.580457419000000000
        TabOrder = 1
      end
      object CBEmiFin: TCheckBox
        Left = 161
        Top = 15
        Width = 43
        Height = 17
        Caption = 'Final'
        TabOrder = 2
      end
      object DTPEmiFin: TDateTimePicker
        Left = 208
        Top = 13
        Width = 87
        Height = 21
        Date = 38606.580457419000000000
        Time = 38606.580457419000000000
        TabOrder = 3
      end
    end
    object RGTipo: TRadioGroup
      Left = 23
      Top = 143
      Width = 304
      Height = 40
      Caption = 'Tipo de Nota Fiscal'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Todas'
        'Entrada'
        'Sa'#237'da')
      TabOrder = 11
    end
    object DBLCBCondPgto: TDBLookupComboBox
      Left = 172
      Top = 69
      Width = 342
      Height = 21
      KeyField = 'CODCONDPGTO'
      ListField = 'CODCONDPGTO;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSCondPgtoLK
      TabOrder = 8
    end
    object DBTST2: TEdit
      Left = 124
      Top = 69
      Width = 46
      Height = 21
      TabOrder = 7
    end
    object CBCondPgto: TCheckBox
      Left = 16
      Top = 72
      Width = 105
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Condi'#231#227'o de Pgto.'
      TabOrder = 6
    end
    object STAbertas: TStaticText
      Left = 5
      Top = 431
      Width = 206
      Height = 13
      AutoSize = False
      Caption = 'Abertas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 13
    end
    object STPagas: TStaticText
      Left = 452
      Top = 431
      Width = 206
      Height = 13
      AutoSize = False
      Caption = 'Pagas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
    end
    object STNPagas: TStaticText
      Left = 229
      Top = 431
      Width = 206
      Height = 13
      AutoSize = False
      Caption = 'N'#227'o Pagas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clOlive
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 15
    end
  end
  object MainMenu1: TMainMenu
    Left = 96
    Top = 368
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object CFOP1: TMenuItem
        Caption = 'CFOP'
      end
      object CondiesdePagamento1: TMenuItem
        Caption = 'Condi'#231#245'es de Pagamento'
      end
      object Fornecedores1: TMenuItem
        Caption = 'Fornecedores'
      end
      object Transportadora1: TMenuItem
        Caption = 'Transportadora'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ImportarOramento1: TMenuItem
        Caption = 'Importar Ordem de Compra'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Vendas1: TMenuItem
        Caption = 'Compras'
        OnClick = Vendas1Click
      end
    end
  end
  object DSCompras: TDataSource
    DataSet = TbCompras
    OnDataChange = DSComprasDataChange
    Left = 296
    Top = 312
  end
  object DSComprasItens: TDataSource
    DataSet = TbComprasItens
    Left = 296
    Top = 340
  end
  object QryProx: TMDOQuery
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    Left = 368
    Top = 312
  end
  object Trans: TMDOTransaction
    Active = False
    AutoCommit = False
    DefaultAction = TACommitRetaining
    DefaultDatabase = Dados.Database
    Left = 392
    Top = 340
  end
  object TbCompras: TMDODataSet
    AfterOpen = TbComprasAfterOpen
    Database = Dados.Database
    OnCalcFields = TbComprasCalcFields
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM COMPRAS'
      'WHERE'
      '  NROCOMPRA = :OLD_NROCOMPRA')
    InsertSQL.Strings = (
      'INSERT INTO COMPRAS'
      
        '  (NROCOMPRA, DATACOMPRA, TIPONOTA, NRONF, DATAEMISSAONF, CODFOR' +
        'NGEN, CODCFOP, '
      
        '   CODCONDPGTO, CODTRANSP, CODORDEMCOMPRA, FRETEPORCONTA, VLR1, ' +
        'DTVCTO1, '
      
        '   VLR2, DTVCTO2, VLR3, DTVCTO3, VLR4, DTVCTO4, VLR5, DTVCTO5, V' +
        'LR6, DTVCTO6, '
      '   VLR7, DTVCTO7, VLR8, DTVCTO8, DTINI)'
      'VALUES'
      
        '  (:NROCOMPRA, :DATACOMPRA, :TIPONOTA, :NRONF, :DATAEMISSAONF, :' +
        'CODFORNGEN, '
      
        '   :CODCFOP, :CODCONDPGTO, :CODTRANSP, :CODORDEMCOMPRA, :FRETEPO' +
        'RCONTA, '
      
        '   :VLR1, :DTVCTO1, :VLR2, :DTVCTO2, :VLR3, :DTVCTO3, :VLR4, :DT' +
        'VCTO4, '
      
        '   :VLR5, :DTVCTO5, :VLR6, :DTVCTO6, :VLR7, :DTVCTO7, :VLR8, :DT' +
        'VCTO8, '
      '   :DTINI)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE COMPRAS'
      'SET'
      '  NROCOMPRA = :NROCOMPRA,'
      '  DATACOMPRA = :DATACOMPRA,'
      '  TIPONOTA = :TIPONOTA,'
      '  NRONF = :NRONF,'
      '  DATAEMISSAONF = :DATAEMISSAONF,'
      '  CODFORNGEN = :CODFORNGEN,'
      '  CODCFOP = :CODCFOP,'
      '  CODCONDPGTO = :CODCONDPGTO,'
      '  CODTRANSP = :CODTRANSP,'
      '  CODORDEMCOMPRA = :CODORDEMCOMPRA,'
      '  FRETEPORCONTA = :FRETEPORCONTA,'
      '  VLR1 = :VLR1,'
      '  DTVCTO1 = :DTVCTO1,'
      '  VLR2 = :VLR2,'
      '  DTVCTO2 = :DTVCTO2,'
      '  VLR3 = :VLR3,'
      '  DTVCTO3 = :DTVCTO3,'
      '  VLR4 = :VLR4,'
      '  DTVCTO4 = :DTVCTO4,'
      '  VLR5 = :VLR5,'
      '  DTVCTO5 = :DTVCTO5,'
      '  VLR6 = :VLR6,'
      '  DTVCTO6 = :DTVCTO6,'
      '  VLR7 = :VLR7,'
      '  DTVCTO7 = :DTVCTO7,'
      '  VLR8 = :VLR8,'
      '  DTVCTO8 = :DTVCTO8,'
      '  DTINI = :DTINI'
      'WHERE'
      '  NROCOMPRA = :OLD_NROCOMPRA')
    RefreshSQL.Strings = (
      'SELECT '
      '  NROCOMPRA,'
      '  DATACOMPRA,'
      '  TIPONOTA,'
      '  NRONF,'
      '  DATAEMISSAONF,'
      '  CODFORNGEN,'
      '  CODCFOP,'
      '  CODCONDPGTO,'
      '  CODTRANSP,'
      '  CODORDEMCOMPRA,'
      '  FRETEPORCONTA,'
      '  VLR1,'
      '  DTVCTO1,'
      '  VLR2,'
      '  DTVCTO2,'
      '  VLR3,'
      '  DTVCTO3,'
      '  VLR4,'
      '  DTVCTO4,'
      '  VLR5,'
      '  DTVCTO5,'
      '  VLR6,'
      '  DTVCTO6,'
      '  VLR7,'
      '  DTVCTO7,'
      '  VLR8,'
      '  DTVCTO8,'
      '  DTINI'
      'FROM COMPRAS '
      'WHERE'
      '  NROCOMPRA = :NROCOMPRA')
    SelectSQL.Strings = (
      'select *  from COMPRAS')
    Left = 264
    Top = 312
    object TbComprasNROCOMPRA: TIntegerField
      FieldName = 'NROCOMPRA'
      Required = True
    end
    object TbComprasDATACOMPRA: TDateField
      FieldName = 'DATACOMPRA'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbComprasTIPONOTA: TMDOStringField
      FieldName = 'TIPONOTA'
      Size = 1
    end
    object TbComprasNRONF: TLargeintField
      FieldName = 'NRONF'
    end
    object TbComprasDATAEMISSAONF: TDateField
      FieldName = 'DATAEMISSAONF'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbComprasCODFORNGEN: TIntegerField
      FieldName = 'CODFORNGEN'
      Required = True
    end
    object TbComprasCODCFOP: TIntegerField
      FieldName = 'CODCFOP'
      Required = True
    end
    object TbComprasCODCONDPGTO: TIntegerField
      FieldName = 'CODCONDPGTO'
      Required = True
    end
    object TbComprasCODTRANSP: TIntegerField
      FieldName = 'CODTRANSP'
      Required = True
    end
    object TbComprasCODORDEMCOMPRA: TIntegerField
      FieldName = 'CODORDEMCOMPRA'
    end
    object TbComprasFRETEPORCONTA: TMDOStringField
      FieldName = 'FRETEPORCONTA'
      Size = 1
    end
    object TbComprasVLR1: TMDOBCDField
      FieldName = 'VLR1'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object TbComprasDTVCTO1: TDateField
      FieldName = 'DTVCTO1'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbComprasVLR2: TMDOBCDField
      FieldName = 'VLR2'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object TbComprasDTVCTO2: TDateField
      FieldName = 'DTVCTO2'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbComprasVLR3: TMDOBCDField
      FieldName = 'VLR3'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object TbComprasDTVCTO3: TDateField
      FieldName = 'DTVCTO3'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbComprasVLR4: TMDOBCDField
      FieldName = 'VLR4'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object TbComprasDTVCTO4: TDateField
      FieldName = 'DTVCTO4'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbComprasVLR5: TMDOBCDField
      FieldName = 'VLR5'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object TbComprasDTVCTO5: TDateField
      FieldName = 'DTVCTO5'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbComprasVLR6: TMDOBCDField
      FieldName = 'VLR6'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object TbComprasDTVCTO6: TDateField
      FieldName = 'DTVCTO6'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbComprasVLR7: TMDOBCDField
      FieldName = 'VLR7'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object TbComprasDTVCTO7: TDateField
      FieldName = 'DTVCTO7'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbComprasVLR8: TMDOBCDField
      FieldName = 'VLR8'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object TbComprasDTVCTO8: TDateField
      FieldName = 'DTVCTO8'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbComprasDTINI: TDateField
      FieldName = 'DTINI'
    end
    object TbComprasTipoNotaStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'TipoNotaStr'
      Size = 7
      Calculated = True
    end
    object TbComprasFornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'Fornecedor'
      LookupDataSet = Dados.QryFornLK
      LookupKeyFields = 'CODGEN'
      LookupResultField = 'NOME'
      KeyFields = 'CODFORNGEN'
      Size = 100
      Lookup = True
    end
  end
  object TbComprasItens: TMDODataSet
    Database = Dados.Database
    OnCalcFields = TbComprasItensCalcFields
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSCompras
    DeleteSQL.Strings = (
      'DELETE FROM COMPRASITENS'
      'WHERE'
      '  NROCOMPRA = :OLD_NROCOMPRA AND'
      '  NROITEM = :OLD_NROITEM')
    InsertSQL.Strings = (
      'INSERT INTO COMPRASITENS'
      
        '  (NROCOMPRA, NROITEM, CODPRODUTO, QUANT, VLRUNIT, PERCICMS, PER' +
        'CIPI, VLRIPI)'
      'VALUES'
      
        '  (:NROCOMPRA, :NROITEM, :CODPRODUTO, :QUANT, :VLRUNIT, :PERCICM' +
        'S, :PERCIPI, '
      '   :VLRIPI)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE COMPRASITENS'
      'SET'
      '  NROCOMPRA = :NROCOMPRA,'
      '  NROITEM = :NROITEM,'
      '  CODPRODUTO = :CODPRODUTO,'
      '  QUANT = :QUANT,'
      '  VLRUNIT = :VLRUNIT,'
      '  PERCICMS = :PERCICMS,'
      '  PERCIPI = :PERCIPI,'
      '  VLRIPI = :VLRIPI'
      'WHERE'
      '  NROCOMPRA = :OLD_NROCOMPRA AND'
      '  NROITEM = :OLD_NROITEM')
    RefreshSQL.Strings = (
      'SELECT '
      '  NROCOMPRA,'
      '  NROITEM,'
      '  CODPRODUTO,'
      '  QUANT,'
      '  VLRUNIT,'
      '  PERCICMS,'
      '  PERCIPI,'
      '  VLRIPI'
      'FROM COMPRASITENS '
      'WHERE'
      '  NROCOMPRA = :NROCOMPRA AND'
      '  NROITEM = :NROITEM')
    SelectSQL.Strings = (
      'select * from COMPRASITENS'
      'where NROCOMPRA= :NROCOMPRA'
      '')
    Left = 264
    Top = 340
    object TbComprasItensNROCOMPRA: TIntegerField
      FieldName = 'NROCOMPRA'
      Required = True
    end
    object TbComprasItensNROITEM: TIntegerField
      FieldName = 'NROITEM'
      Required = True
    end
    object TbComprasItensCODPRODUTO: TIntegerField
      FieldName = 'CODPRODUTO'
      Required = True
    end
    object TbComprasItensQUANT: TMDOBCDField
      FieldName = 'QUANT'
      Precision = 18
      Size = 2
    end
    object TbComprasItensVLRUNIT: TMDOBCDField
      FieldName = 'VLRUNIT'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 3
    end
    object TbComprasItensPERCICMS: TSmallintField
      FieldName = 'PERCICMS'
    end
    object TbComprasItensPERCIPI: TSmallintField
      FieldName = 'PERCIPI'
    end
    object TbComprasItensVLRIPI: TMDOBCDField
      FieldName = 'VLRIPI'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object TbComprasItensVlrTot: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VlrTot'
      DisplayFormat = '#,##0.00'
      Calculated = True
    end
    object TbComprasItensProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'Produto'
      LookupDataSet = Dados.QryProdutosLK
      LookupKeyFields = 'CODPROD'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODPRODUTO'
      Size = 100
      Lookup = True
    end
  end
  object DSSearch: TDataSource
    DataSet = QrySearch
    Left = 296
    Top = 264
  end
  object QrySearch: TMDOQuery
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      'SELECT C.NroCompra, G.NOME AS FORN, CF.DESCRICAO AS CLASS,'
      'C.DATACOMPRA AS COMPRA, C.DATAEMISSAONF AS EMISS,'
      'CAST (CASE C.TIPONOTA WHEN '#39'E'#39' THEN '#39'Entrada'#39
      'ELSE '#39'Sa'#237'da'#39' end AS VARCHAR(7)) as TIPO'
      'FROM COMPRAS C'
      'INNER JOIN GEN G ON G.CODGEN = C.CODFORNGEN'
      'INNER JOIN CFOP CF ON CF.CODCFOP = C.CODCFOP'
      'LEFT JOIN  CONDPGTO  CP ON CP.CODCONDPGTO = C.CODCONDPGTO')
    Left = 256
    Top = 256
    object QrySearchNROCOMPRA: TIntegerField
      FieldName = 'NROCOMPRA'
      Required = True
    end
    object QrySearchFORN: TMDOStringField
      FieldName = 'FORN'
      Size = 100
    end
    object QrySearchCLASS: TMDOStringField
      FieldName = 'CLASS'
      Size = 100
    end
    object QrySearchCOMPRA: TDateField
      FieldName = 'COMPRA'
    end
    object QrySearchEMISS: TDateField
      FieldName = 'EMISS'
    end
    object QrySearchTIPO: TMDOStringField
      FieldName = 'TIPO'
      Size = 7
    end
  end
end
