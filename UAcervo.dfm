object FAcervo: TFAcervo
  Left = 347
  Top = 57
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Acervo Liter'#225'rio'
  ClientHeight = 473
  ClientWidth = 575
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SBDelItens: TSpeedButton
    Left = 5
    Top = 348
    Width = 51
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
    OnClick = SBDelItensClick
  end
  object SBEditItem: TSpeedButton
    Left = 5
    Top = 326
    Width = 51
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
    OnClick = SBEditItemClick
  end
  object SBNewItem: TSpeedButton
    Left = 5
    Top = 304
    Width = 51
    Height = 22
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
    OnClick = SBNewItemClick
  end
  object LblQtde2: TLabel
    Left = 359
    Top = 248
    Width = 197
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'LblQtde2'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblQtde3: TLabel
    Left = 359
    Top = 267
    Width = 197
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'LblQtde3'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = -4
    Top = 263
    Width = 583
    Height = 4
    Shape = bsTopLine
  end
  object Bevel3: TBevel
    Left = -4
    Top = 243
    Width = 583
    Height = 4
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 159
    Top = 267
    Width = 197
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Reservas Ativas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 159
    Top = 248
    Width = 197
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Itens do Acervo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblQtde4: TLabel
    Left = 359
    Top = 287
    Width = 197
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'LblQtde4'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 159
    Top = 287
    Width = 197
    Height = 14
    Alignment = taCenter
    AutoSize = False
    Caption = 'Retiradas Ativas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = -4
    Top = 283
    Width = 583
    Height = 4
    Shape = bsTopLine
  end
  object SBReservas: TSpeedButton
    Left = 1
    Top = 267
    Width = 120
    Height = 15
    Hint = 'Verificar Reservas'
    Caption = 'Reservas'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SBReservasClick
  end
  object SpeedButton2: TSpeedButton
    Left = 1
    Top = 285
    Width = 120
    Height = 15
    Hint = 'Insere novo registro'
    Caption = 'Retiradas'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    OnClick = SpeedButton2Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 575
    Height = 107
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    Color = 2025694
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object SBBusca: TSpeedButton
      Left = 513
      Top = 3
      Width = 59
      Height = 101
      Hint = 'Busca Avan'#231'ada de Acervo Liter'#225'rio'
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
    object Label1: TLabel
      Left = 312
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
      Left = 288
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
      Left = 312
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
      TabOrder = 0
      TabStop = True
      OnClick = RBCodigoClick
    end
    object RBDescricao: TRadioButton
      Left = 312
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
      TabOrder = 1
      OnClick = RBCodigoClick
    end
    object EdBusca: TEdit
      Left = 309
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
      OnChange = EdBuscaChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 107
    Width = 575
    Height = 135
    Align = alTop
    Color = clSilver
    DataSource = DSAcervo
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = SBAlterarClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODACERVO'
        Title.Caption = 'C'#243'd. Acervo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITULO'
        Title.Caption = 'T'#237'tulo'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO'
        Title.Caption = 'Pre'#231'o'
        Width = 75
        Visible = True
      end>
  end
  object DBGrid3: TDBGrid
    Left = 56
    Top = 303
    Width = 518
    Height = 150
    Color = clSilver
    DataSource = DSAcervoItens
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = SBEditItemClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMREG'
        Title.Caption = 'Num. Reg.'
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EDICAO'
        Title.Caption = 'Edi'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IMPRENTA'
        Title.Caption = 'Imprenta'
        Width = 282
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Title.Caption = 'Estado'
        Width = 80
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 454
    Width = 575
    Height = 19
    Color = 2025694
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
  object PnlBusca: TPanel
    Left = 57
    Top = 106
    Width = 575
    Height = 368
    BevelInner = bvLowered
    BevelOuter = bvSpace
    Color = 2025694
    TabOrder = 4
    Visible = False
    object SpeedButton6: TSpeedButton
      Left = 352
      Top = 338
      Width = 90
      Height = 25
      Caption = 'OK'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object SpeedButton7: TSpeedButton
      Left = 448
      Top = 338
      Width = 90
      Height = 25
      Caption = 'Cancelar'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 2
      Width = 571
      Height = 329
      Align = alTop
      Color = 8304766
      DataSource = DSAcervo
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid2DrawColumnCell
      OnDblClick = DBGrid2DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODACERVO'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Title.Caption = 'T'#237'tulo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 400
          Visible = True
        end>
    end
  end
  object MainMenu1: TMainMenu
    Left = 128
    Top = 72
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Sinttico1: TMenuItem
        Caption = 'Sint'#233'tico'
        OnClick = Sinttico1Click
      end
    end
  end
  object DSAcervo: TDataSource
    DataSet = TbAcervo
    OnDataChange = DSAcervoDataChange
    Left = 143
    Top = 126
  end
  object TbAcervo: TMDODataSet
    AfterClose = TbAcervoAfterClose
    AfterOpen = TbAcervoAfterOpen
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ACERVO'
      'WHERE'
      '  CODACERVO = :OLD_CODACERVO')
    InsertSQL.Strings = (
      'INSERT INTO ACERVO'
      
        '  (CODACERVO, TITULO, CODAUTOR1, CODAUTOR2, CODAUTOR3, CODEDITOR' +
        'A, CODBARRAS, '
      '   PRECO, CODGENERO)'
      'VALUES'
      
        '  (:CODACERVO, :TITULO, :CODAUTOR1, :CODAUTOR2, :CODAUTOR3, :COD' +
        'EDITORA, '
      '   :CODBARRAS, :PRECO, :CODGENERO)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ACERVO'
      'SET'
      '  CODACERVO = :CODACERVO,'
      '  TITULO = :TITULO,'
      '  CODAUTOR1 = :CODAUTOR1,'
      '  CODAUTOR2 = :CODAUTOR2,'
      '  CODAUTOR3 = :CODAUTOR3,'
      '  CODEDITORA = :CODEDITORA,'
      '  CODBARRAS = :CODBARRAS,'
      '  PRECO = :PRECO,'
      '  CODGENERO = :CODGENERO'
      'WHERE'
      '  CODACERVO = :OLD_CODACERVO')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODACERVO,'
      '  TITULO,'
      '  CODAUTOR1,'
      '  CODAUTOR2,'
      '  CODAUTOR3,'
      '  CODEDITORA,'
      '  CODBARRAS,'
      '  PRECO,'
      '  CODGENERO'
      'FROM ACERVO '
      'WHERE'
      '  CODACERVO = :CODACERVO')
    SelectSQL.Strings = (
      'Select * from ACERVO')
    Left = 112
    Top = 126
    object TbAcervoCODACERVO: TIntegerField
      FieldName = 'CODACERVO'
      Required = True
    end
    object TbAcervoTITULO: TMDOStringField
      FieldName = 'TITULO'
      Size = 100
    end
    object TbAcervoCODAUTOR1: TSmallintField
      FieldName = 'CODAUTOR1'
    end
    object TbAcervoCODAUTOR2: TSmallintField
      FieldName = 'CODAUTOR2'
    end
    object TbAcervoCODAUTOR3: TSmallintField
      FieldName = 'CODAUTOR3'
    end
    object TbAcervoCODEDITORA: TSmallintField
      FieldName = 'CODEDITORA'
    end
    object TbAcervoCODBARRAS: TMDOStringField
      FieldName = 'CODBARRAS'
    end
    object TbAcervoPRECO: TMDOBCDField
      FieldName = 'PRECO'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object TbAcervoCODGENERO: TSmallintField
      FieldName = 'CODGENERO'
    end
  end
  object Trans: TMDOTransaction
    Active = False
    AutoCommit = False
    DefaultAction = TACommitRetaining
    DefaultDatabase = Dados.Database
    Left = 24
    Top = 112
  end
  object QryProx: TMDOQuery
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    Left = 56
    Top = 115
  end
  object DSAcervoItens: TDataSource
    DataSet = TbAcervoItens
    OnDataChange = DSAcervoDataChange
    Left = 143
    Top = 158
  end
  object TbAcervoItens: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAcervo
    DeleteSQL.Strings = (
      'DELETE FROM ACERVOITENS'
      'WHERE'
      '  CODACERVO = :OLD_CODACERVO AND'
      '  NUMREG = :OLD_NUMREG')
    InsertSQL.Strings = (
      'INSERT INTO ACERVOITENS'
      
        '  (CODACERVO, NUMREG, EDICAO, IMPRENTA, ESTADO, OBS, FORMA, DTRE' +
        'G, CODBARRAS)'
      'VALUES'
      
        '  (:CODACERVO, :NUMREG, :EDICAO, :IMPRENTA, :ESTADO, :OBS, :FORM' +
        'A, :DTREG, '
      '   :CODBARRAS)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ACERVOITENS'
      'SET'
      '  CODACERVO = :CODACERVO,'
      '  NUMREG = :NUMREG,'
      '  EDICAO = :EDICAO,'
      '  IMPRENTA = :IMPRENTA,'
      '  ESTADO = :ESTADO,'
      '  OBS = :OBS,'
      '  FORMA = :FORMA,'
      '  DTREG = :DTREG,'
      '  CODBARRAS = :CODBARRAS'
      'WHERE'
      '  CODACERVO = :OLD_CODACERVO AND'
      '  NUMREG = :OLD_NUMREG')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODACERVO,'
      '  NUMREG,'
      '  EDICAO,'
      '  IMPRENTA,'
      '  ESTADO,'
      '  OBS,'
      '  FORMA,'
      '  DTREG,'
      '  CODBARRAS'
      'FROM ACERVOITENS '
      'WHERE'
      '  CODACERVO = :CODACERVO AND'
      '  NUMREG = :NUMREG')
    SelectSQL.Strings = (
      'Select * from ACERVOITENS'
      'Where CODACERVO = :CODACERVO')
    Left = 112
    Top = 158
    object TbAcervoItensCODACERVO: TSmallintField
      FieldName = 'CODACERVO'
      Required = True
    end
    object TbAcervoItensNUMREG: TSmallintField
      FieldName = 'NUMREG'
      Required = True
    end
    object TbAcervoItensEDICAO: TSmallintField
      FieldName = 'EDICAO'
    end
    object TbAcervoItensIMPRENTA: TMDOStringField
      FieldName = 'IMPRENTA'
      Size = 100
    end
    object TbAcervoItensESTADO: TSmallintField
      FieldName = 'ESTADO'
    end
    object TbAcervoItensOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object TbAcervoItensFORMA: TSmallintField
      FieldName = 'FORMA'
    end
    object TbAcervoItensDTREG: TDateField
      FieldName = 'DTREG'
    end
    object TbAcervoItensCODBARRAS: TMDOStringField
      FieldName = 'CODBARRAS'
      Size = 30
    end
  end
  object TbAcervoReservas: TMDODataSet
    Database = Dados.Database
    OnCalcFields = TbAcervoReservasCalcFields
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAcervo
    DeleteSQL.Strings = (
      'DELETE FROM ACERVORESERVAS'
      'WHERE'
      '  CODACERVO = :OLD_CODACERVO AND'
      '  CODRESERVA = :OLD_CODRESERVA')
    InsertSQL.Strings = (
      'INSERT INTO ACERVORESERVAS'
      
        '  (CODACERVO, CODRESERVA, DTRESERVA, STATUS, CODALUNO, CODFUNC, ' +
        'QUEM, NUMREG, '
      '   TIPORESERVA)'
      'VALUES'
      
        '  (:CODACERVO, :CODRESERVA, :DTRESERVA, :STATUS, :CODALUNO, :COD' +
        'FUNC, :QUEM, '
      '   :NUMREG, :TIPORESERVA)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ACERVORESERVAS'
      'SET'
      '  CODACERVO = :CODACERVO,'
      '  CODRESERVA = :CODRESERVA,'
      '  DTRESERVA = :DTRESERVA,'
      '  STATUS = :STATUS,'
      '  CODALUNO = :CODALUNO,'
      '  CODFUNC = :CODFUNC,'
      '  QUEM = :QUEM,'
      '  NUMREG = :NUMREG,'
      '  TIPORESERVA = :TIPORESERVA'
      'WHERE'
      '  CODACERVO = :OLD_CODACERVO AND'
      '  CODRESERVA = :OLD_CODRESERVA')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODACERVO,'
      '  CODRESERVA,'
      '  DTRESERVA,'
      '  STATUS,'
      '  CODALUNO,'
      '  CODFUNC,'
      '  QUEM,'
      '  NUMREG,'
      '  TIPORESERVA'
      'FROM ACERVORESERVAS '
      'WHERE'
      '  CODACERVO = :CODACERVO AND'
      '  CODRESERVA = :CODRESERVA')
    SelectSQL.Strings = (
      'Select * from ACERVORESERVAS'
      'WHERE CODACERVO = :CODACERVO')
    Left = 184
    Top = 126
    object TbAcervoReservasCODACERVO: TSmallintField
      FieldName = 'CODACERVO'
      Required = True
    end
    object TbAcervoReservasCODRESERVA: TSmallintField
      FieldName = 'CODRESERVA'
      Required = True
    end
    object TbAcervoReservasDTRESERVA: TDateField
      FieldName = 'DTRESERVA'
      EditMask = '99/99/9999;1;_'
    end
    object TbAcervoReservasSTATUS: TMDOStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object TbAcervoReservasCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
    end
    object TbAcervoReservasCODFUNC: TSmallintField
      FieldName = 'CODFUNC'
    end
    object TbAcervoReservasQUEM: TSmallintField
      FieldName = 'QUEM'
    end
    object TbAcervoReservasTIPORESERVA: TSmallintField
      FieldName = 'TIPORESERVA'
    end
    object TbAcervoReservasNUMREG: TSmallintField
      FieldName = 'NUMREG'
    end
    object TbAcervoReservasStatusStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusStr'
      Size = 15
      Calculated = True
    end
  end
  object DSAcervoReservas: TDataSource
    DataSet = TbAcervoReservas
    Left = 215
    Top = 126
  end
  object TbAcervoRetiradas: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAcervo
    DeleteSQL.Strings = (
      'DELETE FROM ACERVORETIRADAS'
      'WHERE'
      '  CODACERVO = :OLD_CODACERVO AND'
      '  CODRETIRADA = :OLD_CODRETIRADA')
    InsertSQL.Strings = (
      'INSERT INTO ACERVORETIRADAS'
      
        '  (CODRESERVA, CODACERVO, CODRETIRADA, DTRETIRADA, DTDEV, DTDEVO' +
        'LV, STATUS, '
      '   CODALUNO, CODFUNC, VLRMULTA, QUEM)'
      'VALUES'
      
        '  (:CODRESERVA, :CODACERVO, :CODRETIRADA, :DTRETIRADA, :DTDEV, :' +
        'DTDEVOLV, '
      '   :STATUS, :CODALUNO, :CODFUNC, :VLRMULTA, :QUEM)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ACERVORETIRADAS'
      'SET'
      '  CODRESERVA = :CODRESERVA,'
      '  CODACERVO = :CODACERVO,'
      '  CODRETIRADA = :CODRETIRADA,'
      '  DTRETIRADA = :DTRETIRADA,'
      '  DTDEV = :DTDEV,'
      '  DTDEVOLV = :DTDEVOLV,'
      '  STATUS = :STATUS,'
      '  CODALUNO = :CODALUNO,'
      '  CODFUNC = :CODFUNC,'
      '  VLRMULTA = :VLRMULTA,'
      '  QUEM = :QUEM'
      'WHERE'
      '  CODACERVO = :OLD_CODACERVO AND'
      '  CODRETIRADA = :OLD_CODRETIRADA')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODRESERVA,'
      '  CODACERVO,'
      '  CODRETIRADA,'
      '  DTRETIRADA,'
      '  DTDEV,'
      '  DTDEVOLV,'
      '  STATUS,'
      '  CODALUNO,'
      '  CODFUNC,'
      '  VLRMULTA,'
      '  QUEM'
      'FROM ACERVORETIRADAS '
      'WHERE'
      '  CODACERVO = :CODACERVO AND'
      '  CODRETIRADA = :CODRETIRADA')
    SelectSQL.Strings = (
      'Select * from ACERVORETIRADAS'
      'WHERE CODACERVO = :CODACERVO')
    Left = 184
    Top = 158
    object TbAcervoRetiradasCODACERVO: TSmallintField
      FieldName = 'CODACERVO'
      Required = True
    end
    object TbAcervoRetiradasCODRETIRADA: TSmallintField
      FieldName = 'CODRETIRADA'
      Required = True
    end
    object TbAcervoRetiradasCODRESERVA: TSmallintField
      FieldName = 'CODRESERVA'
    end
    object TbAcervoRetiradasDTRETIRADA: TDateField
      FieldName = 'DTRETIRADA'
    end
    object TbAcervoRetiradasDTDEV: TDateField
      FieldName = 'DTDEV'
    end
    object TbAcervoRetiradasDTDEVOLV: TDateField
      FieldName = 'DTDEVOLV'
    end
    object TbAcervoRetiradasSTATUS: TMDOStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object TbAcervoRetiradasCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
    end
    object TbAcervoRetiradasCODFUNC: TSmallintField
      FieldName = 'CODFUNC'
    end
    object TbAcervoRetiradasVLRMULTA: TMDOBCDField
      FieldName = 'VLRMULTA'
      Precision = 9
      Size = 2
    end
    object TbAcervoRetiradasQUEM: TSmallintField
      FieldName = 'QUEM'
    end
  end
  object DSAcervoRetiradas: TDataSource
    DataSet = TbAcervoRetiradas
    Left = 215
    Top = 158
  end
end
