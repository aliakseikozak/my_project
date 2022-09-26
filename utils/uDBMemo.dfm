object fmDBMemo: TfmDBMemo
  Left = 591
  Top = 46
  Width = 395
  Height = 169
  Caption = 'fmDBMemo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object memBase: TDBMemo
    Left = 0
    Top = 0
    Width = 379
    Height = 90
    Align = alClient
    TabOrder = 0
  end
  object pnBase: TPanel
    Left = 0
    Top = 90
    Width = 379
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      379
      41)
    object btCancel: TBitBtn
      Left = 295
      Top = 8
      Width = 73
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 0
      OnClick = btClick
      Kind = bkCancel
    end
    object btOK: TBitBtn
      Left = 215
      Top = 8
      Width = 73
      Height = 25
      Anchors = [akRight, akBottom]
      TabOrder = 1
      OnClick = btClick
      Kind = bkOK
    end
  end
end
