object FAlunosInad: TFAlunosInad
  Left = 225
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pesquisa de Alunos Inadimplentes'
  ClientHeight = 315
  ClientWidth = 786
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 786
    Height = 315
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
    object LblMestre: TLabel
      Left = 5
      Top = 6
      Width = 622
      Height = 13
      AutoSize = False
      Caption = 'LblMestre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LblDetalhe: TLabel
      Left = 5
      Top = 158
      Width = 622
      Height = 13
      AutoSize = False
      Caption = 'LblDetalhe'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 294
      Width = 782
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
      Left = 3
      Top = 22
      Width = 780
      Height = 120
      Color = clSilver
      DataSource = DSMestre
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
          FieldName = 'NOME'
          Title.Caption = 'Aluno'
          Width = 205
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEPAI'
          Title.Caption = 'Pai'
          Width = 205
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMEMAE'
          Title.Caption = 'M'#227'e'
          Width = 205
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FONE'
          Title.Caption = 'Fone'
          Visible = True
        end>
    end
    object DBGrid2: TDBGrid
      Left = 3
      Top = 174
      Width = 780
      Height = 120
      Color = clSilver
      DataSource = DSDetalhe
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'DTVCTO'
          Title.Caption = 'Data Vcto.'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIAS'
          Title.Caption = 'Dias em Atraso'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JUROS'
          Title.Caption = 'Juros a Pagar'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Width = 78
          Visible = True
        end>
    end
  end
  object QryMestre: TMDOQuery
    Database = Dados.Database
    Transaction = Dados.Transaction
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      'select distinct(A.CODALUNO), A.NOME,'
      'A.nomepai, A.nomemae, A.fone  from alunos A'
      'inner join alunoscarne AC on'
      'AC.CodAluno = A.CODALUNo'
      'where AC.dtvcto <:pldata')
    Left = 340
    Top = 131
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'pldata'
        ParamType = ptUnknown
      end>
    object QryMestreCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
      Required = True
    end
    object QryMestreNOME: TMDOStringField
      FieldName = 'NOME'
      Size = 100
    end
    object QryMestreNOMEPAI: TMDOStringField
      FieldName = 'NOMEPAI'
      Size = 100
    end
    object QryMestreNOMEMAE: TMDOStringField
      FieldName = 'NOMEMAE'
      Size = 100
    end
    object QryMestreFONE: TMDOStringField
      FieldName = 'FONE'
    end
  end
  object DSMestre: TDataSource
    DataSet = QryMestre
    OnDataChange = DSMestreDataChange
    Left = 378
    Top = 131
  end
  object DSDetalhe: TDataSource
    DataSet = QryDetalhe
    OnDataChange = DSDetalheDataChange
    Left = 378
    Top = 163
  end
  object QryDetalhe: TMDOQuery
    Database = Dados.Database
    OnCalcFields = QryDetalheCalcFields
    Transaction = Dados.Transaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSMestre
    LoadDefaults = False
    SQL.Strings = (
      'select dtvcto, valor, current_date - dtvcto as dias, '
      'CAST (2 as DECIMAL (15,2)) as juros  from alunoscarne AC'
      'where CODALUNO = :CODALUNO and'
      'dtvcto < current_date')
    Left = 340
    Top = 163
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODALUNO'
        ParamType = ptUnknown
      end>
    object QryDetalheDTVCTO: TDateField
      FieldName = 'DTVCTO'
    end
    object QryDetalheVALOR: TMDOBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 9
      Size = 2
    end
    object QryDetalheDIAS: TIntegerField
      FieldName = 'DIAS'
    end
    object QryDetalheJUROS: TMDOBCDField
      FieldName = 'JUROS'
      Required = True
      currency = True
      Precision = 18
      Size = 2
    end
    object QryDetalheTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total'
      Calculated = True
    end
  end
end
