inherited fmSysParam: TfmSysParam
  Left = 488
  Top = 224
  HelpContext = 6
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1080#1089#1090#1077#1084#1099
  ClientHeight = 273
  ClientWidth = 523
  Font.Height = -15
  Position = poMainFormCenter
  ExplicitWidth = 549
  ExplicitHeight = 322
  PixelsPerInch = 96
  TextHeight = 16
  inherited Bevel: TBevel
    Width = 379
    Height = 273
    ExplicitLeft = 8
    ExplicitWidth = 379
    ExplicitHeight = 257
  end
  object lbFontSize: TcxLabel [1]
    Left = 8
    Top = 13
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #1056#1072#1079#1084#1077#1088' '#1064#1088#1080#1092#1090#1072
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Height = 25
    Width = 291
    AnchorX = 299
    AnchorY = 26
  end
  inherited btOk: TcxButton
    Left = 394
    Top = 9
    Width = 121
    Anchors = [akTop, akRight]
    TabOrder = 2
    ParentFont = True
    ExplicitLeft = 394
    ExplicitTop = 9
    ExplicitWidth = 121
  end
  inherited btCancel: TcxButton
    Left = 394
    Top = 40
    Width = 121
    Anchors = [akTop, akRight]
    TabOrder = 6
    ParentFont = True
    ExplicitLeft = 394
    ExplicitTop = 40
    ExplicitWidth = 121
  end
  object edFontSize: TcxSpinEdit
    Left = 305
    Top = 13
    Anchors = [akTop, akRight]
    Properties.LargeIncrement = 1.000000000000000000
    Properties.MaxValue = 12.000000000000000000
    Properties.MinValue = 8.000000000000000000
    TabOrder = 0
    Value = 8
    Width = 65
  end
  object lbTempDir: TcxLabel
    Left = 8
    Top = 152
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #1050#1072#1090#1072#1083#1086#1075' '#1076#1083#1103' '#1074#1088#1077#1084#1077#1085#1085#1099#1093' '#1092#1072#1081#1083#1086#1074
    Properties.Alignment.Vert = taVCenter
    Height = 25
    Width = 363
    AnchorY = 165
  end
  object lbThousandSeparator: TcxLabel
    Left = 8
    Top = 46
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1075#1088#1091#1087#1087' '#1088#1072#1079#1088#1103#1076#1086#1074
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Height = 25
    Width = 291
    AnchorX = 299
    AnchorY = 59
  end
  object edTempDir: TcxShellComboBox
    Left = 8
    Top = 176
    Anchors = [akLeft, akTop, akRight]
    Properties.Root.BrowseFolder = bfCustomPath
    Properties.ShowFullPath = sfpAlways
    TabOrder = 1
    Width = 362
  end
  object edBeaconInterval: TcxSpinEdit
    Left = 305
    Top = 77
    Anchors = [akTop, akRight]
    Properties.LargeIncrement = 1.000000000000000000
    Properties.MaxValue = 60.000000000000000000
    Properties.MinValue = 3.000000000000000000
    TabOrder = 7
    Value = 3
    Width = 65
  end
  object chbBeaconInterval: TcxCheckBox
    Left = 8
    Top = 78
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #1080#1085#1090#1077#1088#1074#1072#1083' '#1086#1087#1088#1086#1089#1072' '#1089#1077#1088#1074#1077#1088#1072', '#1084#1080#1085#1091#1090
    Properties.OnEditValueChanged = chbBeaconIntervalPropertiesEditValueChanged
    TabOrder = 8
    Height = 25
    Width = 291
  end
  object cbThousandSeparator: TcxComboBox
    Left = 305
    Top = 45
    Anchors = [akTop, akRight]
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      ' '
      ','
      #39)
    TabOrder = 9
    Text = ' '
    Width = 65
  end
  object chbRequestAutoRefresh: TcxCheckBox
    Left = 8
    Top = 111
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #1072#1074#1090#1086#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1089#1087#1080#1089#1082#1072' '#1079#1072#1103#1074#1086#1082', '#1084#1080#1085
    Properties.Alignment = taLeftJustify
    Properties.OnEditValueChanged = chbRequestAutoRefreshPropertiesEditValueChanged
    TabOrder = 10
    Height = 25
    Width = 291
  end
  object edRequestAutoRefresh: TcxSpinEdit
    Left = 305
    Top = 111
    Anchors = [akTop, akRight]
    Properties.LargeIncrement = 1.000000000000000000
    Properties.MaxValue = 60.000000000000000000
    Properties.MinValue = 1.000000000000000000
    TabOrder = 11
    Value = 1
    Width = 65
  end
  object cbOffice: TcxComboBox
    Left = 8
    Top = 233
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      'Microsoft Office'
      'WPS Office')
    TabOrder = 12
    Text = 'Microsoft Office'
    Width = 362
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 209
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = #1054#1092#1080#1089':'
    Properties.Alignment.Vert = taVCenter
    Height = 25
    Width = 363
    AnchorY = 222
  end
end
