object FEdMovEst: TFEdMovEst
  Left = 435
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Movimenta'#231#227'o de Estoque'
  ClientHeight = 282
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
    Height = 227
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
      Left = 36
      Top = 17
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Mov.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
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
    object SBProdutos: TSpeedButton
      Left = 450
      Top = 44
      Width = 23
      Height = 22
      Hint = 'Cadastro de Produtos'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBProdutosClick
    end
    object Label3: TLabel
      Left = 345
      Top = 17
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 19
      Top = 113
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Quantidade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 52
      Top = 145
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Obs.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
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
      DataField = 'NROMOV'
      DataSource = FMovEst.DSMovEst
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 45
      Width = 50
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODPRODUTO'
      DataSource = FMovEst.DSMovEst
      TabOrder = 2
    end
    object DBLCBProdutos: TDBLookupComboBox
      Left = 133
      Top = 45
      Width = 316
      Height = 21
      DataField = 'CODPRODUTO'
      DataSource = FMovEst.DSMovEst
      KeyField = 'CODPROD'
      ListField = 'CODPROD;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSProdutosLK
      TabOrder = 3
      OnKeyPress = DBLCBProdutosKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 372
      Top = 13
      Width = 76
      Height = 21
      DataField = 'DATA'
      DataSource = FMovEst.DSMovEst
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 79
      Top = 109
      Width = 50
      Height = 21
      DataField = 'QUANT'
      DataSource = FMovEst.DSMovEst
      TabOrder = 5
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 79
      Top = 72
      Width = 370
      Height = 30
      Caption = 'Tipo'
      Columns = 2
      DataField = 'TIPO'
      DataSource = FMovEst.DSMovEst
      Items.Strings = (
        'Entrada'
        'Sa'#237'da')
      TabOrder = 4
      Values.Strings = (
        'E'
        'S')
    end
    object DBMemo1: TDBMemo
      Left = 78
      Top = 141
      Width = 371
      Height = 74
      DataField = 'OBS'
      DataSource = FMovEst.DSMovEst
      ScrollBars = ssVertical
      TabOrder = 6
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 227
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
