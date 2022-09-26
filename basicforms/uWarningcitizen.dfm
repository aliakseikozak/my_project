object fmWarningcitizen: TfmWarningcitizen
  Left = 0
  Top = 0
  Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
  ClientHeight = 142
  ClientWidth = 350
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 101
    Width = 350
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = -438
    ExplicitTop = 244
    ExplicitWidth = 912
    DesignSize = (
      350
      41)
    object btnOk: TButton
      Tag = 6
      Left = 76
      Top = 6
      Width = 160
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ImageIndex = 14
      Images = Resource.ImageList
      TabOrder = 0
      ExplicitLeft = 638
    end
    object btnCancel: TButton
      Left = 242
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 16
      Images = Resource.ImageList
      TabOrder = 1
      ExplicitLeft = 804
    end
  end
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 350
    Height = 101
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -438
    ExplicitTop = 45
    ExplicitWidth = 912
    ExplicitHeight = 194
    object cxDateEdit1: TcxDateEdit
      Left = 111
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 121
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 111
      Top = 64
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          FieldName = 'name'
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 223
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 111
      Top = 37
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          FieldName = 'name'
        end>
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
      Width = 223
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1044#1072#1090#1072' '#1086#1087#1086#1074#1077#1097#1077#1085#1080#1103':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = #1053#1072#1095#1072#1083#1100#1085#1080#1082':'
      Control = cxLookupComboBox1
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1056#1054#1042#1044':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
end
