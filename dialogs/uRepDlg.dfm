inherited fmRepDlg: TfmRepDlg
  Left = 892
  Top = 98
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1077#1090#1099
  ClientHeight = 150
  ClientWidth = 376
  Position = poScreenCenter
  ExplicitWidth = 382
  ExplicitHeight = 179
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 281
    Height = 137
    Shape = bsFrame
  end
  object OKBtn: TButton
    Left = 296
    Top = 8
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 296
    Top = 40
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object rbAllObjects: TRadioButton
    Left = 16
    Top = 48
    Width = 265
    Height = 25
    Caption = #1055#1086' '#1074#1089#1077#1084' '#1086#1073#1098#1077#1082#1090#1072#1084
    TabOrder = 2
  end
  object rbSelObject: TRadioButton
    Left = 16
    Top = 16
    Width = 265
    Height = 25
    Caption = #1055#1086' '#1072#1082#1090#1080#1074#1085#1086#1084#1091' '#1086#1073#1098#1077#1082#1090#1091
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object cbSave: TCheckBox
    Left = 16
    Top = 80
    Width = 265
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1074' '#1082#1072#1090#1072#1083#1086#1075
    Checked = True
    State = cbChecked
    TabOrder = 4
  end
end
