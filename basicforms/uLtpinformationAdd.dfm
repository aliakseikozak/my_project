inherited fmLtpinformationAdd: TfmLtpinformationAdd
  Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1085#1072#1093#1086#1078#1076#1077#1085#1080#1080' '#1074' '#1051#1058#1055
  ClientHeight = 527
  ClientWidth = 583
  Position = poMainFormCenter
  ExplicitWidth = 599
  ExplicitHeight = 566
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 583
    Height = 486
    Align = alClient
    TabOrder = 4
    object GroupBox2: TGroupBox
      Left = 10
      Top = 64
      Width = 549
      Height = 89
      Caption = #1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077' '#1074' '#1051#1058#1055
      TabOrder = 2
      object dxLayoutControl3: TdxLayoutControl
        Left = 2
        Top = 15
        Width = 545
        Height = 72
        Align = alClient
        TabOrder = 0
        object cxTextEdit3: TcxTextEdit
          Left = 111
          Top = 37
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 1
          Width = 230
        end
        object cxDateEdit4: TcxDateEdit
          Left = 111
          Top = 10
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 0
          Width = 106
        end
        object dxLayoutControl3Group_Root: TdxLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          Index = -1
        end
        object dxLayoutItem17: TdxLayoutItem
          Parent = dxLayoutControl3Group_Root
          CaptionOptions.Text = #1054#1090#1088#1103#1076':'
          Control = cxTextEdit3
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutItem16: TdxLayoutItem
          Parent = dxLayoutControl3Group_Root
          AlignHorz = ahLeft
          CaptionOptions.Text = #1044#1072#1090#1072' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103':'
          Control = cxDateEdit4
          ControlOptions.ShowBorder = False
          Index = 0
        end
      end
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 120
      Top = 10
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1051#1058#1055
          FieldName = 'name'
        end>
      Properties.ListSource = dsOrganization
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 268
    end
    object cxDateEdit2: TcxDateEdit
      Left = 120
      Top = 37
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
      Width = 121
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 280
      Width = 551
      Height = 189
      Caption = #1042#1099#1073#1099#1090#1080#1077' '#1080#1079' '#1051#1058#1055
      TabOrder = 4
      object dxLayoutControl2: TdxLayoutControl
        Left = 2
        Top = 15
        Width = 547
        Height = 172
        Align = alClient
        TabOrder = 0
        object cxDateEdit3: TcxDateEdit
          Left = 160
          Top = 10
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 0
          Width = 89
        end
        object CheckBox1: TCheckBox
          Left = 10
          Top = 64
          Width = 331
          Height = 17
          Caption = #1059#1073#1099#1083' '#1076#1086#1089#1088#1086#1095#1085#1086
          TabOrder = 2
        end
        object CheckBox2: TCheckBox
          Left = 10
          Top = 87
          Width = 463
          Height = 17
          Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085' '#1085#1072' '#1088#1077#1072#1073#1080#1083#1080#1090#1072#1094#1080#1102
          TabOrder = 3
        end
        object CheckBox4: TCheckBox
          Left = 10
          Top = 110
          Width = 463
          Height = 17
          Caption = #1042#1099#1087#1080#1089#1082#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1072' '#1074' '#1059#1047
          TabOrder = 4
        end
        object CheckBox3: TCheckBox
          Left = 10
          Top = 133
          Width = 331
          Height = 17
          Caption = #1055#1077#1088#1077#1076#1072#1085' '#1087#1086#1076' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080' '#1054#1042#1044
          TabOrder = 5
        end
        object cxTextEdit2: TcxTextEdit
          Left = 160
          Top = 37
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 1
          Width = 273
        end
        object dxLayoutControl2Group_Root: TdxLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          Index = -1
        end
        object dxLayoutItem8: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          AlignHorz = ahLeft
          CaptionOptions.Text = #1044#1072#1090#1072' '#1091#1073#1099#1090#1080#1103':'
          Control = cxDateEdit3
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem10: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = 'CheckBox1'
          CaptionOptions.Visible = False
          Control = CheckBox1
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object dxLayoutItem11: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Text = #1053#1072#1087#1088#1072#1074#1083#1077#1085' '#1085#1072' '#1088#1077#1072#1073#1080#1083#1080#1090#1072#1094#1080#1102
          CaptionOptions.Visible = False
          Control = CheckBox2
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 3
        end
        object dxLayoutItem13: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Visible = False
          Control = CheckBox4
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 4
        end
        object dxLayoutItem12: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          CaptionOptions.Visible = False
          Control = CheckBox3
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 5
        end
        object dxLayoutItem9: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          AlignHorz = ahLeft
          CaptionOptions.Text = #1055#1088#1080#1095#1080#1085#1072' '#1089#1086#1082#1088#1072#1097#1077#1085#1080#1103' '#1089#1088#1086#1082#1072':'
          Control = cxTextEdit2
          ControlOptions.ShowBorder = False
          Index = 1
        end
      end
    end
    object GroupBox4: TGroupBox
      Left = 10
      Top = 159
      Width = 360
      Height = 115
      Caption = #1055#1077#1088#1077#1074#1086#1076' '#1074' '#1080#1085#1086#1077' '#1051#1058#1055
      TabOrder = 3
      object dxLayoutControl5: TdxLayoutControl
        Left = 2
        Top = 15
        Width = 356
        Height = 98
        Align = alClient
        TabOrder = 0
        object cxTextEdit4: TcxTextEdit
          Left = 112
          Top = 64
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 2
          Width = 230
        end
        object cxLookupComboBox4: TcxLookupComboBox
          Left = 112
          Top = 10
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              Caption = #1051#1058#1055
              FieldName = 'name'
            end>
          Properties.ListSource = dsOrganization
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 0
          Width = 229
        end
        object cxDateEdit7: TcxDateEdit
          Left = 112
          Top = 37
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 1
          Width = 106
        end
        object dxLayoutGroup1: TdxLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          Index = -1
        end
        object dxLayoutItem22: TdxLayoutItem
          Parent = dxLayoutGroup1
          AlignHorz = ahClient
          AlignVert = avTop
          CaptionOptions.Text = #1055#1088#1080#1095#1080#1085#1072' '#1087#1077#1088#1077#1074#1086#1076#1072':'
          Control = cxTextEdit4
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object dxLayoutItem2: TdxLayoutItem
          Parent = dxLayoutGroup1
          AlignHorz = ahLeft
          AlignVert = avTop
          CaptionOptions.Text = #1051#1058#1055':'
          Control = cxLookupComboBox4
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem23: TdxLayoutItem
          Parent = dxLayoutGroup1
          AlignHorz = ahLeft
          AlignVert = avTop
          CaptionOptions.Text = #1044#1072#1090#1072' '#1087#1077#1088#1077#1074#1086#1076#1072':'
          Control = cxDateEdit7
          ControlOptions.ShowBorder = False
          Index = 1
        end
      end
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem14: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = 'GroupBox2'
      CaptionOptions.Visible = False
      Control = GroupBox2
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1051#1058#1055':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103':'
      Control = cxDateEdit2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = 'GroupBox1'
      CaptionOptions.Visible = False
      Control = GroupBox1
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem21: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'GroupBox4'
      CaptionOptions.Visible = False
      Control = GroupBox4
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 486
    Width = 583
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      583
      41)
    object btnOk: TButton
      Tag = 6
      Left = 319
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
      Left = 485
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
  object dsOrganization: TDataSource
    Left = 444
    Top = 246
  end
end
