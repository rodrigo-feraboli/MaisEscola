object FEtiquetas: TFEtiquetas
  Left = 249
  Top = 95
  AutoScroll = False
  Caption = 'Emiss'#227'o de Etiquetas'
  ClientHeight = 601
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object RL20Etiq: TRLReport
    Left = 8
    Top = 434
    Width = 816
    Height = 1054
    DataSource = DSCDS
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 13.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 0.000000000000000000
    PageSetup.PaperSize = fpCustom
    PageSetup.PaperWidth = 216.000000000000000000
    PageSetup.PaperHeight = 279.000000000000000000
    object RLDetailGrid1: TRLDetailGrid
      Left = 19
      Top = 49
      Width = 778
      Height = 95
      ColCount = 2
      ColSpacing = 0.500000000000000000
      Margins.LeftMargin = 0.400000000000000000
      Margins.TopMargin = 1.270000000000000000
      Margins.RightMargin = 0.400000000000000000
      Margins.BottomMargin = 1.270000000000000000
      RealBounds.UsedUnit = buMilimeters
      BeforePrint = RLDetailGrid1BeforePrint
      object RLDBText1: TRLDBText
        Left = 8
        Top = 10
        Width = 372
        Height = 18
        Alignment = taCenter
        AutoSize = False
        DataField = 'NOME'
        DataSource = DSCDS
      end
      object RLDBText3: TRLDBText
        Left = 8
        Top = 50
        Width = 372
        Height = 18
        Alignment = taCenter
        AutoSize = False
        DataField = 'CIDBAI'
        DataSource = DSCDS
      end
      object RLDBText2: TRLDBText
        Left = 8
        Top = 30
        Width = 372
        Height = 18
        Alignment = taCenter
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = DSCDS
      end
      object RLLabel1: TRLLabel
        Left = 7
        Top = 70
        Width = 373
        Height = 17
        Alignment = taCenter
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 142
    Width = 473
    Height = 265
    TabOrder = 1
    object Label1: TLabel
      Left = 184
      Top = 15
      Width = 73
      Height = 13
      Caption = 'Localizar Nome'
    end
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 24
      Width = 23
      Height = 22
      Hint = 'Desmarcar Todos'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 48
      Top = 24
      Width = 23
      Height = 22
      Hint = 'Selecionar Todos'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 264
      Top = 41
      Width = 200
      Height = 13
      AutoSize = False
      Caption = 'Label2'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 5
      Top = 65
      Width = 462
      Height = 126
      Color = clSilver
      DataSource = DSCDS
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'MARC'
          Title.Caption = 'Imp.'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAD'
          Title.Caption = 'Tipo'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 320
          Visible = True
        end>
    end
    object BitBtn1: TBitBtn
      Left = 245
      Top = 194
      Width = 85
      Height = 25
      Caption = '&Voltar'
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333FF3333333333333003333333333333F77F33333333333009033
        333333333F7737F333333333009990333333333F773337FFFFFF330099999000
        00003F773333377777770099999999999990773FF33333FFFFF7330099999000
        000033773FF33777777733330099903333333333773FF7F33333333333009033
        33333333337737F3333333333333003333333333333377333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 359
      Top = 194
      Width = 85
      Height = 25
      Caption = '&Sair'
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 144
      Top = 194
      Width = 85
      Height = 25
      Caption = '&Visualizar'
      TabOrder = 3
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        033333777777777773333330777777703333333773F333773333333330888033
        33333FFFF7FFF7FFFFFF0000000000000003777777777777777F0FFFFFFFFFF9
        FF037F3333333337337F0F78888888887F037F33FFFFFFFFF37F0F7000000000
        8F037F3777777777F37F0F70AAAAAAA08F037F37F3333337F37F0F70ADDDDDA0
        8F037F37F3333337F37F0F70A99A99A08F037F37F3333337F37F0F70A99A99A0
        8F037F37F3333337F37F0F70AAAAAAA08F037F37FFFFFFF7F37F0F7000000000
        8F037F3777777777337F0F77777777777F037F3333333333337F0FFFFFFFFFFF
        FF037FFFFFFFFFFFFF7F00000000000000037777777777777773}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 29
      Top = 194
      Width = 85
      Height = 25
      Caption = '&Apagar'
      TabOrder = 4
      OnClick = DBGrid1DblClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
    end
    object CBEtiq: TCheckBox
      Left = 236
      Top = 223
      Width = 228
      Height = 17
      Caption = 'Colocar tamb'#233'm as Etiquetas da Escola'
      TabOrder = 5
    end
    object CBQdo: TCheckBox
      Left = 236
      Top = 244
      Width = 199
      Height = 17
      Caption = 'Come'#231'ar a imprimir ap'#243's a etiqueta n'#186
      TabOrder = 6
      OnClick = CBQdoClick
    end
    object EdQdo: TEdit
      Left = 436
      Top = 241
      Width = 32
      Height = 21
      TabOrder = 7
      OnExit = EdQdoExit
    end
    object Edit3: TEdit
      Left = 260
      Top = 11
      Width = 206
      Height = 21
      TabOrder = 8
      OnChange = Edit3Change
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 475
    Height = 133
    Caption = 'Exibir'
    TabOrder = 2
    object Label3: TLabel
      Left = 48
      Top = 84
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object Label4: TLabel
      Left = 43
      Top = 108
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object CBAlunos: TCheckBox
      Left = 16
      Top = 16
      Width = 90
      Height = 17
      Caption = 'Alunos'
      TabOrder = 0
    end
    object CBPais: TCheckBox
      Left = 16
      Top = 40
      Width = 90
      Height = 17
      Caption = 'Pais'
      TabOrder = 1
    end
    object CBMaes: TCheckBox
      Left = 168
      Top = 16
      Width = 90
      Height = 17
      Caption = 'M'#227'es'
      TabOrder = 2
    end
    object CBResp: TCheckBox
      Left = 168
      Top = 40
      Width = 90
      Height = 17
      Caption = 'Respons'#225'veis'
      TabOrder = 3
    end
    object CBFunc: TCheckBox
      Left = 328
      Top = 40
      Width = 90
      Height = 17
      Caption = 'Funcion'#225'rios'
      TabOrder = 4
    end
    object CBForn: TCheckBox
      Left = 328
      Top = 16
      Width = 90
      Height = 17
      Caption = 'Fornecedores'
      TabOrder = 5
    end
    object Button2: TButton
      Left = 336
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Prosseguir'
      TabOrder = 6
      OnClick = Button2Click
    end
    object EdBairro: TEdit
      Left = 80
      Top = 80
      Width = 33
      Height = 21
      TabOrder = 7
      OnChange = EdBairroChange
    end
    object DBLCBBairro: TDBLookupComboBox
      Left = 115
      Top = 80
      Width = 153
      Height = 21
      KeyField = 'CODBAIRRO'
      ListField = 'CODBAIRRO;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSBairrosLK
      TabOrder = 8
      OnClick = DBLCBBairroEnter
      OnCloseUp = DBLCBBairroEnter
      OnEnter = DBLCBBairroEnter
      OnExit = DBLCBBairroEnter
    end
    object EdCity: TEdit
      Left = 80
      Top = 104
      Width = 33
      Height = 21
      TabOrder = 9
      OnChange = EdCityChange
    end
    object DBLCBCity: TDBLookupComboBox
      Left = 115
      Top = 104
      Width = 153
      Height = 21
      KeyField = 'CODCIDADE'
      ListField = 'CODCIDADE;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSCidadesLK
      TabOrder = 10
      OnClick = DBLCBCityEnter
      OnCloseUp = DBLCBCityEnter
      OnEnter = DBLCBCityEnter
      OnExit = DBLCBCityEnter
    end
  end
  object QryEtiquetas: TMDOQuery
    Database = Dados.Database
    OnCalcFields = QryEtiquetasCalcFields
    Transaction = Dados.TransactionLK
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    SQL.Strings = (
      '/* ALUNOS */'
      
        'SELECT 1 AS TIPO, A.NOME AS NOME, A.ENDERECO, B.DESCRICAO AS BAI' +
        'RRO,  C.DESCRICAO||'#39'/'#39'|| E.UF AS CITY, C.CEP FROM ALUNOS  A'
      'LEFT JOIN BAIRROS B ON A.CODBAIRRO = B.CODBAIRRO'
      'INNER JOIN CIDADES C ON C.CODCIDADE = A.CODCIDADE'
      'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO'
      'WHERE A.NOME IS NOT NULL AND A.ENDERECO IS NOT NULL'
      '/* PAIS */'
      ''
      'UNION'
      
        'SELECT 2, A.NOMEPAI, A.ENDERECOPAI, B.DESCRICAO,  C.DESCRICAO||'#39 +
        '/'#39'|| E.UF, C.CEP FROM ALUNOS  A'
      'LEFT JOIN BAIRROS B ON B.CODBAIRRO = A.CODBAIRROPAI'
      'INNER JOIN CIDADES C ON C.CODCIDADE = A.CODCIDADE'
      'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO'
      'WHERE A.NOMEPAI IS NOT NULL AND A.ENDERECOPAI IS NOT NULL'
      '/* M'#195'ES */'
      ''
      'UNION'
      
        'SELECT 3, A.NOMEMAE, A.ENDERECOMAE,  B.DESCRICAO, C.DESCRICAO||'#39 +
        '/'#39'|| E.UF, C.CEP FROM ALUNOS  A'
      'LEFT JOIN BAIRROS B ON B.CODBAIRRO = A.CODBAIRROMAE'
      'INNER JOIN CIDADES C ON C.CODCIDADE = A.CODCIDADE'
      'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO'
      'WHERE A.NOMEMAE IS NOT NULL AND A.ENDERECOMAE IS NOT NULL'
      '/* RESPONS'#193'VEIS */'
      ''
      'UNION'
      
        'SELECT 4, A.NOMERESP, A.ENDERECORESP, B.DESCRICAO, C.DESCRICAO||' +
        #39'/'#39'|| E.UF, C.CEP FROM ALUNOS  A'
      'LEFT JOIN BAIRROS B ON B.CODBAIRRO = A.CODBAIRRORESP'
      'INNER JOIN CIDADES C ON C.CODCIDADE = A.CODCIDADE'
      'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO'
      'WHERE A.NOMERESP IS NOT NULL AND A.ENDERECORESP IS NOT NULL'
      '/* FORNECEDORES */'
      ''
      'UNION'
      
        'SELECT 5, F.NOME, CAST(F.ENDERECO AS VARCHAR(100)), B.DESCRICAO,' +
        ' C.DESCRICAO||'#39'/'#39'|| E.UF, F.CEP FROM FORN F'
      'LEFT JOIN BAIRROS B ON B.CODBAIRRO = F.CODBAIRRO'
      'INNER JOIN CIDADES C ON C.CODCIDADE = F.CODCIDADE'
      'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO'
      'WHERE F.NOME IS NOT NULL AND F.ENDERECO IS NOT NULL'
      '/* FUNCION'#193'RIOS  */'
      ''
      'UNION'
      
        'SELECT 6, F.NOME, F.ENDERECO,  B.DESCRICAO, C.DESCRICAO||'#39'/'#39'|| E' +
        '.UF, F.CEP FROM FUNC F'
      'LEFT JOIN BAIRROS B ON B.CODBAIRRO = F.CODBAIRRO'
      'INNER JOIN CIDADES C ON C.CODCIDADE = F.CODCIDADE'
      'INNER JOIN ESTADOS E ON C.CODESTADO = E.CODESTADO'
      'WHERE F.NOME IS NOT NULL AND F.ENDERECO IS NOT NULL')
    Left = 368
    Top = 208
    object QryEtiquetasTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
    object QryEtiquetasNOME: TMDOStringField
      FieldName = 'NOME'
      Size = 100
    end
    object QryEtiquetasENDERECO: TMDOStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object QryEtiquetasBAIRRO: TMDOStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object QryEtiquetasCITY: TMDOStringField
      FieldName = 'CITY'
      Size = 103
    end
    object QryEtiquetasCEP: TMDOStringField
      FieldName = 'CEP'
      Size = 10
    end
    object QryEtiquetasCad: TStringField
      FieldKind = fkCalculated
      FieldName = 'Cad'
      Size = 15
      Calculated = True
    end
  end
  object DSCDS: TDataSource
    DataSet = CDSEtiq
    OnDataChange = DSCDSDataChange
    Left = 304
    Top = 208
  end
  object CDSEtiq: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 350
    Top = 256
    object CDSEtiqNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object CDSEtiqENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object CDSEtiqBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object CDSEtiqCITY: TStringField
      FieldName = 'CITY'
      Size = 103
    end
    object CDSEtiqCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object CDSEtiqCAD: TStringField
      FieldName = 'CAD'
      Size = 15
    end
    object CDSEtiqMARC: TStringField
      FieldName = 'MARC'
      Size = 1
    end
    object CDSEtiqCIDBAI: TStringField
      FieldName = 'CIDBAI'
      Size = 100
    end
  end
end
