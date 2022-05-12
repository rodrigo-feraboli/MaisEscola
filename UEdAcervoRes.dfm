object FEdAcervoRes: TFEdAcervoRes
  Left = 279
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Reserva do Acervo Liter'#225'rio'
  ClientHeight = 263
  ClientWidth = 520
  Color = clSkyBlue
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 208
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
    object Label1: TLabel
      Left = 52
      Top = 16
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Livro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 48
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Reserva'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblAluno: TLabel
      Left = 49
      Top = 80
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aluno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBAluno: TSpeedButton
      Left = 387
      Top = 77
      Width = 23
      Height = 22
      Caption = '+'
      Flat = True
      OnClick = SBAlunoClick
    end
    object LblFunc: TLabel
      Left = 21
      Top = 112
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Funcion'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBFunc: TSpeedButton
      Left = 387
      Top = 109
      Width = 23
      Height = 22
      Caption = '+'
      Flat = True
      OnClick = SBFuncClick
    end
    object Label3: TLabel
      Left = 43
      Top = 178
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Edi'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBEAluno: TDBEdit
      Left = 79
      Top = 77
      Width = 35
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODALUNO'
      DataSource = FAcervo.DSAcervoReservas
      TabOrder = 5
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 187
      Top = 39
      Width = 185
      Height = 30
      Caption = 'Reserva em nome do'
      Columns = 2
      DataField = 'QUEM'
      DataSource = FAcervo.DSAcervoReservas
      Items.Strings = (
        'Aluno'
        'Funcion'#225'rio')
      TabOrder = 4
      Values.Strings = (
        '1'
        '2')
      OnChange = DBRadioGroup1Change
    end
    object DBLCBAluno: TDBLookupComboBox
      Left = 115
      Top = 77
      Width = 268
      Height = 21
      DataField = 'CODALUNO'
      DataSource = FAcervo.DSAcervoReservas
      KeyField = 'CODALUNO'
      ListField = 'CODALUNO;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSAlunosLK
      TabOrder = 6
    end
    object DBEFunc: TDBEdit
      Left = 79
      Top = 109
      Width = 35
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODFUNC'
      DataSource = FAcervo.DSAcervoReservas
      TabOrder = 7
    end
    object DBLCBFunc: TDBLookupComboBox
      Left = 115
      Top = 109
      Width = 268
      Height = 21
      DataField = 'CODFUNC'
      DataSource = FAcervo.DSAcervoReservas
      KeyField = 'CODFUNC'
      ListField = 'CODFUNC;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSFuncLK
      TabOrder = 8
    end
    object DBLivro: TDBEdit
      Left = 79
      Top = 13
      Width = 35
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODACERVO'
      DataSource = FAcervo.DSAcervoReservas
      TabOrder = 0
    end
    object DBLCBLivro: TDBLookupComboBox
      Left = 115
      Top = 13
      Width = 268
      Height = 21
      DataField = 'CODACERVO'
      DataSource = FAcervo.DSAcervoReservas
      KeyField = 'CODACERVO'
      ListField = 'CODACERVO;TITULO'
      ListFieldIndex = 1
      ListSource = Dados.DSAcervosLK
      TabOrder = 1
      OnExit = DBLCBLivroExit
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 79
      Top = 136
      Width = 302
      Height = 31
      Caption = 'Reservar Edi'#231#227'o do Livro do Acervo'
      Columns = 2
      DataField = 'TIPORESERVA'
      DataSource = FAcervo.DSAcervoReservas
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'O primeiro que chegar'
        'Algum espec'#237'fico')
      ParentFont = False
      TabOrder = 9
      Values.Strings = (
        '0'
        '1')
      OnChange = DBRadioGroup2Change
    end
    object DBLCBEdicao: TDBLookupComboBox
      Left = 79
      Top = 175
      Width = 302
      Height = 21
      KeyField = 'EdicaoStr'
      ListField = 'EdicaoStr'
      ListFieldIndex = 1
      ListSource = DSAcervosRes
      TabOrder = 10
      OnClick = DBLCBEdicaoClick
    end
    object DTPReserva: TDateTimePicker
      Left = 79
      Top = 45
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 3
      OnChange = DTPReservaChange
    end
    object DBEdit2: TDBEdit
      Left = 82
      Top = 48
      Width = 59
      Height = 15
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTRESERVA'
      DataSource = FAcervo.DSAcervoReservas
      TabOrder = 2
      OnEnter = DBEdit2Enter
      OnExit = DBEdit2Enter
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 208
    Width = 520
    Height = 55
    Align = alBottom
    BevelInner = bvLowered
    Color = 2025694
    TabOrder = 1
    object SBGravar: TSpeedButton
      Left = 257
      Top = 7
      Width = 120
      Height = 25
      Caption = 'Gravar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SBGravarClick
    end
    object SBCancelar: TSpeedButton
      Left = 377
      Top = 7
      Width = 120
      Height = 25
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = SBCancelarClick
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 34
      Width = 516
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 125
        end>
    end
  end
  object QryAcervosRes: TMDOQuery
    Database = Dados.Database
    OnCalcFields = QryAcervosResCalcFields
    Transaction = Dados.TransactionLK
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      
        'SELECT DISTINCT(EDICAO) from ACERVOITENS WHERE EDICAO IS NOT NUL' +
        'L'
      'AND CODACERVO = :plCod'
      'ORDER BY 1')
    Left = 432
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'plCod'
        ParamType = ptUnknown
      end>
    object QryAcervosResEDICAO: TSmallintField
      FieldName = 'EDICAO'
    end
    object QryAcervosResEdicaoStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'EdicaoStr'
      Size = 25
      Calculated = True
    end
  end
  object DSAcervosRes: TDataSource
    DataSet = QryAcervosRes
    Left = 432
    Top = 88
  end
end
