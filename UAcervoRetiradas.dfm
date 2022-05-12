object FAcervoRetiradas: TFAcervoRetiradas
  Left = 242
  Top = 227
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Retiradas do Acervo Liter'#225'rio'
  ClientHeight = 423
  ClientWidth = 694
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 694
    Height = 423
    Align = alClient
    BevelInner = bvLowered
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LblQtde: TLabel
      Left = 19
      Top = 234
      Width = 500
      Height = 13
      AutoSize = False
      Caption = 'LblQtde'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SBDelItens: TSpeedButton
      Left = 169
      Top = 8
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
      Left = 118
      Top = 8
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
      Left = 67
      Top = 8
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
    object SBDevolucao: TSpeedButton
      Left = 233
      Top = 8
      Width = 64
      Height = 22
      Hint = 'Apaga registro atual'
      Caption = 'Devolu'#231#227'o'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBDevolucaoClick
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 402
      Width = 690
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 110
        end>
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 252
      Width = 690
      Height = 150
      Align = alBottom
      Color = clSilver
      DataSource = DSReservas
      PopupMenu = PMReservas
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'TITULO'
          Title.Caption = 'Livro'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTRETIRADA'
          Title.Caption = 'Data Retirada'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIASLOCADO'
          Title.Caption = 'Dias Loc.'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALUNO'
          Title.Caption = 'Aluno'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FUNC'
          Title.Caption = 'Funcion'#225'rio'
          Width = 150
          Visible = True
        end>
    end
    object GroupBox1: TGroupBox
      Left = 66
      Top = 34
      Width = 561
      Height = 191
      Caption = 'Pesquisa R'#225'pida'
      TabOrder = 0
      object Label1: TLabel
        Left = 136
        Top = 93
        Width = 23
        Height = 13
        Caption = 'Livro'
      end
      object LblAluno: TLabel
        Left = 132
        Top = 148
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Aluno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblFunc: TLabel
        Left = 104
        Top = 169
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Funcion'#225'rio'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object SBPesquisa: TSpeedButton
        Left = 500
        Top = 166
        Width = 57
        Height = 22
        Caption = 'Pesquisar'
        Flat = True
        OnClick = SBPesquisaClick
      end
      object EdLivro: TEdit
        Left = 162
        Top = 89
        Width = 35
        Height = 21
        TabOrder = 5
        OnChange = EdLivroChange
      end
      object DBLCBLivro: TDBLookupComboBox
        Left = 198
        Top = 89
        Width = 268
        Height = 21
        KeyField = 'CODACERVO'
        ListField = 'CODACERVO;TITULO'
        ListFieldIndex = 1
        ListSource = Dados.DSAcervosLK
        TabOrder = 6
        OnClick = DBLCBLivroCloseUp
        OnCloseUp = DBLCBLivroCloseUp
        OnEnter = DBLCBLivroCloseUp
        OnExit = DBLCBLivroCloseUp
        OnKeyDown = DBLCBLivroKeyDown
      end
      object CBIni: TCheckBox
        Left = 39
        Top = 18
        Width = 129
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Data Inicial da Retirada'
        TabOrder = 0
      end
      object DTPIni: TDateTimePicker
        Left = 170
        Top = 16
        Width = 82
        Height = 21
        Date = 39279.744019178250000000
        Time = 39279.744019178250000000
        TabOrder = 1
      end
      object CBFin: TCheckBox
        Left = 257
        Top = 18
        Width = 124
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Data Final da Retirada'
        TabOrder = 2
      end
      object DTPFin: TDateTimePicker
        Left = 383
        Top = 16
        Width = 82
        Height = 21
        Date = 39279.744019178250000000
        Time = 39279.744019178250000000
        TabOrder = 3
      end
      object RGStatus: TRadioGroup
        Left = 39
        Top = 39
        Width = 483
        Height = 45
        Caption = 'Status'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'Todos'
          'Pend'#234'ncias'
          'D'#233'bitos'
          'Devolvidos (Sem Atraso)'
          'Devolvidos (Com Atraso)')
        TabOrder = 4
      end
      object EdAluno: TEdit
        Left = 162
        Top = 143
        Width = 35
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 7
        OnChange = EdAlunoChange
      end
      object DBLCBAluno: TDBLookupComboBox
        Left = 198
        Top = 143
        Width = 268
        Height = 21
        KeyField = 'CODALUNO'
        ListField = 'CODALUNO;NOME'
        ListFieldIndex = 1
        ListSource = Dados.DSAlunosLK
        TabOrder = 8
        OnClick = DBLCBAlunoCloseUp
        OnCloseUp = DBLCBAlunoCloseUp
        OnEnter = DBLCBAlunoCloseUp
        OnExit = DBLCBAlunoCloseUp
        OnKeyDown = DBLCBLivroKeyDown
      end
      object EdFunc: TEdit
        Left = 162
        Top = 166
        Width = 35
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 9
        OnChange = EdFuncChange
      end
      object DBLCBFunc: TDBLookupComboBox
        Left = 198
        Top = 166
        Width = 268
        Height = 21
        KeyField = 'CODFUNC'
        ListField = 'CODFUNC;NOME'
        ListFieldIndex = 1
        ListSource = Dados.DSFuncLK
        TabOrder = 10
        OnClick = DBLCBFuncCloseUp
        OnCloseUp = DBLCBFuncCloseUp
        OnEnter = DBLCBFuncCloseUp
        OnExit = DBLCBFuncCloseUp
        OnKeyDown = DBLCBLivroKeyDown
      end
      object RGQuem: TRadioGroup
        Left = 39
        Top = 110
        Width = 244
        Height = 31
        Caption = 'Retirada em nome do'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Aluno'
          'Funcion'#225'rio')
        TabOrder = 11
        OnClick = RGQuemClick
      end
    end
  end
  object QryRetiradas: TMDOQuery
    Database = Dados.Database
    OnCalcFields = QryRetiradasCalcFields
    Transaction = Dados.TransactionLK
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      
        'select AR.CODACERVO, AR.CODRETIRADA, A.titulo, AR.dtretirada, F.' +
        'nome as FUNC,  AL.nome as ALUNO, AR.dtdev, AR.dtdevolv,'
      'current_date - AR.dtretirada as DiasLocado'
      'from acervoretiradas AR'
      'inner join acervo A on a.codacervo = Ar.codacervo'
      'left join alunos AL on AL.codaluno = AR.codaluno'
      'left join func F on F.codfunc = AR.codfunc'
      '')
    Left = 196
    Top = 291
    object QryRetiradasCODACERVO: TSmallintField
      FieldName = 'CODACERVO'
      Required = True
    end
    object QryRetiradasCODRETIRADA: TSmallintField
      FieldName = 'CODRETIRADA'
      Required = True
    end
    object QryRetiradasTITULO: TMDOStringField
      FieldName = 'TITULO'
      Size = 100
    end
    object QryRetiradasDTRETIRADA: TDateField
      FieldName = 'DTRETIRADA'
    end
    object QryRetiradasFUNC: TMDOStringField
      FieldName = 'FUNC'
      Size = 100
    end
    object QryRetiradasALUNO: TMDOStringField
      FieldName = 'ALUNO'
      Size = 100
    end
    object QryRetiradasDIASLOCADO: TIntegerField
      FieldName = 'DIASLOCADO'
    end
    object QryRetiradasStatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'Status'
      Size = 10
      Calculated = True
    end
    object QryRetiradasDTDEV: TDateField
      FieldName = 'DTDEV'
    end
    object QryRetiradasDTDEVOLV: TDateField
      FieldName = 'DTDEVOLV'
    end
  end
  object DSReservas: TDataSource
    DataSet = QryRetiradas
    OnDataChange = DSReservasDataChange
    Left = 234
    Top = 291
  end
  object PMReservas: TPopupMenu
    Left = 128
    Top = 344
    object GerarRetirada1: TMenuItem
      Caption = 'Gerar Renova'#231#227'o'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CancelarReseva1: TMenuItem
      Caption = 'Efetuar Devolu'#231#227'o'
    end
  end
end
