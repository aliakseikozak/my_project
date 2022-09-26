inherited fmEducationAdd: TfmEducationAdd
  Caption = #1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
  ClientHeight = 206
  ClientWidth = 428
  Position = poMainFormCenter
  ExplicitWidth = 444
  ExplicitHeight = 245
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 165
    Width = 428
    Height = 41
    Align = alBottom
    TabOrder = 4
    DesignSize = (
      428
      41)
    object btnOk: TButton
      Tag = 6
      Left = 164
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
      Left = 330
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
    Width = 428
    Height = 165
    Align = alClient
    TabOrder = 5
    object cxDateEdit2: TcxDateEdit
      Left = 140
      Top = 37
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
      Width = 121
    end
    object cxDateEdit1: TcxDateEdit
      Left = 287
      Top = 37
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 123
    end
    object cxLookupComboBox3: TcxLookupComboBox
      Left = 140
      Top = 91
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
          FieldName = 'name'
        end>
      Properties.ListSource = dsProfession
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 4
      Width = 270
    end
    object Edit1: TEdit
      Left = 142
      Top = 12
      Width = 268
      Height = 17
      BorderStyle = bsNone
      TabOrder = 0
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 140
      Top = 64
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1057#1090#1091#1087#1077#1085#1100' '#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103
          FieldName = 'name'
        end>
      Properties.ListSource = dsType
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 3
      Width = 270
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1086#1073#1091#1095#1077#1085#1080#1103' '#1089':'
      Control = cxDateEdit2
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      AlignVert = avClient
      CaptionOptions.Text = #1087#1086':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1055#1088#1086#1092#1077#1089#1089#1080#1103':'
      Control = cxLookupComboBox3
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1059#1095#1077#1073#1085#1086#1077' '#1091#1095#1088#1077#1078#1076#1077#1085#1080#1077':'
      Control = Edit1
      Index = 0
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = 'C'#1090#1091#1087#1077#1085#1080' '#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103':'
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
  object dsOrganization: TDataSource
    Left = 208
    Top = 125
  end
  object dsProfession: TDataSource
    Left = 136
    Top = 133
  end
  object dsType: TDataSource
    Left = 360
    Top = 125
  end
end
