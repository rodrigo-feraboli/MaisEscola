object FEdAcervoDev: TFEdAcervoDev
  Left = 250
  Top = 167
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Devolu'#231#227'o do Acervo Liter'#225'rio'
  ClientHeight = 278
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
    Height = 223
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
      Left = 52
      Top = 48
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'Livro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 9
      Top = 80
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Retirada'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 3
      Top = 112
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Devolvido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 198
      Top = 80
      Width = 118
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Prevista Devolu'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 81
      Top = 48
      Width = 384
      Height = 17
      DataField = 'TITULO'
      DataSource = FAcervo.DSAcervo
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 81
      Top = 80
      Width = 101
      Height = 17
      DataField = 'DTRETIRADA'
      DataSource = FAcervo.DSAcervoRetiradas
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 321
      Top = 80
      Width = 101
      Height = 17
      DataField = 'DTDEV'
      DataSource = FAcervo.DSAcervoRetiradas
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lbl: TLabel
      Left = 21
      Top = 16
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aluno/Func'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LblQuem: TLabel
      Left = 80
      Top = 16
      Width = 297
      Height = 13
      AutoSize = False
      Caption = 'LblQuem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 80
      Top = 136
      Width = 329
      Height = 71
      Caption = 'Multa por atraso'
      TabOrder = 2
      object Label3: TLabel
        Left = 32
        Top = 24
        Width = 42
        Height = 13
        Caption = 'Valor Dia'
      end
      object Label5: TLabel
        Left = 23
        Top = 48
        Width = 51
        Height = 13
        Caption = 'Valor Total'
      end
      object Edit1: TEdit
        Left = 80
        Top = 20
        Width = 121
        Height = 21
        TabOrder = 0
        Text = 'Edit1'
      end
      object Edit2: TEdit
        Left = 80
        Top = 44
        Width = 121
        Height = 21
        TabOrder = 1
        Text = 'Edit1'
      end
    end
    object DTPdev: TDateTimePicker
      Left = 79
      Top = 109
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 1
      OnChange = DTPdevChange
    end
    object DBEdit4: TDBEdit
      Left = 82
      Top = 112
      Width = 62
      Height = 14
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTDEVOLV'
      DataSource = FAcervo.DSAcervoRetiradas
      TabOrder = 0
      OnEnter = DBEdit4Enter
      OnExit = DBEdit4Enter
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 223
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
