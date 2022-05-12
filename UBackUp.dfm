object FBackUp: TFBackUp
  Left = 214
  Top = 130
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Backup'
  ClientHeight = 89
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 470
    Height = 89
    Align = alClient
    AutoSize = True
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 93
      Height = 13
      Caption = 'Progresso da C'#243'pia'
    end
    object AbMeter1: TAbMeter
      Left = 8
      Top = 35
      Width = 457
      Height = 16
      Orientation = moHorizontal
      UnusedColor = clBtnFace
      UsedColor = clNavy
    end
    object BitBtn1: TBitBtn
      Left = 168
      Top = 57
      Width = 117
      Height = 25
      Caption = 'Gerar Backup'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
        00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
        00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
        00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
        00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
        0003737FFFFFFFFF7F7330099999999900333777777777777733}
      NumGlyphs = 2
    end
  end
  object AbVCLMeterLink1: TAbVCLMeterLink
    Meter = AbMeter1
    Left = 160
    Top = 8
  end
  object AbZipKit1: TAbZipKit
    ArchiveProgressMeter = AbMeter1
    AutoSave = False
    DOSMode = False
    ExtractOptions = []
    ItemProgressMeter = AbVCLMeterLink1
    Logging = True
    StoreOptions = [soStripDrive, soStripPath, soRemoveDots, soRecurse, soFreshen, soReplace]
    Left = 128
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Arquivos ZIP|*.ZIP'
    Left = 200
    Top = 8
  end
end
