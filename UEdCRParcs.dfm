object FEdCRParcs: TFEdCRParcs
  Left = 196
  Top = 201
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Parcela da Conta a Receber'
  ClientHeight = 196
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
    Height = 141
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
    object Label6: TLabel
      Left = 51
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
    object Label3: TLabel
      Left = 39
      Top = 47
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Vencimento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 297
      Top = 47
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 516
      Top = 76
      Width = 23
      Height = 22
      Hint = 'Cadastro de Bancos'
      Caption = '+'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Label1: TLabel
      Left = 91
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
    object Label4: TLabel
      Left = 291
      Top = 111
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'N'#186' Cheque'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 81
      Top = 111
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ag'#234'ncia'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 329
      Top = 16
      Width = 97
      Height = 13
      DataField = 'SituacaoStr'
      DataSource = FCPagar.DSCPParcs
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 288
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Status'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit5: TDBEdit
      Left = 124
      Top = 12
      Width = 74
      Height = 21
      DataField = 'DATAGERA'
      DataSource = FCReceber.DSCRParcs
      TabOrder = 0
    end
    object DBEdit10: TDBEdit
      Left = 324
      Top = 44
      Width = 75
      Height = 21
      DataField = 'VLRPARC'
      DataSource = FCReceber.DSCRParcs
      TabOrder = 3
    end
    object DBLCBBanco: TDBLookupComboBox
      Left = 172
      Top = 76
      Width = 342
      Height = 21
      DataField = 'CODBANCO'
      DataSource = FCReceber.DSCRParcs
      KeyField = 'CODBANCO'
      ListField = 'CODBANCO;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSBancosLK
      TabOrder = 5
      OnKeyPress = DBLCBBancoKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 124
      Top = 76
      Width = 46
      Height = 21
      DataField = 'CODBANCO'
      DataSource = FCReceber.DSCRParcs
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 347
      Top = 108
      Width = 165
      Height = 21
      DataField = 'NROCHEQUE'
      DataSource = FCReceber.DSCRParcs
      TabOrder = 7
    end
    object DBEdit3: TDBEdit
      Left = 123
      Top = 108
      Width = 69
      Height = 21
      DataField = 'AGENCIA'
      DataSource = FCReceber.DSCRParcs
      TabOrder = 6
    end
    object DTPVcto: TDateTimePicker
      Left = 124
      Top = 45
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 2
      OnChange = DTPVctoChange
    end
    object DBEdit8: TDBEdit
      Left = 127
      Top = 48
      Width = 63
      Height = 15
      BorderStyle = bsNone
      DataField = 'VCTOPARC'
      DataSource = FCReceber.DSCRParcs
      TabOrder = 1
      OnEnter = DBEdit8Enter
      OnExit = DBEdit8Enter
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 141
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
