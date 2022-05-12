object FEdCompras: TFEdCompras
  Left = 187
  Top = 72
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Compra'
  ClientHeight = 287
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
    Height = 232
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
      Left = 14
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
    end
    object DBText1: TDBText
      Left = 81
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
      Left = 521
      Top = 85
      Width = 23
      Height = 22
      Hint = 'Cadastro de Fornecedores'
      Caption = '+'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Label6: TLabel
      Left = 219
      Top = 16
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Compra'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 521
      Top = 117
      Width = 23
      Height = 22
      Hint = 'Cadastro de CFOP'
      Caption = '+'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Label16: TLabel
      Left = 193
      Top = 56
      Width = 92
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro Ordem Compra'
      Visible = False
    end
    object Label5: TLabel
      Left = 84
      Top = 56
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro NF '
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton4: TSpeedButton
      Left = 521
      Top = 197
      Width = 23
      Height = 21
      Caption = '+'
      Flat = True
      OnClick = SpeedButton4Click
    end
    object Label13: TLabel
      Left = 47
      Top = 200
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Transportadora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 371
      Top = 16
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data de Emiss'#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 65
      Top = 88
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
      Left = 93
      Top = 120
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'CFOP'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 369
      Top = 44
      Width = 176
      Height = 32
      Caption = 'Tipo de Nota'
      Columns = 2
      DataField = 'TIPONOTA'
      DataSource = FCompras.DSCompras
      Items.Strings = (
        'Entrada'
        'Sa'#237'da')
      TabOrder = 6
      Values.Strings = (
        'E'
        'S')
    end
    object DBLCBForn: TDBLookupComboBox
      Left = 172
      Top = 85
      Width = 347
      Height = 21
      DataField = 'CODFORNGEN'
      DataSource = FCompras.DSCompras
      KeyField = 'CODGEN'
      ListField = 'CODGEN;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSFornLK
      TabOrder = 8
      OnKeyPress = DBLCBFornKeyPress
    end
    object DBLCBCFOP: TDBLookupComboBox
      Left = 172
      Top = 117
      Width = 347
      Height = 21
      DataField = 'CODCFOP'
      DataSource = FCompras.DSCompras
      KeyField = 'CODCFOP'
      ListField = 'CODCFOP;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSCFOPLK
      TabOrder = 10
      OnKeyPress = DBLCBFornKeyPress
    end
    object DBEdit14: TDBEdit
      Left = 287
      Top = 53
      Width = 74
      Height = 21
      DataField = 'CODORDEMCOMPRA'
      DataSource = FCompras.DSCompras
      TabOrder = 5
      Visible = False
    end
    object DBEdit10: TDBEdit
      Left = 124
      Top = 117
      Width = 46
      Height = 21
      DataField = 'CODCFOP'
      DataSource = FCompras.DSCompras
      TabOrder = 9
    end
    object DBEdit8: TDBEdit
      Left = 124
      Top = 85
      Width = 46
      Height = 21
      DataField = 'CODFORNGEN'
      DataSource = FCompras.DSCompras
      TabOrder = 7
    end
    object DBEdit4: TDBEdit
      Left = 124
      Top = 53
      Width = 65
      Height = 21
      DataField = 'NRONF'
      DataSource = FCompras.DSCompras
      TabOrder = 4
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 123
      Top = 150
      Width = 153
      Height = 32
      Caption = 'Frete por Conta'
      Columns = 2
      DataField = 'FRETEPORCONTA'
      DataSource = FCompras.DSCompras
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'Emitente'
        'Destin'#225'rio')
      ParentFont = False
      TabOrder = 11
      Values.Strings = (
        'E'
        'S')
    end
    object DBEdit12: TDBEdit
      Left = 124
      Top = 197
      Width = 46
      Height = 21
      DataField = 'CODTRANSP'
      DataSource = FCompras.DSCompras
      TabOrder = 12
    end
    object DBLCBTransp: TDBLookupComboBox
      Left = 172
      Top = 197
      Width = 347
      Height = 21
      DataField = 'CODTRANSP'
      DataSource = FCompras.DSCompras
      KeyField = 'CODGEN'
      ListField = 'CODGEN;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSTranspLK
      TabOrder = 13
      OnKeyPress = DBLCBFornKeyPress
    end
    object DTPEmiss: TDateTimePicker
      Left = 451
      Top = 12
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 3
      OnChange = DTPEmissChange
    end
    object DBEdit30: TDBEdit
      Left = 455
      Top = 15
      Width = 62
      Height = 14
      BorderStyle = bsNone
      DataField = 'DATAEMISSAONF'
      DataSource = FCompras.DSCompras
      TabOrder = 2
      OnEnter = DBEdit30Exit
      OnExit = DBEdit30Exit
    end
    object DTPDtCompra: TDateTimePicker
      Left = 285
      Top = 12
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 1
      OnChange = DTPDtCompraChange
    end
    object DBEdit5: TDBEdit
      Left = 289
      Top = 15
      Width = 61
      Height = 15
      BorderStyle = bsNone
      DataField = 'DATACOMPRA'
      DataSource = FCompras.DSCompras
      TabOrder = 0
      OnEnter = DBEdit5Enter
      OnExit = DBEdit5Enter
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 232
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
