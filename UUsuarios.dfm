object FUsuarios: TFUsuarios
  Left = 459
  Top = 190
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Usu'#225'rios'
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
      Hint = 'Busca Avan'#231'ada de Usu'#225'rios'
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
      DataSource = DSUsuarios
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
          FieldName = 'CODUSUARIO'
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LOGIN'
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
    Left = 80
    Top = 90
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
      DataSource = DSUsuarios
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
          FieldName = 'CODUSUARIO'
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
          FieldName = 'LOGIN'
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
  end
  object DSUsuarios: TDataSource
    DataSet = TbUsuarios
    OnDataChange = DSUsuariosDataChange
    Left = 64
    Top = 153
  end
  object TbUsuarios: TMDODataSet
    AfterOpen = TbUsuariosAfterOpen
    BeforeClose = TbUsuariosBeforeClose
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM USUARIOS'
      'WHERE'
      '  CODUSUARIO = :OLD_CODUSUARIO')
    InsertSQL.Strings = (
      'INSERT INTO USUARIOS'
      '  (CODUSUARIO, LOGIN, SENHA)'
      'VALUES'
      '  (:CODUSUARIO, :LOGIN, :SENHA)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE USUARIOS'
      'SET'
      '  CODUSUARIO = :CODUSUARIO,'
      '  LOGIN = :LOGIN,'
      '  SENHA = :SENHA'
      'WHERE'
      '  CODUSUARIO = :OLD_CODUSUARIO')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODUSUARIO,'
      '  LOGIN,'
      '  SENHA'
      'FROM USUARIOS '
      'WHERE'
      '  CODUSUARIO = :CODUSUARIO')
    SelectSQL.Strings = (
      'Select * from USUARIOS')
    Left = 32
    Top = 152
    object TbUsuariosCODUSUARIO: TSmallintField
      FieldName = 'CODUSUARIO'
      Required = True
    end
    object TbUsuariosLOGIN: TMDOStringField
      FieldName = 'LOGIN'
      Size = 40
    end
    object TbUsuariosSENHA: TMDOStringField
      FieldName = 'SENHA'
    end
  end
  object Trans: TMDOTransaction
    Active = False
    AutoCommit = False
    DefaultAction = TACommitRetaining
    DefaultDatabase = Dados.Database
    Left = 24
    Top = 104
  end
  object QryProx: TMDOQuery
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    Left = 72
    Top = 99
  end
  object TbUsuModulos: TMDODataSet
    Database = Dados.Database
    OnCalcFields = TbUsuModulosCalcFields
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSUsuarios
    DeleteSQL.Strings = (
      'DELETE FROM USUMODULOS'
      'WHERE'
      '  CODUSUARIO = :OLD_CODUSUARIO AND'
      '  CODMODULO = :OLD_CODMODULO')
    InsertSQL.Strings = (
      'INSERT INTO USUMODULOS'
      
        '  (CODUSUARIO, CODMODULO, NIVELCONS, NIVELEDI, NIVELEXC, NIVELRE' +
        'L)'
      'VALUES'
      
        '  (:CODUSUARIO, :CODMODULO, :NIVELCONS, :NIVELEDI, :NIVELEXC, :N' +
        'IVELREL)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE USUMODULOS'
      'SET'
      '  CODUSUARIO = :CODUSUARIO,'
      '  CODMODULO = :CODMODULO,'
      '  NIVELCONS = :NIVELCONS,'
      '  NIVELEDI = :NIVELEDI,'
      '  NIVELEXC = :NIVELEXC,'
      '  NIVELREL = :NIVELREL'
      'WHERE'
      '  CODUSUARIO = :OLD_CODUSUARIO AND'
      '  CODMODULO = :OLD_CODMODULO')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODUSUARIO,'
      '  CODMODULO,'
      '  NIVELCONS,'
      '  NIVELEDI,'
      '  NIVELEXC,'
      '  NIVELREL'
      'FROM USUMODULOS '
      'WHERE'
      '  CODUSUARIO = :CODUSUARIO AND'
      '  CODMODULO = :CODMODULO')
    SelectSQL.Strings = (
      'Select US.* from USUMODULOS  US'
      'inner join MODULOS M on M.codmodulo = US.codmodulo'
      'where CodUsuario = :CODUSUARIO'
      'ORDER BY M.descricao')
    Left = 32
    Top = 184
    object TbUsuModulosCODUSUARIO: TSmallintField
      FieldName = 'CODUSUARIO'
      Required = True
    end
    object TbUsuModulosCODMODULO: TSmallintField
      FieldName = 'CODMODULO'
      Required = True
    end
    object TbUsuModulosNIVELCONS: TMDOStringField
      FieldName = 'NIVELCONS'
      Size = 1
    end
    object TbUsuModulosNIVELEDI: TMDOStringField
      FieldName = 'NIVELEDI'
      Size = 1
    end
    object TbUsuModulosNIVELEXC: TMDOStringField
      FieldName = 'NIVELEXC'
      Size = 1
    end
    object TbUsuModulosNIVELREL: TMDOStringField
      FieldName = 'NIVELREL'
      Size = 1
    end
    object TbUsuModulosNivelRelStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'NivelRelStr'
      Size = 1
      Calculated = True
    end
    object TbUsuModulosNivelExcStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'NivelExcStr'
      Size = 1
      Calculated = True
    end
    object TbUsuModulosNivelEdiStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'NivelEdiStr'
      Size = 1
      Calculated = True
    end
    object TbUsuModulosNivelConsStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'NivelConsStr'
      Size = 1
      Calculated = True
    end
    object TbUsuModulosModulo: TStringField
      FieldKind = fkLookup
      FieldName = 'Modulo'
      LookupDataSet = QryModulos
      LookupKeyFields = 'CODMODULO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODMODULO'
      Size = 100
      Lookup = True
    end
  end
  object DSUsuModulos: TDataSource
    DataSet = TbUsuModulos
    OnDataChange = DSUsuariosDataChange
    Left = 64
    Top = 185
  end
  object QryModulos: TMDOQuery
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      'select * from  MODULOS'
      'order by DESCRICAO')
    Left = 56
    Top = 224
    object QryModulosCODMODULO: TIntegerField
      FieldName = 'CODMODULO'
      Required = True
    end
    object QryModulosDESCRICAO: TMDOStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
  end
end
