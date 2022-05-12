object FEdGen: TFEdGen
  Left = 256
  Top = 146
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Gen'#233'rico'
  ClientHeight = 487
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
    Height = 432
    Align = alClient
    BevelInner = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 42
      Top = 41
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 49
      Top = 65
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 35
      Top = 89
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fantasia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 145
      Top = 41
      Width = 70
      Height = 13
      Caption = 'Data Cadastro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 307
      Top = 41
      Width = 73
      Height = 13
      Caption = 'Data Funda'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 49
      Top = 161
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Bairro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBBairro: TSpeedButton
      Left = 363
      Top = 158
      Width = 23
      Height = 22
      Hint = 'Cadastro de Bairros'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBBairroClick
    end
    object Label7: TLabel
      Left = 44
      Top = 185
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cidade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBCidade: TSpeedButton
      Left = 363
      Top = 182
      Width = 23
      Height = 21
      Hint = 'Cadastro de Cidades'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBBairroClick
    end
    object Label8: TLabel
      Left = 58
      Top = 209
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'CEP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 289
      Top = 209
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Caixa Postal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 29
      Top = 233
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Contato 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 29
      Top = 257
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Contato 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 44
      Top = 281
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fone 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 316
      Top = 281
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fone 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 59
      Top = 305
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fax'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 316
      Top = 305
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Celular'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 49
      Top = 329
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'E-mail'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 59
      Top = 353
      Width = 18
      Height = 13
      Alignment = taRightJustify
      Caption = 'Site'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 51
      Top = 113
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'CNPJ'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 66
      Top = 137
      Width = 10
      Height = 13
      Alignment = taRightJustify
      Caption = 'IE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 58
      Top = 377
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Obs'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBMail: TSpeedButton
      Left = 468
      Top = 326
      Width = 23
      Height = 25
      Hint = 'Enviar e-mail (via cliente de e-mail)'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
        000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
        FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
        FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
        9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
        0000777777777777777733333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = SBMailClick
    end
    object Label21: TLabel
      Left = 418
      Top = 185
      Width = 13
      Height = 13
      Alignment = taRightJustify
      Caption = 'UF'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DTPDataCad: TDateTimePicker
      Left = 217
      Top = 38
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 5
      OnChange = DTPDataCadChange
    end
    object DBEdit1: TDBEdit
      Left = 79
      Top = 38
      Width = 50
      Height = 21
      DataField = 'CODGEN'
      DataSource = FGen.DSGen
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 62
      Width = 388
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = FGen.DSGen
      TabOrder = 8
      OnExit = DBEdit2Exit
    end
    object DBEdit3: TDBEdit
      Left = 79
      Top = 86
      Width = 388
      Height = 21
      CharCase = ecUpperCase
      DataField = 'FANTASIA'
      DataSource = FGen.DSGen
      TabOrder = 9
    end
    object DBEdit6: TDBEdit
      Left = 79
      Top = 158
      Width = 30
      Height = 21
      DataField = 'CODBAIRRO'
      DataSource = FGen.DSGen
      TabOrder = 12
    end
    object DBLCBBairro: TDBLookupComboBox
      Left = 112
      Top = 158
      Width = 250
      Height = 21
      DataField = 'CODBAIRRO'
      DataSource = FGen.DSGen
      KeyField = 'CODBAIRRO'
      ListField = 'CODBAIRRO;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSBairrosLK
      TabOrder = 13
      OnKeyPress = DBLCBBairroKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 79
      Top = 182
      Width = 30
      Height = 21
      DataField = 'CODCIDADE'
      DataSource = FGen.DSGen
      TabOrder = 14
    end
    object DBLCBCidades: TDBLookupComboBox
      Left = 112
      Top = 182
      Width = 250
      Height = 21
      DataField = 'CODCIDADE'
      DataSource = FGen.DSGen
      KeyField = 'CODCIDADE'
      ListField = 'CODCIDADE;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSCidadesLK
      TabOrder = 15
      OnEnter = DBLCBCidadesEnter
      OnExit = DBLCBCidadesExit
      OnKeyPress = DBLCBBairroKeyPress
    end
    object DBEdit8: TDBEdit
      Left = 79
      Top = 206
      Width = 114
      Height = 21
      DataField = 'CEP'
      DataSource = FGen.DSGen
      TabOrder = 16
    end
    object DBEdit9: TDBEdit
      Left = 350
      Top = 206
      Width = 114
      Height = 21
      DataField = 'CAIXAPOSTAL'
      DataSource = FGen.DSGen
      TabOrder = 17
    end
    object DBEdit10: TDBEdit
      Left = 79
      Top = 230
      Width = 386
      Height = 21
      DataField = 'CONTATO1'
      DataSource = FGen.DSGen
      TabOrder = 18
    end
    object DBEdit11: TDBEdit
      Left = 79
      Top = 254
      Width = 386
      Height = 21
      DataField = 'CONTATO2'
      DataSource = FGen.DSGen
      TabOrder = 19
    end
    object DBEdit12: TDBEdit
      Left = 79
      Top = 278
      Width = 114
      Height = 21
      DataField = 'FONE1'
      DataSource = FGen.DSGen
      TabOrder = 20
    end
    object DBEdit13: TDBEdit
      Left = 351
      Top = 278
      Width = 114
      Height = 21
      DataField = 'FONE2'
      DataSource = FGen.DSGen
      TabOrder = 21
    end
    object DBEdit14: TDBEdit
      Left = 79
      Top = 302
      Width = 114
      Height = 21
      DataField = 'FAX'
      DataSource = FGen.DSGen
      TabOrder = 22
    end
    object DBEdit15: TDBEdit
      Left = 351
      Top = 302
      Width = 114
      Height = 21
      DataField = 'CELULAR'
      DataSource = FGen.DSGen
      TabOrder = 23
    end
    object DBEdit16: TDBEdit
      Left = 79
      Top = 326
      Width = 386
      Height = 21
      DataField = 'EMAIL'
      DataSource = FGen.DSGen
      TabOrder = 24
    end
    object DBEdit17: TDBEdit
      Left = 79
      Top = 350
      Width = 386
      Height = 21
      DataField = 'SITE'
      DataSource = FGen.DSGen
      TabOrder = 25
    end
    object DBEdit18: TDBEdit
      Left = 79
      Top = 110
      Width = 388
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CNPJ'
      DataSource = FGen.DSGen
      TabOrder = 10
      OnExit = DBEdit18Exit
    end
    object DBEdit19: TDBEdit
      Left = 79
      Top = 134
      Width = 388
      Height = 21
      CharCase = ecUpperCase
      DataField = 'IE'
      DataSource = FGen.DSGen
      TabOrder = 11
      OnExit = DBEdit19Exit
    end
    object DBMemo1: TDBMemo
      Left = 79
      Top = 374
      Width = 386
      Height = 55
      DataField = 'OBS'
      DataSource = FGen.DSGen
      ScrollBars = ssVertical
      TabOrder = 26
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 257
      Top = 4
      Width = 185
      Height = 30
      Caption = 'Tipo Pessoa'
      Columns = 2
      DataField = 'TIPO'
      DataSource = FGen.DSGen
      Items.Strings = (
        'F'#237'sica'
        'Jur'#237'dica')
      TabOrder = 2
      Values.Strings = (
        'F'
        'J')
    end
    object EdUF: TEdit
      Left = 433
      Top = 182
      Width = 30
      Height = 21
      ReadOnly = True
      TabOrder = 27
    end
    object CBForn: TDBCheckBox
      Left = 24
      Top = 13
      Width = 75
      Height = 17
      Caption = 'Fornecedor'
      DataField = 'TIPOFORN'
      DataSource = FGen.DSGen
      TabOrder = 0
      ValueChecked = 'T'
      ValueUnchecked = 'F'
    end
    object CBTrans: TDBCheckBox
      Left = 104
      Top = 13
      Width = 97
      Height = 17
      Caption = 'Transportadora'
      DataField = 'TIPOTRAN'
      DataSource = FGen.DSGen
      TabOrder = 1
      ValueChecked = 'T'
      ValueUnchecked = 'F'
    end
    object DTPDataFund: TDateTimePicker
      Left = 383
      Top = 38
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 7
      OnChange = DTPDataFundChange
    end
    object DBEdit5: TDBEdit
      Left = 387
      Top = 41
      Width = 61
      Height = 16
      BorderStyle = bsNone
      DataField = 'DTFUND'
      DataSource = FGen.DSGen
      TabOrder = 6
      OnEnter = DBEdit5Enter
      OnExit = DBEdit5Enter
    end
    object DBEdit4: TDBEdit
      Left = 220
      Top = 41
      Width = 64
      Height = 15
      BorderStyle = bsNone
      DataField = 'DTCAD'
      DataSource = FGen.DSGen
      TabOrder = 4
      OnEnter = DBEdit4Exit
      OnExit = DBEdit4Exit
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 432
    Width = 520
    Height = 55
    Align = alBottom
    BevelInner = bvLowered
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
      Panels = <
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 125
        end>
    end
  end
end
