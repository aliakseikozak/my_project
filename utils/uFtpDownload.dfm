object fmFtpDownload: TfmFtpDownload
  Left = 288
  Top = 190
  BorderStyle = bsDialog
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1092#1072#1081#1083#1072
  ClientHeight = 216
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 72
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 40
    Width = 369
    Height = 17
    TabOrder = 0
  end
  object Button1: TButton
    Left = 152
    Top = 96
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 1
    TabOrder = 1
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Interval = 300
    OnTimer = Timer1Timer
    Left = 248
    Top = 96
  end
  object IdFTP1: TIdFTP
    OnWork = IdFTP1Work
    OnWorkEnd = IdFTP1WorkEnd
    IPVersion = Id_IPv4
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 88
    Top = 96
  end
end
