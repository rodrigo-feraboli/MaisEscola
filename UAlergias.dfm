object FAlergias: TFAlergias
  Left = 435
  Top = 203
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Alergias'
  ClientHeight = 363
  ClientWidth = 574
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
    Width = 574
    Height = 107
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvSpace
    Color = 2025694
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object SBRefresh: TSpeedButton
      Left = 243
      Top = 37
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
      Top = 37
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
      Top = 37
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
      Top = 37
      Width = 32
      Height = 32
      Hint = 'Anterior'
      Flat = True
      Margin = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = SBFirstClick
    end
    object SBBusca: TSpeedButton
      Left = 513
      Top = 3
      Width = 59
      Height = 101
      Hint = 'Busca Avan'#231'ada de Alergias'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        36060000424D3606000000000000360200002800000020000000200000000100
        08000000000000040000C40E0000C40E000080000000800000004F000000F4CC
        CC00C0C4C400A8ADAD00999999007C7D7D005C626200FFFFFF00D6D6D600BDAB
        AB0071464600B69191009C7F7F0099666600F7F0F000CDACAC00E6D6D600812A
        2A00D6C4C400D6939300F6E8E800E6E6E600D1BBBB005F212100A5A5A5007373
        73009C4B4B0090787800C6848400ACB3B300CCCCCC00CC999900D6DEDE00F8DE
        DE00E7C5C500E7AEAE00A86A6A0099999900B88585007E6E6E00751A1A00F6F6
        F600EFEFEF007B232300EBBFBF00BDBDBD00838383008D8C8C00D4A6A600785E
        5E00E6BEBE00853A3A00AAA3A300DFACAC00E9DFDF00C17B7B00F8D4D4009A5A
        5A00E8CECE006311110099999900B4AFAF00B46464008E6D6D00AD707000E1CC
        CC00E0BDBD0066333300D08B8B0066666600FEE6E600C3A8A800E4B7B700AA9A
        9A00EEE4E400C5C5C500FFEEEE00AEAEAE00CAB6B6009B515100B98B8B00FFF7
        F700FEDEDE00DB9A9A00852F2F008A878700BBB8B800FED6D600AF7B7B00B56B
        6B008A5C5C00DEB2B2007753530086898900EED0D0008E3A3A00DBC4C400F0C5
        C500ECDDDD00EED8D800682727008472720096757500FFCCCC00DBA5A500D7AF
        AF00B576760066666600F0B6B600B5B5B500DED6D600C9B9B900DEDEDE00A498
        9800CEC4C40094888800807E7E00CE87870066666600A3636300A3939300B49A
        9A0091828200D7BCBC00C5B5B500B9A7A7008A3131007C4C4C00070707070707
        0707070707070707070707070707070707070707070707070707070707070707
        0707070707154A4A142A07070707070707070707070707070707070707070707
        070729081021015B3532634A2A07070707070707070707070707070707070707
        2A4B71104C60660A173B33374208070707070707070707070707070707070708
        187A630E4D04181D1D7343005F6812070707072A2A0707070707070707071E04
        716907030418034D6D0202737F5861122D18040404043D2A070707070708044B
        4F07080403033D6D2D2D4B1E56711621782F55275A6A6A4062070707292F1E39
        500718186D4D6D2D02021E1E084B2D2A143F643E6C6C4477470707074B04604F
        3A10046D566D2D4B1E1E080808701E080748285F1C595F1141070707182D421F
        5E6F0402025602021E0870707070156D10512277547E2B50070707152F564142
        3209184B4B2D4B1E08701515151570553D140730281A0F07070707702F04625E
        3579031E1E2D4B1E0870152A2A292D19344151263360070707070715042F514A
        13794D1E1E4B4B0808152A2907152E740816385E14070707070707073D2F0714
        750B031E081E1E1E70152A07702F196D2A72424C0707070707070707702F074C
        4426030808081E087015706D2E191815701E0F52070707070707070707021451
        681C2F4B080802026D182E191918151508084761070707070707070707291451
        2C53455D566D0419194545746D15150808087D1F0E0707070707070707075151
        63230C064D4D18194574181E707008081E1E49773A070707070707070707514C
        462C30191802025618020808081E1E1E4B4B7133690707070707070707070746
        4638617D18080870080202021E4B4B4B2D02783B1F0707070707070707070746
        46523822042D7008084B562D2D2D2D2D562D7A3B300707070707070707070751
        525252524E044B700808026D6D6D6D6D4D6D65335B0707070707070707070707
        46575746467D041E0808084B4D4D4D4D18033177320707070707070707070707
        515757574C463404020808081E6D031818185C373A0707070707070707070707
        074C5767525114342F4D1E08081E4B4B56740D130E0707070707070707070707
        0707466767210751565555186D6D6D032F1B6822070707070707070707070707
        070707212353220707364D557474745579482C07070707070707070707070707
        07070707631C3E1C4A07070E1060415E385E5107070707070707070707070707
        07070707070E1F1A7E407B1451514C4C4C070707070707070707070707070707
        070707070707076224282B584114510707070707070707070707070707070707
        0707070707070707070707070707070707070707070707070707070707070707
        0707070707070707070707070707070707070707070707070707}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SBBuscaClick
    end
    object Label1: TLabel
      Left = 312
      Top = 7
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
      Left = 288
      Top = 80
      Width = 197
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
    object SBFirst: TSpeedButton
      Left = 123
      Top = 37
      Width = 32
      Height = 32
      Hint = 'Primeiro'
      Flat = True
      Margin = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = SBFirstClick
    end
    object SBNovo: TSpeedButton
      Left = 3
      Top = 3
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
      Top = 28
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
      Top = 53
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
      Top = 78
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
    object RBCodigo: TRadioButton
      Left = 312
      Top = 23
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
      Left = 312
      Top = 39
      Width = 68
      Height = 17
      Caption = 'Descri'#231#227'o'
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
      Left = 309
      Top = 56
      Width = 189
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
  object Panel2: TPanel
    Left = 0
    Top = 107
    Width = 574
    Height = 256
    Align = alClient
    BevelInner = bvLowered
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 2
      Width = 570
      Height = 233
      Align = alClient
      Color = clSilver
      DataSource = DSAlergias
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = SBAlterarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CODALERGIA'
          Title.Caption = 'C'#243'digo'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 400
          Visible = True
        end>
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 235
      Width = 570
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
    Left = 72
    Top = 114
    Width = 576
    Height = 257
    BevelInner = bvLowered
    BevelOuter = bvSpace
    Color = 2025694
    TabOrder = 2
    Visible = False
    object SpeedButton6: TSpeedButton
      Left = 352
      Top = 228
      Width = 90
      Height = 25
      Caption = 'OK'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object SpeedButton7: TSpeedButton
      Left = 448
      Top = 228
      Width = 90
      Height = 25
      Caption = 'Cancelar'
      Flat = True
      OnClick = SpeedButton6Click
    end
    object DBGrid2: TDBGrid
      Left = 2
      Top = 2
      Width = 572
      Height = 223
      Align = alTop
      Color = 8304766
      DataSource = DSAlergias
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
          FieldName = 'CODALERGIA'
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
          FieldName = 'DESCRICAO'
          Title.Caption = 'Descri'#231#227'o'
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
    Left = 104
    Top = 160
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Sinttico1: TMenuItem
        Caption = 'Sint'#233'tico'
        OnClick = Sinttico1Click
      end
    end
  end
  object DSAlergias: TDataSource
    DataSet = TbAlergias
    OnDataChange = DSAlergiasDataChange
    Left = 136
    Top = 97
  end
  object TbAlergias: TMDODataSet
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM aleRGIAS'
      'WHERE'
      '  CODALERGIA = :OLD_CODALERGIA')
    InsertSQL.Strings = (
      'INSERT INTO aleRGIAS'
      '  (CODALERGIA, DESCRICAO)'
      'VALUES'
      '  (:CODALERGIA, :DESCRICAO)')
    LoadDefaults = False
    ModifySQL.Strings = (
      'UPDATE aleRGIAS'
      'SET'
      '  CODALERGIA = :CODALERGIA,'
      '  DESCRICAO = :DESCRICAO'
      'WHERE'
      '  CODALERGIA = :OLD_CODALERGIA')
    RefreshSQL.Strings = (
      'SELECT '
      '  CODALERGIA,'
      '  DESCRICAO'
      'FROM aleRGIAS '
      'WHERE'
      '  CODALERGIA = :CODALERGIA')
    SelectSQL.Strings = (
      'Select * from ALERGIAS')
    Left = 56
    Top = 112
    object TbAlergiasCODALERGIA: TSmallintField
      FieldName = 'CODALERGIA'
      Required = True
    end
    object TbAlergiasDESCRICAO: TMDOStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 100
    end
  end
  object Trans: TMDOTransaction
    Active = False
    AutoCommit = False
    DefaultAction = TACommitRetaining
    DefaultDatabase = Dados.Database
    Left = 24
    Top = 112
  end
  object QryProx: TMDOQuery
    Database = Dados.Database
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    LoadDefaults = False
    Left = 40
    Top = 147
  end
end
