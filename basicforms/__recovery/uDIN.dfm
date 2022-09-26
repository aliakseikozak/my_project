inherited fmDIN: TfmDIN
  Caption = 'fmDIN'
  ClientWidth = 1004
  ExplicitWidth = 1020
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    Width = 1004
    Height = 281
    TabOrder = 2
    ExplicitWidth = 1004
    ExplicitHeight = 281
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 1002
    end
    object dxLayoutControl2: TdxLayoutControl
      Left = 1
      Top = 18
      Width = 1002
      Height = 262
      Align = alClient
      TabOrder = 1
      AutoSize = True
      object Edit5: TEdit
        Left = 150
        Top = 30
        Width = 150
        Height = 17
        BorderStyle = bsNone
        ImeName = 'bmf.family_name'
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 10
        Top = 202
        Width = 148
        Height = 25
        Action = actGetData
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 11
      end
      object BitBtn2: TBitBtn
        Left = 164
        Top = 202
        Width = 197
        Height = 25
        Action = actParamClear
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
        TabOrder = 12
      end
      object Edit6: TEdit
        Left = 150
        Top = 57
        Width = 150
        Height = 17
        BorderStyle = bsNone
        ImeName = 'bmf.name'
        TabOrder = 1
      end
      object Edit7: TEdit
        Left = 150
        Top = 84
        Width = 150
        Height = 17
        BorderStyle = bsNone
        ImeName = 'bmf.patronymic'
        TabOrder = 2
      end
      object Edit8: TEdit
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
        Left = 472
        Top = 28
        ImeName = 'gdt.disease_id'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImeName = 'gdt.disease_id'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = #1044#1080#1072#1075#1085#1086#1079
            Width = 100
            FieldName = 'code'
          end>
        Properties.ListSource = dsDisease
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 6
        Width = 155
      end
      object cxLookupComboBox8: TcxLookupComboBox
        AlignWithMargins = True
        Left = 472
        Top = 55
        ImeName = 'rm.dependency_type_id'
        Properties.DropDownAutoSize = True
        Properties.DropDownSizeable = True
        Properties.ImeName = 'rm.dependency_type_id'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = #1042#1080#1076
            Width = 100
            FieldName = 'name'
          end>
        Properties.ListSource = dsdependency
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 7
        Width = 155
      end
      object cxDateEdit2: TcxDateEdit
        Left = 148
        Top = 163
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 5
        Width = 109
      end
      object cxLookupComboBox9: TcxLookupComboBox
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
      object cxLookupComboBox10: TcxLookupComboBox
        Left = 472
        Top = 82
        ImeName = 'ltc.kmcr_attribute_id'
        Properties.ImeName = 'ltc.kmcr_attribute_id'
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = #1050#1052#1057#1056
            FieldName = 'name'
          end>
        Properties.ListSource = dskmcr
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 8
        Width = 153
      end
      object CheckBox2: TCheckBox
        Left = 308
        Top = 136
        Width = 319
        Height = 17
        Caption = #1055#1088#1086#1093#1086#1076#1080#1090'/'#1087#1088#1086#1096#1077#1083' '#1087#1089#1080#1093#1086'-'#1082#1086#1088#1088#1077#1094#1080#1086#1085#1085#1091#1102' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
        TabOrder = 10
      end
      object cxDateEdit3: TcxDateEdit
        Left = 472
        Top = 109
        ImeName = 'cri.date_criminal'
        Properties.ImeName = 'cri.date_criminal'
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 9
        Width = 121
      end
      object dxLayoutGroup1: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Visible = False
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = -1
      end
      object dxLayoutGroup5: TdxLayoutGroup
        Parent = dxLayoutGroup1
        AlignHorz = ahClient
        AlignVert = avTop
        CaptionOptions.Text = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
        ButtonOptions.Buttons = <>
        LayoutDirection = ldHorizontal
        Index = 0
      end
      object dxLayoutItem11: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup5
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = #1060#1072#1084#1080#1083#1080#1103
        Control = Edit5
        Index = 0
      end
      object dxLayoutItem12: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup4
        AlignHorz = ahLeft
        CaptionOptions.Visible = False
        Control = BitBtn1
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object dxLayoutItem13: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup4
        AlignVert = avBottom
        CaptionOptions.Visible = False
        Control = BitBtn2
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup
        Parent = dxLayoutGroup1
        AlignHorz = ahClient
        AlignVert = avTop
        LayoutDirection = ldHorizontal
        Index = 1
        AutoCreated = True
      end
      object dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup
        Parent = dxLayoutGroup5
        AlignHorz = ahLeft
        AlignVert = avTop
        Index = 0
        AutoCreated = True
      end
      object dxLayoutItem19: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup5
        AlignHorz = ahClient
        AlignVert = avTop
        CaptionOptions.Text = #1048#1084#1103
        Control = Edit6
        Index = 1
      end
      object dxLayoutItem20: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup5
        AlignHorz = ahClient
        AlignVert = avClient
        CaptionOptions.Text = #1054#1090#1095#1077#1089#1090#1074#1086
        Control = Edit7
        Index = 2
      end
      object dxLayoutItem21: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup5
        AlignHorz = ahClient
        AlignVert = avTop
        CaptionOptions.Text = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#8470
        Control = Edit8
        Index = 3
      end
      object dxLayoutItem22: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup6
        AlignHorz = ahLeft
        CaptionOptions.Text = #1044#1080#1072#1075#1085#1086#1079' ('#1082#1086#1076')'
        Control = cxLookupComboBox7
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup
        Parent = dxLayoutGroup5
        Index = 1
        AutoCreated = True
      end
      object dxLayoutItem23: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup6
        AlignHorz = ahLeft
        CaptionOptions.Text = #1042#1080#1076' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1080
        Control = cxLookupComboBox8
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLayoutItem24: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup5
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Control = cxDateEdit2
        ControlOptions.ShowBorder = False
        Index = 5
      end
      object dxLayoutItem25: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup5
        AlignHorz = ahLeft
        CaptionOptions.Text = #1057#1090#1072#1090#1091#1089
        Control = cxLookupComboBox9
        ControlOptions.ShowBorder = False
        Index = 4
      end
      object dxLayoutItem27: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup6
        AlignHorz = ahClient
        CaptionOptions.Text = #1055#1088#1086#1093#1086#1076#1080#1090'/'#1087#1088#1086#1096#1077#1083' '#1050#1052#1057#1056' '#1074' '#1051#1058#1055
        Control = cxLookupComboBox10
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object dxLayoutItem1: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup6
        CaptionOptions.Text = 'CheckBox2'
        CaptionOptions.Visible = False
        Control = CheckBox2
        ControlOptions.AutoColor = True
        ControlOptions.ShowBorder = False
        Index = 4
      end
      object dxLayoutItem2: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup6
        AlignHorz = ahLeft
        CaptionOptions.Text = #1044#1072#1090#1072' '#1086#1089#1091#1078#1076#1077#1085#1080#1103
        Control = cxDateEdit3
        ControlOptions.ShowBorder = False
        Index = 3
      end
    end
  end
  inherited pnSelect: TPanel
    Width = 1004
    TabOrder = 4
    ExplicitWidth = 1004
    inherited dxLCPnlSelect: TdxLayoutControl
      Left = 797
      ExplicitLeft = 797
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
    Top = 313
    Width = 1004
    Height = 174
    ExplicitTop = 313
    ExplicitWidth = 1004
    ExplicitHeight = 174
    inherited grBase: TcxGrid
      Width = 1002
      Height = 172
      ExplicitWidth = 1002
      ExplicitHeight = 172
      inherited grBaseDBTableView: TcxGridDBTableView
        OnCellDblClick = grBaseDBTableViewCellDblClick
        OptionsView.Footer = True
        OptionsView.GroupByBox = True
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = #1060#1072#1084#1080#1083#1080#1103
          DataBinding.FieldName = 'family_name'
          Options.AutoWidthSizable = False
          Width = 136
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1048#1084#1103
          DataBinding.FieldName = 'name'
          Options.AutoWidthSizable = False
          Width = 129
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          DataBinding.FieldName = 'patronymic'
          Options.AutoWidthSizable = False
          Width = 128
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1094#1080#1086#1085#1085#1099#1081' '#8470
          DataBinding.FieldName = 'personal_id'
          Options.AutoWidthSizable = False
          Width = 158
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
          DataBinding.FieldName = 'birthdate'
          Options.AutoWidthSizable = False
          Width = 106
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #8470' '#1083#1080#1095#1085#1086#1075#1086' '#1076#1077#1083#1072
          DataBinding.FieldName = 'grinformation_id'
          Options.AutoWidthSizable = False
          Width = 106
        end
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1091#1089' '#1076#1077#1083#1072
          DataBinding.FieldName = 'status_form'
          Options.AutoWidthSizable = False
          Width = 104
        end
        object grBaseDBTableViewColumn8: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'create_date'
          Options.AutoWidthSizable = False
          Width = 115
        end
        object grBaseDBTableViewColumn9: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'change_date'
          Options.AutoWidthSizable = False
          Width = 115
        end
        object grBaseDBTableViewColumn10: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Options.AutoWidthSizable = False
          Width = 131
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    Top = 305
    Width = 1004
    ExplicitTop = 305
    ExplicitWidth = 1004
  end
  inherited BarManager: TdxBarManager
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
  end
  object dsDisease: TDataSource
    Left = 801
    Top = 226
  end
  object dsdependency: TDataSource
    Left = 712
    Top = 189
  end
  object dskmcr: TDataSource
    Left = 736
    Top = 120
  end
  object dsStatus: TDataSource
    Left = 657
    Top = 237
  end
end
