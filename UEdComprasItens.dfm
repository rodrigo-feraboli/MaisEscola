object FEdComprasItens: TFEdComprasItens
  Left = 435
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o dos Itens da Compra'
  ClientHeight = 190
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
    Height = 135
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
      Left = 68
      Top = 13
      Width = 38
      Height = 13
      Caption = 'Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 34
      Top = 44
      Width = 56
      Height = 13
      Caption = 'Quantidade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 25
      Top = 76
      Width = 67
      Height = 13
      Caption = 'Valor Unit'#225'rio '
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 431
      Top = 8
      Width = 22
      Height = 22
      Hint = 'Cadastro de Produtos'
      Caption = '+'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Label9: TLabel
      Left = 19
      Top = 108
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Total'
    end
    object Label4: TLabel
      Left = 293
      Top = 108
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor IPI'
    end
    object DBEdit1: TDBEdit
      Left = 92
      Top = 41
      Width = 70
      Height = 21
      DataField = 'QUANT'
      DataSource = FCompras.DSComprasItens
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 92
      Top = 73
      Width = 70
      Height = 21
      DataField = 'VLRUNIT'
      DataSource = FCompras.DSComprasItens
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 110
      Top = 9
      Width = 52
      Height = 21
      DataField = 'CODPRODUTO'
      DataSource = FCompras.DSComprasItens
      TabOrder = 0
    end
    object DBLCBProduto: TDBLookupComboBox
      Left = 163
      Top = 9
      Width = 266
      Height = 21
      DataField = 'CODPRODUTO'
      DataSource = FCompras.DSComprasItens
      KeyField = 'CODPROD'
      ListField = 'CODPROD;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSProdutosLK
      TabOrder = 1
      OnExit = DBLCBProdutoExit
      OnKeyDown = DBLCBProdutoKeyDown
      OnKeyPress = DBLCBProdutoKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 73
      Top = 105
      Width = 89
      Height = 21
      DataField = 'VlrTot'
      DataSource = FCompras.DSComprasItens
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 337
      Top = 105
      Width = 89
      Height = 21
      DataField = 'VLRIPI'
      DataSource = FCompras.DSComprasItens
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 135
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
