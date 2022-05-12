object FGen: TFGen
  Left = 347
  Top = 193
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro Gen'#233'rico'
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
      Caption = 'Nome'
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
      DataSource = DSGen
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBAlterarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODGEN'
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Descri'#231#227'o'
          Width = 400
          Visible = True
        end>
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 235
      Width = 571
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
  end
  object PnlBusca: TPanel
    Left = 88
    Top = 122
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
      DataSource = DSGen
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
          FieldName = 'CODGEN'
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
          Title.Caption = 'Descri'#231#227'o'
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
      object Ficha: TMenuItem
        Caption = 'Ficha do Gen'#233'rico'
        OnClick = FichaClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sinttico1: TMenuItem
        Caption = 'Sint'#233'tico'
        OnClick = Sinttico1Click
      end
    end
  end
  object DSGen: TDataSource
    DataSet = TbGen
    OnDataChange = DSGenDataChange
    Left = 136
    Top = 97
  end
  object TbGen: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM GEN'
      'WHERE'
      '  CODGEN = :OLD_CODGEN')
    InsertSQL.Strings = (
      'INSERT INTO GEN'
      
        '  (CODGEN, NOME, FANTASIA, DTCAD, DTFUND, ENDERECO, CODBAIRRO, C' +
        'ODCIDADE, '
      
        '   CEP, CAIXAPOSTAL, CONTATO1, CONTATO2, FONE1, FONE2, FAX, CELU' +
        'LAR, EMAIL, '
      '   SITE, TIPOFORN, TIPOTRAN, CNPJ, IE, OBS, TIPO)'
      'VALUES'
      
        '  (:CODGEN, :NOME, :FANTASIA, :DTCAD, :DTFUND, :ENDERECO, :CODBA' +
        'IRRO, :CODCIDADE, '
      
        '   :CEP, :CAIXAPOSTAL, :CONTATO1, :CONTATO2, :FONE1, :FONE2, :FA' +
        'X, :CELULAR, '
      '   :EMAIL, :SITE, :TIPOFORN, :TIPOTRAN, :CNPJ, :IE, :OBS, :TIPO)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE GEN'
      'SET'
      '  CODGEN = :CODGEN,'
      '  NOME = :NOME,'
      '  FANTASIA = :FANTASIA,'
      '  DTCAD = :DTCAD,'
      '  DTFUND = :DTFUND,'
      '  ENDERECO = :ENDERECO,'
      '  CODBAIRRO = :CODBAIRRO,'
      '  CODCIDADE = :CODCIDADE,'
      '  CEP = :CEP,'
      '  CAIXAPOSTAL = :CAIXAPOSTAL,'
      '  CONTATO1 = :CONTATO1,'
      '  CONTATO2 = :CONTATO2,'
      '  FONE1 = :FONE1,'
      '  FONE2 = :FONE2,'
      '  FAX = :FAX,'
      '  CELULAR = :CELULAR,'
      '  EMAIL = :EMAIL,'
      '  SITE = :SITE,'
      '  TIPOFORN = :TIPOFORN,'
      '  TIPOTRAN = :TIPOTRAN,'
      '  CNPJ = :CNPJ,'
      '  IE = :IE,'
      '  OBS = :OBS,'
      '  TIPO = :TIPO'
      'WHERE'
      '  CODGEN = :OLD_CODGEN')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODGEN,'
      '  NOME,'
      '  FANTASIA,'
      '  DTCAD,'
      '  DTFUND,'
      '  ENDERECO,'
      '  CODBAIRRO,'
      '  CODCIDADE,'
      '  CEP,'
      '  CAIXAPOSTAL,'
      '  CONTATO1,'
      '  CONTATO2,'
      '  FONE1,'
      '  FONE2,'
      '  FAX,'
      '  CELULAR,'
      '  EMAIL,'
      '  SITE,'
      '  TIPOFORN,'
      '  TIPOTRAN,'
      '  CNPJ,'
      '  IE,'
      '  OBS,'
      '  TIPO'
      'FROM GEN '
      'WHERE'
      '  CODGEN = :CODGEN')
    Left = 72
    Top = 112
    object TbGenCODGEN: TSmallintField
      FieldName = 'CODGEN'
      Required = True
    end
    object TbGenNOME: TMDOStringField
      FieldName = 'NOME'
      Size = 100
    end
    object TbGenFANTASIA: TMDOStringField
      FieldName = 'FANTASIA'
      Size = 100
    end
    object TbGenDTCAD: TDateField
      FieldName = 'DTCAD'
      EditMask = '99/99/9999;1;_'
    end
    object TbGenDTFUND: TDateField
      FieldName = 'DTFUND'
      EditMask = '99/99/9999;1;_'
    end
    object TbGenENDERECO: TMDOStringField
      FieldName = 'ENDERECO'
      Size = 200
    end
    object TbGenCODBAIRRO: TSmallintField
      FieldName = 'CODBAIRRO'
    end
    object TbGenCODCIDADE: TSmallintField
      FieldName = 'CODCIDADE'
    end
    object TbGenCEP: TMDOStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TbGenCAIXAPOSTAL: TSmallintField
      FieldName = 'CAIXAPOSTAL'
    end
    object TbGenCONTATO1: TMDOStringField
      FieldName = 'CONTATO1'
      Size = 100
    end
    object TbGenCONTATO2: TMDOStringField
      FieldName = 'CONTATO2'
      Size = 100
    end
    object TbGenFONE1: TMDOStringField
      FieldName = 'FONE1'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbGenFONE2: TMDOStringField
      FieldName = 'FONE2'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbGenFAX: TMDOStringField
      FieldName = 'FAX'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbGenCELULAR: TMDOStringField
      FieldName = 'CELULAR'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbGenEMAIL: TMDOStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object TbGenSITE: TMDOStringField
      FieldName = 'SITE'
      Size = 100
    end
    object TbGenCNPJ: TMDOStringField
      FieldName = 'CNPJ'
      EditMask = '99.999.999/9999-99;0;_'
    end
    object TbGenIE: TMDOStringField
      FieldName = 'IE'
      EditMask = '999/9999999;0;_'
    end
    object TbGenOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object TbGenTIPO: TMDOStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object TbGenTIPOFORN: TMDOStringField
      FieldName = 'TIPOFORN'
      Size = 1
    end
    object TbGenTIPOTRAN: TMDOStringField
      FieldName = 'TIPOTRAN'
      Size = 1
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
