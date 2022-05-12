object FTurmas: TFTurmas
  Left = 263
  Top = 161
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro de Turmas'
  ClientHeight = 397
  ClientWidth = 786
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
    Width = 786
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
      Left = 725
      Top = 3
      Width = 59
      Height = 101
      Hint = 'Busca Avan'#231'ada de Turmas'
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
      Left = 516
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
      Left = 492
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
      Left = 516
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
      Left = 516
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
      Left = 513
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
    Width = 786
    Height = 290
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
    object SBNewAtividade: TSpeedButton
      Left = 406
      Top = 2
      Width = 75
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
      OnClick = SBNewAtividadeClick
    end
    object SBEditAtividade: TSpeedButton
      Left = 406
      Top = 27
      Width = 75
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
      OnClick = SBEditAtividadeClick
    end
    object SBDelAtividade: TSpeedButton
      Left = 406
      Top = 52
      Width = 75
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
      OnClick = SBDelAtividadeClick
    end
    object SBNewCardapio: TSpeedButton
      Left = 326
      Top = 132
      Width = 139
      Height = 25
      Hint = 'Insere novo registro'
      Caption = 'Lan'#231'ar Dias para Card'#225'pio'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNewCardapioClick
    end
    object SBNewCardapioDia: TSpeedButton
      Left = 3
      Top = 164
      Width = 75
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
      OnClick = SBNewCardapioDiaClick
    end
    object SBEditCard: TSpeedButton
      Left = 3
      Top = 189
      Width = 75
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
      OnClick = SBEditCardClick
    end
    object SpeedButton11: TSpeedButton
      Left = 3
      Top = 214
      Width = 75
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
      OnClick = SpeedButton11Click
    end
    object Label2: TLabel
      Left = 159
      Top = 138
      Width = 46
      Height = 13
      Caption = 'Filtrar Dia'
    end
    object SpeedButton1: TSpeedButton
      Left = 494
      Top = 132
      Width = 139
      Height = 25
      Hint = 'Insere novo registro'
      Caption = 'Exibir toda a semana'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 399
      Height = 125
      Color = clSilver
      DataSource = DSTurmas
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
          FieldName = 'CODTURMA'
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end>
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 269
      Width = 782
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
    object DBGrid4: TDBGrid
      Left = 483
      Top = 1
      Width = 302
      Height = 125
      Color = clSilver
      DataSource = DSTurmasAtividades
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBEditAtividadeClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Atividade'
          Width = 200
          Visible = True
        end>
    end
    object DBGrid5: TDBGrid
      Left = 79
      Top = 163
      Width = 706
      Height = 105
      Color = clSilver
      DataSource = DSTurmasCardapiosItens
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBEditCardClick
      Columns = <
        item
          Expanded = False
          FieldName = 'HORA'
          Title.Caption = 'Hora'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Refeicao'
          Title.Caption = 'Refei'#231#227'o'
          Width = 350
          Visible = True
        end>
    end
    object DTPCalend: TDateTimePicker
      Left = 208
      Top = 134
      Width = 81
      Height = 21
      Date = 39256.487843240740000000
      Time = 39256.487843240740000000
      TabOrder = 4
      OnChange = DTPCalendChange
    end
  end
  object PnlBusca: TPanel
    Left = 56
    Top = 107
    Width = 785
    Height = 289
    BevelInner = bvLowered
    BevelOuter = bvSpace
    Color = 2025694
    TabOrder = 2
    Visible = False
    object SpeedButton6: TSpeedButton
      Left = 584
      Top = 257
      Width = 90
      Height = 25
      Caption = 'OK'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object SpeedButton7: TSpeedButton
      Left = 680
      Top = 257
      Width = 90
      Height = 25
      Caption = 'Cancelar'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 2
      Width = 781
      Height = 250
      Align = alTop
      Color = 8304766
      DataSource = DSTurmas
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
          FieldName = 'CODTURMA'
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
          FieldName = 'DESCRICAO'
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
    Left = 232
    Top = 136
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
  object DSTurmas: TDataSource
    DataSet = TbTurmas
    OnDataChange = DSTurmasDataChange
    Left = 56
    Top = 146
  end
  object TbTurmas: TMDODataSet
    AfterOpen = TbTurmasAfterOpen
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TURMAS'
      'WHERE'
      '  DESCRICAO = :OLD_DESCRICAO')
    InsertSQL.Strings = (
      'INSERT INTO TURMAS'
      '  (DESCRICAO, CODTURMA, VLRCARNE)'
      'VALUES'
      '  (:DESCRICAO, :CODTURMA, :VLRCARNE)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE TURMAS'
      'SET'
      '  DESCRICAO = :DESCRICAO,'
      '  CODTURMA = :CODTURMA,'
      '  VLRCARNE = :VLRCARNE'
      'WHERE'
      '  DESCRICAO = :OLD_DESCRICAO')
    RefreshSQL.Strings = (
      'SELECT '
      '  DESCRICAO,'
      '  CODTURMA,'
      '  VLRCARNE'
      'FROM TURMAS '
      'WHERE'
      '  DESCRICAO = :DESCRICAO')
    SelectSQL.Strings = (
      'Select * from TURMAS')
    Left = 24
    Top = 144
    object TbTurmasCODTURMA: TSmallintField
      FieldName = 'CODTURMA'
      Required = True
    end
    object TbTurmasDESCRICAO: TMDOStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object TbTurmasVLRCARNE: TMDOBCDField
      FieldName = 'VLRCARNE'
      currency = True
      Precision = 9
      Size = 2
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
    Left = 200
    Top = 107
  end
  object TbTurmasAtividades: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSTurmas
    DeleteSQL.Strings = (
      'DELETE FROM TURMASATIVIDADES'
      'WHERE'
      '  CODTURMA = :OLD_CODTURMA AND'
      '  CODATIVIDADE = :OLD_CODATIVIDADE AND'
      '  NROITEM = :OLD_NROITEM')
    InsertSQL.Strings = (
      'INSERT INTO TURMASATIVIDADES'
      
        '  (CODTURMA, CODATIVIDADE, NROITEM, CODFUNC, DATA, HORAINI, HORA' +
        'FIN, TIPOATIVIDADE, '
      '   STATUS)'
      'VALUES'
      
        '  (:CODTURMA, :CODATIVIDADE, :NROITEM, :CODFUNC, :DATA, :HORAINI' +
        ', :HORAFIN, '
      '   :TIPOATIVIDADE, :STATUS)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE TURMASATIVIDADES'
      'SET'
      '  CODTURMA = :CODTURMA,'
      '  CODATIVIDADE = :CODATIVIDADE,'
      '  NROITEM = :NROITEM,'
      '  CODFUNC = :CODFUNC,'
      '  DATA = :DATA,'
      '  HORAINI = :HORAINI,'
      '  HORAFIN = :HORAFIN,'
      '  TIPOATIVIDADE = :TIPOATIVIDADE,'
      '  STATUS = :STATUS'
      'WHERE'
      '  CODTURMA = :OLD_CODTURMA AND'
      '  CODATIVIDADE = :OLD_CODATIVIDADE AND'
      '  NROITEM = :OLD_NROITEM')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODTURMA,'
      '  CODATIVIDADE,'
      '  NROITEM,'
      '  CODFUNC,'
      '  DATA,'
      '  HORAINI,'
      '  HORAFIN,'
      '  TIPOATIVIDADE,'
      '  STATUS'
      'FROM TURMASATIVIDADES '
      'WHERE'
      '  CODTURMA = :CODTURMA AND'
      '  CODATIVIDADE = :CODATIVIDADE AND'
      '  NROITEM = :NROITEM')
    SelectSQL.Strings = (
      'Select * from TURMASATIVIDADES'
      'Where CODTURMA = :CODTURMA ')
    Left = 24
    Top = 176
    object TbTurmasAtividadesCODTURMA: TSmallintField
      FieldName = 'CODTURMA'
      Required = True
    end
    object TbTurmasAtividadesCODATIVIDADE: TSmallintField
      FieldName = 'CODATIVIDADE'
      Required = True
    end
    object TbTurmasAtividadesNROITEM: TSmallintField
      FieldName = 'NROITEM'
      Required = True
    end
    object TbTurmasAtividadesCODFUNC: TSmallintField
      FieldName = 'CODFUNC'
    end
    object TbTurmasAtividadesDATA: TDateField
      FieldName = 'DATA'
      EditMask = '99/99/9999;1;_'
    end
    object TbTurmasAtividadesHORAINI: TTimeField
      FieldName = 'HORAINI'
      EditMask = '99:99;1;_'
    end
    object TbTurmasAtividadesHORAFIN: TTimeField
      FieldName = 'HORAFIN'
      EditMask = '99:99;1;_'
    end
    object TbTurmasAtividadesAtividade: TStringField
      FieldKind = fkLookup
      FieldName = 'Atividade'
      LookupDataSet = Dados.QryAtividadesLK
      LookupKeyFields = 'CODATIVIDADE'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODATIVIDADE'
      Size = 100
      Lookup = True
    end
    object TbTurmasAtividadesTIPOATIVIDADE: TMDOStringField
      FieldName = 'TIPOATIVIDADE'
      Size = 1
    end
    object TbTurmasAtividadesSTATUS: TMDOStringField
      FieldName = 'STATUS'
      Size = 1
    end
  end
  object TbTurmasCardapio: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSTurmas
    DeleteSQL.Strings = (
      'DELETE FROM TURMASCARDAPIOS'
      'WHERE'
      '  CODTURMA = :OLD_CODTURMA AND'
      '  DATA = :OLD_DATA')
    InsertSQL.Strings = (
      'INSERT INTO TURMASCARDAPIOS'
      '  (CODTURMA, DATA)'
      'VALUES'
      '  (:CODTURMA, :DATA)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE TURMASCARDAPIOS'
      'SET'
      '  CODTURMA = :CODTURMA,'
      '  DATA = :DATA'
      'WHERE'
      '  CODTURMA = :OLD_CODTURMA AND'
      '  DATA = :OLD_DATA')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODTURMA,'
      '  DATA'
      'FROM TURMASCARDAPIOS '
      'WHERE'
      '  CODTURMA = :CODTURMA AND'
      '  DATA = :DATA')
    SelectSQL.Strings = (
      'Select * from TURMASCARDAPIOS'
      'WHERE CODTURMA = :CODTURMA')
    Left = 24
    Top = 208
    object TbTurmasCardapioCODTURMA: TSmallintField
      FieldName = 'CODTURMA'
      Required = True
    end
    object TbTurmasCardapioDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
  end
  object DSTurmasAtividades: TDataSource
    DataSet = TbTurmasAtividades
    OnDataChange = DSTurmasDataChange
    Left = 56
    Top = 178
  end
  object DSTurmasCardapio: TDataSource
    DataSet = TbTurmasCardapio
    OnDataChange = DSTurmasDataChange
    Left = 56
    Top = 210
  end
  object TbTurmasCardapiosItens: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSTurmas
    DeleteSQL.Strings = (
      'DELETE FROM TURMASCARDAPIOSITENS'
      'WHERE'
      '  CODTURMA = :OLD_CODTURMA AND'
      '  DATA = :OLD_DATA AND'
      '  NROITEM = :OLD_NROITEM')
    InsertSQL.Strings = (
      'INSERT INTO TURMASCARDAPIOSITENS'
      '  (CODTURMA, DATA, NROITEM, CODREFEICAO, HORA)'
      'VALUES'
      '  (:CODTURMA, :DATA, :NROITEM, :CODREFEICAO, :HORA)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE TURMASCARDAPIOSITENS'
      'SET'
      '  CODTURMA = :CODTURMA,'
      '  DATA = :DATA,'
      '  NROITEM = :NROITEM,'
      '  CODREFEICAO = :CODREFEICAO,'
      '  HORA = :HORA'
      'WHERE'
      '  CODTURMA = :OLD_CODTURMA AND'
      '  DATA = :OLD_DATA AND'
      '  NROITEM = :OLD_NROITEM')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODTURMA,'
      '  DATA,'
      '  NROITEM,'
      '  CODREFEICAO,'
      '  HORA'
      'FROM TURMASCARDAPIOSITENS '
      'WHERE'
      '  CODTURMA = :CODTURMA AND'
      '  DATA = :DATA AND'
      '  NROITEM = :NROITEM')
    SelectSQL.Strings = (
      'Select * from TURMASCARDAPIOSITENS'
      'WHERE CODTURMA = :CODTURMA'
      '')
    Left = 88
    Top = 208
    object TbTurmasCardapiosItensCODTURMA: TSmallintField
      FieldName = 'CODTURMA'
      Required = True
    end
    object TbTurmasCardapiosItensDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object TbTurmasCardapiosItensNROITEM: TSmallintField
      FieldName = 'NROITEM'
      Required = True
    end
    object TbTurmasCardapiosItensCODREFEICAO: TSmallintField
      FieldName = 'CODREFEICAO'
    end
    object TbTurmasCardapiosItensHORA: TTimeField
      FieldName = 'HORA'
      DisplayFormat = 'hh:mm'
    end
    object TbTurmasCardapiosItensRefeicao: TStringField
      FieldKind = fkLookup
      FieldName = 'Refeicao'
      LookupDataSet = Dados.QryRefeicoesLK
      LookupKeyFields = 'CODREFEICAO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODREFEICAO'
      Size = 100
      Lookup = True
    end
  end
  object DSTurmasCardapiosItens: TDataSource
    DataSet = TbTurmasCardapiosItens
    OnDataChange = DSTurmasDataChange
    Left = 120
    Top = 210
  end
end
