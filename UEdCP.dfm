object FEdCP: TFEdCP
  Left = 208
  Top = 189
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Conta a Pagar'
  ClientHeight = 296
  ClientWidth = 550
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
    Width = 550
    Height = 241
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
      Top = 16
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro. Compra'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Label1Click
    end
    object DBText1: TDBText
      Left = 103
      Top = 16
      Width = 104
      Height = 17
      DataField = 'NROCOMPRA'
      DataSource = FCompras.DSCompras
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 492
      Top = 44
      Width = 23
      Height = 22
      Hint = 'Cadastro de Fornecedores'
      Caption = '+'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Label6: TLabel
      Left = 340
      Top = 16
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
    object SpeedButton2: TSpeedButton
      Left = 492
      Top = 76
      Width = 23
      Height = 22
      Hint = 'Cadastro de Bancos'
      Caption = '+'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Label13: TLabel
      Left = 75
      Top = 176
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Obs.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 41
      Top = 47
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fornecedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 67
      Top = 79
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Banco'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton3: TSpeedButton
      Left = 492
      Top = 140
      Width = 23
      Height = 22
      Hint = 'Cadastro de Condi'#231#245'es de Pagamento'
      Caption = '+'
      Flat = True
      OnClick = SpeedButton3Click
    end
    object Label4: TLabel
      Left = 8
      Top = 143
      Width = 88
      Height = 13
      Alignment = taRightJustify
      Caption = 'Condi'#231#227'o de Pgto.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton4: TSpeedButton
      Left = 492
      Top = 108
      Width = 23
      Height = 22
      Hint = 'Cadastro de Centro de Custos'
      Caption = '+'
      Flat = True
      OnClick = SpeedButton4Click
    end
    object Label5: TLabel
      Left = 17
      Top = 111
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Centro de Custo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBLCBForn: TDBLookupComboBox
      Left = 148
      Top = 44
      Width = 342
      Height = 21
      DataField = 'CODGEN'
      DataSource = FCPagar.DSCP
      KeyField = 'CODGEN'
      ListField = 'CODGEN;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSFornLK
      TabOrder = 2
      OnKeyPress = DBLCBFornKeyPress
    end
    object DBEdit5: TDBEdit
      Left = 414
      Top = 12
      Width = 74
      Height = 21
      DataField = 'DATA'
      DataSource = FCPagar.DSCP
      TabOrder = 0
    end
    object DBLCBBanco: TDBLookupComboBox
      Left = 148
      Top = 76
      Width = 342
      Height = 21
      DataField = 'CODBANCO'
      DataSource = FCPagar.DSCP
      KeyField = 'CODBANCO'
      ListField = 'CODBANCO;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSBancosLK
      TabOrder = 4
      OnKeyPress = DBLCBFornKeyPress
    end
    object DBEdit10: TDBEdit
      Left = 100
      Top = 76
      Width = 46
      Height = 21
      DataField = 'CODBANCO'
      DataSource = FCPagar.DSCP
      TabOrder = 3
    end
    object DBEdit8: TDBEdit
      Left = 100
      Top = 44
      Width = 46
      Height = 21
      DataField = 'CODGEN'
      DataSource = FCPagar.DSCP
      TabOrder = 1
    end
    object DBMemo1: TDBMemo
      Left = 100
      Top = 172
      Width = 390
      Height = 56
      DataField = 'OBS'
      DataSource = FCPagar.DSCP
      ScrollBars = ssVertical
      TabOrder = 9
    end
    object DBLCBCondPgto: TDBLookupComboBox
      Left = 148
      Top = 140
      Width = 342
      Height = 21
      DataField = 'CODCONDPGTO'
      DataSource = FCPagar.DSCP
      KeyField = 'CODCONDPGTO'
      ListField = 'CODCONDPGTO;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSCondPgtoLK
      TabOrder = 8
      OnKeyPress = DBLCBFornKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 100
      Top = 140
      Width = 46
      Height = 21
      DataField = 'CODCONDPGTO'
      DataSource = FCPagar.DSCP
      TabOrder = 7
    end
    object DBLCBCC: TDBLookupComboBox
      Left = 148
      Top = 108
      Width = 342
      Height = 21
      DataField = 'CODCC'
      DataSource = FCPagar.DSCP
      KeyField = 'CODCC'
      ListField = 'CODCC;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSCCLK
      TabOrder = 6
      OnKeyPress = DBLCBFornKeyPress
    end
    object DBEdit2: TDBEdit
      Left = 100
      Top = 108
      Width = 46
      Height = 21
      DataField = 'CODCC'
      DataSource = FCPagar.DSCP
      TabOrder = 5
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 241
    Width = 550
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
      Width = 546
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
