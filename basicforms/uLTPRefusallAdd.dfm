inherited fmLTPRefusallAdd: TfmLTPRefusallAdd
  Caption = #1054#1090#1082#1072#1079' '#1074' '#1087#1088#1080#1077#1084#1077' '#1074' '#1051#1058#1055
  ClientHeight = 145
  ClientWidth = 460
  Position = poMainFormCenter
  ExplicitWidth = 476
  ExplicitHeight = 184
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 460
    Height = 104
    Align = alClient
    TabOrder = 4
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 212
      Top = 37
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1055#1088#1080#1095#1080#1085#1072
          FieldName = 'name'
        end>
      Properties.ListSource = dsViolations
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
      Width = 223
    end
    object cxDateEdit1: TcxDateEdit
      Left = 212
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 121
    end
    object cxDateEdit2: TcxDateEdit
      Left = 212
      Top = 64
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 121
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1055#1088#1080#1095#1080#1085#1072' '#1086#1090#1082#1072#1079#1072':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1044#1072#1090#1072' '#1086#1090#1082#1072#1079#1072':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1074' '#1089#1091#1076':'
      Control = cxDateEdit2
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 104
    Width = 460
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      460
      41)
    object btnOk: TButton
      Tag = 6
      Left = 186
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
      Left = 352
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
  object dsViolations: TDataSource
    Left = 48
    Top = 88
  end
end
