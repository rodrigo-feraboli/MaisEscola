object FFunc: TFFunc
  Left = 353
  Top = 201
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Funcion'#225'rios'
  ClientHeight = 363
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
    TabOrder = 0
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
    object SBBusca: TSpeedButton
      Left = 513
      Top = 3
      Width = 59
      Height = 101
      Hint = 'Busca Avan'#231'ada de Funcion'#225'rios'
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
      Caption = 'Descri'#231#227'o'
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
  object Panel2: TPanel
    Left = 0
    Top = 107
    Width = 575
    Height = 256
    Align = alClient
    BevelInner = bvLowered
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 571
      Height = 233
      Align = alClient
      Color = clSilver
      DataSource = DSFunc
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
          FieldName = 'CODFUNC'
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 400
          Visible = True
        end>
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 235
      Width = 571
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
  end
  object PnlBusca: TPanel
    Left = 72
    Top = 106
    Width = 576
    Height = 257
    BevelInner = bvLowered
    BevelOuter = bvSpace
    Color = 2025694
    TabOrder = 2
    Visible = False
    object SpeedButton6: TSpeedButton
      Left = 352
      Top = 228
      Width = 90
      Height = 25
      Caption = 'OK'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object SpeedButton7: TSpeedButton
      Left = 448
      Top = 228
      Width = 90
      Height = 25
      Caption = 'Cancelar'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 2
      Width = 572
      Height = 223
      Align = alTop
      Color = 8304766
      DataSource = DSFunc
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGrid2DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODFUNC'
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
          FieldName = 'NOME'
          Title.Caption = 'Nome'
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
    Left = 104
    Top = 160
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Analitco1: TMenuItem
        Caption = 'Analit'#237'co'
      end
      object Sinttico1: TMenuItem
        Caption = 'Sint'#233'tico'
        OnClick = Sinttico1Click
      end
    end
  end
  object DSFunc: TDataSource
    DataSet = TbFunc
    OnDataChange = DSFuncDataChange
    Left = 136
    Top = 97
  end
  object TbFunc: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM FUNC'
      'WHERE'
      '  CODFUNC = :OLD_CODFUNC')
    InsertSQL.Strings = (
      'INSERT INTO FUNC'
      
        '  (CODFUNC, NOME, DTCAD, DTCONTR, DTNASC, CODPROFISSAO, EMAIL, C' +
        'ODCIDADE, '
      
        '   CEP, ENDERECO, CODBAIRRO, CTNUM, CTSERIE, RG, FONE, CELULAR, ' +
        'PATHFOTO, '
      '   SEXO, OBS)'
      'VALUES'
      
        '  (:CODFUNC, :NOME, :DTCAD, :DTCONTR, :DTNASC, :CODPROFISSAO, :E' +
        'MAIL, :CODCIDADE, '
      
        '   :CEP, :ENDERECO, :CODBAIRRO, :CTNUM, :CTSERIE, :RG, :FONE, :C' +
        'ELULAR, '
      '   :PATHFOTO, :SEXO, :OBS)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE FUNC'
      'SET'
      '  CODFUNC = :CODFUNC,'
      '  NOME = :NOME,'
      '  DTCAD = :DTCAD,'
      '  DTCONTR = :DTCONTR,'
      '  DTNASC = :DTNASC,'
      '  CODPROFISSAO = :CODPROFISSAO,'
      '  EMAIL = :EMAIL,'
      '  CODCIDADE = :CODCIDADE,'
      '  CEP = :CEP,'
      '  ENDERECO = :ENDERECO,'
      '  CODBAIRRO = :CODBAIRRO,'
      '  CTNUM = :CTNUM,'
      '  CTSERIE = :CTSERIE,'
      '  RG = :RG,'
      '  FONE = :FONE,'
      '  CELULAR = :CELULAR,'
      '  PATHFOTO = :PATHFOTO,'
      '  SEXO = :SEXO,'
      '  OBS = :OBS'
      'WHERE'
      '  CODFUNC = :OLD_CODFUNC')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODFUNC,'
      '  NOME,'
      '  DTCAD,'
      '  DTCONTR,'
      '  DTNASC,'
      '  CODPROFISSAO,'
      '  EMAIL,'
      '  CODCIDADE,'
      '  CEP,'
      '  ENDERECO,'
      '  CODBAIRRO,'
      '  CTNUM,'
      '  CTSERIE,'
      '  RG,'
      '  FONE,'
      '  CELULAR,'
      '  PATHFOTO,'
      '  SEXO,'
      '  OBS'
      'FROM FUNC '
      'WHERE'
      '  CODFUNC = :CODFUNC')
    SelectSQL.Strings = (
      'Select * from FUNC')
    Left = 56
    Top = 112
    object TbFuncCODFUNC: TSmallintField
      FieldName = 'CODFUNC'
      Required = True
    end
    object TbFuncNOME: TMDOStringField
      FieldName = 'NOME'
      Size = 100
    end
    object TbFuncCODPROFISSAO: TSmallintField
      FieldName = 'CODPROFISSAO'
    end
    object TbFuncDTCAD: TDateField
      FieldName = 'DTCAD'
      DisplayFormat = 'dd/MM/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object TbFuncDTCONTR: TDateField
      FieldName = 'DTCONTR'
      DisplayFormat = 'dd/MM/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object TbFuncDTNASC: TDateField
      FieldName = 'DTNASC'
      DisplayFormat = 'dd/MM/yyyy'
      EditMask = '99/99/9999;1;_'
    end
    object TbFuncEMAIL: TMDOStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object TbFuncCODCIDADE: TSmallintField
      FieldName = 'CODCIDADE'
    end
    object TbFuncCEP: TMDOStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TbFuncENDERECO: TMDOStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object TbFuncCODBAIRRO: TSmallintField
      FieldName = 'CODBAIRRO'
    end
    object TbFuncCTNUM: TMDOStringField
      FieldName = 'CTNUM'
    end
    object TbFuncCTSERIE: TMDOStringField
      FieldName = 'CTSERIE'
    end
    object TbFuncRG: TMDOStringField
      FieldName = 'RG'
      Size = 15
    end
    object TbFuncFONE: TMDOStringField
      FieldName = 'FONE'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbFuncCELULAR: TMDOStringField
      FieldName = 'CELULAR'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbFuncPATHFOTO: TMDOStringField
      FieldName = 'PATHFOTO'
      Size = 200
    end
    object TbFuncSEXO: TMDOStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object TbFuncOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
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
    Left = 40
    Top = 147
  end
end
