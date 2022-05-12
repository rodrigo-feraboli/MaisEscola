object FEdAcervo: TFEdAcervo
  Left = 284
  Top = 121
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Acervo Liter'#225'rio'
  ClientHeight = 325
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 270
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
      Left = 50
      Top = 48
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'T'#237'tulo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 41
      Top = 111
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'G'#234'nero'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBGeneros: TSpeedButton
      Left = 441
      Top = 108
      Width = 23
      Height = 22
      Hint = 'Cadastro de G'#234'neros'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBGenerosClick
    end
    object Autores: TLabel
      Left = 40
      Top = 175
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Autor 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBAutor1: TSpeedButton
      Left = 441
      Top = 172
      Width = 23
      Height = 22
      Hint = 'Cadastro de Autores'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAutor3Click
    end
    object Label7: TLabel
      Left = 40
      Top = 207
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Autor 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBAutor2: TSpeedButton
      Left = 441
      Top = 204
      Width = 23
      Height = 22
      Hint = 'Cadastro de Autores'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAutor3Click
    end
    object Label8: TLabel
      Left = 40
      Top = 239
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Autor 3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBAutor3: TSpeedButton
      Left = 441
      Top = 236
      Width = 23
      Height = 22
      Hint = 'Cadastro de Autores'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAutor3Click
    end
    object Label9: TLabel
      Left = 42
      Top = 143
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Editora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBEditora: TSpeedButton
      Left = 441
      Top = 140
      Width = 23
      Height = 22
      Hint = 'Cadastro de Editoras'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBEditoraClick
    end
    object Label10: TLabel
      Left = 22
      Top = 80
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pr. Compra'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
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
      DataField = 'CODACERVO'
      DataSource = FAcervo.DSAcervo
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 45
      Width = 386
      Height = 21
      CharCase = ecUpperCase
      DataField = 'TITULO'
      DataSource = FAcervo.DSAcervo
      TabOrder = 1
      OnExit = DBEdit2Exit
    end
    object DBEdit33: TDBEdit
      Left = 79
      Top = 109
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODGENERO'
      DataSource = FAcervo.DSAcervo
      TabOrder = 3
    end
    object DBLCBGenero: TDBLookupComboBox
      Left = 112
      Top = 109
      Width = 328
      Height = 21
      DataField = 'CODGENERO'
      DataSource = FAcervo.DSAcervo
      KeyField = 'CODGENERO'
      ListField = 'CODGENERO;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSGenerosLK
      TabOrder = 4
      OnKeyPress = DBLCBGeneroKeyPress
    end
    object DBEdit6: TDBEdit
      Left = 79
      Top = 173
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODAUTOR1'
      DataSource = FAcervo.DSAcervo
      TabOrder = 7
    end
    object DBLCBAutor: TDBLookupComboBox
      Left = 112
      Top = 173
      Width = 328
      Height = 21
      DataField = 'CODAUTOR1'
      DataSource = FAcervo.DSAcervo
      KeyField = 'CODAUTOR'
      ListField = 'CODAUTOR;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSAutoresLK
      TabOrder = 8
      OnKeyPress = DBLCBGeneroKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 79
      Top = 205
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODAUTOR2'
      DataSource = FAcervo.DSAcervo
      TabOrder = 9
    end
    object DBLCBAutor2: TDBLookupComboBox
      Left = 112
      Top = 205
      Width = 328
      Height = 21
      DataField = 'CODAUTOR2'
      DataSource = FAcervo.DSAcervo
      KeyField = 'CODAUTOR'
      ListField = 'CODAUTOR;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSAutoresLK
      TabOrder = 10
      OnKeyPress = DBLCBGeneroKeyPress
    end
    object DBEdit8: TDBEdit
      Left = 79
      Top = 237
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODAUTOR3'
      DataSource = FAcervo.DSAcervo
      TabOrder = 11
    end
    object DBLCBAutor3: TDBLookupComboBox
      Left = 112
      Top = 237
      Width = 328
      Height = 21
      DataField = 'CODAUTOR3'
      DataSource = FAcervo.DSAcervo
      KeyField = 'CODAUTOR'
      ListField = 'CODAUTOR;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSAutoresLK
      TabOrder = 12
      OnKeyPress = DBLCBGeneroKeyPress
    end
    object DBEdit9: TDBEdit
      Left = 79
      Top = 141
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODEDITORA'
      DataSource = FAcervo.DSAcervo
      TabOrder = 5
    end
    object DBLCBEditora: TDBLookupComboBox
      Left = 112
      Top = 141
      Width = 328
      Height = 21
      DataField = 'CODEDITORA'
      DataSource = FAcervo.DSAcervo
      KeyField = 'CODEDITORA'
      ListField = 'CODEDITORA;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSEditorasLK
      TabOrder = 6
      OnKeyPress = DBLCBGeneroKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 79
      Top = 77
      Width = 89
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PRECO'
      DataSource = FAcervo.DSAcervo
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 270
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
end
