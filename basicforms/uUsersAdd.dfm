inherited fmUsersAdd: TfmUsersAdd
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  ClientHeight = 520
  ClientWidth = 529
  Position = poMainFormCenter
  ExplicitWidth = 545
  ExplicitHeight = 559
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl2: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 529
    Height = 479
    Align = alClient
    TabOrder = 4
    ExplicitWidth = 403
    ExplicitHeight = 201
    object Edit1: TEdit
      Left = 140
      Top = 12
      Width = 119
      Height = 17
      BorderStyle = bsNone
      TabOrder = 0
    end
    object Edit4: TEdit
      Left = 140
      Top = 93
      Width = 119
      Height = 17
      BorderStyle = bsNone
      TabOrder = 4
    end
    object Edit6: TEdit
      Left = 140
      Top = 147
      Width = 119
      Height = 17
      BorderStyle = bsNone
      TabOrder = 6
    end
    object Edit5: TEdit
      Left = 140
      Top = 174
      Width = 119
      Height = 17
      BorderStyle = bsNone
      TabOrder = 7
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 138
      Top = 199
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1054#1088#1072#1075#1080#1085#1079#1072#1094#1080#1103
          FieldName = 'name'
        end>
      Properties.ListSource = dsorganization
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 8
      Width = 223
    end
    object Edit3: TEdit
      Left = 140
      Top = 39
      Width = 119
      Height = 17
      BorderStyle = bsNone
      PasswordChar = '*'
      TabOrder = 1
      OnChange = Edit3Change
      OnKeyPress = Edit3KeyPress
    end
    object Edit2: TEdit
      Left = 140
      Top = 66
      Width = 119
      Height = 17
      BorderStyle = bsNone
      PasswordChar = '*'
      TabOrder = 3
    end
    object Edit7: TEdit
      Left = 140
      Top = 120
      Width = 119
      Height = 17
      BorderStyle = bsNone
      TabOrder = 5
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 138
      Top = 226
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
          FieldName = 'name'
        end>
      Properties.ListSource = dsdepartment
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 9
      Width = 223
    end
    object cxLookupComboBox3: TcxLookupComboBox
      Left = 138
      Top = 253
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          FieldName = 'name'
        end>
      Properties.ListSource = dsPost
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 10
      Width = 223
    end
    object CheckBox1: TCheckBox
      Left = 10
      Top = 280
      Width = 97
      Height = 17
      Caption = #1044#1086#1082#1090#1086#1088
      TabOrder = 11
    end
    object cxLookupComboBox4: TcxLookupComboBox
      Left = 138
      Top = 303
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1057#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
          FieldName = 'name'
        end>
      Properties.ListSource = dsspecialistdoctor
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 12
      Width = 223
    end
    object cxLookupComboBox5: TcxLookupComboBox
      Left = 138
      Top = 384
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1056#1086#1083#1100
          FieldName = 'name'
        end>
      Properties.ListSource = dsRole
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 15
      Width = 223
    end
    object Edit9: TEdit
      Left = 140
      Top = 332
      Width = 221
      Height = 17
      BorderStyle = bsNone
      TabOrder = 13
    end
    object Edit8: TEdit
      Left = 140
      Top = 359
      Width = 221
      Height = 17
      BorderStyle = bsNone
      TabOrder = 14
    end
    object CheckBox2: TCheckBox
      Left = 10
      Top = 411
      Width = 97
      Height = 17
      Caption = #1040#1082#1090#1080#1074#1085#1099#1081
      TabOrder = 16
    end
    object btnPassword: TcxButton
      Left = 267
      Top = 37
      Width = 30
      Height = 20
      OptionsImage.ImageIndex = 85
      PaintStyle = bpsGlyph
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
      Control = Edit1
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088':'
      Control = Edit4
      Index = 3
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1048#1084#1103':'
      Control = Edit6
      Index = 5
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1054#1090#1095#1077#1089#1090#1074#1086':'
      Control = Edit5
      Index = 6
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1055#1072#1088#1086#1083#1100':'
      Control = Edit3
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1055#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077' '#1087#1072#1088#1086#1083#1103':'
      Control = Edit2
      Index = 2
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1060#1072#1084#1080#1083#1080#1103':'
      Control = Edit7
      Index = 4
    end
    object dxLayoutItem12: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
      Control = cxLookupComboBox1
      ControlOptions.ShowBorder = False
      Index = 8
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
      Control = cxLookupComboBox3
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutItem13: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = #1044#1086#1082#1090#1086#1088
      CaptionOptions.Visible = False
      Control = CheckBox1
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 10
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = #1057#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103':'
      Control = cxLookupComboBox4
      ControlOptions.ShowBorder = False
      Index = 11
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = #1056#1086#1083#1100':'
      Control = cxLookupComboBox5
      ControlOptions.ShowBorder = False
      Index = 14
    end
    object dxLayoutItem15: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #1058#1077#1083#1077#1092#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088':'
      Control = Edit9
      Index = 12
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1087#1086#1095#1090#1072':'
      Control = Edit8
      Index = 13
    end
    object dxLayoutItem16: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = 'CheckBox2'
      CaptionOptions.Visible = False
      Control = CheckBox2
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 15
    end
    object dxLayoutItem17: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = btnPassword
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutGroup1
      AlignVert = avTop
      LayoutDirection = ldHorizontal
      Index = 1
      AutoCreated = True
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 479
    Width = 529
    Height = 41
    Align = alBottom
    TabOrder = 5
    ExplicitTop = 201
    ExplicitWidth = 403
    DesignSize = (
      529
      41)
    object btnOk: TButton
      Tag = 6
      Left = 255
      Top = 6
      Width = 160
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ImageIndex = 14
      Images = Resource.ImageList
      TabOrder = 0
      OnClick = btnOkClick
      ExplicitLeft = 129
    end
    object btnCancel: TButton
      Left = 421
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 16
      Images = Resource.ImageList
      TabOrder = 1
      OnClick = btnCancelClick
      ExplicitLeft = 295
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
  inherited ActionList: TActionList
    object actHidePassword: TAction
      Caption = 'actHidePassword'
      Hint = #1057#1082#1088#1099#1090#1100' '#1087#1072#1088#1086#1083#1100
      ImageIndex = 84
      OnExecute = actHidePasswordExecute
    end
    object actShowPassword: TAction
      Caption = 'actShowPassword'
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1072#1088#1086#1083#1100
      ImageIndex = 85
      OnExecute = actShowPasswordExecute
    end
  end
  object dsRole: TDataSource
    Left = 448
    Top = 328
  end
  object dsspecialistdoctor: TDataSource
    Left = 448
    Top = 280
  end
  object dsorganization: TDataSource
    Left = 448
    Top = 384
  end
  object dsdepartment: TDataSource
    Left = 448
    Top = 224
  end
  object dsPost: TDataSource
    Left = 448
    Top = 176
  end
end
