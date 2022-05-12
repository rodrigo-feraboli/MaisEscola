object FMalaDireta: TFMalaDireta
  Left = 181
  Top = 102
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Envio de Mala Direta'
  ClientHeight = 669
  ClientWidth = 779
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 779
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
    object Label1: TLabel
      Left = 377
      Top = 22
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
      Left = 374
      Top = 80
      Width = 280
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
    object SBNovo: TSpeedButton
      Left = 3
      Top = 3
      Width = 120
      Height = 25
      Hint = 'Insere novo registro'
      Caption = 'Apagar Selecionado'
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
      Caption = 'Reler E-mails'
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
      Caption = 'Enviar Cliente de E-mail'
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
      Caption = 'Enviar Via Sistema'
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
    object SpeedButton1: TSpeedButton
      Left = 657
      Top = 3
      Width = 120
      Height = 25
      Hint = 'Insere novo registro'
      Caption = 'Salvar Mala Direta'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object SpeedButton2: TSpeedButton
      Left = 657
      Top = 28
      Width = 120
      Height = 25
      Hint = 'Insere novo registro'
      Caption = 'Carregar Mala Direta'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object RBNome: TRadioButton
      Left = 377
      Top = 38
      Width = 57
      Height = 17
      Caption = 'Nome'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TabStop = True
      OnClick = RBNomeClick
    end
    object RBMail: TRadioButton
      Left = 377
      Top = 54
      Width = 68
      Height = 17
      Caption = 'E-mail'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = RBNomeClick
    end
    object EdBusca: TEdit
      Left = 444
      Top = 48
      Width = 161
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
    object RGFilltro: TGroupBox
      Left = 126
      Top = 5
      Width = 107
      Height = 97
      Caption = 'Exibir e-mails dos'
      TabOrder = 3
      object CBPais: TCheckBox
        Left = 8
        Top = 16
        Width = 95
        Height = 17
        Caption = 'Pais'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CBPaisClick
      end
      object CBMaes: TCheckBox
        Left = 8
        Top = 36
        Width = 95
        Height = 17
        Caption = 'M'#227'es'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CBPaisClick
      end
      object CBFornecedores: TCheckBox
        Left = 8
        Top = 57
        Width = 95
        Height = 17
        Caption = 'Fornecedores'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CBPaisClick
      end
      object CBFuncionarios: TCheckBox
        Left = 8
        Top = 78
        Width = 95
        Height = 17
        Caption = 'Funcion'#225'rios'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CBPaisClick
      end
    end
    object RGPriority: TRadioGroup
      Left = 234
      Top = 5
      Width = 138
      Height = 97
      Caption = 'Prioridade (Via Sistema)'
      Items.Strings = (
        'Alt'#237'ssima'
        'Alta'
        'Normal'
        'Baixa'
        'Baix'#237'ssima')
      TabOrder = 4
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 107
    Width = 779
    Height = 562
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
    object Assunto: TLabel
      Left = 22
      Top = 358
      Width = 39
      Height = 13
      Caption = 'Assunto'
    end
    object Mensagem: TLabel
      Left = 10
      Top = 380
      Width = 51
      Height = 13
      Caption = 'Mensagem'
    end
    object Label3: TLabel
      Left = 39
      Top = 8
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = 'Para'
    end
    object DBGrid1: TDBGrid
      Left = 66
      Top = 2
      Width = 709
      Height = 348
      Color = clSilver
      DataSource = DSMalaDireta
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 293
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Width = 293
          Visible = True
        end>
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 541
      Width = 775
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'Ctrl + Del - Apagar Sel.'
          Width = 135
        end
        item
          Alignment = taCenter
          Text = 'Ctrl + F5 - Reler E-mails'
          Width = 135
        end
        item
          Alignment = taCenter
          Text = 'F8 - Env. Cliente e-mail'
          Width = 135
        end
        item
          Alignment = taCenter
          Text = 'F9 - Env. Sistema'
          Width = 135
        end
        item
          Alignment = taCenter
          Text = 'Ctrl + S - Salvar Rascunho'
          Width = 135
        end
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 135
        end>
    end
    object EdAssunto: TEdit
      Left = 66
      Top = 355
      Width = 709
      Height = 21
      TabOrder = 2
      Text = 'EdAssunto'
    end
    object MemoMsg: TMemo
      Left = 66
      Top = 378
      Width = 709
      Height = 157
      Lines.Strings = (
        'MemoMsg')
      ScrollBars = ssVertical
      TabOrder = 3
    end
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Host = 'smtp.bgz.terra.com.br'
    Port = 25
    AuthenticationType = atNone
    Password = 'evldadm362'
    Left = 56
    Top = 208
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Priority = mpHighest
    Recipients = <>
    ReplyTo = <>
    Left = 48
    Top = 240
  end
  object DSMalaDireta: TDataSource
    DataSet = CDSMalaDireta
    Left = 96
    Top = 171
  end
  object CDSMalaDireta: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'INDEXMAIL'
        Fields = 'EMAIL'
      end
      item
        Name = 'INDEXNAME'
        Fields = 'NOME'
      end>
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 144
    object CDSMalaDiretaTIPO: TStringField
      FieldName = 'TIPO'
    end
    object CDSMalaDiretaNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object CDSMalaDiretaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object QryMalaDireta: TMDOQuery
    Database = Dados.Database
    Transaction = Dados.TransactionLK
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      
        'SELECT CAST('#39'Pai'#39' as varchar(20)) as TIPO, nomepai as NOME, emai' +
        'lpai as email from alunos where emailpai is not null'
      'union'
      
        'SELECT CAST('#39'M'#227'e'#39' as varchar(20)), nomemae, emailmae from alunos' +
        ' where emailmae is not null'
      'union'
      
        'SELECT CAST('#39'Funcion'#225'rio'#39' as varchar(20)), nome, email  from fun' +
        'c  where email is not null'
      'union'
      
        'SELECT CAST('#39'Fornecedor'#39' as varchar(20)), nome, email from forn ' +
        'where email is not null')
    Left = 137
    Top = 136
    object QryMalaDiretaTIPO: TMDOStringField
      FieldName = 'TIPO'
      Required = True
    end
    object QryMalaDiretaNOME: TMDOStringField
      FieldName = 'NOME'
      Size = 100
    end
    object QryMalaDiretaEMAIL: TMDOStringField
      FieldName = 'EMAIL'
      Size = 100
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = QryMalaDireta
    Left = 168
    Top = 139
  end
  object CDSAnexos: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'INDEXMAIL'
        Fields = 'EMAIL'
      end
      item
        Name = 'INDEXNAME'
        Fields = 'NOME'
      end>
    Params = <>
    StoreDefs = True
    Left = 200
    Top = 176
    object CDSAnexosPATH: TStringField
      FieldName = 'PATH'
      Size = 200
    end
  end
  object DSAnexos: TDataSource
    DataSet = CDSAnexos
    Left = 232
    Top = 179
  end
  object ODAnexos: TOpenDialog
    Left = 160
    Top = 203
  end
end
