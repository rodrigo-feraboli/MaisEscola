object FEdAlunos: TFEdAlunos
  Left = 293
  Top = 135
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o do Aluno'
  ClientHeight = 568
  ClientWidth = 790
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
    Width = 790
    Height = 513
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
      Top = 8
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
      Left = 33
      Top = 36
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Matr'#237'cula'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 49
      Top = 64
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton1: TSpeedButton
      Left = 596
      Top = 5
      Width = 74
      Height = 22
      Caption = 'Carregar Foto'
      Flat = True
      OnClick = SpeedButton1Click
    end
    object Label4: TLabel
      Left = 319
      Top = 36
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Nasc.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ImaAluno: TImage
      Left = 672
      Top = 4
      Width = 114
      Height = 85
      Center = True
      Proportional = True
      Stretch = True
    end
    object Label52: TLabel
      Left = 142
      Top = 8
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Cadastro'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label53: TLabel
      Left = 306
      Top = 8
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data Ingresso'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label73: TLabel
      Left = 465
      Top = 37
      Width = 33
      Height = 13
      Caption = 'Idade'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 502
      Top = 37
      Width = 65
      Height = 14
      DataField = 'Idade'
      DataSource = FAlunos.DSAlunos
    end
    object DBEdit1: TDBEdit
      Left = 79
      Top = 5
      Width = 50
      Height = 21
      DataField = 'CODALUNO'
      DataSource = FAlunos.DSAlunos
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 33
      Width = 202
      Height = 21
      CharCase = ecUpperCase
      DataField = 'MATRICULA'
      DataSource = FAlunos.DSAlunos
      TabOrder = 4
    end
    object PCRaiz: TPageControl
      Left = 2
      Top = 89
      Width = 786
      Height = 422
      ActivePage = TSExtras
      Align = alBottom
      TabOrder = 13
      object TSExtras: TTabSheet
        Caption = 'Extras'
        ImageIndex = 2
        object Label23: TLabel
          Left = 31
          Top = 8
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Endere'#231'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 48
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bairro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 43
          Top = 72
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object SBBairro: TSpeedButton
          Left = 441
          Top = 37
          Width = 23
          Height = 22
          Hint = 'Manuten'#231#227'o de Bairros'
          Caption = '+'
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = SBBairroPaiClick
        end
        object SBCidade: TSpeedButton
          Left = 441
          Top = 68
          Width = 23
          Height = 22
          Hint = 'Manuten'#231#227'o de Cidades'
          Caption = '+'
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = SBBairroPaiClick
        end
        object Label26: TLabel
          Left = 49
          Top = 186
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object Label27: TLabel
          Left = 52
          Top = 219
          Width = 24
          Height = 13
          Caption = 'Fone'
        end
        object Label28: TLabel
          Left = 478
          Top = 10
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Telefone'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label30: TLabel
          Left = 24
          Top = 321
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Obs Gerais'
        end
        object Label50: TLabel
          Left = 48
          Top = 297
          Width = 28
          Height = 13
          Caption = 'Outro'
        end
        object Label51: TLabel
          Left = 46
          Top = 104
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Turma'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object SBTurmas: TSpeedButton
          Left = 441
          Top = 100
          Width = 23
          Height = 22
          Hint = 'Manuten'#231#227'o de Cidades'
          Caption = '+'
          Flat = True
          ParentShowHint = False
          ShowHint = True
          OnClick = SBBairroPaiClick
        end
        object DBEdit23: TDBEdit
          Left = 79
          Top = 5
          Width = 384
          Height = 21
          CharCase = ecUpperCase
          DataField = 'ENDERECO'
          DataSource = FAlunos.DSAlunos
          TabOrder = 0
        end
        object DBEdit24: TDBEdit
          Left = 79
          Top = 37
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CODBAIRRO'
          DataSource = FAlunos.DSAlunos
          TabOrder = 2
        end
        object DBEdit25: TDBEdit
          Left = 79
          Top = 69
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CODCIDADE'
          DataSource = FAlunos.DSAlunos
          TabOrder = 5
        end
        object DBLCBBairro: TDBLookupComboBox
          Left = 112
          Top = 37
          Width = 328
          Height = 21
          DataField = 'CODBAIRRO'
          DataSource = FAlunos.DSAlunos
          KeyField = 'CODBAIRRO'
          ListField = 'CODBAIRRO;DESCRICAO'
          ListFieldIndex = 1
          ListSource = Dados.DSBairrosLK
          TabOrder = 3
          OnKeyPress = DBLCBBairroKeyPress
        end
        object DBLCBCidade: TDBLookupComboBox
          Left = 112
          Top = 69
          Width = 328
          Height = 21
          DataField = 'CODCIDADE'
          DataSource = FAlunos.DSAlunos
          KeyField = 'CODCIDADE'
          ListField = 'CODCIDADE;DESCRICAO'
          ListFieldIndex = 1
          ListSource = Dados.DSCidadesLK
          TabOrder = 6
          OnKeyPress = DBLCBBairroKeyPress
        end
        object RGChamar: TDBRadioGroup
          Left = 16
          Top = 134
          Width = 561
          Height = 45
          Caption = 'Em caso de emerg'#234'ncia, avisar'
          Columns = 5
          DataField = 'EMERGENCIACHAMAR'
          DataSource = FAlunos.DSAlunos
          Items.Strings = (
            'Pai e M'#227'e'
            'Pai'
            'M'#227'e'
            'Respons'#225'vel'
            'Outro')
          TabOrder = 9
          Values.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5')
          OnChange = RGChamarChange
        end
        object RGAcid: TDBRadioGroup
          Left = 16
          Top = 242
          Width = 561
          Height = 45
          Caption = 'Em caso de acidente, a escola dever'#225
          Columns = 2
          DataField = 'EMACIDENTE'
          DataSource = FAlunos.DSAlunos
          Items.Strings = (
            'Telefonar para pai/m'#227'e/resp.'
            'Encaminhar o aluno para casa'
            'Levar para pronto-socorro'
            'Outro')
          TabOrder = 12
          Values.Strings = (
            '1'
            '2'
            '3'
            '4')
          OnChange = RGAcidChange
        end
        object DBEdit26: TDBEdit
          Left = 79
          Top = 183
          Width = 384
          Height = 21
          CharCase = ecUpperCase
          DataField = 'EMERGENCIANOME'
          DataSource = FAlunos.DSAlunos
          TabOrder = 10
        end
        object DBEdit27: TDBEdit
          Left = 79
          Top = 215
          Width = 384
          Height = 21
          CharCase = ecUpperCase
          DataField = 'EMERGENCIAFONE'
          DataSource = FAlunos.DSAlunos
          TabOrder = 11
        end
        object DBEdit28: TDBEdit
          Left = 523
          Top = 7
          Width = 130
          Height = 21
          CharCase = ecUpperCase
          DataField = 'FONE'
          DataSource = FAlunos.DSAlunos
          TabOrder = 1
        end
        object DBMemo1: TDBMemo
          Left = 79
          Top = 320
          Width = 384
          Height = 73
          DataField = 'OBS'
          DataSource = FAlunos.DSAlunos
          ScrollBars = ssVertical
          TabOrder = 14
        end
        object DBEdit49: TDBEdit
          Left = 79
          Top = 293
          Width = 384
          Height = 21
          CharCase = ecUpperCase
          DataField = 'EMACIDADENTEOUTRO'
          DataSource = FAlunos.DSAlunos
          TabOrder = 13
        end
        object DBEdit51: TDBEdit
          Left = 79
          Top = 101
          Width = 30
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CODTURMA'
          DataSource = FAlunos.DSAlunos
          TabOrder = 7
        end
        object DBLCBTurma: TDBLookupComboBox
          Left = 112
          Top = 101
          Width = 328
          Height = 21
          DataField = 'CODTURMA'
          DataSource = FAlunos.DSAlunos
          KeyField = 'CODTURMA'
          ListField = 'CODTURMA;DESCRICAO'
          ListFieldIndex = 1
          ListSource = Dados.DSTurmasLK
          TabOrder = 8
          OnKeyPress = DBLCBBairroKeyPress
        end
        object DBRadioGroup3: TDBRadioGroup
          Left = 524
          Top = 34
          Width = 169
          Height = 52
          Caption = 'Respons'#225'vel p/ Buscar do Aluno'
          Columns = 2
          DataField = 'QUEMBUSCA'
          DataSource = FAlunos.DSAlunos
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'Todos'
            'Pai'
            'M'#227'e'
            'Respons'#225'vel')
          ParentFont = False
          TabOrder = 4
          Values.Strings = (
            '1'
            '2'
            '3'
            '4')
        end
      end
      object TSPM: TTabSheet
        Caption = 'Respons'#225'veis'
        ImageIndex = 1
        object PCResp: TPageControl
          Left = 0
          Top = 0
          Width = 778
          Height = 394
          ActivePage = TSPai
          Align = alClient
          TabOrder = 0
          object TSPai: TTabSheet
            Caption = 'Pai'
            object Label5: TLabel
              Left = 49
              Top = 8
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nome'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label6: TLabel
              Left = 23
              Top = 40
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Data Nasc.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object SpeedButton2: TSpeedButton
              Left = 575
              Top = 5
              Width = 74
              Height = 22
              Caption = 'Carregar Foto'
              Flat = True
              OnClick = SpeedButton2Click
            end
            object Label7: TLabel
              Left = 31
              Top = 72
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Endere'#231'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label8: TLabel
              Left = 48
              Top = 104
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bairro'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 43
              Top = 136
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cidade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label10: TLabel
              Left = 32
              Top = 168
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Profiss'#227'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label11: TLabel
              Left = 16
              Top = 200
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'Escolaridade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 4
              Top = 232
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Endere'#231'o Prof.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label13: TLabel
              Left = 21
              Top = 264
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Telef. Prof.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object SBBairroPai: TSpeedButton
              Left = 441
              Top = 100
              Width = 23
              Height = 22
              Hint = 'Manuten'#231#227'o de Bairros'
              Caption = '+'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBBairroPaiClick
            end
            object SBCidadePai: TSpeedButton
              Left = 441
              Top = 130
              Width = 23
              Height = 22
              Hint = 'Manuten'#231#227'o de Cidades'
              Caption = '+'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBBairroPaiClick
            end
            object SBProfPai: TSpeedButton
              Left = 441
              Top = 163
              Width = 23
              Height = 22
              Hint = 'Manuten'#231#227'o de Profiss'#245'es'
              Caption = '+'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBBairroPaiClick
            end
            object Label18: TLabel
              Left = 468
              Top = 200
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Telefefone'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label19: TLabel
              Left = 487
              Top = 168
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Celular'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label20: TLabel
              Left = 171
              Top = 40
              Width = 14
              Height = 13
              Alignment = taRightJustify
              Caption = 'RG'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label21: TLabel
              Left = 330
              Top = 40
              Width = 19
              Height = 13
              Alignment = taRightJustify
              Caption = 'CPF'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label22: TLabel
              Left = 492
              Top = 104
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'E-Mail'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label29: TLabel
              Left = 501
              Top = 136
              Width = 19
              Height = 13
              Alignment = taRightJustify
              Caption = 'CEP'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object SBMail: TSpeedButton
              Left = 745
              Top = 100
              Width = 23
              Height = 22
              Hint = 'Enviar e-mail (via cliente de e-mail)'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
                000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
                FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
                FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
                9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
                0000777777777777777733333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = SBMailClick
            end
            object ImPai: TImage
              Left = 655
              Top = 4
              Width = 114
              Height = 88
              Center = True
              Proportional = True
              Stretch = True
            end
            object Label74: TLabel
              Left = 468
              Top = 41
              Width = 33
              Height = 13
              Caption = 'Idade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText2: TDBText
              Left = 505
              Top = 41
              Width = 65
              Height = 14
              DataField = 'IdadePai'
              DataSource = FAlunos.DSAlunos
            end
            object DBEdit5: TDBEdit
              Left = 79
              Top = 5
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOMEPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 0
            end
            object DBEdit7: TDBEdit
              Left = 79
              Top = 69
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ENDERECOPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 5
            end
            object DBEdit8: TDBEdit
              Left = 79
              Top = 101
              Width = 30
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODBAIRROPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 6
            end
            object DBEdit9: TDBEdit
              Left = 79
              Top = 133
              Width = 30
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODCIDADEPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 9
            end
            object DBEdit10: TDBEdit
              Left = 79
              Top = 165
              Width = 30
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODPROFPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 12
            end
            object DBEdit11: TDBEdit
              Left = 79
              Top = 197
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ESCOLARIDADEPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 15
            end
            object DBEdit12: TDBEdit
              Left = 79
              Top = 229
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ENDPROFPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 17
            end
            object DBEdit13: TDBEdit
              Left = 79
              Top = 261
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'TELPROFPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 18
            end
            object GroupBox1: TGroupBox
              Left = 72
              Top = 284
              Width = 425
              Height = 65
              Caption = 'Hor'#225'rio de Trabalho'
              TabOrder = 19
              object Label14: TLabel
                Left = 36
                Top = 16
                Width = 62
                Height = 13
                Alignment = taRightJustify
                Caption = 'Manh'#227' Inicial'
              end
              object Label15: TLabel
                Left = 40
                Top = 42
                Width = 58
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tarde Inicial'
              end
              object Label16: TLabel
                Left = 193
                Top = 16
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'Manh'#227' Final'
              end
              object Label17: TLabel
                Left = 197
                Top = 43
                Width = 53
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tarde Final'
              end
              object DBEdit14: TDBEdit
                Left = 103
                Top = 12
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABPAIMAINI'
                DataSource = FAlunos.DSAlunos
                TabOrder = 0
              end
              object DBEdit15: TDBEdit
                Left = 103
                Top = 40
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABPAITAINI'
                DataSource = FAlunos.DSAlunos
                TabOrder = 2
              end
              object DBEdit16: TDBEdit
                Left = 255
                Top = 12
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABPAIMAFIN'
                DataSource = FAlunos.DSAlunos
                TabOrder = 1
              end
              object DBEdit17: TDBEdit
                Left = 255
                Top = 40
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABPAITAFIN'
                DataSource = FAlunos.DSAlunos
                TabOrder = 3
              end
            end
            object DBLCBBairroPai: TDBLookupComboBox
              Left = 112
              Top = 101
              Width = 328
              Height = 21
              DataField = 'CODBAIRROPAI'
              DataSource = FAlunos.DSAlunos
              KeyField = 'CODBAIRRO'
              ListField = 'CODBAIRRO;DESCRICAO'
              ListFieldIndex = 1
              ListSource = Dados.DSBairrosLK
              TabOrder = 7
              OnKeyPress = DBLCBBairroKeyPress
            end
            object DBLCBCidadePai: TDBLookupComboBox
              Left = 112
              Top = 132
              Width = 328
              Height = 21
              DataField = 'CODCIDADEPAI'
              DataSource = FAlunos.DSAlunos
              KeyField = 'CODCIDADE'
              ListField = 'CODCIDADE;DESCRICAO'
              ListFieldIndex = 1
              ListSource = Dados.DSCidadesLK
              TabOrder = 10
              OnExit = DBLCBCidadePaiExit
              OnKeyPress = DBLCBBairroKeyPress
            end
            object DBLCBProfPai: TDBLookupComboBox
              Left = 112
              Top = 165
              Width = 328
              Height = 21
              DataField = 'CODPROFPAI'
              DataSource = FAlunos.DSAlunos
              KeyField = 'CODPROFISSAO'
              ListField = 'CODPROFISSAO;DESCRICAO'
              ListFieldIndex = 1
              ListSource = Dados.DSProfissoesLK
              TabOrder = 13
              OnKeyPress = DBLCBBairroKeyPress
            end
            object DBEdit18: TDBEdit
              Left = 523
              Top = 197
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'FONEPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 16
            end
            object DBEdit19: TDBEdit
              Left = 523
              Top = 165
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CELPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 14
            end
            object DBEdit20: TDBEdit
              Left = 187
              Top = 37
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'RGPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 3
            end
            object DBEdit21: TDBEdit
              Left = 353
              Top = 37
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CPFPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 4
            end
            object DBEdit22: TDBEdit
              Left = 523
              Top = 101
              Width = 221
              Height = 21
              CharCase = ecUpperCase
              DataField = 'EMAILPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 8
            end
            object DBEdit29: TDBEdit
              Left = 523
              Top = 133
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CEPPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 11
            end
            object DTPDtNascPai: TDateTimePicker
              Left = 79
              Top = 37
              Width = 85
              Height = 21
              Date = 39300.616501006940000000
              Time = 39300.616501006940000000
              TabOrder = 2
              OnChange = DTPDtNascPaiChange
            end
            object DBEdit6: TDBEdit
              Left = 82
              Top = 40
              Width = 63
              Height = 16
              BorderStyle = bsNone
              CharCase = ecUpperCase
              DataField = 'DTNASCPAI'
              DataSource = FAlunos.DSAlunos
              TabOrder = 1
              OnEnter = DBEdit6Enter
              OnExit = DBEdit6Enter
            end
          end
          object TSMae: TTabSheet
            Caption = 'M'#227'e'
            ImageIndex = 1
            object Label31: TLabel
              Left = 49
              Top = 8
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nome'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label32: TLabel
              Left = 23
              Top = 40
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Data Nasc.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object SpeedButton3: TSpeedButton
              Left = 575
              Top = 5
              Width = 74
              Height = 22
              Caption = 'Carregar Foto'
              Flat = True
              OnClick = SpeedButton3Click
            end
            object Label33: TLabel
              Left = 31
              Top = 72
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Endere'#231'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label34: TLabel
              Left = 48
              Top = 104
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bairro'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label35: TLabel
              Left = 43
              Top = 136
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cidade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label36: TLabel
              Left = 32
              Top = 168
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Profiss'#227'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label37: TLabel
              Left = 16
              Top = 200
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'Escolaridade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label38: TLabel
              Left = 4
              Top = 232
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Endere'#231'o Prof.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label39: TLabel
              Left = 21
              Top = 264
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Telef. Prof.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object SBBairroMae: TSpeedButton
              Left = 441
              Top = 100
              Width = 23
              Height = 22
              Hint = 'Manuten'#231#227'o de Bairros'
              Caption = '+'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBBairroPaiClick
            end
            object SBCidadeMae: TSpeedButton
              Left = 441
              Top = 130
              Width = 23
              Height = 22
              Hint = 'Manuten'#231#227'o de Cidades'
              Caption = '+'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBBairroPaiClick
            end
            object SBProfMae: TSpeedButton
              Left = 441
              Top = 163
              Width = 23
              Height = 22
              Hint = 'Manuten'#231#227'o de Profiss'#245'es'
              Caption = '+'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBBairroPaiClick
            end
            object Label40: TLabel
              Left = 468
              Top = 200
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Telefefone'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label41: TLabel
              Left = 487
              Top = 168
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Celular'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label42: TLabel
              Left = 171
              Top = 40
              Width = 14
              Height = 13
              Alignment = taRightJustify
              Caption = 'RG'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label43: TLabel
              Left = 330
              Top = 40
              Width = 19
              Height = 13
              Alignment = taRightJustify
              Caption = 'CPF'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label44: TLabel
              Left = 492
              Top = 104
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'E-Mail'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label49: TLabel
              Left = 501
              Top = 136
              Width = 19
              Height = 13
              Alignment = taRightJustify
              Caption = 'CEP'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object SpeedButton4: TSpeedButton
              Left = 745
              Top = 100
              Width = 23
              Height = 22
              Hint = 'Enviar e-mail (via cliente de e-mail)'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
                000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
                FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
                FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
                9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
                0000777777777777777733333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton4Click
            end
            object ImMae: TImage
              Left = 655
              Top = 4
              Width = 114
              Height = 88
              Center = True
              Proportional = True
              Stretch = True
            end
            object Label75: TLabel
              Left = 468
              Top = 41
              Width = 33
              Height = 13
              Caption = 'Idade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText3: TDBText
              Left = 505
              Top = 41
              Width = 65
              Height = 14
              DataField = 'IdadeMae'
              DataSource = FAlunos.DSAlunos
            end
            object DBEdit30: TDBEdit
              Left = 79
              Top = 5
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOMEMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 0
            end
            object DBEdit32: TDBEdit
              Left = 79
              Top = 69
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ENDERECOMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 5
            end
            object DBEdit33: TDBEdit
              Left = 79
              Top = 101
              Width = 30
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODBAIRROMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 6
            end
            object DBEdit34: TDBEdit
              Left = 79
              Top = 133
              Width = 30
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODCIDADEMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 9
            end
            object DBEdit35: TDBEdit
              Left = 79
              Top = 165
              Width = 30
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODPROFMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 12
            end
            object DBEdit36: TDBEdit
              Left = 79
              Top = 197
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ESCOLARIDADEMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 15
            end
            object DBEdit37: TDBEdit
              Left = 79
              Top = 229
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ENDPROFMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 17
            end
            object DBEdit38: TDBEdit
              Left = 79
              Top = 261
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'TELPROFMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 18
            end
            object GroupBox2: TGroupBox
              Left = 72
              Top = 284
              Width = 425
              Height = 65
              Caption = 'Hor'#225'rio de Trabalho'
              TabOrder = 19
              object Label45: TLabel
                Left = 36
                Top = 16
                Width = 62
                Height = 13
                Alignment = taRightJustify
                Caption = 'Manh'#227' Inicial'
              end
              object Label46: TLabel
                Left = 40
                Top = 42
                Width = 58
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tarde Inicial'
              end
              object Label47: TLabel
                Left = 193
                Top = 16
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'Manh'#227' Final'
              end
              object Label48: TLabel
                Left = 197
                Top = 43
                Width = 53
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tarde Final'
              end
              object DBEdit39: TDBEdit
                Left = 103
                Top = 12
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABMAEMAINI'
                DataSource = FAlunos.DSAlunos
                TabOrder = 0
              end
              object DBEdit40: TDBEdit
                Left = 103
                Top = 40
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABMAETAINI'
                DataSource = FAlunos.DSAlunos
                TabOrder = 2
              end
              object DBEdit41: TDBEdit
                Left = 255
                Top = 12
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABMAEMAFIN'
                DataSource = FAlunos.DSAlunos
                TabOrder = 1
              end
              object DBEdit42: TDBEdit
                Left = 255
                Top = 40
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABMAETAFIN'
                DataSource = FAlunos.DSAlunos
                TabOrder = 3
              end
            end
            object DBLCBBairroMae: TDBLookupComboBox
              Left = 112
              Top = 101
              Width = 328
              Height = 21
              DataField = 'CODBAIRROMAE'
              DataSource = FAlunos.DSAlunos
              KeyField = 'CODBAIRRO'
              ListField = 'CODBAIRRO;DESCRICAO'
              ListFieldIndex = 1
              ListSource = Dados.DSBairrosLK
              TabOrder = 7
              OnKeyPress = DBLCBBairroKeyPress
            end
            object DBLCBCidadeMae: TDBLookupComboBox
              Left = 112
              Top = 132
              Width = 328
              Height = 21
              DataField = 'CODCIDADEMAE'
              DataSource = FAlunos.DSAlunos
              KeyField = 'CODCIDADE'
              ListField = 'CODCIDADE;DESCRICAO'
              ListFieldIndex = 1
              ListSource = Dados.DSCidadesLK
              TabOrder = 10
              OnExit = DBLCBCidadeMaeExit
              OnKeyPress = DBLCBBairroKeyPress
            end
            object DBLCBProfMae: TDBLookupComboBox
              Left = 112
              Top = 165
              Width = 328
              Height = 21
              DataField = 'CODPROFMAE'
              DataSource = FAlunos.DSAlunos
              KeyField = 'CODPROFISSAO'
              ListField = 'CODPROFISSAO;DESCRICAO'
              ListFieldIndex = 1
              ListSource = Dados.DSProfissoesLK
              TabOrder = 13
              OnKeyPress = DBLCBBairroKeyPress
            end
            object DBEdit43: TDBEdit
              Left = 523
              Top = 197
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'FONEMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 16
            end
            object DBEdit44: TDBEdit
              Left = 523
              Top = 165
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CELMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 14
            end
            object DBEdit45: TDBEdit
              Left = 187
              Top = 37
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'RGMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 3
            end
            object DBEdit46: TDBEdit
              Left = 352
              Top = 37
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CPFMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 4
            end
            object DBEdit47: TDBEdit
              Left = 523
              Top = 101
              Width = 221
              Height = 21
              CharCase = ecUpperCase
              DataField = 'EMAILMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 8
            end
            object DBEdit48: TDBEdit
              Left = 523
              Top = 133
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CEPMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 11
            end
            object DTPDtNascMae: TDateTimePicker
              Left = 79
              Top = 37
              Width = 85
              Height = 21
              Date = 39300.616501006940000000
              Time = 39300.616501006940000000
              TabOrder = 2
              OnChange = DTPDtNascMaeChange
            end
            object DBEdit31: TDBEdit
              Left = 82
              Top = 40
              Width = 62
              Height = 14
              BorderStyle = bsNone
              CharCase = ecUpperCase
              DataField = 'DTNASCMAE'
              DataSource = FAlunos.DSAlunos
              TabOrder = 1
              OnEnter = DBEdit31Enter
              OnExit = DBEdit31Enter
            end
          end
          object TSResp: TTabSheet
            Caption = 'Respons'#225'vel'
            ImageIndex = 2
            object Label54: TLabel
              Left = 49
              Top = 8
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nome'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label55: TLabel
              Left = 23
              Top = 40
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Data Nasc.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object SpeedButton5: TSpeedButton
              Left = 575
              Top = 5
              Width = 74
              Height = 22
              Caption = 'Carregar Foto'
              Flat = True
              OnClick = SpeedButton5Click
            end
            object Label56: TLabel
              Left = 31
              Top = 72
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Endere'#231'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label57: TLabel
              Left = 48
              Top = 104
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bairro'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label58: TLabel
              Left = 43
              Top = 136
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cidade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label59: TLabel
              Left = 32
              Top = 168
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Profiss'#227'o'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label60: TLabel
              Left = 16
              Top = 200
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'Escolaridade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label61: TLabel
              Left = 4
              Top = 232
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Endere'#231'o Prof.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label62: TLabel
              Left = 21
              Top = 264
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Telef. Prof.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object SpeedButton6: TSpeedButton
              Left = 441
              Top = 100
              Width = 23
              Height = 22
              Hint = 'Manuten'#231#227'o de Bairros'
              Caption = '+'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBBairroPaiClick
            end
            object SpeedButton7: TSpeedButton
              Left = 441
              Top = 130
              Width = 23
              Height = 22
              Hint = 'Manuten'#231#227'o de Cidades'
              Caption = '+'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBBairroPaiClick
            end
            object SpeedButton8: TSpeedButton
              Left = 441
              Top = 163
              Width = 23
              Height = 22
              Hint = 'Manuten'#231#227'o de Profiss'#245'es'
              Caption = '+'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBBairroPaiClick
            end
            object Label63: TLabel
              Left = 468
              Top = 200
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Telefefone'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label64: TLabel
              Left = 487
              Top = 168
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Celular'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label65: TLabel
              Left = 170
              Top = 40
              Width = 14
              Height = 13
              Alignment = taRightJustify
              Caption = 'RG'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label66: TLabel
              Left = 330
              Top = 40
              Width = 19
              Height = 13
              Alignment = taRightJustify
              Caption = 'CPF'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label67: TLabel
              Left = 492
              Top = 104
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'E-Mail'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label68: TLabel
              Left = 501
              Top = 136
              Width = 19
              Height = 13
              Alignment = taRightJustify
              Caption = 'CEP'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object SpeedButton9: TSpeedButton
              Left = 745
              Top = 100
              Width = 23
              Height = 22
              Hint = 'Enviar e-mail (via cliente de e-mail)'
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
                000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
                FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
                FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
                9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
                0000777777777777777733333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333333333333333
                3333333333333333333333333333333333333333333333333333}
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton9Click
            end
            object ImResp: TImage
              Left = 655
              Top = 4
              Width = 114
              Height = 88
              Center = True
              Proportional = True
              Stretch = True
            end
            object Label76: TLabel
              Left = 468
              Top = 41
              Width = 33
              Height = 13
              Caption = 'Idade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBText4: TDBText
              Left = 505
              Top = 41
              Width = 65
              Height = 14
              DataField = 'IdadeResp'
              DataSource = FAlunos.DSAlunos
            end
            object DBEdit53: TDBEdit
              Left = 79
              Top = 5
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'NOMERESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 0
            end
            object DBEdit55: TDBEdit
              Left = 79
              Top = 69
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ENDERECORESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 5
            end
            object DBEdit56: TDBEdit
              Left = 79
              Top = 101
              Width = 30
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODBAIRRORESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 6
            end
            object DBEdit57: TDBEdit
              Left = 79
              Top = 133
              Width = 30
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODCIDADERESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 9
            end
            object DBEdit58: TDBEdit
              Left = 79
              Top = 165
              Width = 30
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CODPROFRESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 12
            end
            object DBEdit59: TDBEdit
              Left = 79
              Top = 197
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ESCOLARIDADERESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 15
            end
            object DBEdit60: TDBEdit
              Left = 79
              Top = 229
              Width = 384
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ENDPROFRESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 17
            end
            object DBEdit61: TDBEdit
              Left = 79
              Top = 261
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'TELPROFRESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 18
            end
            object GroupBox3: TGroupBox
              Left = 72
              Top = 284
              Width = 425
              Height = 65
              Caption = 'Hor'#225'rio de Trabalho'
              TabOrder = 19
              object Label69: TLabel
                Left = 36
                Top = 16
                Width = 62
                Height = 13
                Alignment = taRightJustify
                Caption = 'Manh'#227' Inicial'
              end
              object Label70: TLabel
                Left = 40
                Top = 42
                Width = 58
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tarde Inicial'
              end
              object Label71: TLabel
                Left = 193
                Top = 16
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'Manh'#227' Final'
              end
              object Label72: TLabel
                Left = 197
                Top = 43
                Width = 53
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tarde Final'
              end
              object DBEdit62: TDBEdit
                Left = 103
                Top = 12
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABRESPMAINI'
                DataSource = FAlunos.DSAlunos
                TabOrder = 0
              end
              object DBEdit63: TDBEdit
                Left = 103
                Top = 40
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABRESPTAINI'
                DataSource = FAlunos.DSAlunos
                TabOrder = 2
              end
              object DBEdit64: TDBEdit
                Left = 255
                Top = 12
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABRESPMAFIN'
                DataSource = FAlunos.DSAlunos
                TabOrder = 1
              end
              object DBEdit65: TDBEdit
                Left = 255
                Top = 40
                Width = 66
                Height = 21
                CharCase = ecUpperCase
                DataField = 'HORATRABRESPTAFIN'
                DataSource = FAlunos.DSAlunos
                TabOrder = 3
              end
            end
            object DBLCBBairroResp: TDBLookupComboBox
              Left = 112
              Top = 101
              Width = 328
              Height = 21
              DataField = 'CODBAIRRORESP'
              DataSource = FAlunos.DSAlunos
              KeyField = 'CODBAIRRO'
              ListField = 'CODBAIRRO;DESCRICAO'
              ListFieldIndex = 1
              ListSource = Dados.DSBairrosLK
              TabOrder = 7
              OnKeyPress = DBLCBBairroKeyPress
            end
            object DBLCBCidadeResp: TDBLookupComboBox
              Left = 112
              Top = 132
              Width = 328
              Height = 21
              DataField = 'CODCIDADERESP'
              DataSource = FAlunos.DSAlunos
              KeyField = 'CODCIDADE'
              ListField = 'CODCIDADE;DESCRICAO'
              ListFieldIndex = 1
              ListSource = Dados.DSCidadesLK
              TabOrder = 10
              OnExit = DBLCBCidadeRespExit
              OnKeyPress = DBLCBBairroKeyPress
            end
            object DBLCBProfResp: TDBLookupComboBox
              Left = 112
              Top = 165
              Width = 328
              Height = 21
              DataField = 'CODPROFRESP'
              DataSource = FAlunos.DSAlunos
              KeyField = 'CODPROFISSAO'
              ListField = 'CODPROFISSAO;DESCRICAO'
              ListFieldIndex = 1
              ListSource = Dados.DSProfissoesLK
              TabOrder = 13
              OnKeyPress = DBLCBBairroKeyPress
            end
            object DBEdit66: TDBEdit
              Left = 523
              Top = 197
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'FONERESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 16
            end
            object DBEdit67: TDBEdit
              Left = 523
              Top = 165
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CELRESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 14
            end
            object DBEdit68: TDBEdit
              Left = 187
              Top = 37
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'RGRESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 3
            end
            object DBEdit69: TDBEdit
              Left = 352
              Top = 37
              Width = 110
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CPFRESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 4
            end
            object DBEdit70: TDBEdit
              Left = 523
              Top = 101
              Width = 221
              Height = 21
              CharCase = ecUpperCase
              DataField = 'EMAILRESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 8
            end
            object DBEdit71: TDBEdit
              Left = 523
              Top = 133
              Width = 130
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CEPRESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 11
            end
            object DTPDtAnivRe: TDateTimePicker
              Left = 79
              Top = 37
              Width = 85
              Height = 21
              Date = 39300.616501006940000000
              Time = 39300.616501006940000000
              TabOrder = 2
              OnChange = DTPDtAnivReChange
            end
            object DBEdit54: TDBEdit
              Left = 82
              Top = 40
              Width = 66
              Height = 15
              BorderStyle = bsNone
              CharCase = ecUpperCase
              DataField = 'DTNASCRESP'
              DataSource = FAlunos.DSAlunos
              TabOrder = 1
              OnEnter = DBEdit54Enter
              OnExit = DBEdit54Enter
            end
          end
        end
      end
    end
    object DBEdit3: TDBEdit
      Left = 79
      Top = 61
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = FAlunos.DSAlunos
      TabOrder = 7
      OnExit = DBEdit3Exit
    end
    object DBCheckBox1: TDBCheckBox
      Left = 144
      Top = 90
      Width = 97
      Height = 17
      Caption = 'Pais Divorciados'
      DataField = 'SEPARADOS'
      DataSource = FAlunos.DSAlunos
      TabOrder = 8
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 247
      Top = 90
      Width = 109
      Height = 17
      Caption = 'Pais Moram Juntos'
      DataField = 'PMJ'
      DataSource = FAlunos.DSAlunos
      TabOrder = 9
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBEdit50: TDBEdit
      Left = 215
      Top = 5
      Width = 66
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DATACAD'
      DataSource = FAlunos.DSAlunos
      TabOrder = 1
    end
    object DBCheckBox3: TDBCheckBox
      Left = 367
      Top = 90
      Width = 45
      Height = 17
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = FAlunos.DSAlunos
      TabOrder = 10
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBCheckBox4: TDBCheckBox
      Left = 439
      Top = 90
      Width = 69
      Height = 17
      Caption = 'Em f'#233'rias'
      DataField = 'EMFERIAS'
      DataSource = FAlunos.DSAlunos
      TabOrder = 11
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 518
      Top = 72
      Width = 127
      Height = 35
      Caption = 'Sexo'
      Columns = 2
      DataField = 'SEXO'
      DataSource = FAlunos.DSAlunos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        'Fem.'
        'Masc.')
      ParentFont = False
      TabOrder = 12
      Values.Strings = (
        'F'
        'M')
    end
    object DTPIngresso: TDateTimePicker
      Left = 375
      Top = 5
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 3
      OnChange = DTPIngressoChange
    end
    object DBEdit52: TDBEdit
      Left = 378
      Top = 8
      Width = 63
      Height = 16
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DATAINGRESSO'
      DataSource = FAlunos.DSAlunos
      TabOrder = 2
      OnEnter = DBEdit52Enter
      OnExit = DBEdit52Enter
    end
    object DTPNasc: TDateTimePicker
      Left = 375
      Top = 33
      Width = 85
      Height = 21
      Date = 39300.616501006940000000
      Time = 39300.616501006940000000
      TabOrder = 6
      OnChange = DTPNascChange
    end
    object DBEdit4: TDBEdit
      Left = 378
      Top = 36
      Width = 64
      Height = 16
      BorderStyle = bsNone
      CharCase = ecUpperCase
      DataField = 'DTNASC'
      DataSource = FAlunos.DSAlunos
      TabOrder = 5
      OnEnter = DBEdit4Exit
      OnExit = DBEdit4Exit
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 513
    Width = 790
    Height = 55
    Align = alBottom
    BevelInner = bvLowered
    Color = 2025694
    TabOrder = 1
    object SBGravar: TSpeedButton
      Left = 513
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
      Left = 633
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
      Width = 786
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
