object FEdAlunosSaidas: TFEdAlunosSaidas
  Left = 280
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Sa'#237'da Antecipada (Aviso Pr'#233'vio) do Aluno'
  ClientHeight = 243
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
    Height = 188
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
      Left = 48
      Top = 16
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aluno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 3
      Top = 48
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Dt/Hr Cadastro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 81
      Top = 16
      Width = 368
      Height = 17
      DataField = 'NOME'
      DataSource = FAlunos.DSAlunos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 80
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Sa'#237'da'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 390
      Top = 80
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hora Sa'#237'da'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 44
      Top = 112
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Motivo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 432
      Top = 48
      Width = 65
      Height = 15
      DataField = 'StatusSTR'
      DataSource = FAlunos.DSAlunosSai
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TLabel
      Left = 389
      Top = 48
      Width = 37
      Height = 13
      Caption = 'Status'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBEdit8: TDBEdit
      Left = 79
      Top = 45
      Width = 122
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DTHRINS'
      DataSource = FAlunos.DSAlunosSai
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 444
      Top = 77
      Width = 53
      Height = 21
      CharCase = ecUpperCase
      DataField = 'HRSAI'
      DataSource = FAlunos.DSAlunosSai
      TabOrder = 3
    end
    object DBMemo1: TDBMemo
      Left = 79
      Top = 109
      Width = 418
      Height = 71
      DataField = 'MOTIVO'
      DataSource = FAlunos.DSAlunosSai
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object DTPData: TDateTimePicker
      Left = 79
      Top = 77
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 2
      OnChange = DTPDataChange
    end
    object DBEdit1: TDBEdit
      Left = 82
      Top = 80
      Width = 62
      Height = 15
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTSAI'
      DataSource = FAlunos.DSAlunosSai
      TabOrder = 1
      OnEnter = DBEdit1Enter
      OnExit = DBEdit1Enter
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 188
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
