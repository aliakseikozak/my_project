inherited fmLTPExtensionAdd: TfmLTPExtensionAdd
  Caption = #1055#1088#1086#1076#1083#1077#1085#1080#1077' '#1087#1088#1077#1073#1099#1074#1072#1085#1080#1103
  ClientHeight = 145
  ClientWidth = 449
  Position = poMainFormCenter
  ExplicitWidth = 465
  ExplicitHeight = 184
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 449
    Height = 104
    Align = alClient
    TabOrder = 4
    object cxTextEdit3: TcxTextEdit
      Left = 166
      Top = 64
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
      Width = 268
    end
    object cxDateEdit1: TcxDateEdit
      Left = 166
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 121
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 166
      Top = 37
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1057' '#1082#1077#1084' '#1087#1088#1086#1074#1077#1076#1077#1085#1072' '#1073#1077#1089#1077#1076#1072
          FieldName = 'name'
        end>
      Properties.ListSource = dsPeriodltpreason
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
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1088#1077#1096#1077#1085#1080#1080' '#1089#1091#1076#1072':'
      Control = cxTextEdit3
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1044#1072#1090#1072' '#1087#1088#1086#1076#1083#1077#1085#1080#1103':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1055#1088#1080#1095#1080#1085#1072' '#1087#1088#1086#1076#1083#1077#1085#1080#1103':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 104
    Width = 449
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      449
      41)
    object btnOk: TButton
      Tag = 6
      Left = 175
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
      Left = 341
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
      DockedTop = 0
      Visible = False
    end
  end
  object dsPeriodltpreason: TDataSource
    Left = 80
    Top = 96
  end
end
