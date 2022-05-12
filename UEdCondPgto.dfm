object FEdCondPgto: TFEdCondPgto
  Left = 435
  Top = 161
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Edi'#231#227'o da Condi'#231#227'o de Pagamento'
  ClientHeight = 276
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
    Height = 221
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
    object Label3: TLabel
      Left = 39
      Top = 80
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Prazo 1'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 151
      Top = 80
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Prazo 2'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 39
      Top = 112
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Prazo 3'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 151
      Top = 112
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Prazo 4'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 39
      Top = 144
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Prazo 5'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 151
      Top = 144
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Prazo 6'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 39
      Top = 176
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Prazo 7'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 151
      Top = 176
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Prazo 8'
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
      DataField = 'CODCONDPGTO'
      DataSource = FCondPgto.DSCondPgto
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 79
      Top = 45
      Width = 362
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = FCondPgto.DSCondPgto
      TabOrder = 1
      OnExit = DBEdit2Exit
    end
    object DBEdit3: TDBEdit
      Left = 79
      Top = 77
      Width = 50
      Height = 21
      DataField = 'PRAZO1'
      DataSource = FCondPgto.DSCondPgto
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 191
      Top = 77
      Width = 50
      Height = 21
      DataField = 'PRAZO2'
      DataSource = FCondPgto.DSCondPgto
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 79
      Top = 109
      Width = 50
      Height = 21
      DataField = 'PRAZO3'
      DataSource = FCondPgto.DSCondPgto
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 191
      Top = 109
      Width = 50
      Height = 21
      DataField = 'PRAZO4'
      DataSource = FCondPgto.DSCondPgto
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 79
      Top = 141
      Width = 50
      Height = 21
      DataField = 'PRAZO5'
      DataSource = FCondPgto.DSCondPgto
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 191
      Top = 141
      Width = 50
      Height = 21
      DataField = 'PRAZO6'
      DataSource = FCondPgto.DSCondPgto
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 79
      Top = 173
      Width = 50
      Height = 21
      DataField = 'PRAZO7'
      DataSource = FCondPgto.DSCondPgto
      TabOrder = 8
    end
    object DBEdit10: TDBEdit
      Left = 191
      Top = 173
      Width = 50
      Height = 21
      DataField = 'PRAZO8'
      DataSource = FCondPgto.DSCondPgto
      TabOrder = 9
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 221
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
