object FEdBancos: TFEdBancos
  Left = 243
  Top = 147
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Banco'
  ClientHeight = 294
  ClientWidth = 505
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
    Width = 505
    Height = 239
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
    object Label23: TLabel
      Left = 31
      Top = 112
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Endere'#231'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 48
      Top = 176
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
    object Label25: TLabel
      Left = 43
      Top = 208
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
    object SBBairro: TSpeedButton
      Left = 441
      Top = 173
      Width = 23
      Height = 22
      Hint = 'Cadastro de Bairros'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBBairroClick
    end
    object SBCidade: TSpeedButton
      Left = 441
      Top = 204
      Width = 23
      Height = 22
      Hint = 'Cadastro de Cidades'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBCidadeClick
    end
    object Label28: TLabel
      Left = 30
      Top = 146
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefone'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 35
      Top = 80
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fantasia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 266
      Top = 18
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Cadastro'
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
      DataField = 'CODBANCO'
      DataSource = FBancos.DSBancos
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
      DataSource = FBancos.DSBancos
      TabOrder = 2
      OnExit = DBEdit2Exit
    end
    object DBEdit23: TDBEdit
      Left = 79
      Top = 109
      Width = 364
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ENDERECO'
      DataSource = FBancos.DSBancos
      TabOrder = 4
    end
    object DBEdit24: TDBEdit
      Left = 79
      Top = 173
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODBAIRRO'
      DataSource = FBancos.DSBancos
      TabOrder = 6
    end
    object DBEdit25: TDBEdit
      Left = 79
      Top = 205
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODCIDADE'
      DataSource = FBancos.DSBancos
      TabOrder = 8
    end
    object DBLCBBairro: TDBLookupComboBox
      Left = 112
      Top = 173
      Width = 328
      Height = 21
      DataField = 'CODBAIRRO'
      DataSource = FBancos.DSBancos
      KeyField = 'CODBAIRRO'
      ListField = 'CODBAIRRO;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSBairrosLK
      TabOrder = 7
      OnKeyPress = DBLCBBairroKeyPress
    end
    object DBLCBCidade: TDBLookupComboBox
      Left = 112
      Top = 205
      Width = 328
      Height = 21
      DataField = 'CODCIDADE'
      DataSource = FBancos.DSBancos
      KeyField = 'CODCIDADE'
      ListField = 'CODCIDADE;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSCidadesLK
      TabOrder = 9
      OnKeyPress = DBLCBBairroKeyPress
    end
    object DBEdit28: TDBEdit
      Left = 78
      Top = 141
      Width = 130
      Height = 21
      CharCase = ecUpperCase
      DataField = 'FONE'
      DataSource = FBancos.DSBancos
      TabOrder = 5
    end
    object DBEdit3: TDBEdit
      Left = 79
      Top = 77
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      DataField = 'FANTASIA'
      DataSource = FBancos.DSBancos
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 342
      Top = 13
      Width = 99
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DATACADASTRO'
      DataSource = FBancos.DSBancos
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 239
    Width = 505
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
      Width = 501
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
