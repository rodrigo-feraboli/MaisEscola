object FEdAcervoRet: TFEdAcervoRet
  Left = 250
  Top = 167
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Retirada do Acervo Liter'#225'rio'
  ClientHeight = 269
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
    Height = 214
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
      Top = 16
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
      Top = 48
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
      Top = 80
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
      Left = 193
      Top = 48
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Devolu'#231#227'o'
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
    object LblAluno: TLabel
      Left = 49
      Top = 148
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Aluno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBAluno: TSpeedButton
      Left = 387
      Top = 145
      Width = 23
      Height = 22
      Caption = '+'
      Flat = True
      OnClick = SBAlunoClick
    end
    object LblFunc: TLabel
      Left = 21
      Top = 180
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Funcion'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SBFunc: TSpeedButton
      Left = 387
      Top = 177
      Width = 23
      Height = 22
      Caption = '+'
      Flat = True
      OnClick = SBFuncClick
    end
    object DTPDev: TDateTimePicker
      Left = 271
      Top = 45
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 3
      OnChange = DTPDevChange
    end
    object DBEdit5: TDBEdit
      Left = 274
      Top = 48
      Width = 63
      Height = 16
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTDEV'
      DataSource = FAcervo.DSAcervoRetiradas
      TabOrder = 2
      OnEnter = DBEdit5Exit
      OnExit = DBEdit5Exit
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 79
      Top = 107
      Width = 185
      Height = 30
      Caption = 'Reserva em nome do'
      Columns = 2
      DataField = 'QUEM'
      DataSource = FAcervo.DSAcervoRetiradas
      Items.Strings = (
        'Aluno'
        'Funcion'#225'rio')
      TabOrder = 6
      Values.Strings = (
        '1'
        '2')
      OnChange = DBRadioGroup1Change
    end
    object DBEAluno: TDBEdit
      Left = 79
      Top = 145
      Width = 35
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODALUNO'
      DataSource = FAcervo.DSAcervoRetiradas
      TabOrder = 7
    end
    object DBLCBAluno: TDBLookupComboBox
      Left = 115
      Top = 145
      Width = 268
      Height = 21
      DataField = 'CODALUNO'
      DataSource = FAcervo.DSAcervoRetiradas
      KeyField = 'CODALUNO'
      ListField = 'CODALUNO;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSAlunosLK
      TabOrder = 8
      OnKeyPress = DBLCBAlunoKeyPress
    end
    object DBEFunc: TDBEdit
      Left = 79
      Top = 177
      Width = 35
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODFUNC'
      DataSource = FAcervo.DSAcervoRetiradas
      TabOrder = 9
    end
    object DBLCBFunc: TDBLookupComboBox
      Left = 115
      Top = 177
      Width = 268
      Height = 21
      DataField = 'CODFUNC'
      DataSource = FAcervo.DSAcervoRetiradas
      KeyField = 'CODFUNC'
      ListField = 'CODFUNC;NOME'
      ListFieldIndex = 1
      ListSource = Dados.DSFuncLK
      TabOrder = 10
      OnKeyPress = DBLCBAlunoKeyPress
    end
    object DTPRet: TDateTimePicker
      Left = 79
      Top = 45
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 1
      OnChange = DTPRetChange
    end
    object DBEdit2: TDBEdit
      Left = 83
      Top = 48
      Width = 58
      Height = 15
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTRETIRADA'
      DataSource = FAcervo.DSAcervoRetiradas
      TabOrder = 0
      OnEnter = DBEdit2Enter
      OnExit = DBEdit2Enter
    end
    object DTPDevol: TDateTimePicker
      Left = 79
      Top = 76
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 5
      OnChange = DTPDevolChange
    end
    object DBEdit4: TDBEdit
      Left = 82
      Top = 79
      Width = 62
      Height = 16
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTDEVOLV'
      DataSource = FAcervo.DSAcervoRetiradas
      TabOrder = 4
      OnEnter = DBEdit4Enter
      OnExit = DBEdit4Enter
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 214
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
