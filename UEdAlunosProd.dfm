object FEdAlunosProd: TFEdAlunosProd
  Left = 280
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Produto do Aluno'
  ClientHeight = 201
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
    Height = 146
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
      Left = 38
      Top = 48
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produto'
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
    object SBProd: TSpeedButton
      Left = 441
      Top = 44
      Width = 23
      Height = 22
      Hint = 'Cadastro de Produtos'
      Caption = '+'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SBProdClick
    end
    object Label3: TLabel
      Left = 52
      Top = 80
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 25
      Top = 112
      Width = 51
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Vcto.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 306
      Top = 112
      Width = 50
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Pago'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
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
      DataField = 'CODPROD'
      DataSource = FAlunos.DSAlunosProdutos
      TabOrder = 0
    end
    object DBLCBProd: TDBLookupComboBox
      Left = 112
      Top = 45
      Width = 328
      Height = 21
      DataField = 'CODPROD'
      DataSource = FAlunos.DSAlunosProdutos
      KeyField = 'CODPROD'
      ListField = 'CODPROD;DESCRICAO'
      ListFieldIndex = 1
      ListSource = Dados.DSProdutosAlunosLK
      TabOrder = 1
      OnKeyPress = DBLCBProdKeyPress
    end
    object DBEdit1: TDBEdit
      Left = 79
      Top = 77
      Width = 30
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CODPROD'
      DataSource = FAlunos.DSAlunosProdutos
      TabOrder = 2
    end
    object DTPVcto: TDateTimePicker
      Left = 79
      Top = 109
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 4
      OnChange = DTPVctoChange
    end
    object DBEdit2: TDBEdit
      Left = 82
      Top = 112
      Width = 60
      Height = 15
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'CODPROD'
      DataSource = FAlunos.DSAlunosProdutos
      TabOrder = 3
      OnEnter = DBEdit2Enter
      OnExit = DBEdit2Enter
    end
    object DTPPago: TDateTimePicker
      Left = 359
      Top = 109
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 6
      OnChange = DTPPagoChange
    end
    object DBEdit3: TDBEdit
      Left = 363
      Top = 112
      Width = 60
      Height = 15
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'CODPROD'
      DataSource = FAlunos.DSAlunosProdutos
      TabOrder = 5
      OnExit = DBEdit3Exit
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 146
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
