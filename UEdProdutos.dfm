object FEdProdutos: TFEdProdutos
  Left = 435
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Produto'
  ClientHeight = 267
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
    Height = 212
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
      Left = 47
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
      Left = 35
      Top = 48
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descri'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 14
      Top = 80
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pre'#231'o Compra'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 301
      Top = 80
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pre'#231'o Venda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 6
      Top = 112
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. '#218'lt. Compra'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 293
      Top = 112
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt. '#218'lt. Venda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 34
      Top = 144
      Width = 47
      Height = 13
      Alignment = taRightJustify
      Caption = 'Est. Atual'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 346
      Top = 144
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Est. Alerta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 187
      Top = 144
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Est. M'#237'nimo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 453
      Top = 144
      Width = 11
      Height = 13
      Alignment = taRightJustify
      Caption = '%'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 84
      Top = 13
      Width = 50
      Height = 21
      DataField = 'CODPROD'
      DataSource = FProdutos.DSProdutos
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 84
      Top = 45
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = FProdutos.DSProdutos
      TabOrder = 1
      OnExit = DBEdit2Exit
    end
    object DBEdit3: TDBEdit
      Left = 84
      Top = 77
      Width = 83
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PRECOCOMPRA'
      DataSource = FProdutos.DSProdutos
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 364
      Top = 77
      Width = 83
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PRECOVENDA'
      DataSource = FProdutos.DSProdutos
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 84
      Top = 109
      Width = 83
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DATAULTCOMPRA'
      DataSource = FProdutos.DSProdutos
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 364
      Top = 109
      Width = 83
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DATAULTVENDA'
      DataSource = FProdutos.DSProdutos
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 84
      Top = 141
      Width = 72
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ESTATUAL'
      DataSource = FProdutos.DSProdutos
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 401
      Top = 141
      Width = 47
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ESTALERTA'
      DataSource = FProdutos.DSProdutos
      TabOrder = 8
    end
    object DBEdit9: TDBEdit
      Left = 244
      Top = 141
      Width = 72
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ESTMINIMO'
      DataSource = FProdutos.DSProdutos
      TabOrder = 7
    end
    object DBCheckBox1: TDBCheckBox
      Left = 85
      Top = 175
      Width = 217
      Height = 17
      Caption = 'Alunos podem adquirir este produto'
      DataField = 'ALUNOSADQ'
      DataSource = FProdutos.DSProdutos
      TabOrder = 9
      ValueChecked = 'T'
      ValueUnchecked = 'F'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 212
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
