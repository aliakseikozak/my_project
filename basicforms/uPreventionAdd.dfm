inherited fmPreventionAdd: TfmPreventionAdd
  Caption = #1055#1088#1086#1092#1080#1083#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1088#1072#1073#1086#1090#1072
  ClientHeight = 217
  ClientWidth = 442
  Position = poMainFormCenter
  ExplicitWidth = 458
  ExplicitHeight = 256
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 176
    Width = 442
    Height = 41
    Align = alBottom
    TabOrder = 4
    DesignSize = (
      442
      41)
    object btnOk: TButton
      Tag = 6
      Left = 168
      Top = 6
      Width = 160
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ImageIndex = 14
      Images = Resource.ImageList
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 334
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 16
      Images = Resource.ImageList
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object dxLayoutControl1: TdxLayoutControl [1]
    Left = 0
    Top = 0
    Width = 442
    Height = 176
    Align = alClient
    TabOrder = 5
    object cxDateEdit1: TcxDateEdit
      Left = 148
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 121
    end
    object cxTextEdit3: TcxTextEdit
      Left = 148
      Top = 37
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 148
      Top = 91
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1043#1088#1072#1078#1076#1072#1085#1080#1085
          FieldName = 'name'
        end>
      Properties.ListSource = dsFamily
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 3
      Width = 223
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 148
      Top = 64
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1057' '#1082#1077#1084' '#1087#1088#1086#1074#1077#1076#1077#1085#1072' '#1073#1077#1089#1077#1076#1072
          FieldName = 'name'
        end>
      Properties.ListSource = dsConversation
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
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
      CaptionOptions.Text = #1044#1072#1090#1072' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1073#1077#1089#1077#1076#1099':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103':'
      Control = cxTextEdit3
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = #1057#1077#1084#1100#1103' '#1075#1088#1072#1078#1076#1072#1085#1080#1085#1072':'
      Control = cxLookupComboBox1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1057' '#1082#1077#1084' '#1087#1088#1086#1074#1077#1076#1077#1085#1072' '#1073#1077#1089#1077#1076#1072':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarManagerMainMenu: TdxBar
      Visible = False
    end
    inherited BarManagerMainBar: TdxBar
      Visible = False
    end
  end
  object dsFamily: TDataSource
    Left = 304
    Top = 37
  end
  object dsConversation: TDataSource
    Left = 376
    Top = 37
  end
end
