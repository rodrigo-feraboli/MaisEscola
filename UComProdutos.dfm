object FComProdutos: TFComProdutos
  Left = 211
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Itens da Compra'
  ClientHeight = 186
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 459
    Height = 132
    BevelInner = bvRaised
    BevelOuter = bvLowered
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
      Left = 50
      Top = 45
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
      Left = 39
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
      Caption = '+'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Label9: TLabel
      Left = 55
      Top = 107
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
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
      Left = 111
      Top = 42
      Width = 70
      Height = 21
      DataField = 'QUANT'
      DataSource = FCompras.DSComprasItens
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 111
      Top = 73
      Width = 70
      Height = 21
      DataField = 'VLRUNIT'
      DataSource = FCompras.DSComprasItens
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 111
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
      KeyField = 'CODPRODUTO'
      ListField = 'NOME'
      TabOrder = 1
      OnKeyPress = DBLCBProdutoKeyPress
    end
    object DBEdit7: TDBEdit
      Left = 111
      Top = 104
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
    Top = 131
    Width = 459
    Height = 55
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object SBGravar: TSpeedButton
      Left = 187
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
    end
    object SBCancelar: TSpeedButton
      Left = 307
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
    object StatusBar2: TStatusBar
      Left = 2
      Top = 34
      Width = 455
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
