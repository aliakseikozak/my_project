object frmProgressBar: TfrmProgressBar
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074'...'
  ClientHeight = 62
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 1
    Width = 160
    Height = 13
    Caption = #1048#1076#1077#1090' '#1079#1072#1075#1088#1091#1079#1082#1072' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1086#1074'...'
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 20
    Width = 403
    Height = 42
    Align = alBottom
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 360
    Top = 8
  end
end
