object FEdUsuarios: TFEdUsuarios
  Left = 309
  Top = 135
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Usu'#225'rio'
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
    object Label2: TLabel
      Left = 51
      Top = 14
      Width = 25
      Height = 13
      Alignment = taRightJustify
      Caption = 'Login'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 46
      Top = 46
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Senha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 11
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      DataField = 'LOGIN'
      DataSource = FUsuarios.DSUsuarios
      TabOrder = 0
      OnExit = DBEdit2Exit
    end
    object DBEdit3: TDBEdit
      Left = 79
      Top = 43
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      DataField = 'SENHA'
      DataSource = FUsuarios.DSUsuarios
      PasswordChar = '*'
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 74
      Width = 516
      Height = 147
      Align = alBottom
      Color = clMoneyGreen
      DataSource = FUsuarios.DSUsuModulos
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      OnExit = DBGrid1Exit
      Columns = <
        item
          Expanded = False
          FieldName = 'Modulo'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 200
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NivelConsStr'
          Title.Caption = 'Consulta'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NivelEdiStr'
          Title.Caption = 'Edi'#231#227'o'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NivelExcStr'
          Title.Caption = 'Exclus'#227'o'
          Width = 55
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'NivelRelStr'
          Title.Caption = 'Relat'#243'rios'
          Width = 55
          Visible = True
        end>
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
