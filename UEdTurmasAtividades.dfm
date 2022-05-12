object FEdTurmasAtividades: TFEdTurmasAtividades
  Left = 280
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Atividade da Turma'
  ClientHeight = 242
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
    Height = 187
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
      Left = 45
      Top = 16
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Turma'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 31
      Top = 48
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'Atividade'
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
      Width = 192
      Height = 17
      DataField = 'DESCRICAO'
      DataSource = FTurmas.DSTurmas
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SBAtiv: TSpeedButton
      Left = 441
      Top = 44
      Width = 23
      Height = 22
      Hint = 'Cadastro de Atividades'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAtivClick
    end
    object Label3: TLabel
      Left = 21
      Top = 80
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Funcion'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBFunc: TSpeedButton
      Left = 441
      Top = 76
      Width = 23
      Height = 22
      Hint = 'Cadastro de Funcion'#225'rios'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAtivClick
    end
    object Label4: TLabel
      Left = 53
      Top = 112
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
    object Label5: TLabel
      Left = 23
      Top = 144
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hora Inicial'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 308
      Top = 144
      Width = 48
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hora Final'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit8: TDBEdit
      Left = 79
      Top = 45
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODATIVIDADE'
      DataSource = FTurmas.DSTurmasAtividades
      TabOrder = 1
    end
    object DBLCBAtividade: TDBLookupComboBox
      Left = 112
      Top = 45
      Width = 328
      Height = 21
      DataField = 'CODATIVIDADE'
      DataSource = FTurmas.DSTurmasAtividades
      KeyField = 'CODATIVIDADE'
      ListField = 'CODATIVIDADE;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSAtividadesLK
      TabOrder = 2
      OnKeyPress = DBLCBAtividadeKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 79
      Top = 77
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODFUNC'
      DataSource = FTurmas.DSTurmasAtividades
      TabOrder = 3
    end
    object DBLCBFunc: TDBLookupComboBox
      Left = 112
      Top = 77
      Width = 328
      Height = 21
      DataField = 'CODFUNC'
      DataSource = FTurmas.DSTurmasAtividades
      KeyField = 'CODFUNC'
      ListField = 'CODFUNC;NOME'
      ListFieldIndex = 1
      TabOrder = 4
      OnKeyPress = DBLCBAtividadeKeyPress
    end
    object DBEdit3: TDBEdit
      Left = 79
      Top = 141
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      DataField = 'HORAINI'
      DataSource = FTurmas.DSTurmasAtividades
      TabOrder = 7
    end
    object DBEdit4: TDBEdit
      Left = 359
      Top = 141
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      DataField = 'HORAFIN'
      DataSource = FTurmas.DSTurmasAtividades
      TabOrder = 8
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 280
      Top = 8
      Width = 185
      Height = 33
      Caption = 'Tipo de Atividade'
      Columns = 2
      DataField = 'TIPOATIVIDADE'
      DataSource = FTurmas.DSTurmasAtividades
      Items.Strings = (
        'Externa'
        'Interna')
      TabOrder = 0
      Values.Strings = (
        'E'
        'I')
    end
    object DTPData: TDateTimePicker
      Left = 79
      Top = 109
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 6
      OnChange = DTPDataChange
    end
    object DBEdit2: TDBEdit
      Left = 82
      Top = 112
      Width = 60
      Height = 14
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DATA'
      DataSource = FTurmas.DSTurmasAtividades
      TabOrder = 5
      OnEnter = DBEdit2Enter
      OnExit = DBEdit2Enter
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 187
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
