inherited fmOVDAdd: TfmOVDAdd
  Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086
  ClientHeight = 571
  ClientWidth = 1060
  Position = poMainFormCenter
  WindowState = wsMaximized
  ExplicitWidth = 1076
  ExplicitHeight = 610
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl [0]
    Left = 0
    Top = 0
    Width = 1060
    Height = 530
    Align = alClient
    TabOrder = 4
    Properties.ActivePage = cxGrinformation
    Properties.CustomButtons.Buttons = <>
    Properties.NavigatorPosition = npRightBottom
    Properties.Rotate = True
    Properties.TabPosition = tpLeft
    OnChange = cxPageControl1Change
    ClientRectBottom = 526
    ClientRectLeft = 244
    ClientRectRight = 1056
    ClientRectTop = 4
    object cxGrinformation: TcxTabSheet
      Hint = 'OVD_OSN'
      Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086'. '#1054#1089#1085#1086#1074#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103
      ImageIndex = 0
      object dxLayoutControl1: TdxLayoutControl
        Left = 0
        Top = 0
        Width = 812
        Height = 522
        Align = alClient
        TabOrder = 0
        object cbbSex: TcxLookupComboBox
          Left = 160
          Top = 64
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              Caption = #1055#1086#1083
              FieldName = 'name'
            end>
          Properties.ListSource = dsSex
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 6
          Width = 145
        end
        object cbbCategory: TcxLookupComboBox
          Left = 436
          Top = 64
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1075#1088#1072#1078#1076#1072#1085
              FieldName = 'name'
            end>
          Properties.ListSource = dsCategory
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 7
          Width = 145
        end
        object cbbCitizenship: TcxLookupComboBox
          Left = 160
          Top = 91
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              Caption = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086
              FieldName = 'name'
            end>
          Properties.ListSource = dsCitizenship
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 8
          Width = 145
        end
        object dtBirthdate: TcxDateEdit
          Left = 374
          Top = 37
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 4
          Width = 121
        end
        object edFam: TcxTextEdit
          Left = 160
          Top = 10
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          StyleDisabled.BorderColor = clBackground
          StyleDisabled.Color = clHighlightText
          StyleDisabled.TextColor = clBackground
          TabOrder = 0
          Width = 121
        end
        object edName: TcxTextEdit
          Left = 374
          Top = 10
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          StyleDisabled.TextColor = clBackground
          TabOrder = 1
          Width = 121
        end
        object edPatronymic: TcxTextEdit
          Left = 575
          Top = 10
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 2
          Width = 121
        end
        object edpersonal_num: TcxTextEdit
          Left = 160
          Top = 37
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          TabOrder = 3
          Width = 121
        end
        object cbbMartial_status: TcxLookupComboBox
          Left = 436
          Top = 91
          Properties.DropDownSizeable = True
          Properties.KeyFieldNames = 'id'
          Properties.ListColumns = <
            item
              Caption = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
              FieldName = 'name'
            end>
          Properties.ListSource = dsMarital_status
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 9
          Width = 145
        end
        object cxpensioner: TCheckBox
          Left = 10
          Top = 118
          Width = 207
          Height = 17
          Caption = #1071#1074#1083#1103#1077#1090#1089#1103' '#1087#1077#1085#1089#1080#1086#1085#1077#1088#1086#1084
          TabOrder = 10
        end
        object cxchild: TCheckBox
          Left = 10
          Top = 141
          Width = 207
          Height = 17
          Caption = #1053#1072#1083#1080#1095#1080#1077' '#1076#1077#1090#1077#1081' '#1076#1086' 1 '#1075#1086#1076#1072
          TabOrder = 11
        end
        object cxyes_criminal: TCheckBox
          Left = 10
          Top = 164
          Width = 207
          Height = 17
          Caption = #1053#1072#1083#1080#1095#1080#1077' '#1089#1091#1076#1080#1084#1086#1089#1090#1080
          TabOrder = 12
        end
        object cxmandatory_pres: TCheckBox
          Left = 10
          Top = 187
          Width = 207
          Height = 17
          Caption = #1054#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1083#1080#1094#1086
          TabOrder = 13
        end
        object cxno_work: TCheckBox
          Left = 10
          Top = 210
          Width = 97
          Height = 17
          Caption = #1053#1077' '#1090#1088#1091#1076#1086#1091#1089#1090#1088#1086#1077#1085
          TabOrder = 14
        end
        object cxantisocial_life: TCheckBox
          Left = 10
          Top = 233
          Width = 97
          Height = 17
          Caption = #1040#1089#1086#1094#1080#1072#1083#1100#1085#1099#1081' '#1086#1073#1088#1072#1079' '#1078#1080#1079#1085#1080
          TabOrder = 15
        end
        object cxDateEdit1: TcxDateEdit
          Left = 575
          Top = 37
          Style.BorderColor = clWindowFrame
          Style.BorderStyle = ebs3D
          Style.HotTrack = False
          Style.ButtonStyle = bts3D
          Style.PopupBorderStyle = epbsFrame3D
          TabOrder = 5
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
        object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
          Parent = dxLayoutControl1Group_Root
          AlignHorz = ahLeft
          AlignVert = avTop
          Index = 0
          AutoCreated = True
        end
        object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
          Parent = dxLayoutAutoCreatedGroup2
          AlignVert = avTop
          LayoutDirection = ldHorizontal
          Index = 1
          AutoCreated = True
        end
        object dxLayoutItem5: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup5
          AlignHorz = ahLeft
          CaptionOptions.Text = #1055#1086#1083':'
          Control = cbbSex
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem7: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup5
          AlignVert = avBottom
          CaptionOptions.Text = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1075#1088#1072#1078#1076#1072#1085#1080#1085#1072':'
          Control = cbbCategory
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup
          Parent = dxLayoutControl1Group_Root
          LayoutDirection = ldHorizontal
          Index = 1
          AutoCreated = True
        end
        object dxLayoutItem9: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup3
          AlignHorz = ahLeft
          AlignVert = avTop
          CaptionOptions.Text = #1043#1088#1072#1078#1076#1072#1085#1089#1090#1074#1086':'
          Control = cbbCitizenship
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem6: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup1
          AlignHorz = ahLeft
          AlignVert = avClient
          CaptionOptions.Text = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103':'
          Control = dtBirthdate
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutItem18: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup4
          AlignHorz = ahLeft
          AlignVert = avTop
          CaptionOptions.Text = #1060#1072#1084#1080#1083#1080#1103':'
          Control = edFam
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem1: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup4
          AlignVert = avClient
          CaptionOptions.Text = #1048#1084#1103':'
          Control = edName
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup
          Parent = dxLayoutAutoCreatedGroup2
          AlignVert = avTop
          LayoutDirection = ldHorizontal
          Index = 0
          AutoCreated = True
        end
        object dxLayoutItem2: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup4
          CaptionOptions.Text = #1054#1090#1095#1077#1089#1090#1074#1086':'
          Control = edPatronymic
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object dxLayoutItem3: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup1
          AlignVert = avClient
          CaptionOptions.Text = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088':'
          Control = edpersonal_num
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem8: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup3
          AlignHorz = ahLeft
          AlignVert = avClient
          CaptionOptions.Text = #1057#1077#1084#1077#1081#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077':'
          Control = cbbMartial_status
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
          Parent = dxLayoutControl1Group_Root
          AlignVert = avTop
          LayoutDirection = ldHorizontal
          Index = 2
          AutoCreated = True
        end
        object dxLayoutItem4: TdxLayoutItem
          Parent = dxLayoutControl1Group_Root
          AlignHorz = ahLeft
          CaptionOptions.Text = 'CheckBox1'
          CaptionOptions.Visible = False
          Control = cxpensioner
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 3
        end
        object dxLayoutItem10: TdxLayoutItem
          Parent = dxLayoutControl1Group_Root
          AlignHorz = ahLeft
          CaptionOptions.Text = 'CheckBox1'
          CaptionOptions.Visible = False
          Control = cxchild
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 4
        end
        object dxLayoutItem11: TdxLayoutItem
          Parent = dxLayoutControl1Group_Root
          AlignHorz = ahLeft
          CaptionOptions.Text = 'CheckBox1'
          CaptionOptions.Visible = False
          Control = cxyes_criminal
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 5
        end
        object dxLayoutItem19: TdxLayoutItem
          Parent = dxLayoutControl1Group_Root
          AlignHorz = ahLeft
          CaptionOptions.Text = 'CheckBox2'
          CaptionOptions.Visible = False
          Control = cxmandatory_pres
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 6
        end
        object dxLayoutItem12: TdxLayoutItem
          Parent = dxLayoutControl1Group_Root
          CaptionOptions.Text = 'CheckBox1'
          CaptionOptions.Visible = False
          Control = cxno_work
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 7
        end
        object dxLayoutItem13: TdxLayoutItem
          Parent = dxLayoutControl1Group_Root
          CaptionOptions.Text = 'CheckBox2'
          CaptionOptions.Visible = False
          Control = cxantisocial_life
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 8
        end
        object dxLayoutItem22: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup1
          AlignVert = avClient
          CaptionOptions.Text = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1080':'
          Control = cxDateEdit1
          ControlOptions.ShowBorder = False
          Index = 2
        end
      end
      object GroupBox3: TGroupBox
        Left = 10
        Top = 270
        Width = 684
        Height = 96
        Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081' '#1080#1085#1089#1087#1077#1082#1090#1086#1088
        TabOrder = 1
        object dxLayoutControl3: TdxLayoutControl
          Left = 2
          Top = 15
          Width = 680
          Height = 79
          Align = alClient
          TabOrder = 0
          object cxLookupComboBox4: TcxLookupComboBox
            Left = 76
            Top = 10
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = #1059#1095#1072#1089#1090#1082#1086#1074#1099#1081
                FieldName = 'fio'
              end>
            Properties.ListSource = dsYch
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            Style.ButtonStyle = bts3D
            Style.PopupBorderStyle = epbsFrame3D
            TabOrder = 0
            Width = 334
          end
          object Button2: TButton
            Left = 416
            Top = 10
            Width = 103
            Height = 25
            Caption = #1053#1072#1079#1085#1072#1095#1080#1090#1100
            ImageIndex = 14
            Images = Resource.ImageList
            TabOrder = 1
            OnClick = Button2Click
          end
          object dxLayoutControl3Group_Root: TdxLayoutGroup
            AlignHorz = ahLeft
            AlignVert = avTop
            ButtonOptions.Buttons = <>
            Hidden = True
            LayoutDirection = ldHorizontal
            ShowBorder = False
            Index = -1
          end
          object dxLayoutItem21: TdxLayoutItem
            Parent = dxLayoutControl3Group_Root
            AlignHorz = ahLeft
            AlignVert = avTop
            CaptionOptions.Text = #1048#1085#1089#1087#1077#1082#1090#1086#1088': '
            Control = cxLookupComboBox4
            ControlOptions.ShowBorder = False
            Index = 0
          end
          object dxLayoutItem23: TdxLayoutItem
            Parent = dxLayoutControl3Group_Root
            AlignHorz = ahClient
            AlignVert = avClient
            CaptionOptions.Text = 'Button2'
            CaptionOptions.Visible = False
            Control = Button2
            ControlOptions.ShowBorder = False
            Index = 1
          end
        end
      end
    end
    object cxAdress: TcxTabSheet
      Hint = 'OVD_OSN'
      Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086'. '#1052#1077#1089#1090#1086' '#1078#1080#1090#1077#1083#1100#1089#1090#1074#1072
      ImageIndex = 1
      object dxLayoutControl2: TdxLayoutControl
        Left = 0
        Top = 0
        Width = 812
        Height = 522
        Align = alClient
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 391
          Top = 10
          Width = 330
          Height = 199
          Caption = #1040#1076#1088#1077#1089' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103':'
          TabOrder = 2
          object Label1: TLabel
            Left = 16
            Top = 58
            Width = 34
            Height = 13
            Caption = #1056#1072#1081#1086#1085':'
          end
          object Label2: TLabel
            Left = 16
            Top = 82
            Width = 57
            Height = 13
            Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090':'
          end
          object Label3: TLabel
            Left = 16
            Top = 136
            Width = 35
            Height = 13
            Caption = #1059#1083#1080#1094#1072':'
          end
          object Label4: TLabel
            Left = 161
            Top = 163
            Width = 39
            Height = 13
            Caption = #1050#1086#1088#1087#1091#1089':'
          end
          object Label5: TLabel
            Left = 16
            Top = 163
            Width = 66
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1084#1072':'
          end
          object Label6: TLabel
            Left = 247
            Top = 163
            Width = 19
            Height = 13
            Caption = #1050#1074'.:'
          end
          object Label14: TLabel
            Left = 16
            Top = 109
            Width = 81
            Height = 13
            Caption = #1056#1072#1081#1086#1085' '#1074' '#1075#1086#1088#1086#1076#1077':'
          end
          object cxLabel1: TcxLabel
            Left = 16
            Top = 29
            Caption = #1054#1073#1083#1072#1089#1090#1100':'
          end
          object cxLookupComboBox9: TcxLookupComboBox
            Left = 102
            Top = 28
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = #1054#1073#1083#1072#1089#1090#1100
                FieldName = 'name'
              end>
            Properties.ListSource = dsArea_p
            Properties.OnEditValueChanged = cxLookupComboBox9PropertiesEditValueChanged
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            Style.ButtonStyle = bts3D
            Style.PopupBorderStyle = epbsFrame3D
            TabOrder = 1
            Width = 219
          end
          object cxLookupComboBox10: TcxLookupComboBox
            Left = 102
            Top = 55
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = #1056#1072#1081#1086#1085
                FieldName = 'name'
              end>
            Properties.ListSource = dsRegion_p
            Properties.OnEditValueChanged = cxLookupComboBox10PropertiesEditValueChanged
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            Style.ButtonStyle = bts3D
            Style.PopupBorderStyle = epbsFrame3D
            TabOrder = 2
            Width = 219
          end
          object cxLookupComboBox11: TcxLookupComboBox
            Left = 102
            Top = 82
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
                FieldName = 'name'
              end>
            Properties.ListSource = dsCity_p
            Properties.OnEditValueChanged = cxLookupComboBox11PropertiesEditValueChanged
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            Style.ButtonStyle = bts3D
            Style.PopupBorderStyle = epbsFrame3D
            TabOrder = 3
            Width = 219
          end
          object cxLookupComboBox12: TcxLookupComboBox
            Left = 102
            Top = 134
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = #1059#1083#1080#1094#1072
                FieldName = 'name'
              end>
            Properties.ListSource = dsStreet_p
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            Style.ButtonStyle = bts3D
            Style.PopupBorderStyle = epbsFrame3D
            TabOrder = 4
            Width = 219
          end
          object cxTextEdit4: TcxTextEdit
            Left = 206
            Top = 161
            Properties.OnChange = cxTextEdit4PropertiesChange
            TabOrder = 5
            Width = 35
          end
          object cxTextEdit5: TcxTextEdit
            Left = 102
            Top = 161
            TabOrder = 6
            Width = 51
          end
          object cxTextEdit6: TcxTextEdit
            Left = 272
            Top = 161
            TabOrder = 7
            Width = 49
          end
          object cxLookupComboBox3: TcxLookupComboBox
            Left = 102
            Top = 107
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = #1056#1072#1081#1086#1085
                FieldName = 'name'
              end>
            Properties.ListSource = dsCityRegion_p
            TabOrder = 8
            Width = 219
          end
        end
        object GroupBox2: TGroupBox
          Left = 10
          Top = 10
          Width = 330
          Height = 199
          Caption = #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080':'
          TabOrder = 0
          object Label7: TLabel
            Left = 16
            Top = 58
            Width = 34
            Height = 13
            Caption = #1056#1072#1081#1086#1085':'
          end
          object Label8: TLabel
            Left = 16
            Top = 82
            Width = 57
            Height = 13
            Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090':'
          end
          object Label9: TLabel
            Left = 16
            Top = 137
            Width = 35
            Height = 13
            Caption = #1059#1083#1080#1094#1072':'
          end
          object Label10: TLabel
            Left = 159
            Top = 163
            Width = 39
            Height = 13
            Caption = #1050#1086#1088#1087#1091#1089':'
          end
          object Label11: TLabel
            Left = 16
            Top = 163
            Width = 66
            Height = 13
            Caption = #1053#1086#1084#1077#1088' '#1076#1086#1084#1072':'
          end
          object Label12: TLabel
            Left = 245
            Top = 163
            Width = 19
            Height = 13
            Caption = #1050#1074'.:'
          end
          object Label13: TLabel
            Left = 16
            Top = 109
            Width = 81
            Height = 13
            Caption = #1056#1072#1081#1086#1085' '#1074' '#1075#1086#1088#1086#1076#1077':'
          end
          object cxLabel2: TcxLabel
            Left = 16
            Top = 29
            Caption = #1054#1073#1083#1072#1089#1090#1100':'
          end
          object cxLookupComboBox5: TcxLookupComboBox
            Left = 102
            Top = 28
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = #1054#1073#1083#1072#1089#1090#1100
                FieldName = 'name'
              end>
            Properties.ListSource = dsArea
            Properties.OnEditValueChanged = cxLookupComboBox5PropertiesEditValueChanged
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            Style.ButtonStyle = bts3D
            Style.PopupBorderStyle = epbsFrame3D
            TabOrder = 1
            Width = 219
          end
          object cxLookupComboBox7: TcxLookupComboBox
            Left = 103
            Top = 82
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
                FieldName = 'name'
              end>
            Properties.ListSource = dsCity
            Properties.OnEditValueChanged = cxLookupComboBox7PropertiesEditValueChanged
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            Style.ButtonStyle = bts3D
            Style.PopupBorderStyle = epbsFrame3D
            TabOrder = 2
            Width = 219
          end
          object cxLookupComboBox8: TcxLookupComboBox
            Left = 102
            Top = 134
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = #1059#1083#1080#1094#1072
                FieldName = 'name'
              end>
            Properties.ListSource = dsStreet
            Style.BorderColor = clWindowFrame
            Style.BorderStyle = ebs3D
            Style.HotTrack = False
            Style.ButtonStyle = bts3D
            Style.PopupBorderStyle = epbsFrame3D
            TabOrder = 3
            Width = 219
          end
          object cxLookupComboBox1: TcxLookupComboBox
            Left = 102
            Top = 55
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = #1056#1072#1081#1086#1085
                FieldName = 'name'
              end>
            Properties.ListSource = dsRegion
            Properties.OnEditValueChanged = cxLookupComboBox1PropertiesEditValueChanged
            TabOrder = 4
            Width = 219
          end
          object cxTextEdit1: TcxTextEdit
            Left = 204
            Top = 161
            TabOrder = 5
            Width = 35
          end
          object cxTextEdit2: TcxTextEdit
            Left = 102
            Top = 161
            TabOrder = 6
            Width = 51
          end
          object cxTextEdit3: TcxTextEdit
            Left = 270
            Top = 161
            TabOrder = 7
            Width = 49
          end
          object cxLookupComboBox2: TcxLookupComboBox
            Left = 102
            Top = 107
            Properties.DropDownSizeable = True
            Properties.KeyFieldNames = 'id'
            Properties.ListColumns = <
              item
                Caption = #1056#1072#1081#1086#1085
                FieldName = 'name'
              end>
            Properties.ListSource = dsCityRegion
            TabOrder = 8
            Width = 219
          end
        end
        object BitBtn2: TBitBtn
          Left = 346
          Top = 10
          Width = 39
          Height = 199
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BitBtn2Click
        end
        object dxLayoutControl2Group_Root: TdxLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          ButtonOptions.Buttons = <>
          Hidden = True
          LayoutDirection = ldHorizontal
          ShowBorder = False
          Index = -1
        end
        object dxLayoutItem16: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          AlignHorz = ahLeft
          AlignVert = avTop
          CaptionOptions.Text = 'GroupBox1'
          CaptionOptions.Visible = False
          Control = GroupBox1
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 2
        end
        object dxLayoutItem17: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          AlignHorz = ahLeft
          AlignVert = avTop
          CaptionOptions.Visible = False
          Control = GroupBox2
          ControlOptions.AutoColor = True
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem20: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          AlignHorz = ahLeft
          AlignVert = avClient
          CaptionOptions.Text = 'BitBtn2'
          CaptionOptions.Visible = False
          Control = BitBtn2
          ControlOptions.ShowBorder = False
          Index = 1
        end
      end
    end
    object cxDocument: TcxTabSheet
      Hint = 'OVD_OSN'
      Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086'. '#1044#1086#1082#1091#1084#1077#1085#1090#1099' '#1075#1088#1072#1078#1076#1072#1085#1080#1085#1072
      ImageIndex = 2
    end
    object cxWork: TcxTabSheet
      Hint = 'OVD_OSN'
      Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086'. '#1056#1072#1073#1086#1090#1072' '#1075#1088#1072#1078#1076#1072#1085#1080#1085#1072
      ImageIndex = 3
    end
    object cxFamily: TcxTabSheet
      Hint = 'OVD_OSN'
      Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086'. '#1057#1086#1089#1090#1072#1074' '#1089#1077#1084#1100#1080
      ImageIndex = 4
    end
    object cxCriminal: TcxTabSheet
      Hint = 'OVD_OFFENSE'
      Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086'. '#1044#1072#1085#1085#1099#1077' '#1086' '#1089#1086#1076#1080#1084#1086#1089#1090#1080
      ImageIndex = 5
    end
    object cxOffenses: TcxTabSheet
      Hint = 'OVD_OFFENSE'
      Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086'. '#1040#1076#1084#1080#1085'. '#1087#1088#1072#1074#1086#1085#1072#1088#1091#1096#1077#1085#1080#1103
      ImageIndex = 6
    end
    object cxEducation: TcxTabSheet
      Hint = 'OVD_OSN'
      Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086'. '#1054#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077
      ImageIndex = 7
    end
    object cxPrevention: TcxTabSheet
      Hint = 'OVD_OSN'
      Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086'. '#1055#1088#1086#1092#1080#1083#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1088#1072#1073#1086#1090#1072
      ImageIndex = 8
    end
    object cxReferralData: TcxTabSheet
      Hint = 'OVD_LTP'
      Caption = #1051#1080#1095#1085#1086#1077' '#1076#1077#1083#1086'. '#1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1085#1072#1087#1088'. '#1074' '#1051#1058#1055
      ImageIndex = 9
    end
    object cxMedInspector: TcxTabSheet
      Hint = 'OZ'
      Caption = #1052#1077#1076#1089#1074#1077#1076#1077#1085#1080#1103'.'#1054#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086#1074#1072#1085#1080#1077' '
      ImageIndex = 10
    end
    object cxMedExamination: TcxTabSheet
      Hint = 'OZ'
      Caption = #1052#1077#1076#1089#1074#1077#1076#1077#1085#1080#1103'.'#1054#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
      ImageIndex = 11
    end
    object cxSocLegal: TcxTabSheet
      Hint = 'GRADE_PRAVO'
      Caption = #1054#1094#1077#1085#1082#1072' '#1089#1086#1094#1080#1072#1083#1100#1085#1086'-'#1087#1088#1072#1074#1086#1074#1086#1075#1086' '#1082#1088#1080#1090#1077#1088#1080#1103
      ImageIndex = 12
    end
    object cxSocAssessment: TcxTabSheet
      Hint = 'GRADE_TRUD'
      Caption = #1054#1094#1077#1085#1082#1072' '#1089#1086#1094#1080#1072#1083#1100#1085#1086'-'#1090#1088#1091#1076#1086#1074#1086#1075#1086' '#1082#1088#1080#1090#1077#1088#1080#1103
      ImageIndex = 13
    end
    object cxMedAssessment: TcxTabSheet
      Hint = 'GRADE_MED'
      Caption = #1054#1094#1077#1085#1082#1072' '#1084#1077#1076#1080#1082#1086'-'#1089#1086#1094#1080#1072#1083#1100#1085#1086#1075#1086' '#1082#1088#1080#1090#1077#1088#1080#1103
      ImageIndex = 14
    end
    object cxLTPInformation: TcxTabSheet
      Hint = 'LTP_INOUT'
      Caption = #1051#1058#1055'. '#1055#1088#1080#1077#1084'/'#1042#1099#1073#1099#1090#1080#1077
      ImageIndex = 15
    end
    object cxLTPWork: TcxTabSheet
      Hint = 'LTP_STAY'
      Caption = #1051#1058#1055'. '#1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1090#1088#1091#1076#1086#1074#1086#1081' '#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080
      ImageIndex = 16
    end
    object cxLTPPenalty: TcxTabSheet
      Hint = 'LTP_STAY'
      Caption = #1051#1058#1055'. '#1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1085#1072#1082#1072#1079#1072#1085#1080#1080
      ImageIndex = 17
    end
    object cxLTPReward: TcxTabSheet
      Hint = 'LTP_STAY'
      Caption = #1051#1058#1055'. '#1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1086#1086#1097#1088#1077#1085#1080#1080
      ImageIndex = 18
    end
    object cxLTPExtension: TcxTabSheet
      Hint = 'LTP_STAY'
      Caption = #1051#1058#1055'. '#1055#1088#1086#1076#1083#1077#1085#1080#1077' '#1087#1088#1077#1073#1099#1074#1072#1085#1080#1103
      ImageIndex = 19
    end
    object cxLTPTraining: TcxTabSheet
      Hint = 'LTP_STAY'
      Caption = #1051#1058#1055'. '#1054#1073#1091#1095#1077#1085#1080#1077
      ImageIndex = 20
    end
    object cxLTPPreventive: TcxTabSheet
      Hint = 'LTP_STAY'
      Caption = #1051#1058#1055'. '#1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1088#1086#1092#1091#1095#1077#1090#1072
      ImageIndex = 21
    end
    object cxLTPRefusall: TcxTabSheet
      Hint = 'LTP_INOUT'
      Caption = #1051#1058#1055'. '#1054#1090#1082#1072#1079' '#1074' '#1087#1088#1080#1077#1084#1077' '#1074' '#1051#1058#1055
      ImageIndex = 22
    end
    object cxltpCure: TcxTabSheet
      Hint = 'LTP_MED'
      Caption = #1051#1058#1055'. '#1044#1072#1085#1085#1099#1077' '#1086' '#1083#1077#1095#1077#1085#1080#1080' '#1074' '#1051#1058#1055
      ImageIndex = 23
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 530
    Width = 1060
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      1060
      41)
    object btnCancel: TButton
      Left = 948
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 16
      Images = Resource.ImageList
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object Button1: TButton
      Left = 782
      Top = 6
      Width = 160
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ImageIndex = 14
      Images = Resource.ImageList
      TabOrder = 1
      OnClick = Button1Click
    end
    object btnAddEdProject: TButton
      Tag = 6
      Left = 616
      Top = 6
      Width = 160
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1051#1044
      ImageIndex = 14
      Images = Resource.ImageList
      TabOrder = 2
      OnClick = btnAddEdProjectClick
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
  inherited ActionList: TActionList
    object Action1: TAction
      Caption = 'Action1'
      ImageIndex = 45
    end
    object actAddEdd: TAction
      Tag = 6
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100' F2'
      ImageIndex = 14
      ShortCut = 113
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 16
    end
  end
  object dsSex: TDataSource
    Left = 636
    Top = 72
  end
  object dsMarital_status: TDataSource
    Left = 604
    Top = 304
  end
  object dsCitizenship: TDataSource
    Left = 500
    Top = 416
  end
  object dsCategory: TDataSource
    Left = 380
    Top = 416
  end
  object actlstN: TActionList
    Images = Resource.ImageList
    Left = 780
    Top = 40
    object Action2: TAction
      Tag = 6
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100' F2'
      ImageIndex = 14
      ShortCut = 113
    end
    object Action3: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 16
    end
  end
  object dsArea: TDataSource
    Left = 508
    Top = 304
  end
  object dsRegion: TDataSource
    Left = 556
    Top = 304
  end
  object dsCity: TDataSource
    Left = 460
    Top = 304
  end
  object dsStreet: TDataSource
    Left = 388
    Top = 304
  end
  object dsStreet_p: TDataSource
    Left = 628
    Top = 416
  end
  object dsCity_p: TDataSource
    Left = 684
    Top = 416
  end
  object dsArea_p: TDataSource
    Left = 740
    Top = 416
  end
  object dsRegion_p: TDataSource
    Left = 788
    Top = 416
  end
  object dsCityRegion: TDataSource
    Left = 316
    Top = 304
  end
  object dsCityRegion_p: TDataSource
    Left = 564
    Top = 416
  end
  object dsBaseAdres: TDataSource
    Left = 316
    Top = 416
  end
  object dsBaseAdresPr: TDataSource
    Left = 444
    Top = 416
  end
  object dsYch: TDataSource
    Left = 323
    Top = 348
  end
  object dsORGIU: TDataSource
    Left = 603
    Top = 364
  end
end
