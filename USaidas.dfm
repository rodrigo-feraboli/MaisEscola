object FSaidas: TFSaidas
  Left = 225
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pesquisa de Sa'#237'das Antecipadas'
  ClientHeight = 304
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
    Height = 304
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
      Left = 13
      Top = 26
      Width = 622
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
    object StatusBar1: TStatusBar
      Left = 2
      Top = 283
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
      Top = 39
      Width = 780
      Height = 243
      Color = clSilver
      DataSource = DSAniv
      ReadOnly = True
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
          FieldName = 'DIA'
          Title.Caption = 'Data'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HRSAI'
          Title.Caption = 'Hora'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MotivoStr'
          Title.Caption = 'Motivo'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StatusStr'
          Title.Caption = 'Status'
          Width = 75
          Visible = True
        end>
    end
    object CBIni: TCheckBox
      Left = 469
      Top = 5
      Width = 72
      Height = 17
      Caption = 'Data Inicial'
      TabOrder = 2
      OnClick = CBIniClick
    end
    object CBFin: TCheckBox
      Left = 604
      Top = 5
      Width = 68
      Height = 17
      Caption = 'Data Final'
      TabOrder = 3
      OnClick = CBIniClick
    end
    object DTPIni: TDateTimePicker
      Left = 544
      Top = 3
      Width = 53
      Height = 21
      Date = 39273.413562638890000000
      Format = 'dd/MM'
      Time = 39273.413562638890000000
      TabOrder = 4
      OnChange = CBIniClick
    end
    object DTPFin: TDateTimePicker
      Left = 672
      Top = 3
      Width = 53
      Height = 21
      Date = 39273.413562638890000000
      Format = 'dd/MM'
      Time = 39273.413562638890000000
      TabOrder = 5
      OnChange = CBIniClick
    end
  end
  object QrySaidas: TMDOQuery
    Database = Dados.Database
    OnCalcFields = QrySaidasCalcFields
    Transaction = Dados.Transaction
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      'SELECT A.NOME,'
      ' AA.DTSAI as Dia,'
      '  AA.HRSAI, AA.MOTIVO, AA.STATUS FROM ALUNOS A'
      ' INNER JOIN ALUNOSAVISO AA ON AA.CODALUNO = A.CODALUNO'
      ' WHERE MOTIVO IS NOT NULL  and'
      ' ((cast(extract(month from AA.DTSAI) as smallint) * 100) +'
      
        ' cast(extract(day from AA.DTSAI) as smallint)) between :plPerIni' +
        ' and  :plPerFin'
      '  order by 2.3'
      '')
    Left = 340
    Top = 131
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'plPerIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'plPerFin'
        ParamType = ptUnknown
      end>
    object QrySaidasNOME: TMDOStringField
      FieldName = 'NOME'
      Size = 100
    end
    object QrySaidasDIA: TDateField
      FieldName = 'DIA'
      DisplayFormat = 'dd/MM'
    end
    object QrySaidasHRSAI: TTimeField
      FieldName = 'HRSAI'
    end
    object QrySaidasMOTIVO: TMemoField
      FieldName = 'MOTIVO'
      BlobType = ftMemo
      Size = 8
    end
    object QrySaidasSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object QrySaidasMotivoStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'MotivoStr'
      Size = 100
      Calculated = True
    end
    object QrySaidasStatusStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusStr'
      Size = 10
      Calculated = True
    end
  end
  object DSAniv: TDataSource
    DataSet = QrySaidas
    Left = 378
    Top = 131
  end
end
