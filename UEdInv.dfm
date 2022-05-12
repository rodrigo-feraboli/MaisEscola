object FEdInv: TFEdInv
  Left = 309
  Top = 135
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Invent'#225'rio Mobili'#225'rio'
  ClientHeight = 239
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
    Height = 184
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
    object Label3: TLabel
      Left = 17
      Top = 112
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Observa'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 38
      Top = 48
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 37
      Top = 80
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Estoque'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 263
      Top = 16
      Width = 12
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 175
      Top = 80
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aquisi'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 332
      Top = 80
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Baixa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBProd: TSpeedButton
      Left = 441
      Top = 44
      Width = 23
      Height = 22
      Hint = 'Cadastro de Doen'#231'as'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBProdClick
    end
    object DBEdit1: TDBEdit
      Left = 79
      Top = 13
      Width = 50
      Height = 21
      DataField = 'CODPROD'
      DataSource = FInv.DSInv
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 45
      Width = 39
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DTENV'
      DataSource = FInv.DSInv
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 79
      Top = 77
      Width = 74
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DTENT'
      DataSource = FInv.DSInv
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 279
      Top = 13
      Width = 50
      Height = 21
      DataField = 'NROORDEM'
      DataSource = FInv.DSInv
      ReadOnly = True
      TabOrder = 1
    end
    object DBLCBProdutos: TDBLookupComboBox
      Left = 120
      Top = 45
      Width = 316
      Height = 21
      DataField = 'CODPROD'
      DataSource = FInv.DSInv
      KeyField = 'CODPROD'
      ListField = 'CODPROD;DESCRICAO'
      ListSource = Dados.DSProdutosLK
      TabOrder = 3
      OnKeyPress = DBLCBProdutosKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 223
      Top = 77
      Width = 74
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DTENT'
      DataSource = FInv.DSInv
      TabOrder = 5
    end
    object DBEdit8: TDBEdit
      Left = 360
      Top = 77
      Width = 74
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DTENT'
      DataSource = FInv.DSInv
      TabOrder = 6
    end
    object DBMemo1: TDBMemo
      Left = 79
      Top = 109
      Width = 355
      Height = 67
      DataField = 'OBS'
      DataSource = FInv.DSInv
      ScrollBars = ssVertical
      TabOrder = 7
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 184
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
