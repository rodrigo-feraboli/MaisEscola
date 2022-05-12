object FEdFunc: TFEdFunc
  Left = 284
  Top = 121
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Funcion'#225'rio'
  ClientHeight = 447
  ClientWidth = 564
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
    Width = 564
    Height = 392
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
      Left = 42
      Top = 16
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
      Top = 48
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
      Left = 6
      Top = 80
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Cadastro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 144
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Contrat.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 183
      Top = 80
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Nasc.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Bairro: TLabel
      Left = 48
      Top = 303
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
    object SpeedButton5: TSpeedButton
      Left = 441
      Top = 300
      Width = 23
      Height = 22
      Hint = 'Cadastro de Bairros'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton5Click
    end
    object Label7: TLabel
      Left = 32
      Top = 175
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Profiss'#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 441
      Top = 172
      Width = 23
      Height = 22
      Hint = 'Cadastro de Profiss'#245'es'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object Label8: TLabel
      Left = 43
      Top = 335
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
    object SpeedButton2: TSpeedButton
      Left = 441
      Top = 332
      Width = 23
      Height = 22
      Hint = 'Cadastro de Cidades'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
    object Label6: TLabel
      Left = 23
      Top = 112
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#250'mero CT'
      FocusControl = DBEdit1
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 196
      Top = 112
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'S'#233'rie CT'
      FocusControl = DBEdit1
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 222
      Top = 144
      Width = 14
      Height = 13
      Alignment = taRightJustify
      Caption = 'RG'
      FocusControl = DBEdit1
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton3: TSpeedButton
      Left = 367
      Top = 5
      Width = 74
      Height = 22
      Caption = 'Carregar Foto'
      Flat = True
      OnClick = SpeedButton3Click
    end
    object ImaFunc: TImage
      Left = 447
      Top = 2
      Width = 114
      Height = 88
      Center = True
      Proportional = True
      Stretch = True
    end
    object Label11: TLabel
      Left = 52
      Top = 208
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fone'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 203
      Top = 208
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = 'Celular'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 48
      Top = 240
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'E-mail'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 31
      Top = 272
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Endere'#231'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 57
      Top = 368
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'CEP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 79
      Top = 13
      Width = 50
      Height = 21
      DataField = 'CODFUNC'
      DataSource = FFunc.DSFunc
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 45
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = FFunc.DSFunc
      TabOrder = 1
      OnExit = DBEdit2Exit
    end
    object DBEdit3: TDBEdit
      Left = 79
      Top = 77
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DTCAD'
      DataSource = FFunc.DSFunc
      TabOrder = 2
    end
    object DBEdit33: TDBEdit
      Left = 79
      Top = 301
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODBAIRRO'
      DataSource = FFunc.DSFunc
      TabOrder = 16
    end
    object DBLCBBairro: TDBLookupComboBox
      Left = 112
      Top = 301
      Width = 328
      Height = 21
      DataField = 'CODBAIRRO'
      DataSource = FFunc.DSFunc
      KeyField = 'CODBAIRRO'
      ListField = 'CODBAIRRO;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSBairrosLK
      TabOrder = 17
      OnKeyPress = DBLCBProfissaoKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 79
      Top = 173
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODPROFISSAO'
      DataSource = FFunc.DSFunc
      TabOrder = 10
    end
    object DBLCBProfissao: TDBLookupComboBox
      Left = 112
      Top = 173
      Width = 328
      Height = 21
      DataField = 'CODPROFISSAO'
      DataSource = FFunc.DSFunc
      KeyField = 'CODPROFISSAO'
      ListField = 'CODPROFISSAO;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSProfissoesLK
      TabOrder = 11
      OnKeyPress = DBLCBProfissaoKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 79
      Top = 333
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODCIDADE'
      DataSource = FFunc.DSFunc
      TabOrder = 18
    end
    object DBLCBCidade: TDBLookupComboBox
      Left = 112
      Top = 333
      Width = 328
      Height = 21
      DataField = 'CODCIDADE'
      DataSource = FFunc.DSFunc
      KeyField = 'CODCIDADE'
      ListField = 'CODCIDADE;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSCidadesLK
      TabOrder = 19
      OnExit = DBLCBCidadeExit
      OnKeyPress = DBLCBProfissaoKeyPress
    end
    object DBEdit8: TDBEdit
      Left = 79
      Top = 109
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CTNUM'
      DataSource = FFunc.DSFunc
      TabOrder = 5
    end
    object DBEdit9: TDBEdit
      Left = 239
      Top = 109
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CTSERIE'
      DataSource = FFunc.DSFunc
      TabOrder = 6
    end
    object DBEdit10: TDBEdit
      Left = 239
      Top = 141
      Width = 224
      Height = 21
      CharCase = ecUpperCase
      DataField = 'RG'
      DataSource = FFunc.DSFunc
      TabOrder = 9
    end
    object DBEdit11: TDBEdit
      Left = 79
      Top = 205
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      DataField = 'FONE'
      DataSource = FFunc.DSFunc
      TabOrder = 12
    end
    object DBEdit12: TDBEdit
      Left = 239
      Top = 205
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CELULAR'
      DataSource = FFunc.DSFunc
      TabOrder = 13
    end
    object DBEdit13: TDBEdit
      Left = 79
      Top = 237
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      DataField = 'EMAIL'
      DataSource = FFunc.DSFunc
      TabOrder = 14
    end
    object DBEdit14: TDBEdit
      Left = 79
      Top = 269
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO'
      DataSource = FFunc.DSFunc
      TabOrder = 15
    end
    object DBEdit15: TDBEdit
      Left = 79
      Top = 365
      Width = 82
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CEP'
      DataSource = FFunc.DSFunc
      TabOrder = 20
    end
    object DTPNasc: TDateTimePicker
      Left = 239
      Top = 77
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 4
      OnChange = DTPNascChange
    end
    object DBEdit5: TDBEdit
      Left = 242
      Top = 80
      Width = 61
      Height = 14
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTNASC'
      DataSource = FFunc.DSFunc
      TabOrder = 3
      OnEnter = DBEdit5Enter
      OnExit = DBEdit5Enter
    end
    object DTPContr: TDateTimePicker
      Left = 79
      Top = 141
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 8
      OnChange = DTPContrChange
    end
    object DBEdit4: TDBEdit
      Left = 82
      Top = 144
      Width = 62
      Height = 15
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTCONTR'
      DataSource = FFunc.DSFunc
      TabOrder = 7
      OnEnter = DBEdit4Enter
      OnExit = DBEdit4Enter
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 392
    Width = 564
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
      Width = 560
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
end
