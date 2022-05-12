object FBaixaCP: TFBaixaCP
  Left = 435
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Baixa da Conta a Pagar'
  ClientHeight = 275
  ClientWidth = 517
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
    Width = 517
    Height = 220
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
    object SpeedButton2: TSpeedButton
      Left = 455
      Top = 7
      Width = 23
      Height = 22
      Hint = 'Cadastro de Bancos'
      Caption = '+'
      Flat = True
      OnClick = SpeedButton2Click
    end
    object Label3: TLabel
      Left = 68
      Top = 10
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
      Left = 44
      Top = 42
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
      Left = 272
      Top = 42
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
    object DBLCBBanco: TDBLookupComboBox
      Left = 149
      Top = 7
      Width = 300
      Height = 21
      DataField = 'CODBANCO'
      DataSource = FCPagar.DSCPParcs
      KeyField = 'CODBANCO'
      ListField = 'CODBANCO;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSBancosLK
      TabOrder = 1
      OnKeyPress = DBLCBBancoKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 101
      Top = 7
      Width = 46
      Height = 21
      DataField = 'CODBANCO'
      DataSource = FCPagar.DSCPParcs
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 101
      Top = 39
      Width = 165
      Height = 21
      DataField = 'NROCHEQUE'
      DataSource = FCPagar.DSCPParcs
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 314
      Top = 39
      Width = 132
      Height = 21
      DataField = 'AGENCIA'
      DataSource = FCPagar.DSCPParcs
      TabOrder = 3
    end
    object GroupBox1: TGroupBox
      Left = 2
      Top = 71
      Width = 513
      Height = 147
      Align = alBottom
      Caption = 'Valores, Descontos e Multas'
      TabOrder = 4
      object Label1: TLabel
        Left = 46
        Top = 24
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data Vcto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 45
        Top = 120
        Width = 48
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data Pgto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 200
        Top = 120
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor Pago'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 39
        Top = 55
        Width = 54
        Height = 13
        Caption = 'Perc. Multa'
      end
      object Label9: TLabel
        Left = 198
        Top = 56
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor Multa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 20
        Top = 87
        Width = 73
        Height = 13
        Caption = 'Perc. Desconto'
      end
      object Label11: TLabel
        Left = 197
        Top = 88
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor Desc.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 188
        Top = 24
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor Original'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 97
        Top = 21
        Width = 85
        Height = 21
        DataField = 'VCTOPARC'
        DataSource = FCPagar.DSCPParcs
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit8: TDBEdit
        Left = 257
        Top = 117
        Width = 85
        Height = 21
        DataField = 'VLRPAGO'
        DataSource = FCPagar.DSCPParcs
        TabOrder = 7
      end
      object Edit1: TEdit
        Left = 97
        Top = 53
        Width = 85
        Height = 21
        TabOrder = 2
        OnExit = Edit1Exit
      end
      object DBEdit2: TDBEdit
        Left = 257
        Top = 53
        Width = 85
        Height = 21
        DataField = 'VLRMULTA'
        DataSource = FCPagar.DSCPParcs
        TabOrder = 3
        OnExit = DBEdit2Exit
      end
      object Edit2: TEdit
        Left = 97
        Top = 85
        Width = 85
        Height = 21
        TabOrder = 4
        OnExit = Edit2Exit
      end
      object DBEdit9: TDBEdit
        Left = 257
        Top = 85
        Width = 85
        Height = 21
        DataField = 'VLRDESC'
        DataSource = FCPagar.DSCPParcs
        TabOrder = 5
        OnExit = DBEdit2Exit
      end
      object DBEdit10: TDBEdit
        Left = 257
        Top = 21
        Width = 85
        Height = 21
        DataField = 'VLRPARC'
        DataSource = FCPagar.DSCPParcs
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DTPVcto: TDateTimePicker
        Left = 96
        Top = 117
        Width = 85
        Height = 21
        Date = 39300.616501006940000000
        Time = 39300.616501006940000000
        TabOrder = 8
        OnChange = DTPVctoChange
      end
      object DBEdit6: TDBEdit
        Left = 100
        Top = 120
        Width = 56
        Height = 14
        BorderStyle = bsNone
        DataField = 'PGTOPARC'
        DataSource = FCPagar.DSCPParcs
        TabOrder = 6
        OnExit = DBEdit6Exit
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 220
    Width = 517
    Height = 55
    Align = alBottom
    BevelInner = bvLowered
    Color = 2025694
    TabOrder = 1
    object SBGravar: TSpeedButton
      Left = 233
      Top = 7
      Width = 120
      Height = 25
      Caption = 'Baixar'
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
      Left = 353
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
      Width = 513
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
