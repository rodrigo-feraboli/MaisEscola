object FCPagar: TFCPagar
  Left = 227
  Top = 97
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Contas a Pagar'
  ClientHeight = 428
  ClientWidth = 670
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
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PnlInfo: TPanel
    Left = 0
    Top = 106
    Width = 670
    Height = 324
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label223: TLabel
      Left = 4
      Top = 7
      Width = 660
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Dados da Conta a Pagar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 2
      Top = 183
      Width = 660
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Itens da Conta a Pagar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SBNewItem: TSpeedButton
      Left = 4
      Top = 196
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
    object SBDelParc: TSpeedButton
      Left = 4
      Top = 240
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
      OnClick = SBDelParcClick
    end
    object SBAltItem: TSpeedButton
      Left = 4
      Top = 218
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
    object DBGrid2: TDBGrid
      Left = 3
      Top = 21
      Width = 661
      Height = 155
      Color = clSilver
      DataSource = DSCP
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid2DrawColumnCell
      OnDblClick = SBAlterarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Fornecedor'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA'
          Title.Caption = 'Data'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ObsStr'
          Title.Caption = 'Obs.'
          Width = 250
          Visible = True
        end>
    end
    object DBGrid1: TDBGrid
      Left = 47
      Top = 197
      Width = 619
      Height = 106
      Color = clSilver
      DataSource = DSCPParcs
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid2DrawColumnCell
      OnDblClick = SBAltItemClick
      Columns = <
        item
          Expanded = False
          FieldName = 'VCTOPARC'
          Title.Caption = 'Vcto. Parc.'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLRPARC'
          Title.Caption = 'Valor Parc.'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PGTOPARC'
          Title.Caption = 'Pgto. Parc.'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLRPAGO'
          Title.Caption = 'Vlr. Pago'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SituacaoStr'
          Title.Caption = 'Situa'#231#227'o'
          Width = 235
          Visible = True
        end>
    end
  end
  object PnlSup: TPanel
    Left = 0
    Top = 0
    Width = 670
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
      Caption = 'Lan'#231'ar'
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
      Top = 3
      Width = 59
      Height = 101
      Hint = 'Busca Avan'#231'ada de Contas a Pagar'
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
    object RBCodigo: TRadioButton
      Left = 421
      Top = 23
      Width = 124
      Height = 17
      Caption = 'Nro. Conta a Pagar'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = RBCodigoClick
    end
    object RBDescricao: TRadioButton
      Left = 421
      Top = 39
      Width = 68
      Height = 17
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = RBCodigoClick
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
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 409
    Width = 670
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
    Left = 360
    Top = 97
    Width = 670
    Height = 448
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
      Top = 219
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
      Top = 402
      Width = 63
      Height = 22
      Caption = 'Buscar'
      OnClick = SBOKClick
    end
    object SBCanc: TSpeedButton
      Left = 568
      Top = 402
      Width = 63
      Height = 22
      Caption = 'Cancelar'
      OnClick = SBOKClick
    end
    object SpeedButton3: TSpeedButton
      Left = 531
      Top = 215
      Width = 114
      Height = 22
      Caption = 'Pesquisar'
      OnClick = SpeedButton3Click
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
      OnClick = DBLCBFornCloseUp
      OnCloseUp = DBLCBFornCloseUp
      OnEnter = DBLCBFornCloseUp
      OnExit = DBLCBFornCloseUp
    end
    object DBLCBBanco: TDBLookupComboBox
      Left = 172
      Top = 37
      Width = 342
      Height = 21
      KeyField = 'CODBANCO'
      ListField = 'CODBANCO;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSBancosLK
      TabOrder = 5
      OnClick = DBLCBBancoCloseUp
      OnCloseUp = DBLCBBancoCloseUp
      OnEnter = DBLCBBancoCloseUp
      OnExit = DBLCBBancoCloseUp
    end
    object DBTST1: TEdit
      Left = 124
      Top = 37
      Width = 46
      Height = 21
      TabOrder = 4
      OnExit = DBTST1Exit
    end
    object DBTST: TEdit
      Left = 124
      Top = 5
      Width = 46
      Height = 21
      TabOrder = 1
      OnExit = DBTSTExit
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
    object CBBanco: TCheckBox
      Left = 76
      Top = 40
      Width = 45
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Banco'
      TabOrder = 3
    end
    object DBGridSearch: TDBGrid
      Left = 8
      Top = 242
      Width = 653
      Height = 157
      Color = 8304766
      DataSource = DSSearch
      TabOrder = 13
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGridSearchDrawColumnCell
      OnDblClick = SBOKClick
      Columns = <
        item
          Expanded = False
          FieldName = 'LCTO'
          Title.Caption = 'Data CP.'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORN'
          Title.Caption = 'Fornecedor'
          Width = 165
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CC'
          Title.Caption = 'Centro de Custo'
          Width = 165
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BANC'
          Title.Caption = 'Banco'
          Width = 165
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VCTO'
          Title.Caption = 'Data Vcto.'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VLRPARC'
          Title.Caption = 'Valor'
          Width = 55
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 23
      Top = 101
      Width = 305
      Height = 40
      Caption = 'Data do Lan'#231'amento da Conta a Pagar'
      TabOrder = 9
      object CBLctoIni: TCheckBox
        Left = 8
        Top = 16
        Width = 49
        Height = 17
        Caption = 'Inicial'
        TabOrder = 0
      end
      object DTPLctoIni: TDateTimePicker
        Left = 56
        Top = 13
        Width = 87
        Height = 21
        Date = 38606.580457419000000000
        Time = 38606.580457419000000000
        TabOrder = 1
      end
      object CBLctoFin: TCheckBox
        Left = 161
        Top = 15
        Width = 43
        Height = 17
        Caption = 'Final'
        TabOrder = 2
      end
      object DTPLctoFin: TDateTimePicker
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
      Caption = 'Data do Vencimento da Conta a Pagar'
      TabOrder = 10
      object CBVctoIni: TCheckBox
        Left = 8
        Top = 16
        Width = 49
        Height = 17
        Caption = 'Inicial'
        TabOrder = 0
      end
      object DTPVencIni: TDateTimePicker
        Left = 56
        Top = 13
        Width = 87
        Height = 21
        Date = 38606.580457419000000000
        Time = 38606.580457419000000000
        TabOrder = 1
      end
      object CBVctoFin: TCheckBox
        Left = 161
        Top = 15
        Width = 43
        Height = 17
        Caption = 'Final'
        TabOrder = 2
      end
      object DTPVencFin: TDateTimePicker
        Left = 208
        Top = 13
        Width = 87
        Height = 21
        Date = 38606.580457419000000000
        Time = 38606.580457419000000000
        TabOrder = 3
      end
    end
    object RGStatus: TRadioGroup
      Left = 342
      Top = 143
      Width = 304
      Height = 70
      Caption = 'Status da Parcela da Conta a Pagar'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Todas'
        'Abertas'
        'Canceladas'
        'Pagas'
        'Vencidas n'#227'o pagas')
      TabOrder = 12
    end
    object GroupBox3: TGroupBox
      Left = 22
      Top = 144
      Width = 304
      Height = 70
      Caption = 'Valores'
      TabOrder = 11
      object RBAll: TRadioButton
        Left = 8
        Top = 17
        Width = 89
        Height = 13
        Caption = 'Qualquer Valor'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RBAllClick
      end
      object RBMen: TRadioButton
        Left = 8
        Top = 34
        Width = 89
        Height = 13
        Caption = 'Menor que'
        TabOrder = 1
        OnClick = RBAllClick
      end
      object RBIgu: TRadioButton
        Left = 8
        Top = 51
        Width = 89
        Height = 14
        Caption = 'Igual a'
        TabOrder = 2
        OnClick = RBAllClick
      end
      object RBMai: TRadioButton
        Left = 128
        Top = 16
        Width = 72
        Height = 13
        Caption = 'Maior que'
        TabOrder = 3
        OnClick = RBAllClick
      end
      object EdDinDin: TEdit
        Left = 198
        Top = 13
        Width = 97
        Height = 21
        TabOrder = 4
        Visible = False
        OnChange = EdDinDinChange
      end
    end
    object DBLCBCC: TDBLookupComboBox
      Left = 172
      Top = 69
      Width = 342
      Height = 21
      KeyField = 'CODCC'
      ListField = 'CODCC;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSCCLK
      TabOrder = 8
      OnClick = DBLCBCCCloseUp
      OnCloseUp = DBLCBCCCloseUp
      OnEnter = DBLCBCCCloseUp
      OnExit = DBLCBCCCloseUp
    end
    object DBTST2: TEdit
      Left = 124
      Top = 69
      Width = 46
      Height = 21
      TabOrder = 7
      OnExit = DBTST2Exit
    end
    object CBCC: TCheckBox
      Left = 24
      Top = 72
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Centro de Custo'
      TabOrder = 6
    end
    object StatusBar2: TStatusBar
      Left = 1
      Top = 426
      Width = 668
      Height = 21
      Panels = <
        item
          Width = 223
        end
        item
          Width = 223
        end
        item
          Width = 223
        end>
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
      TabOrder = 15
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
      TabOrder = 16
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
      TabOrder = 17
    end
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 352
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object ContasaPagar1: TMenuItem
        Caption = 'Contas a Pagar'
        OnClick = ContasaPagar1Click
      end
    end
  end
  object DSCPParcs: TDataSource
    DataSet = TbCPParcs
    Left = 104
    Top = 360
  end
  object DSCP: TDataSource
    DataSet = TbCP
    OnDataChange = DSCPDataChange
    Left = 88
    Top = 336
  end
  object TbCP: TMDODataSet
    AfterOpen = TbCPAfterOpen
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CPAGAR'
      'WHERE'
      '  NROCPAGAR = :OLD_NROCPAGAR')
    InsertSQL.Strings = (
      'INSERT INTO CPAGAR'
      
        '  (CODGEN, CODCC, NROCPAGAR, NROCOMPRA, CODBANCO, CODCONDPGTO, D' +
        'ATA, OBS)'
      'VALUES'
      
        '  (:CODGEN, :CODCC, :NROCPAGAR, :NROCOMPRA, :CODBANCO, :CODCONDP' +
        'GTO, :DATA, '
      '   :OBS)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE CPAGAR'
      'SET'
      '  CODGEN = :CODGEN,'
      '  CODCC = :CODCC,'
      '  NROCPAGAR = :NROCPAGAR,'
      '  NROCOMPRA = :NROCOMPRA,'
      '  CODBANCO = :CODBANCO,'
      '  CODCONDPGTO = :CODCONDPGTO,'
      '  DATA = :DATA,'
      '  OBS = :OBS'
      'WHERE'
      '  NROCPAGAR = :OLD_NROCPAGAR')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODGEN,'
      '  CODCC,'
      '  NROCPAGAR,'
      '  NROCOMPRA,'
      '  CODBANCO,'
      '  CODCONDPGTO,'
      '  DATA,'
      '  OBS'
      'FROM CPAGAR '
      'WHERE'
      '  NROCPAGAR = :NROCPAGAR')
    SelectSQL.Strings = (
      'Select * from CPAGAR')
    Left = 56
    Top = 344
    object TbCPNROCPAGAR: TSmallintField
      FieldName = 'NROCPAGAR'
      Required = True
    end
    object TbCPCODGEN: TSmallintField
      FieldName = 'CODGEN'
    end
    object TbCPNROCOMPRA: TSmallintField
      FieldName = 'NROCOMPRA'
    end
    object TbCPCODBANCO: TSmallintField
      FieldName = 'CODBANCO'
    end
    object TbCPCODCONDPGTO: TSmallintField
      FieldName = 'CODCONDPGTO'
      Required = True
    end
    object TbCPDATA: TDateField
      FieldName = 'DATA'
    end
    object TbCPOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object TbCPCODCC: TSmallintField
      FieldName = 'CODCC'
    end
    object TbCPFornecedor: TStringField
      FieldKind = fkLookup
      FieldName = 'Fornecedor'
      LookupDataSet = Dados.QryFornLK
      LookupKeyFields = 'CODGEN'
      LookupResultField = 'NOME'
      KeyFields = 'CODGEN'
      Size = 100
      Lookup = True
    end
    object TbCPObsStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'ObsStr'
      Size = 100
      Calculated = True
    end
  end
  object TbCPParcs: TMDODataSet
    Database = Dados.Database
    OnCalcFields = TbCPParcsCalcFields
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSCP
    DeleteSQL.Strings = (
      'DELETE FROM CPAGARPARCS'
      'WHERE'
      '  NROCPAGAR = :OLD_NROCPAGAR AND'
      '  NROPARC = :OLD_NROPARC')
    InsertSQL.Strings = (
      'INSERT INTO CPAGARPARCS'
      
        '  (VLRMULTA, VLRDESC, NROCHEQUE, AGENCIA, CODBANCO, NROCPAGAR, N' +
        'ROPARC, '
      '   VCTOPARC, VLRPARC, PGTOPARC, VLRPAGO, SITUACAO, DATAGERA)'
      'VALUES'
      
        '  (:VLRMULTA, :VLRDESC, :NROCHEQUE, :AGENCIA, :CODBANCO, :NROCPA' +
        'GAR, :NROPARC, '
      
        '   :VCTOPARC, :VLRPARC, :PGTOPARC, :VLRPAGO, :SITUACAO, :DATAGER' +
        'A)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE CPAGARPARCS'
      'SET'
      '  VLRMULTA = :VLRMULTA,'
      '  VLRDESC = :VLRDESC,'
      '  NROCHEQUE = :NROCHEQUE,'
      '  AGENCIA = :AGENCIA,'
      '  CODBANCO = :CODBANCO,'
      '  NROCPAGAR = :NROCPAGAR,'
      '  NROPARC = :NROPARC,'
      '  VCTOPARC = :VCTOPARC,'
      '  VLRPARC = :VLRPARC,'
      '  PGTOPARC = :PGTOPARC,'
      '  VLRPAGO = :VLRPAGO,'
      '  SITUACAO = :SITUACAO,'
      '  DATAGERA = :DATAGERA'
      'WHERE'
      '  NROCPAGAR = :OLD_NROCPAGAR AND'
      '  NROPARC = :OLD_NROPARC')
    RefreshSQL.Strings = (
      'SELECT '
      '  VLRMULTA,'
      '  VLRDESC,'
      '  NROCHEQUE,'
      '  AGENCIA,'
      '  CODBANCO,'
      '  NROCPAGAR,'
      '  NROPARC,'
      '  VCTOPARC,'
      '  VLRPARC,'
      '  PGTOPARC,'
      '  VLRPAGO,'
      '  SITUACAO,'
      '  DATAGERA'
      'FROM CPAGARPARCS '
      'WHERE'
      '  NROCPAGAR = :NROCPAGAR AND'
      '  NROPARC = :NROPARC')
    SelectSQL.Strings = (
      'Select * from CPAGARPARCS'
      'Where NROCPAGAR = :NROCPAGAR')
    Left = 72
    Top = 360
    object TbCPParcsNROCPAGAR: TIntegerField
      FieldName = 'NROCPAGAR'
      Required = True
    end
    object TbCPParcsNROPARC: TIntegerField
      FieldName = 'NROPARC'
      Required = True
    end
    object TbCPParcsVCTOPARC: TDateField
      FieldName = 'VCTOPARC'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbCPParcsVLRPARC: TMDOBCDField
      FieldName = 'VLRPARC'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object TbCPParcsPGTOPARC: TDateField
      FieldName = 'PGTOPARC'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbCPParcsVLRPAGO: TMDOBCDField
      FieldName = 'VLRPAGO'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object TbCPParcsSITUACAO: TMDOStringField
      FieldName = 'SITUACAO'
      Size = 1
    end
    object TbCPParcsDATAGERA: TDateField
      FieldName = 'DATAGERA'
      DisplayFormat = 'dd/MM/yyyy'
    end
    object TbCPParcsSituacaoStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'SituacaoStr'
      Size = 25
      Calculated = True
    end
    object TbCPParcsVLRMULTA: TMDOBCDField
      FieldName = 'VLRMULTA'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object TbCPParcsVLRDESC: TMDOBCDField
      FieldName = 'VLRDESC'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object TbCPParcsNROCHEQUE: TMDOStringField
      FieldName = 'NROCHEQUE'
    end
    object TbCPParcsAGENCIA: TMDOStringField
      FieldName = 'AGENCIA'
      Size = 8
    end
    object TbCPParcsCODBANCO: TSmallintField
      FieldName = 'CODBANCO'
    end
  end
  object Trans: TMDOTransaction
    Active = False
    AutoCommit = False
    DefaultAction = TACommitRetaining
    DefaultDatabase = Dados.Database
    Left = 152
    Top = 368
  end
  object QryAux: TMDOQuery
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    Left = 168
    Top = 328
  end
  object QrySearch: TMDOQuery
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      
        'select CPP.nrocpagar, CPP.nroparc, G.Nome as FORN, B.Nome as BAN' +
        'C, C.descricao as cc,  CPP.datagera as LCTO, CPP.vctoparc as VCT' +
        'O, CPP.vlrparc, '
      'CAST ('#39#39' as VARCHAR(16)) as STATUS  from cpagarparcs CPP'
      'inner join cpagar CP on CP.nrocpagar = CPP.nrocpagar'
      'inner join gen G on g.codgen = CP.CodGen'
      'inner join cc C on c.codcc = CP.CodCC'
      'left join bancos B on B.codbanco = CP.CodBanco')
    Left = 256
    Top = 256
    object QrySearchFORN: TMDOStringField
      FieldName = 'FORN'
      Size = 100
    end
    object QrySearchBANC: TMDOStringField
      FieldName = 'BANC'
      Size = 75
    end
    object QrySearchLCTO: TDateField
      FieldName = 'LCTO'
    end
    object QrySearchVCTO: TDateField
      FieldName = 'VCTO'
    end
    object QrySearchVLRPARC: TMDOBCDField
      FieldName = 'VLRPARC'
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object QrySearchNROCPAGAR: TSmallintField
      FieldName = 'NROCPAGAR'
      Required = True
    end
    object QrySearchNROPARC: TSmallintField
      FieldName = 'NROPARC'
      Required = True
    end
    object QrySearchCC: TMDOStringField
      FieldName = 'CC'
      Size = 100
    end
    object QrySearchSTATUS: TMDOStringField
      FieldName = 'STATUS'
      Required = True
      Size = 16
    end
  end
  object DSSearch: TDataSource
    DataSet = QrySearch
    Left = 296
    Top = 264
  end
  object PopupMenu1: TPopupMenu
    Left = 368
    Top = 329
    object Baixar1: TMenuItem
      Caption = 'Baixar'
      OnClick = Baixar1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
      OnClick = Cancelar1Click
    end
  end
end
