inherited fmOVD: TfmOVD
  Caption = #1054#1042#1044
  ClientHeight = 605
  ClientWidth = 1127
  ExplicitWidth = 1143
  ExplicitHeight = 644
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    Width = 1127
    Height = 273
    TabOrder = 2
    ExplicitWidth = 1127
    ExplicitHeight = 273
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 1125
    end
    object dxLayoutControl1: TdxLayoutControl
      Left = 1
      Top = 18
      Width = 1125
      Height = 254
      Align = alClient
      TabOrder = 1
      AutoSize = True
      object Edit1: TEdit
        Left = 150
        Top = 30
        Width = 150
        Height = 17
        BorderStyle = bsNone
        ImeName = 'bmf.family_name'
        TabOrder = 0
      end
      object btFind: TBitBtn
        Left = 10
        Top = 214
        Width = 148
        Height = 25
        Action = actGetData
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 14
      end
      object btFindParamClear: TBitBtn
        Left = 164
        Top = 214
        Width = 197
        Height = 25
        Action = actParamClear
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
        TabOrder = 15
      end
      object cxLookupComboBox4: TcxLookupComboBox
        AlignWithMargins = True
        Left = 446
        Top = 82
        ImeName = 'adr.region_id'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImeName = 'adr.region_id'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = #1056#1072#1081#1086#1085
            Width = 100
            FieldName = 'name'
          end>
        Properties.ListSource = dsRegion
        Properties.OnEditValueChanged = cxLookupComboBox4PropertiesEditValueChanged
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 7
        Width = 145
      end
      object cxLookupComboBox1: TcxLookupComboBox
        AlignWithMargins = True
        Left = 446
        Top = 109
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ListColumns = <>
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 8
        Width = 145
      end
      object cxLookupComboBox3: TcxLookupComboBox
        AlignWithMargins = True
        Left = 446
        Top = 136
        ImeName = 'adr.city_id'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImeName = 'adr.city_id'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
            Width = 100
            FieldName = 'name'
          end>
        Properties.ListSource = dsCity
        Properties.OnEditValueChanged = cxLookupComboBox3PropertiesEditValueChanged
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 9
        Width = 145
      end
      object cxLookupComboBox2: TcxLookupComboBox
        AlignWithMargins = True
        Left = 446
        Top = 163
        ImeName = 'adr.city_region_id'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImeName = 'adr.city_region_id'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = #1056#1072#1081#1086#1085' '#1075#1086#1088#1086#1076#1072
            Width = 100
            FieldName = 'name'
          end>
        Properties.ListSource = dsCityRegion
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 10
        Width = 145
      end
      object RadioGroup1: TRadioGroup
        Left = 320
        Top = 46
        Width = 315
        Height = 30
        BiDiMode = bdLeftToRight
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
          #1040#1076#1088#1077#1089' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103)
        ParentBiDiMode = False
        TabOrder = 6
      end
      object Edit2: TEdit
        Left = 150
        Top = 57
        Width = 150
        Height = 17
        BorderStyle = bsNone
        ImeName = 'bmf.name'
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 150
        Top = 84
        Width = 150
        Height = 17
        BorderStyle = bsNone
        ImeName = 'bmf.patronymic'
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 150
        Top = 111
        Width = 150
        Height = 17
        BorderStyle = bsNone
        ImeName = 'bmf.personal_num'
        TabOrder = 3
      end
      object cxLookupComboBox7: TcxLookupComboBox
        AlignWithMargins = True
        Left = 742
        Top = 55
        ImeName = 'cri.criminal_article_id'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImeName = 'cri.criminal_article_id'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = #1057#1090#1072#1090#1100#1103
            Width = 100
            FieldName = 'name'
          end>
        Properties.ListSource = dsYKRB
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 12
        Width = 155
      end
      object cxLookupComboBox6: TcxLookupComboBox
        AlignWithMargins = True
        Left = 742
        Top = 82
        ImeName = 'off.offenses_article_id'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImeName = 'off.offenses_article_id'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = #1057#1090#1072#1090#1100#1103
            Width = 100
            FieldName = 'name'
          end>
        Properties.ListSource = dsKOAP
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 13
        Width = 155
      end
      object cxDateEdit1: TcxDateEdit
        Left = 148
        Top = 163
        ImeName = 'bmf.birthdate'
        Properties.ImeName = 'bmf.birthdate'
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 5
        Width = 109
      end
      object cxLookupComboBox5: TcxLookupComboBox
        AlignWithMargins = True
        Left = 148
        Top = 136
        ImeName = 'bmf.status_form_id'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImeName = 'bmf.status_form_id'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = #1057#1090#1072#1090#1091#1089
            Width = 100
            FieldName = 'status_form'
          end>
        Properties.ListSource = dsStatus
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 4
        Width = 152
      end
      object Edit5: TEdit
        Left = 744
        Top = 30
        Width = 153
        Height = 17
        BorderStyle = bsNone
        ImeName = 'cri.reg_num'
        TabOrder = 11
      end
      object dxLayoutControl1Group_Root: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Visible = False
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = -1
      end
      object dxLayoutGroup1: TdxLayoutGroup
        Parent = dxLayoutControl1Group_Root
        AlignHorz = ahClient
        AlignVert = avTop
        CaptionOptions.Text = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        Index = 0
      end
      object dxLayoutItem1: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup3
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = #1060#1072#1084#1080#1083#1080#1103
        Control = Edit1
        Index = 0
      end
      object dxLayoutItem6: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup1
        AlignHorz = ahLeft
        CaptionOptions.Visible = False
        Control = btFind
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object dxLayoutItem5: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup1
        AlignVert = avBottom
        CaptionOptions.Visible = False
        Control = btFindParamClear
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
        Parent = dxLayoutControl1Group_Root
        AlignHorz = ahClient
        AlignVert = avTop
        LayoutDirection = ldHorizontal
        Index = 1
        AutoCreated = True
      end
      object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
        Parent = dxLayoutGroup1
        AlignHorz = ahLeft
        AlignVert = avTop
        Index = 0
        AutoCreated = True
      end
      object dxLayoutGroup2: TdxLayoutGroup
        Parent = dxLayoutGroup1
        CaptionOptions.Text = #1040#1076#1088#1077#1089
        ButtonOptions.Buttons = <>
        Index = 1
      end
      object dxLayoutItem12: TdxLayoutItem
        Parent = dxLayoutGroup2
        CaptionOptions.Text = #1056#1072#1081#1086#1085
        Control = cxLookupComboBox4
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLayoutItem9: TdxLayoutItem
        Parent = dxLayoutGroup2
        CaptionOptions.Text = #1057#1077#1083#1100#1089#1086#1074#1077#1090
        Control = cxLookupComboBox1
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object dxLayoutItem11: TdxLayoutItem
        Parent = dxLayoutGroup2
        CaptionOptions.Text = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
        Control = cxLookupComboBox3
        ControlOptions.ShowBorder = False
        Index = 3
      end
      object dxLayoutItem10: TdxLayoutItem
        Parent = dxLayoutGroup2
        CaptionOptions.Text = #1042#1085#1091#1090#1088#1080#1075#1086#1088#1086#1076#1089#1082#1086#1081' '#1088#1072#1081#1086#1085
        Control = cxLookupComboBox2
        ControlOptions.ShowBorder = False
        Index = 4
      end
      object dxLayoutItem8: TdxLayoutItem
        Parent = dxLayoutGroup2
        AlignHorz = ahLeft
        CaptionOptions.Text = 'RadioGroup1'
        CaptionOptions.Visible = False
        Control = RadioGroup1
        ControlOptions.AutoColor = True
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object dxLayoutItem4: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup3
        AlignHorz = ahClient
        AlignVert = avTop
        CaptionOptions.Text = #1048#1084#1103
        Control = Edit2
        Index = 1
      end
      object dxLayoutItem2: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup3
        AlignHorz = ahClient
        AlignVert = avClient
        CaptionOptions.Text = #1054#1090#1095#1077#1089#1090#1074#1086
        Control = Edit3
        Index = 2
      end
      object dxLayoutItem3: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup3
        AlignHorz = ahClient
        AlignVert = avTop
        CaptionOptions.Text = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#8470
        Control = Edit4
        Index = 3
      end
      object dxLayoutItem15: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup2
        AlignHorz = ahLeft
        CaptionOptions.Text = #1057#1090#1072#1090#1100#1103' '#1059#1050' '#1056#1041
        Control = cxLookupComboBox7
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
        Parent = dxLayoutGroup1
        Index = 2
        AutoCreated = True
      end
      object dxLayoutItem14: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup2
        AlignHorz = ahLeft
        CaptionOptions.Text = #1057#1090#1072#1090#1100#1103' '#1050#1086#1040#1055
        Control = cxLookupComboBox6
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object dxLayoutItem7: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup3
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Control = cxDateEdit1
        ControlOptions.ShowBorder = False
        Index = 5
      end
      object dxLayoutItem13: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup3
        AlignHorz = ahLeft
        CaptionOptions.Text = #1057#1090#1072#1090#1091#1089
        Control = cxLookupComboBox5
        ControlOptions.ShowBorder = False
        Index = 4
      end
      object dxLayoutItem16: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup2
        AlignHorz = ahLeft
        CaptionOptions.Text = #1056#1077#1075'. '#8470' '#1074' '#1045#1043#1041#1044#1055
        Control = Edit5
        Index = 0
      end
    end
  end
  inherited pnSelect: TPanel
    Top = 557
    Width = 1127
    TabOrder = 4
    ExplicitTop = 557
    ExplicitWidth = 1127
    inherited dxLCPnlSelect: TdxLayoutControl
      Left = 920
      ExplicitLeft = 920
      inherited dxLCPnlSelectGroup_Root: TdxLayoutGroup
        Index = -1
      end
      inherited dxLIbtnCancel: TdxLayoutItem
        Index = 1
      end
      inherited dxLIbtnSelect: TdxLayoutItem
        Index = 0
      end
    end
  end
  inherited gbGridBase: TPanel
    Top = 305
    Width = 1127
    Height = 252
    ExplicitTop = 305
    ExplicitWidth = 1127
    ExplicitHeight = 252
    inherited grBase: TcxGrid
      Width = 1125
      Height = 250
      ExplicitWidth = 1125
      ExplicitHeight = 250
      inherited grBaseDBTableView: TcxGridDBTableView
        OnCellDblClick = grBaseDBTableViewCellDblClick
        OptionsView.Footer = True
        OptionsView.GroupByBox = True
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = #1060#1072#1084#1080#1083#1080#1103
          DataBinding.FieldName = 'family_name'
          Width = 96
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1048#1084#1103
          DataBinding.FieldName = 'name'
          Width = 121
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          DataBinding.FieldName = 'patronymic'
          Width = 122
        end
        object grBaseDBTableViewColumn8: TcxGridDBColumn
          Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#8470
          DataBinding.FieldName = 'personal_id'
          Width = 188
        end
        object grBaseDBTableViewColumn9: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          DataBinding.FieldName = 'birthdate'
          Width = 108
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #8470' '#1083#1080#1095#1085#1086#1075#1086' '#1076#1077#1083#1072
          DataBinding.FieldName = 'grinformation_id'
          SortIndex = 0
          SortOrder = soDescending
          Width = 158
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1091#1089' '#1076#1077#1083#1072
          DataBinding.FieldName = 'status_form'
          Width = 131
        end
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'create_date'
          Width = 129
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'change_date'
          Width = 133
        end
        object grBaseDBTableViewColumn10: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Width = 100
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    Top = 297
    Width = 1127
    ExplicitTop = 297
    ExplicitWidth = 1127
  end
  inherited BarManager: TdxBarManager
    Left = 824
    Top = 32
    DockControlHeights = (
      0
      0
      24
      0)
  end
  inherited ActionList: TActionList
    inherited actGetData: TAction
      OnExecute = actGetDataExecute
    end
    object actGoFilter: TAction
      Caption = 'actGoFilter'
      ImageIndex = 21
    end
    object actAdvanced: TAction
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081' '#1087#1086#1080#1089#1082
      ImageIndex = 89
    end
  end
  inherited pmGrid: TPopupMenu
    Left = 768
    Top = 31
  end
  object dsStatus: TDataSource
    Left = 441
    Top = 301
  end
  object dsRegion: TDataSource
    Left = 668
    Top = 248
  end
  object dsCity: TDataSource
    Left = 572
    Top = 248
  end
  object dsCityRegion: TDataSource
    Left = 428
    Top = 248
  end
  object dsYKRB: TDataSource
    Left = 761
    Top = 242
  end
  object dsKOAP: TDataSource
    Left = 825
    Top = 242
  end
end
