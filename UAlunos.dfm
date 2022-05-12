object FAlunos: TFAlunos
  Left = 290
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Alunos'
  ClientHeight = 518
  ClientWidth = 785
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 518
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 0
    object SpeedButton18: TSpeedButton
      Left = 521
      Top = 120
      Width = 42
      Height = 22
      Hint = 'Insere nova carn'#234
      Caption = 'Novo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton18Click
    end
    object SpeedButton17: TSpeedButton
      Left = 521
      Top = 142
      Width = 42
      Height = 22
      Hint = 'Altera registro corrente'
      Caption = 'Alterar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAltFuncClick
    end
    object SpeedButton16: TSpeedButton
      Left = 521
      Top = 164
      Width = 42
      Height = 22
      Hint = 'Apaga registro atual'
      Caption = 'Apagar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBDelFuncClick
    end
    object SpeedButton1: TSpeedButton
      Left = 521
      Top = 186
      Width = 42
      Height = 22
      Hint = 'Apaga registro atual'
      Caption = 'Baixar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SBNewTrat: TSpeedButton
      Left = 0
      Top = 326
      Width = 42
      Height = 22
      Hint = 'Insere novo tratamento'
      Caption = 'Novo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNewTratClick
    end
    object SBNewResp: TSpeedButton
      Left = 0
      Top = 233
      Width = 42
      Height = 22
      Hint = 'Insere nova professora'
      Caption = 'Novo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNewRespClick
    end
    object SBNewRemedio: TSpeedButton
      Left = 260
      Top = 326
      Width = 42
      Height = 22
      Hint = 'Insere nova rem'#233'dio'
      Caption = 'Novo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNewRemedioClick
    end
    object SBNewProd: TSpeedButton
      Left = 522
      Top = 326
      Width = 42
      Height = 22
      Hint = 'Insere nova conv'#234'niencia'
      Caption = 'Novo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNewProdClick
    end
    object SBNewDoenca: TSpeedButton
      Left = 522
      Top = 233
      Width = 42
      Height = 22
      Hint = 'Insere nova doen'#231'a '
      Caption = 'Novo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNewDoencaClick
    end
    object SBNewBol: TSpeedButton
      Left = 260
      Top = 423
      Width = 42
      Height = 22
      Hint = 'Insere novo boletim virtual'
      Caption = 'Novo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNewBolClick
    end
    object SBNewAv: TSpeedButton
      Left = 0
      Top = 423
      Width = 42
      Height = 22
      Hint = 'Insere nova sa'#237'da antecipada'
      Caption = 'Novo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNewAvClick
    end
    object SBNewAlergia: TSpeedButton
      Left = 260
      Top = 233
      Width = 42
      Height = 22
      Hint = 'Insere nova alergia'
      Caption = 'Novo'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBNewAlergiaClick
    end
    object SBEditBol: TSpeedButton
      Left = 260
      Top = 445
      Width = 42
      Height = 22
      Hint = 'Altera registro corrente'
      Caption = 'Alterar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBEditBolClick
    end
    object SBEditAv: TSpeedButton
      Left = 0
      Top = 445
      Width = 42
      Height = 22
      Hint = 'Altera registro corrente'
      Caption = 'Alterar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBEditAvClick
    end
    object SBDelTrat: TSpeedButton
      Left = 0
      Top = 370
      Width = 42
      Height = 22
      Hint = 'Apaga registro atual'
      Caption = 'Apagar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBDelTratClick
    end
    object SBDelRemedio: TSpeedButton
      Left = 260
      Top = 370
      Width = 42
      Height = 22
      Hint = 'Apaga registro atual'
      Caption = 'Apagar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBDelRemedioClick
    end
    object SBDelProd: TSpeedButton
      Left = 522
      Top = 370
      Width = 42
      Height = 22
      Hint = 'Apaga registro atual'
      Caption = 'Apagar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBDelProdClick
    end
    object SBDelFunc: TSpeedButton
      Left = 0
      Top = 277
      Width = 42
      Height = 22
      Hint = 'Apaga registro atual'
      Caption = 'Apagar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBDelFuncClick
    end
    object SBDelDoenca: TSpeedButton
      Left = 522
      Top = 277
      Width = 42
      Height = 22
      Hint = 'Apaga registro atual'
      Caption = 'Apagar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBDelDoencaClick
    end
    object SBDelBol: TSpeedButton
      Left = 260
      Top = 467
      Width = 42
      Height = 22
      Hint = 'Apaga registro atual'
      Caption = 'Apagar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
    end
    object SBDelAv: TSpeedButton
      Left = 0
      Top = 467
      Width = 42
      Height = 22
      Hint = 'Apaga registro atual'
      Caption = 'Apagar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBDelAvClick
    end
    object SBDelAlergia: TSpeedButton
      Left = 260
      Top = 277
      Width = 42
      Height = 22
      Hint = 'Apaga registro atual'
      Caption = 'Apagar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBDelAlergiaClick
    end
    object SBAltTrat: TSpeedButton
      Left = 0
      Top = 348
      Width = 42
      Height = 22
      Hint = 'Altera registro corrente'
      Caption = 'Alterar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAltTratClick
    end
    object SBAltRemedio: TSpeedButton
      Left = 260
      Top = 348
      Width = 42
      Height = 22
      Hint = 'Altera registro corrente'
      Caption = 'Alterar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAltRemedioClick
    end
    object SBAltProd: TSpeedButton
      Left = 522
      Top = 348
      Width = 42
      Height = 22
      Hint = 'Altera registro corrente'
      Caption = 'Alterar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAltProdClick
    end
    object SBAltFunc: TSpeedButton
      Left = 0
      Top = 255
      Width = 42
      Height = 22
      Hint = 'Altera registro corrente'
      Caption = 'Alterar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAltFuncClick
    end
    object SBAltDoenca: TSpeedButton
      Left = 522
      Top = 255
      Width = 42
      Height = 22
      Hint = 'Altera registro corrente'
      Caption = 'Alterar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAltDoencaClick
    end
    object SBAltAlergia: TSpeedButton
      Left = 260
      Top = 255
      Width = 42
      Height = 22
      Hint = 'Altera registro corrente'
      Caption = 'Alterar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBAltAlergiaClick
    end
    object Label8: TLabel
      Left = 33
      Top = 407
      Width = 233
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Sa'#237'das Antecipadas (Aviso Pr'#233'vio)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 292
      Top = 407
      Width = 541
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Boletim Virtual'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 304
      Top = 311
      Width = 233
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Rem'#233'dios'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 570
      Top = 311
      Width = 230
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Conv'#234'niencias'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 29
      Top = 311
      Width = 233
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Tratamentos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 617
      Top = 105
      Width = 85
      Height = 13
      Caption = 'Carn'#234' do Aluno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 192
      Top = 105
      Width = 87
      Height = 13
      Caption = 'Dados do Aluno'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 43
      Top = 217
      Width = 217
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Respons'#225'veis'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 307
      Top = 217
      Width = 231
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Alergias'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 568
      Top = 217
      Width = 232
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Doen'#231'as'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 785
      Height = 104
      Align = alTop
      BevelOuter = bvNone
      Color = 2025694
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 0
      object SBRefresh: TSpeedButton
        Left = 243
        Top = 36
        Width = 31
        Height = 32
        Hint = 'Atualizar'
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = SBFirstClick
      end
      object SBPrior: TSpeedButton
        Left = 213
        Top = 36
        Width = 32
        Height = 32
        Hint = #218'ltimo'
        Flat = True
        Margin = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = SBFirstClick
      end
      object SBNext: TSpeedButton
        Left = 183
        Top = 36
        Width = 32
        Height = 32
        Hint = 'Pr'#243'ximo'
        Flat = True
        Margin = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = SBFirstClick
      end
      object SBLast: TSpeedButton
        Left = 153
        Top = 36
        Width = 32
        Height = 32
        Hint = 'Anterior'
        Flat = True
        Margin = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = SBFirstClick
      end
      object SBFirst: TSpeedButton
        Left = 123
        Top = 36
        Width = 32
        Height = 32
        Hint = 'Primeiro'
        Flat = True
        Margin = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = SBFirstClick
      end
      object SBBusca: TSpeedButton
        Left = 736
        Top = 2
        Width = 59
        Height = 101
        Hint = 'Busca Avan'#231'ada de Alunos'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SBBuscaClick
      end
      object Label1: TLabel
        Left = 564
        Top = 5
        Width = 32
        Height = 13
        Caption = 'Ordem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LblQtde: TLabel
        Left = 500
        Top = 79
        Width = 198
        Height = 16
        Alignment = taCenter
        AutoSize = False
        Caption = 'LblQtde'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ImaAluno: TImage
        Left = 275
        Top = 23
        Width = 55
        Height = 81
        Center = True
        Proportional = True
        Stretch = True
      end
      object SBNovo: TSpeedButton
        Left = 3
        Top = 2
        Width = 120
        Height = 25
        Hint = 'Insere novo registro'
        Caption = 'Novo'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SBNovoClick
      end
      object SBAlterar: TSpeedButton
        Left = 3
        Top = 27
        Width = 120
        Height = 25
        Hint = 'Altera registro corrente'
        Caption = 'Alterar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SBAlterarClick
      end
      object SBExcluir: TSpeedButton
        Left = 3
        Top = 52
        Width = 120
        Height = 25
        Hint = 'Apaga registro atual'
        Caption = 'Apagar'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SBExcluirClick
      end
      object SBSair: TSpeedButton
        Left = 3
        Top = 77
        Width = 120
        Height = 25
        Hint = 'Sair do cadastro'
        Caption = 'Sair'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = SBSairClick
      end
      object Label12: TLabel
        Left = 294
        Top = 7
        Width = 27
        Height = 13
        Caption = 'Aluno'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ImaPai: TImage
        Left = 334
        Top = 23
        Width = 55
        Height = 81
        Center = True
        Proportional = True
        Stretch = True
      end
      object Label13: TLabel
        Left = 340
        Top = 7
        Width = 161
        Height = 13
        Caption = 'Respons'#225'vel por Buscar/Entregar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object ImaMae: TImage
        Left = 390
        Top = 23
        Width = 55
        Height = 81
        Center = True
        Proportional = True
        Stretch = True
      end
      object ImaResp: TImage
        Left = 446
        Top = 23
        Width = 55
        Height = 81
        Center = True
        Proportional = True
        Stretch = True
      end
      object RBCodigo: TRadioButton
        Left = 564
        Top = 21
        Width = 57
        Height = 17
        Caption = 'C'#243'digo'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = RBCodigoClick
      end
      object RBDescricao: TRadioButton
        Left = 564
        Top = 37
        Width = 68
        Height = 17
        Caption = 'Nome'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = RBCodigoClick
      end
      object EdBusca: TEdit
        Left = 559
        Top = 55
        Width = 161
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = EdBuscaChange
      end
    end
    object DBGrid9: TDBGrid
      Left = 304
      Top = 326
      Width = 220
      Height = 76
      Color = clSilver
      DataSource = DSAlunosRemedios
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBAltRemedioClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Remedios'
          Width = 185
          Visible = True
        end>
    end
    object DBGrid8: TDBGrid
      Left = 565
      Top = 326
      Width = 220
      Height = 76
      Color = clSilver
      DataSource = DSAlunosProdutos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBAltProdClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Produto'
          Width = 185
          Visible = True
        end>
    end
    object DBGrid7: TDBGrid
      Left = 42
      Top = 326
      Width = 220
      Height = 76
      Color = clSilver
      DataSource = DSAlunosTrat
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBAltTratClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Trat'
          Title.Caption = 'Tratamento'
          Width = 185
          Visible = True
        end>
    end
    object DBGrid6: TDBGrid
      Left = 565
      Top = 232
      Width = 220
      Height = 76
      Color = clSilver
      DataSource = DSAlunosDoencas
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBAltDoencaClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Nome'
          Title.Caption = 'Doen'#231'a'
          Width = 185
          Visible = True
        end>
    end
    object DBGrid5: TDBGrid
      Left = 304
      Top = 232
      Width = 220
      Height = 76
      Color = clSilver
      DataSource = DSAlunosAlergias
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBAltAlergiaClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Nome'
          Title.Caption = 'Alergia'
          Width = 185
          Visible = True
        end>
    end
    object DBGrid4: TDBGrid
      Left = 565
      Top = 119
      Width = 220
      Height = 93
      Color = clSilver
      DataSource = DSAlunosCarne
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid4DrawColumnCell
      OnDblClick = SBAltFuncClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODCARNE'
          Title.Caption = 'C'#243'digo'
          Width = 41
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Caption = 'Valor'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTVCTO'
          Title.Caption = 'Dt. Vcto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTPGTO'
          Title.Caption = 'Dt. Pgto.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StatusStr'
          Title.Caption = 'Status'
          Visible = True
        end>
    end
    object DBGrid3: TDBGrid
      Left = 41
      Top = 232
      Width = 220
      Height = 76
      Color = clSilver
      DataSource = DSAlunosFunc
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBAltFuncClick
      Columns = <
        item
          Expanded = False
          FieldName = 'Nome'
          Title.Caption = 'Respons'#225'vel'
          Width = 185
          Visible = True
        end>
    end
    object DBGrid11: TDBGrid
      Left = 42
      Top = 422
      Width = 220
      Height = 76
      Color = clSilver
      DataSource = DSAlunosSai
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PopupMenu1
      ReadOnly = True
      TabOrder = 8
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid11DrawColumnCell
      OnDblClick = SBEditAvClick
      Columns = <
        item
          Expanded = False
          FieldName = 'DTSAI'
          Title.Caption = 'Data'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HRSAI'
          Title.Caption = 'Hora'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StatusSTR'
          Title.Caption = 'Status'
          Width = 84
          Visible = True
        end>
    end
    object DBGrid10: TDBGrid
      Left = 303
      Top = 422
      Width = 483
      Height = 76
      Color = clSilver
      DataSource = DSAlunosAval
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 9
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBEditBolClick
      Columns = <
        item
          Expanded = False
          FieldName = 'PERIODO'
          Title.Caption = 'Per'#237'odo'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Assiduidade'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Atencao'
          Title.Caption = 'Aten'#231#227'o'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Comportamento'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DesenMot'
          Title.Caption = 'Desenv. Motor'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Higiene'
          Width = 85
          Visible = True
        end>
    end
    object DBGrid1: TDBGrid
      Left = 7
      Top = 119
      Width = 516
      Height = 93
      Color = clSilver
      DataSource = DSAlunos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 10
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBAlterarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODALUNO'
          Title.Caption = 'C'#243'digo'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MATRICULA'
          Title.Caption = 'Matr'#237'cula'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 298
          Visible = True
        end>
    end
    object StatusBar1: TStatusBar
      Left = 0
      Top = 499
      Width = 785
      Height = 19
      Color = 2025694
      Panels = <
        item
          Alignment = taCenter
          Text = 'CTRL + N - Novo'
          Width = 110
        end
        item
          Alignment = taCenter
          Text = 'CTRL + A - Alterar'
          Width = 110
        end
        item
          Alignment = taCenter
          Text = 'CTRL + Del - Excluir '
          Width = 110
        end
        item
          Alignment = taCenter
          Text = 'F3 - Busca Avan'#231'ada'
          Width = 110
        end
        item
          Alignment = taCenter
          Text = 'Esc - Sair'
          Width = 110
        end>
    end
  end
  object PnlBusca: TPanel
    Left = 723
    Top = 490
    Width = 790
    Height = 416
    BevelInner = bvLowered
    BevelOuter = bvSpace
    Color = 2025694
    TabOrder = 1
    Visible = False
    object SpeedButton6: TSpeedButton
      Left = 584
      Top = 386
      Width = 88
      Height = 25
      Caption = 'OK'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object SpeedButton7: TSpeedButton
      Left = 680
      Top = 386
      Width = 88
      Height = 25
      Caption = 'Cancelar'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 2
      Width = 786
      Height = 381
      Align = alTop
      Color = 8304766
      DataSource = DSAlunos
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid2DrawColumnCell
      OnDblClick = DBGrid2DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODALUNO'
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = []
          Width = 400
          Visible = True
        end>
    end
  end
  object MainMenu1: TMainMenu
    Left = 176
    Top = 72
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object AlunosInadimplentes1: TMenuItem
        Caption = 'Alunos Inadimplentes'
        OnClick = AlunosInadimplentes1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object FichadoAluno1: TMenuItem
        Caption = 'Ficha do Aluno'
        OnClick = FichadoAluno1Click
      end
      object FaixaEtria1: TMenuItem
        Caption = 'Faixa Et'#225'ria'
        OnClick = FaixaEtria1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Simples1: TMenuItem
        Caption = 'Sint'#233'tico'
        OnClick = Simples1Click
      end
      object Estatstico1: TMenuItem
        Caption = 'Estat'#237'stico'
        OnClick = Estatstico1Click
      end
    end
  end
  object DSAlunos: TDataSource
    DataSet = TbAlunos
    OnDataChange = DSAlunosDataChange
    Left = 96
    Top = 145
  end
  object TbAlunos: TMDODataSet
    AfterClose = TbAlunosAfterClose
    AfterOpen = TbAlunosAfterOpen
    Database = Dados.Database
    OnCalcFields = TbAlunosCalcFields
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ALUNOS'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO')
    GeneratorLink.IncrementBy = 0
    InsertSQL.Strings = (
      'INSERT INTO ALUNOS'
      
        '  (CODALUNO, NOME, DTNASC, NOMEPAI, DTNASCPAI, NOMEMAE, ENDERECO' +
        ', ENDERECOPAI, '
      
        '   ENDERECOMAE, CODCIDADE, CODCIDADEPAI, CODCIDADEMAE, CODBAIRRO' +
        ', CODBAIRROPAI, '
      
        '   CODBAIRROMAE, CEP, FONE, FONEPAI, FONEMAE, CELPAI, CELMAE, RG' +
        'PAI, RGMAE, '
      
        '   CPFPAI, CPFMAE, EMAILPAI, EMAILMAE, OBS, QUEMBUSCA, ENDERECOR' +
        'ESP, CODCIDADERESP, '
      
        '   CODBAIRRORESP, ESCOLARIDADERESP, HORATRABRESPMAINI, HORATRABR' +
        'ESPMAFIN, '
      
        '   HORATRABRESPTAINI, HORATRABRESPTAFIN, CEPRESP, FONERESP, CELR' +
        'ESP, RGRESP, '
      
        '   CPFRESP, EMAILRESP, DTNASCRESP, NOMERESP, CODPROFRESP, ENDPRO' +
        'FRESP, '
      
        '   TELPROFRESP, CODPROFPAI, ENDPROFPAI, ENDPROFMAE, ESCOLARIDADE' +
        'PAI, ESCOLARIDADEMAE, '
      
        '   TELPROFPAI, TELPROFMAE, HORATRABPAIMAINI, HORATRABPAIMAFIN, H' +
        'ORATRABPAITAINI, '
      
        '   HORATRABPAITAFIN, HORATRABMAEMAINI, HORATRABMAEMAFIN, HORATRA' +
        'BMAETAINI, '
      
        '   HORATRABMAETAFIN, PMJ, SEPARADOS, EMERGENCIANOME, EMERGENCIAF' +
        'ONE, CODPROFMAE, '
      
        '   MATRICULA, PATHFOTOPAI, PATHFOTO, PATHFOTOMAE, PATHFOTORESP, ' +
        'DTNASCMAE, '
      
        '   RESPONSAVELBUSCA, EMERGENCIACHAMAR, CEPPAI, CEPMAE, DATAINGRE' +
        'SSO, DATACAD, '
      
        '   EMACIDENTE, SEXO, EMACIDADENTEOUTRO, CODTURMA, ATIVO, EMFERIA' +
        'S)'
      'VALUES'
      
        '  (:CODALUNO, :NOME, :DTNASC, :NOMEPAI, :DTNASCPAI, :NOMEMAE, :E' +
        'NDERECO, '
      
        '   :ENDERECOPAI, :ENDERECOMAE, :CODCIDADE, :CODCIDADEPAI, :CODCI' +
        'DADEMAE, '
      
        '   :CODBAIRRO, :CODBAIRROPAI, :CODBAIRROMAE, :CEP, :FONE, :FONEP' +
        'AI, :FONEMAE, '
      
        '   :CELPAI, :CELMAE, :RGPAI, :RGMAE, :CPFPAI, :CPFMAE, :EMAILPAI' +
        ', :EMAILMAE, '
      
        '   :OBS, :QUEMBUSCA, :ENDERECORESP, :CODCIDADERESP, :CODBAIRRORE' +
        'SP, :ESCOLARIDADERESP, '
      
        '   :HORATRABRESPMAINI, :HORATRABRESPMAFIN, :HORATRABRESPTAINI, :' +
        'HORATRABRESPTAFIN, '
      
        '   :CEPRESP, :FONERESP, :CELRESP, :RGRESP, :CPFRESP, :EMAILRESP,' +
        ' :DTNASCRESP, '
      
        '   :NOMERESP, :CODPROFRESP, :ENDPROFRESP, :TELPROFRESP, :CODPROF' +
        'PAI, :ENDPROFPAI, '
      
        '   :ENDPROFMAE, :ESCOLARIDADEPAI, :ESCOLARIDADEMAE, :TELPROFPAI,' +
        ' :TELPROFMAE, '
      
        '   :HORATRABPAIMAINI, :HORATRABPAIMAFIN, :HORATRABPAITAINI, :HOR' +
        'ATRABPAITAFIN, '
      
        '   :HORATRABMAEMAINI, :HORATRABMAEMAFIN, :HORATRABMAETAINI, :HOR' +
        'ATRABMAETAFIN, '
      
        '   :PMJ, :SEPARADOS, :EMERGENCIANOME, :EMERGENCIAFONE, :CODPROFM' +
        'AE, :MATRICULA, '
      
        '   :PATHFOTOPAI, :PATHFOTO, :PATHFOTOMAE, :PATHFOTORESP, :DTNASC' +
        'MAE, :RESPONSAVELBUSCA, '
      
        '   :EMERGENCIACHAMAR, :CEPPAI, :CEPMAE, :DATAINGRESSO, :DATACAD,' +
        ' :EMACIDENTE, '
      '   :SEXO, :EMACIDADENTEOUTRO, :CODTURMA, :ATIVO, :EMFERIAS)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ALUNOS'
      'SET'
      '  CODALUNO = :CODALUNO,'
      '  NOME = :NOME,'
      '  DTNASC = :DTNASC,'
      '  NOMEPAI = :NOMEPAI,'
      '  DTNASCPAI = :DTNASCPAI,'
      '  NOMEMAE = :NOMEMAE,'
      '  ENDERECO = :ENDERECO,'
      '  ENDERECOPAI = :ENDERECOPAI,'
      '  ENDERECOMAE = :ENDERECOMAE,'
      '  CODCIDADE = :CODCIDADE,'
      '  CODCIDADEPAI = :CODCIDADEPAI,'
      '  CODCIDADEMAE = :CODCIDADEMAE,'
      '  CODBAIRRO = :CODBAIRRO,'
      '  CODBAIRROPAI = :CODBAIRROPAI,'
      '  CODBAIRROMAE = :CODBAIRROMAE,'
      '  CEP = :CEP,'
      '  FONE = :FONE,'
      '  FONEPAI = :FONEPAI,'
      '  FONEMAE = :FONEMAE,'
      '  CELPAI = :CELPAI,'
      '  CELMAE = :CELMAE,'
      '  RGPAI = :RGPAI,'
      '  RGMAE = :RGMAE,'
      '  CPFPAI = :CPFPAI,'
      '  CPFMAE = :CPFMAE,'
      '  EMAILPAI = :EMAILPAI,'
      '  EMAILMAE = :EMAILMAE,'
      '  OBS = :OBS,'
      '  QUEMBUSCA = :QUEMBUSCA,'
      '  ENDERECORESP = :ENDERECORESP,'
      '  CODCIDADERESP = :CODCIDADERESP,'
      '  CODBAIRRORESP = :CODBAIRRORESP,'
      '  ESCOLARIDADERESP = :ESCOLARIDADERESP,'
      '  HORATRABRESPMAINI = :HORATRABRESPMAINI,'
      '  HORATRABRESPMAFIN = :HORATRABRESPMAFIN,'
      '  HORATRABRESPTAINI = :HORATRABRESPTAINI,'
      '  HORATRABRESPTAFIN = :HORATRABRESPTAFIN,'
      '  CEPRESP = :CEPRESP,'
      '  FONERESP = :FONERESP,'
      '  CELRESP = :CELRESP,'
      '  RGRESP = :RGRESP,'
      '  CPFRESP = :CPFRESP,'
      '  EMAILRESP = :EMAILRESP,'
      '  DTNASCRESP = :DTNASCRESP,'
      '  NOMERESP = :NOMERESP,'
      '  CODPROFRESP = :CODPROFRESP,'
      '  ENDPROFRESP = :ENDPROFRESP,'
      '  TELPROFRESP = :TELPROFRESP,'
      '  CODPROFPAI = :CODPROFPAI,'
      '  ENDPROFPAI = :ENDPROFPAI,'
      '  ENDPROFMAE = :ENDPROFMAE,'
      '  ESCOLARIDADEPAI = :ESCOLARIDADEPAI,'
      '  ESCOLARIDADEMAE = :ESCOLARIDADEMAE,'
      '  TELPROFPAI = :TELPROFPAI,'
      '  TELPROFMAE = :TELPROFMAE,'
      '  HORATRABPAIMAINI = :HORATRABPAIMAINI,'
      '  HORATRABPAIMAFIN = :HORATRABPAIMAFIN,'
      '  HORATRABPAITAINI = :HORATRABPAITAINI,'
      '  HORATRABPAITAFIN = :HORATRABPAITAFIN,'
      '  HORATRABMAEMAINI = :HORATRABMAEMAINI,'
      '  HORATRABMAEMAFIN = :HORATRABMAEMAFIN,'
      '  HORATRABMAETAINI = :HORATRABMAETAINI,'
      '  HORATRABMAETAFIN = :HORATRABMAETAFIN,'
      '  PMJ = :PMJ,'
      '  SEPARADOS = :SEPARADOS,'
      '  EMERGENCIANOME = :EMERGENCIANOME,'
      '  EMERGENCIAFONE = :EMERGENCIAFONE,'
      '  CODPROFMAE = :CODPROFMAE,'
      '  MATRICULA = :MATRICULA,'
      '  PATHFOTOPAI = :PATHFOTOPAI,'
      '  PATHFOTO = :PATHFOTO,'
      '  PATHFOTOMAE = :PATHFOTOMAE,'
      '  PATHFOTORESP = :PATHFOTORESP,'
      '  DTNASCMAE = :DTNASCMAE,'
      '  RESPONSAVELBUSCA = :RESPONSAVELBUSCA,'
      '  EMERGENCIACHAMAR = :EMERGENCIACHAMAR,'
      '  CEPPAI = :CEPPAI,'
      '  CEPMAE = :CEPMAE,'
      '  DATAINGRESSO = :DATAINGRESSO,'
      '  DATACAD = :DATACAD,'
      '  EMACIDENTE = :EMACIDENTE,'
      '  SEXO = :SEXO,'
      '  EMACIDADENTEOUTRO = :EMACIDADENTEOUTRO,'
      '  CODTURMA = :CODTURMA,'
      '  ATIVO = :ATIVO,'
      '  EMFERIAS = :EMFERIAS'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODALUNO,'
      '  NOME,'
      '  DTNASC,'
      '  NOMEPAI,'
      '  DTNASCPAI,'
      '  NOMEMAE,'
      '  ENDERECO,'
      '  ENDERECOPAI,'
      '  ENDERECOMAE,'
      '  CODCIDADE,'
      '  CODCIDADEPAI,'
      '  CODCIDADEMAE,'
      '  CODBAIRRO,'
      '  CODBAIRROPAI,'
      '  CODBAIRROMAE,'
      '  CEP,'
      '  FONE,'
      '  FONEPAI,'
      '  FONEMAE,'
      '  CELPAI,'
      '  CELMAE,'
      '  RGPAI,'
      '  RGMAE,'
      '  CPFPAI,'
      '  CPFMAE,'
      '  EMAILPAI,'
      '  EMAILMAE,'
      '  OBS,'
      '  QUEMBUSCA,'
      '  ENDERECORESP,'
      '  CODCIDADERESP,'
      '  CODBAIRRORESP,'
      '  ESCOLARIDADERESP,'
      '  HORATRABRESPMAINI,'
      '  HORATRABRESPMAFIN,'
      '  HORATRABRESPTAINI,'
      '  HORATRABRESPTAFIN,'
      '  CEPRESP,'
      '  FONERESP,'
      '  CELRESP,'
      '  RGRESP,'
      '  CPFRESP,'
      '  EMAILRESP,'
      '  DTNASCRESP,'
      '  NOMERESP,'
      '  CODPROFRESP,'
      '  ENDPROFRESP,'
      '  TELPROFRESP,'
      '  CODPROFPAI,'
      '  ENDPROFPAI,'
      '  ENDPROFMAE,'
      '  ESCOLARIDADEPAI,'
      '  ESCOLARIDADEMAE,'
      '  TELPROFPAI,'
      '  TELPROFMAE,'
      '  HORATRABPAIMAINI,'
      '  HORATRABPAIMAFIN,'
      '  HORATRABPAITAINI,'
      '  HORATRABPAITAFIN,'
      '  HORATRABMAEMAINI,'
      '  HORATRABMAEMAFIN,'
      '  HORATRABMAETAINI,'
      '  HORATRABMAETAFIN,'
      '  PMJ,'
      '  SEPARADOS,'
      '  EMERGENCIANOME,'
      '  EMERGENCIAFONE,'
      '  CODPROFMAE,'
      '  MATRICULA,'
      '  PATHFOTOPAI,'
      '  PATHFOTO,'
      '  PATHFOTOMAE,'
      '  PATHFOTORESP,'
      '  DTNASCMAE,'
      '  RESPONSAVELBUSCA,'
      '  EMERGENCIACHAMAR,'
      '  CEPPAI,'
      '  CEPMAE,'
      '  DATAINGRESSO,'
      '  DATACAD,'
      '  EMACIDENTE,'
      '  SEXO,'
      '  EMACIDADENTEOUTRO,'
      '  CODTURMA,'
      '  ATIVO,'
      '  EMFERIAS'
      'FROM ALUNOS '
      'WHERE'
      '  CODALUNO = :CODALUNO')
    SelectSQL.Strings = (
      'Select * from ALUNOS')
    Left = 67
    Top = 145
    object TbAlunosCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
      Required = True
    end
    object TbAlunosNOME: TMDOStringField
      FieldName = 'NOME'
      Size = 100
    end
    object TbAlunosATIVO: TSmallintField
      FieldName = 'ATIVO'
    end
    object TbAlunosCODTURMA: TSmallintField
      FieldName = 'CODTURMA'
    end
    object TbAlunosEMFERIAS: TSmallintField
      FieldName = 'EMFERIAS'
    end
    object TbAlunosDATAINGRESSO: TDateField
      FieldName = 'DATAINGRESSO'
    end
    object TbAlunosDATACAD: TDateField
      FieldName = 'DATACAD'
    end
    object TbAlunosMATRICULA: TIntegerField
      FieldName = 'MATRICULA'
    end
    object TbAlunosDTNASC: TDateField
      FieldName = 'DTNASC'
    end
    object TbAlunosPATHFOTO: TMDOStringField
      FieldName = 'PATHFOTO'
      Size = 250
    end
    object TbAlunosPATHFOTOPAI: TMDOStringField
      FieldName = 'PATHFOTOPAI'
      Size = 250
    end
    object TbAlunosPATHFOTOMAE: TMDOStringField
      FieldName = 'PATHFOTOMAE'
      Size = 250
    end
    object TbAlunosPATHFOTORESP: TMDOStringField
      FieldName = 'PATHFOTORESP'
      Size = 250
    end
    object TbAlunosNOMEPAI: TMDOStringField
      FieldName = 'NOMEPAI'
      Size = 100
    end
    object TbAlunosDTNASCPAI: TDateField
      FieldName = 'DTNASCPAI'
    end
    object TbAlunosDTNASCMAE: TDateField
      FieldName = 'DTNASCMAE'
    end
    object TbAlunosNOMEMAE: TMDOStringField
      FieldName = 'NOMEMAE'
      Size = 100
    end
    object TbAlunosENDERECO: TMDOStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object TbAlunosENDERECOPAI: TMDOStringField
      FieldName = 'ENDERECOPAI'
      Size = 100
    end
    object TbAlunosENDERECOMAE: TMDOStringField
      FieldName = 'ENDERECOMAE'
      Size = 100
    end
    object TbAlunosCODCIDADE: TSmallintField
      FieldName = 'CODCIDADE'
    end
    object TbAlunosCODCIDADEPAI: TSmallintField
      FieldName = 'CODCIDADEPAI'
    end
    object TbAlunosCODCIDADEMAE: TSmallintField
      FieldName = 'CODCIDADEMAE'
    end
    object TbAlunosCODBAIRRO: TSmallintField
      FieldName = 'CODBAIRRO'
    end
    object TbAlunosCODBAIRROPAI: TSmallintField
      FieldName = 'CODBAIRROPAI'
    end
    object TbAlunosCODBAIRROMAE: TSmallintField
      FieldName = 'CODBAIRROMAE'
    end
    object TbAlunosPMJ: TSmallintField
      FieldName = 'PMJ'
    end
    object TbAlunosSEPARADOS: TSmallintField
      FieldName = 'SEPARADOS'
    end
    object TbAlunosRESPONSAVELBUSCA: TSmallintField
      FieldName = 'RESPONSAVELBUSCA'
    end
    object TbAlunosEMERGENCIACHAMAR: TSmallintField
      FieldName = 'EMERGENCIACHAMAR'
    end
    object TbAlunosEMERGENCIANOME: TMDOStringField
      FieldName = 'EMERGENCIANOME'
      Size = 100
    end
    object TbAlunosEMERGENCIAFONE: TMDOStringField
      FieldName = 'EMERGENCIAFONE'
    end
    object TbAlunosEMACIDENTE: TSmallintField
      FieldName = 'EMACIDENTE'
    end
    object TbAlunosEMACIDADENTEOUTRO: TMDOStringField
      FieldName = 'EMACIDADENTEOUTRO'
      Size = 100
    end
    object TbAlunosCODPROFPAI: TSmallintField
      FieldName = 'CODPROFPAI'
    end
    object TbAlunosESCOLARIDADEPAI: TMDOStringField
      FieldName = 'ESCOLARIDADEPAI'
      Size = 100
    end
    object TbAlunosESCOLARIDADEMAE: TMDOStringField
      FieldName = 'ESCOLARIDADEMAE'
      Size = 100
    end
    object TbAlunosENDPROFPAI: TMDOStringField
      FieldName = 'ENDPROFPAI'
      Size = 100
    end
    object TbAlunosTELPROFPAI: TMDOStringField
      FieldName = 'TELPROFPAI'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbAlunosHORATRABPAIMAINI: TTimeField
      FieldName = 'HORATRABPAIMAINI'
    end
    object TbAlunosHORATRABPAIMAFIN: TTimeField
      FieldName = 'HORATRABPAIMAFIN'
    end
    object TbAlunosHORATRABPAITAINI: TTimeField
      FieldName = 'HORATRABPAITAINI'
    end
    object TbAlunosHORATRABPAITAFIN: TTimeField
      FieldName = 'HORATRABPAITAFIN'
    end
    object TbAlunosCODPROFMAE: TSmallintField
      FieldName = 'CODPROFMAE'
    end
    object TbAlunosENDPROFMAE: TMDOStringField
      FieldName = 'ENDPROFMAE'
      Size = 100
    end
    object TbAlunosTELPROFMAE: TMDOStringField
      FieldName = 'TELPROFMAE'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbAlunosHORATRABMAEMAINI: TTimeField
      FieldName = 'HORATRABMAEMAINI'
    end
    object TbAlunosHORATRABMAEMAFIN: TTimeField
      FieldName = 'HORATRABMAEMAFIN'
    end
    object TbAlunosHORATRABMAETAINI: TTimeField
      FieldName = 'HORATRABMAETAINI'
    end
    object TbAlunosHORATRABMAETAFIN: TTimeField
      FieldName = 'HORATRABMAETAFIN'
    end
    object TbAlunosCEP: TMDOStringField
      FieldName = 'CEP'
      Size = 10
    end
    object TbAlunosCEPPAI: TMDOStringField
      FieldName = 'CEPPAI'
      Size = 10
    end
    object TbAlunosCEPMAE: TMDOStringField
      FieldName = 'CEPMAE'
      Size = 10
    end
    object TbAlunosFONE: TMDOStringField
      FieldName = 'FONE'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbAlunosFONEPAI: TMDOStringField
      FieldName = 'FONEPAI'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbAlunosFONEMAE: TMDOStringField
      FieldName = 'FONEMAE'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbAlunosCELPAI: TMDOStringField
      FieldName = 'CELPAI'
    end
    object TbAlunosCELMAE: TMDOStringField
      FieldName = 'CELMAE'
    end
    object TbAlunosRGPAI: TMDOStringField
      FieldName = 'RGPAI'
      Size = 15
    end
    object TbAlunosRGMAE: TMDOStringField
      FieldName = 'RGMAE'
      Size = 15
    end
    object TbAlunosCPFPAI: TMDOStringField
      FieldName = 'CPFPAI'
      Size = 15
    end
    object TbAlunosCPFMAE: TMDOStringField
      FieldName = 'CPFMAE'
      Size = 15
    end
    object TbAlunosEMAILPAI: TMDOStringField
      FieldName = 'EMAILPAI'
      Size = 100
    end
    object TbAlunosEMAILMAE: TMDOStringField
      FieldName = 'EMAILMAE'
      Size = 100
    end
    object TbAlunosOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 8
    end
    object TbAlunosQUEMBUSCA: TSmallintField
      FieldName = 'QUEMBUSCA'
    end
    object TbAlunosENDERECORESP: TMDOStringField
      FieldName = 'ENDERECORESP'
      Size = 100
    end
    object TbAlunosCODCIDADERESP: TSmallintField
      FieldName = 'CODCIDADERESP'
    end
    object TbAlunosCODBAIRRORESP: TSmallintField
      FieldName = 'CODBAIRRORESP'
    end
    object TbAlunosESCOLARIDADERESP: TMDOStringField
      FieldName = 'ESCOLARIDADERESP'
      Size = 100
    end
    object TbAlunosHORATRABRESPMAINI: TTimeField
      FieldName = 'HORATRABRESPMAINI'
    end
    object TbAlunosHORATRABRESPMAFIN: TTimeField
      FieldName = 'HORATRABRESPMAFIN'
    end
    object TbAlunosHORATRABRESPTAINI: TTimeField
      FieldName = 'HORATRABRESPTAINI'
    end
    object TbAlunosHORATRABRESPTAFIN: TTimeField
      FieldName = 'HORATRABRESPTAFIN'
    end
    object TbAlunosCEPRESP: TMDOStringField
      FieldName = 'CEPRESP'
      Size = 10
    end
    object TbAlunosFONERESP: TMDOStringField
      FieldName = 'FONERESP'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbAlunosCELRESP: TMDOStringField
      FieldName = 'CELRESP'
      EditMask = '(99)9999-9999;1;_'
    end
    object TbAlunosRGRESP: TMDOStringField
      FieldName = 'RGRESP'
      Size = 15
    end
    object TbAlunosCPFRESP: TMDOStringField
      FieldName = 'CPFRESP'
      Size = 15
    end
    object TbAlunosEMAILRESP: TMDOStringField
      FieldName = 'EMAILRESP'
      Size = 100
    end
    object TbAlunosDTNASCRESP: TDateField
      FieldName = 'DTNASCRESP'
    end
    object TbAlunosNOMERESP: TMDOStringField
      FieldName = 'NOMERESP'
      Size = 100
    end
    object TbAlunosCODPROFRESP: TSmallintField
      FieldName = 'CODPROFRESP'
    end
    object TbAlunosENDPROFRESP: TMDOStringField
      FieldName = 'ENDPROFRESP'
      Size = 100
    end
    object TbAlunosTELPROFRESP: TMDOStringField
      FieldName = 'TELPROFRESP'
      EditMask = '(99)9999-9999;1;_'
      Size = 100
    end
    object TbAlunosSEXO: TMDOStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object TbAlunosIdade: TStringField
      FieldKind = fkCalculated
      FieldName = 'Idade'
      Size = 8
      Calculated = True
    end
    object TbAlunosIdadePai: TStringField
      FieldKind = fkCalculated
      FieldName = 'IdadePai'
      Size = 8
      Calculated = True
    end
    object TbAlunosIdadeMae: TStringField
      FieldKind = fkCalculated
      FieldName = 'IdadeMae'
      Size = 8
      Calculated = True
    end
    object TbAlunosIdadeResp: TStringField
      FieldKind = fkCalculated
      FieldName = 'IdadeResp'
      Size = 8
      Calculated = True
    end
  end
  object Trans: TMDOTransaction
    Active = False
    AutoCommit = False
    DefaultAction = TACommitRetaining
    DefaultDatabase = Dados.Database
    Left = 136
    Top = 72
  end
  object DSAlunosFunc: TDataSource
    DataSet = TbAlunosFunc
    Left = 96
    Top = 173
  end
  object TbAlunosFunc: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAlunos
    DeleteSQL.Strings = (
      'DELETE FROM ALUNOSFUNC'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODFUNC = :OLD_CODFUNC')
    InsertSQL.Strings = (
      'INSERT INTO ALUNOSFUNC'
      '  (CODALUNO, CODFUNC)'
      'VALUES'
      '  (:CODALUNO, :CODFUNC)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ALUNOSFUNC'
      'SET'
      '  CODALUNO = :CODALUNO,'
      '  CODFUNC = :CODFUNC'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODFUNC = :OLD_CODFUNC')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODALUNO,'
      '  CODFUNC'
      'FROM ALUNOSFUNC '
      'WHERE'
      '  CODALUNO = :CODALUNO AND'
      '  CODFUNC = :CODFUNC')
    SelectSQL.Strings = (
      'Select * from ALUNOSFUNC '
      'Where CODALUNO = :CODALUNO'
      '')
    Left = 67
    Top = 173
    object TbAlunosFuncCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
      Required = True
    end
    object TbAlunosFuncCODFUNC: TSmallintField
      FieldName = 'CODFUNC'
      Required = True
    end
    object TbAlunosFuncNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome'
      LookupDataSet = Dados.QryFuncLK
      LookupKeyFields = 'CODFUNC'
      LookupResultField = 'NOME'
      KeyFields = 'CODFUNC'
      Size = 100
      Lookup = True
    end
  end
  object QryAux: TMDOQuery
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    Left = 26
    Top = 157
  end
  object QryProx: TMDOQuery
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    Left = 208
    Top = 75
  end
  object TbAlunosDoencas: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAlunos
    DeleteSQL.Strings = (
      'DELETE FROM ALUNOSDOENCAS'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODDOENCA = :OLD_CODDOENCA')
    InsertSQL.Strings = (
      'INSERT INTO ALUNOSDOENCAS'
      '  (CODALUNO, CODDOENCA)'
      'VALUES'
      '  (:CODALUNO, :CODDOENCA)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ALUNOSDOENCAS'
      'SET'
      '  CODALUNO = :CODALUNO,'
      '  CODDOENCA = :CODDOENCA'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODDOENCA = :OLD_CODDOENCA')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODALUNO,'
      '  CODDOENCA'
      'FROM ALUNOSDOENCAS '
      'WHERE'
      '  CODALUNO = :CODALUNO AND'
      '  CODDOENCA = :CODDOENCA')
    SelectSQL.Strings = (
      'Select * from ALUNOSDOENCAS'
      'Where CODALUNO = :CODALUNO'
      '')
    Left = 132
    Top = 145
    object TbAlunosDoencasCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
      Required = True
    end
    object TbAlunosDoencasCODDOENCA: TSmallintField
      FieldName = 'CODDOENCA'
      Required = True
    end
    object TbAlunosDoencasNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome'
      LookupDataSet = Dados.QryDoencasLK
      LookupKeyFields = 'CODDOENCA'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODDOENCA'
      Size = 100
      Lookup = True
    end
  end
  object DSAlunosDoencas: TDataSource
    DataSet = TbAlunosDoencas
    Left = 160
    Top = 145
  end
  object DSAlunosAlergias: TDataSource
    DataSet = TbAlunosAlergias
    Left = 160
    Top = 173
  end
  object TbAlunosAlergias: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAlunos
    DeleteSQL.Strings = (
      'DELETE FROM ALUNOSALERGIAS'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODALERGIA = :OLD_CODALERGIA')
    InsertSQL.Strings = (
      'INSERT INTO ALUNOSALERGIAS'
      '  (CODALUNO, CODALERGIA)'
      'VALUES'
      '  (:CODALUNO, :CODALERGIA)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ALUNOSALERGIAS'
      'SET'
      '  CODALUNO = :CODALUNO,'
      '  CODALERGIA = :CODALERGIA'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODALERGIA = :OLD_CODALERGIA')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODALUNO,'
      '  CODALERGIA'
      'FROM ALUNOSALERGIAS '
      'WHERE'
      '  CODALUNO = :CODALUNO AND'
      '  CODALERGIA = :CODALERGIA')
    SelectSQL.Strings = (
      'Select * from ALUNOSALERGIAS'
      'Where CODALUNO = :CODALUNO'
      '')
    Left = 132
    Top = 173
    object TbAlunosAlergiasCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
      Required = True
    end
    object TbAlunosAlergiasCODALERGIA: TSmallintField
      FieldName = 'CODALERGIA'
      Required = True
    end
    object TbAlunosAlergiasNome: TStringField
      FieldKind = fkLookup
      FieldName = 'Nome'
      LookupDataSet = Dados.QryAlergiasLK
      LookupKeyFields = 'CODALERGIA'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODALERGIA'
      Size = 100
      Lookup = True
    end
  end
  object DSAlunosProdutos: TDataSource
    DataSet = TbAlunosProdutos
    Left = 224
    Top = 173
  end
  object TbAlunosProdutos: TMDODataSet
    AfterOpen = TbAlunosProdutosAfterOpen
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAlunos
    DeleteSQL.Strings = (
      'DELETE FROM ALUNOSPRODUTOS'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODPROD = :OLD_CODPROD')
    InsertSQL.Strings = (
      'INSERT INTO ALUNOSPRODUTOS'
      '  (CODALUNO, CODPROD, VALOR, DTVCTO, PAGO, DTPGTO, DTPAGO)'
      'VALUES'
      
        '  (:CODALUNO, :CODPROD, :VALOR, :DTVCTO, :PAGO, :DTPGTO, :DTPAGO' +
        ')')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ALUNOSPRODUTOS'
      'SET'
      '  CODALUNO = :CODALUNO,'
      '  CODPROD = :CODPROD,'
      '  VALOR = :VALOR,'
      '  DTVCTO = :DTVCTO,'
      '  PAGO = :PAGO,'
      '  DTPGTO = :DTPGTO,'
      '  DTPAGO = :DTPAGO'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODPROD = :OLD_CODPROD')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODALUNO,'
      '  CODPROD,'
      '  VALOR,'
      '  DTVCTO,'
      '  PAGO,'
      '  DTPGTO,'
      '  DTPAGO'
      'FROM ALUNOSPRODUTOS '
      'WHERE'
      '  CODALUNO = :CODALUNO AND'
      '  CODPROD = :CODPROD')
    SelectSQL.Strings = (
      'Select * from ALUNOSPRODUTOS'
      'Where CODALUNO = :CODALUNO'
      '')
    Left = 196
    Top = 173
    object TbAlunosProdutosCODALUNO: TIntegerField
      FieldName = 'CODALUNO'
      Required = True
    end
    object TbAlunosProdutosCODPROD: TIntegerField
      FieldName = 'CODPROD'
      Required = True
    end
    object TbAlunosProdutosVALOR: TMDOBCDField
      FieldName = 'VALOR'
      Precision = 9
      Size = 2
    end
    object TbAlunosProdutosDTVCTO: TDateField
      FieldName = 'DTVCTO'
    end
    object TbAlunosProdutosDTPGTO: TDateField
      FieldName = 'DTPGTO'
    end
    object TbAlunosProdutosDTPAGO: TDateField
      FieldName = 'DTPAGO'
    end
    object TbAlunosProdutosPAGO: TMDOStringField
      FieldName = 'PAGO'
      Size = 1
    end
    object TbAlunosProdutosProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'Produto'
      LookupDataSet = Dados.QryProdutosLK
      LookupKeyFields = 'CODPROD'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODPROD'
      Size = 100
      Lookup = True
    end
  end
  object DSAlunosRemedios: TDataSource
    DataSet = TbAlunosRemedios
    Left = 224
    Top = 145
  end
  object TbAlunosRemedios: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAlunos
    DeleteSQL.Strings = (
      'DELETE FROM ALUNOSREMEDIOS'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODREMEDIO = :OLD_CODREMEDIO')
    InsertSQL.Strings = (
      'INSERT INTO ALUNOSREMEDIOS'
      '  (CODALUNO, CODREMEDIO, MODOAPLIC, REPETDIA)'
      'VALUES'
      '  (:CODALUNO, :CODREMEDIO, :MODOAPLIC, :REPETDIA)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ALUNOSREMEDIOS'
      'SET'
      '  CODALUNO = :CODALUNO,'
      '  CODREMEDIO = :CODREMEDIO,'
      '  MODOAPLIC = :MODOAPLIC,'
      '  REPETDIA = :REPETDIA'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODREMEDIO = :OLD_CODREMEDIO')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODALUNO,'
      '  CODREMEDIO,'
      '  MODOAPLIC,'
      '  REPETDIA'
      'FROM ALUNOSREMEDIOS '
      'WHERE'
      '  CODALUNO = :CODALUNO AND'
      '  CODREMEDIO = :CODREMEDIO')
    SelectSQL.Strings = (
      'Select * from ALUNOSREMEDIOS'
      'Where CODALUNO = :CODALUNO'
      '')
    Left = 196
    Top = 145
    object TbAlunosRemediosCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
      Required = True
    end
    object TbAlunosRemediosCODREMEDIO: TSmallintField
      FieldName = 'CODREMEDIO'
      Required = True
    end
    object TbAlunosRemediosMODOAPLIC: TMemoField
      FieldName = 'MODOAPLIC'
      BlobType = ftMemo
      Size = 8
    end
    object TbAlunosRemediosREPETDIA: TMDOStringField
      FieldName = 'REPETDIA'
      Size = 100
    end
    object TbAlunosRemediosRemedios: TStringField
      FieldKind = fkLookup
      FieldName = 'Remedios'
      LookupDataSet = Dados.QryRemediosLK
      LookupKeyFields = 'CODREMEDIO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODREMEDIO'
      Size = 100
      Lookup = True
    end
  end
  object TbAlunosCarne: TMDODataSet
    Database = Dados.Database
    OnCalcFields = TbAlunosCarneCalcFields
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAlunos
    DeleteSQL.Strings = (
      'DELETE FROM ALUNOSCARNE'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODCARNE = :OLD_CODCARNE')
    InsertSQL.Strings = (
      'INSERT INTO ALUNOSCARNE'
      
        '  (CODALUNO, CODCARNE, VALOR, DTVCTO, DTPGTO, STATUS, VALORPAGO,' +
        ' PERCMULTA, '
      '   VALORMULTA, PERCDESC, VALORDESC)'
      'VALUES'
      
        '  (:CODALUNO, :CODCARNE, :VALOR, :DTVCTO, :DTPGTO, :STATUS, :VAL' +
        'ORPAGO, '
      '   :PERCMULTA, :VALORMULTA, :PERCDESC, :VALORDESC)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ALUNOSCARNE'
      'SET'
      '  CODALUNO = :CODALUNO,'
      '  CODCARNE = :CODCARNE,'
      '  VALOR = :VALOR,'
      '  DTVCTO = :DTVCTO,'
      '  DTPGTO = :DTPGTO,'
      '  STATUS = :STATUS,'
      '  VALORPAGO = :VALORPAGO,'
      '  PERCMULTA = :PERCMULTA,'
      '  VALORMULTA = :VALORMULTA,'
      '  PERCDESC = :PERCDESC,'
      '  VALORDESC = :VALORDESC'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODCARNE = :OLD_CODCARNE')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODALUNO,'
      '  CODCARNE,'
      '  VALOR,'
      '  DTVCTO,'
      '  DTPGTO,'
      '  STATUS,'
      '  VALORPAGO,'
      '  PERCMULTA,'
      '  VALORMULTA,'
      '  PERCDESC,'
      '  VALORDESC'
      'FROM ALUNOSCARNE '
      'WHERE'
      '  CODALUNO = :CODALUNO AND'
      '  CODCARNE = :CODCARNE')
    SelectSQL.Strings = (
      'Select * from ALUNOSCARNE'
      'Where CODALUNO = :CODALUNO'
      '')
    Left = 260
    Top = 145
    object TbAlunosCarneCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
      Required = True
    end
    object TbAlunosCarneCODCARNE: TSmallintField
      FieldName = 'CODCARNE'
      Required = True
    end
    object TbAlunosCarneVALOR: TMDOBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
      Precision = 9
      Size = 2
    end
    object TbAlunosCarneDTVCTO: TDateField
      FieldName = 'DTVCTO'
    end
    object TbAlunosCarneDTPGTO: TDateField
      FieldName = 'DTPGTO'
      EditMask = '99/99/9999;1;_'
    end
    object TbAlunosCarneSTATUS: TMDOStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object TbAlunosCarneStatusStr: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusStr'
      Size = 10
      Calculated = True
    end
    object TbAlunosCarneVALORPAGO: TMDOBCDField
      FieldName = 'VALORPAGO'
      Precision = 9
      Size = 2
    end
    object TbAlunosCarnePERCMULTA: TMDOBCDField
      FieldName = 'PERCMULTA'
      Precision = 18
      Size = 2
    end
    object TbAlunosCarneVALORMULTA: TMDOBCDField
      FieldName = 'VALORMULTA'
      Precision = 9
      Size = 2
    end
    object TbAlunosCarnePERCDESC: TMDOBCDField
      FieldName = 'PERCDESC'
      Precision = 18
      Size = 2
    end
    object TbAlunosCarneVALORDESC: TMDOBCDField
      FieldName = 'VALORDESC'
      Precision = 9
      Size = 2
    end
  end
  object DSAlunosCarne: TDataSource
    DataSet = TbAlunosCarne
    Left = 288
    Top = 145
  end
  object DSAlunosAval: TDataSource
    DataSet = TbAlunosAval
    Left = 288
    Top = 173
  end
  object TbAlunosAval: TMDODataSet
    Database = Dados.Database
    OnCalcFields = TbAlunosAvalCalcFields
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAlunos
    DeleteSQL.Strings = (
      'DELETE FROM ALUNOSAVAL'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  PERIODO = :OLD_PERIODO')
    InsertSQL.Strings = (
      'INSERT INTO ALUNOSAVAL'
      '  (CODALUNO, PERIODO, COMP, HIG, ATE, ASD, DM)'
      'VALUES'
      '  (:CODALUNO, :PERIODO, :COMP, :HIG, :ATE, :ASD, :DM)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ALUNOSAVAL'
      'SET'
      '  CODALUNO = :CODALUNO,'
      '  PERIODO = :PERIODO,'
      '  COMP = :COMP,'
      '  HIG = :HIG,'
      '  ATE = :ATE,'
      '  ASD = :ASD,'
      '  DM = :DM'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  PERIODO = :OLD_PERIODO')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODALUNO,'
      '  PERIODO,'
      '  COMP,'
      '  HIG,'
      '  ATE,'
      '  ASD,'
      '  DM'
      'FROM ALUNOSAVAL '
      'WHERE'
      '  CODALUNO = :CODALUNO AND'
      '  PERIODO = :PERIODO')
    SelectSQL.Strings = (
      'Select * from ALUNOSAVAL'
      'Where CODALUNO = :CODALUNO'
      '')
    Left = 260
    Top = 173
    object TbAlunosAvalCODALUNO: TIntegerField
      FieldName = 'CODALUNO'
      Required = True
    end
    object TbAlunosAvalPERIODO: TMDOStringField
      FieldName = 'PERIODO'
      Required = True
      Size = 10
    end
    object TbAlunosAvalCOMP: TSmallintField
      FieldName = 'COMP'
    end
    object TbAlunosAvalHIG: TSmallintField
      FieldName = 'HIG'
    end
    object TbAlunosAvalATE: TSmallintField
      FieldName = 'ATE'
    end
    object TbAlunosAvalASD: TSmallintField
      FieldName = 'ASD'
    end
    object TbAlunosAvalDM: TSmallintField
      FieldName = 'DM'
    end
    object TbAlunosAvalComportamento: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'Comportamento'
      Size = 25
      Calculated = True
    end
    object TbAlunosAvalHigiene: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'Higiene'
      Size = 25
      Calculated = True
    end
    object TbAlunosAvalAtencao: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'Atencao'
      Size = 25
      Calculated = True
    end
    object TbAlunosAvalAssiduidade: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'Assiduidade'
      Size = 25
      Calculated = True
    end
    object TbAlunosAvalDesenMot: TStringField
      DisplayWidth = 25
      FieldKind = fkCalculated
      FieldName = 'DesenMot'
      Size = 25
      Calculated = True
    end
  end
  object DSAlunosSai: TDataSource
    DataSet = TbAlunosAv
    Left = 352
    Top = 173
  end
  object DSAlunosTrat: TDataSource
    DataSet = TbAlunosTrat
    Left = 352
    Top = 145
  end
  object TbAlunosAv: TMDODataSet
    Database = Dados.Database
    OnCalcFields = TbAlunosAvCalcFields
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAlunos
    DeleteSQL.Strings = (
      'DELETE FROM ALUNOSAVISO'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODAVISO = :OLD_CODAVISO')
    InsertSQL.Strings = (
      'INSERT INTO ALUNOSAVISO'
      '  (STATUS, CODALUNO, CODAVISO, DTHRINS, DTSAI, HRSAI, MOTIVO)'
      'VALUES'
      
        '  (:STATUS, :CODALUNO, :CODAVISO, :DTHRINS, :DTSAI, :HRSAI, :MOT' +
        'IVO)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ALUNOSAVISO'
      'SET'
      '  STATUS = :STATUS,'
      '  CODALUNO = :CODALUNO,'
      '  CODAVISO = :CODAVISO,'
      '  DTHRINS = :DTHRINS,'
      '  DTSAI = :DTSAI,'
      '  HRSAI = :HRSAI,'
      '  MOTIVO = :MOTIVO'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO AND'
      '  CODAVISO = :OLD_CODAVISO')
    RefreshSQL.Strings = (
      'SELECT '
      '  STATUS,'
      '  CODALUNO,'
      '  CODAVISO,'
      '  DTHRINS,'
      '  DTSAI,'
      '  HRSAI,'
      '  MOTIVO'
      'FROM ALUNOSAVISO '
      'WHERE'
      '  CODALUNO = :CODALUNO AND'
      '  CODAVISO = :CODAVISO'
      'ORDER BY STATUS DESC, DTSAI, HRSAI')
    SelectSQL.Strings = (
      'Select * from ALUNOSAVISO'
      'Where CODALUNO = :CODALUNO'
      'ORDER BY STATUS DESC, DTSAI, HRSAI'
      '')
    Left = 324
    Top = 173
    object TbAlunosAvCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
      Required = True
    end
    object TbAlunosAvCODAVISO: TSmallintField
      FieldName = 'CODAVISO'
      Required = True
    end
    object TbAlunosAvDTHRINS: TDateTimeField
      FieldName = 'DTHRINS'
    end
    object TbAlunosAvDTSAI: TDateField
      FieldName = 'DTSAI'
      EditMask = '99/99/9999;1;_'
    end
    object TbAlunosAvHRSAI: TTimeField
      FieldName = 'HRSAI'
      DisplayFormat = 'hh:mm'
    end
    object TbAlunosAvMOTIVO: TMemoField
      FieldName = 'MOTIVO'
      BlobType = ftMemo
      Size = 8
    end
    object TbAlunosAvSTATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object TbAlunosAvStatusSTR: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusSTR'
      Calculated = True
    end
  end
  object TbAlunosTrat: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DSAlunos
    DeleteSQL.Strings = (
      'DELETE FROM ALUNOSTRAT'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO')
    InsertSQL.Strings = (
      'INSERT INTO ALUNOSTRAT'
      '  (CODALUNO, CODTRATAMENTO)'
      'VALUES'
      '  (:CODALUNO, :CODTRATAMENTO)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE ALUNOSTRAT'
      'SET'
      '  CODALUNO = :CODALUNO,'
      '  CODTRATAMENTO = :CODTRATAMENTO'
      'WHERE'
      '  CODALUNO = :OLD_CODALUNO')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODALUNO,'
      '  CODTRATAMENTO'
      'FROM ALUNOSTRAT '
      'WHERE'
      '  CODALUNO = :CODALUNO')
    SelectSQL.Strings = (
      'Select * from ALUNOSTRAT'
      'Where CODALUNO = :CODALUNO'
      '')
    Left = 324
    Top = 145
    object TbAlunosTratCODALUNO: TSmallintField
      FieldName = 'CODALUNO'
      Required = True
    end
    object TbAlunosTratCODTRATAMENTO: TSmallintField
      FieldName = 'CODTRATAMENTO'
      Required = True
    end
    object TbAlunosTratTrat: TStringField
      FieldKind = fkLookup
      FieldName = 'Trat'
      LookupDataSet = Dados.QryTratLK
      LookupKeyFields = 'CODTRAT'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODTRATAMENTO'
      Size = 100
      Lookup = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 448
    Top = 168
    object IMAberto: TMenuItem
      Caption = 'Aberto'
      OnClick = IMAbertoClick
    end
    object IMConcluido: TMenuItem
      Caption = 'Conclu'#237'do'
      OnClick = IMAbertoClick
    end
  end
end
