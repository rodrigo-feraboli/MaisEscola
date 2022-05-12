object FEdDatasCom: TFEdDatasCom
  Left = 370
  Top = 220
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Data Comemorativa'
  ClientHeight = 197
  ClientWidth = 561
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
    Width = 561
    Height = 142
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
      Left = 42
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
      Left = 30
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
    object Label5: TLabel
      Left = 444
      Top = 16
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
    object DTPDtCom: TDateTimePicker
      Left = 471
      Top = 13
      Width = 62
      Height = 21
      Date = 39300.616501006940000000
      Format = 'dd/MM'
      Time = 39300.616501006940000000
      TabOrder = 5
      OnChange = DTPDtComChange
    end
    object DBEdit1: TDBEdit
      Left = 79
      Top = 13
      Width = 50
      Height = 21
      DataField = 'CODDTCOM'
      DataSource = FDatasCom.DSDatasCom
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 45
      Width = 343
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = FDatasCom.DSDatasCom
      TabOrder = 2
      OnExit = DBEdit2Exit
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 79
      Top = 77
      Width = 450
      Height = 53
      Caption = 'Tipo de Feriado'
      Columns = 2
      DataField = 'TIPOFERIADO'
      DataSource = FDatasCom.DSDatasCom
      Items.Strings = (
        'Comemorativo'
        'Municipal'
        'Estadual'
        'Nacional')
      TabOrder = 4
      Values.Strings = (
        '1'
        '2'
        '3'
        '4')
    end
    object DBEdit3: TDBEdit
      Left = 474
      Top = 16
      Width = 38
      Height = 16
      BorderStyle = bsNone
      DataField = 'DATA'
      DataSource = FDatasCom.DSDatasCom
      TabOrder = 1
      OnEnter = DBEdit3Enter
      OnExit = DBEdit3Enter
    end
    object DBCheckBox1: TDBCheckBox
      Left = 432
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Feriado Letivo'
      DataField = 'FERIADOLETIVO'
      DataSource = FDatasCom.DSDatasCom
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 142
    Width = 561
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
      Width = 557
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
