object FEdCorresp: TFEdCorresp
  Left = 618
  Top = 225
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Correspond'#234'ncia'
  ClientHeight = 239
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
    Height = 184
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
      Left = 19
      Top = 16
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro. Ordem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 17
      Top = 112
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proced'#234'ncia'
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
      Caption = 'Data de Envio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 197
      Top = 80
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data de Entrada'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 36
      Top = 144
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Assunto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 79
      Top = 13
      Width = 50
      Height = 21
      DataField = 'NROORDEM'
      DataSource = FCorresp.DSCorresp
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 79
      Top = 109
      Width = 378
      Height = 21
      CharCase = ecUpperCase
      DataField = 'PROCED'
      DataSource = FCorresp.DSCorresp
      TabOrder = 6
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 79
      Top = 38
      Width = 250
      Height = 30
      Caption = 'Esp'#233'cie'
      Columns = 2
      DataField = 'ESPECIE'
      DataSource = FCorresp.DSCorresp
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'Of'#237'cio'
        'Correspond'#234'ncia')
      ParentFont = False
      TabOrder = 1
      Values.Strings = (
        '1'
        '2')
    end
    object DBEdit5: TDBEdit
      Left = 79
      Top = 141
      Width = 378
      Height = 21
      CharCase = ecUpperCase
      DataField = 'ASSUNTO'
      DataSource = FCorresp.DSCorresp
      TabOrder = 7
    end
    object DTPEntrada: TDateTimePicker
      Left = 279
      Top = 77
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 5
      OnChange = DTPEntradaChange
    end
    object DBEdit4: TDBEdit
      Left = 283
      Top = 80
      Width = 61
      Height = 16
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTENT'
      DataSource = FCorresp.DSCorresp
      TabOrder = 4
      OnEnter = DBEdit4Exit
      OnExit = DBEdit4Exit
    end
    object DTPEnvio: TDateTimePicker
      Left = 79
      Top = 77
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 3
      OnChange = DTPEnvioChange
    end
    object DBEdit2: TDBEdit
      Left = 82
      Top = 80
      Width = 63
      Height = 15
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTENV'
      DataSource = FCorresp.DSCorresp
      TabOrder = 2
      OnEnter = DBEdit2Enter
      OnExit = DBEdit2Enter
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 184
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
