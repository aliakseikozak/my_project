inherited fmUsers: TfmUsers
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  ClientWidth = 1084
  ExplicitWidth = 1100
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    Width = 1084
    Height = 145
    TabOrder = 2
    ExplicitWidth = 1084
    ExplicitHeight = 145
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 1082
    end
    object lcParams: TdxLayoutControl
      Left = 1
      Top = 18
      Width = 1082
      Height = 126
      Align = alClient
      TabOrder = 1
      DesignSize = (
        1082
        126)
      object eLastName: TEdit
        Left = 67
        Top = 10
        Width = 190
        Height = 21
        ImeName = 'bmf.family_name'
        MaxLength = 100
        TabOrder = 0
      end
      object eFirstName: TEdit
        Left = 67
        Top = 37
        Width = 190
        Height = 21
        ImeName = 'bmf.name'
        MaxLength = 100
        TabOrder = 1
      end
      object eMiddleName: TEdit
        Left = 67
        Top = 64
        Width = 190
        Height = 21
        ImeName = 'bmf.patronymic'
        MaxLength = 100
        TabOrder = 2
      end
      object eLogin: TEdit
        Left = 338
        Top = 10
        Width = 242
        Height = 21
        ImeName = 'bmf.username'
        MaxLength = 100
        TabOrder = 3
      end
      object cxOrg: TcxLookupComboBox
        Left = 338
        Top = 37
        ImeName = 'bmf.name_org_id '
        Properties.DropDownSizeable = True
        Properties.ImeName = 'bmf.name_org_id '
        Properties.KeyFieldNames = 'id'
        Properties.ListColumns = <
          item
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            FieldName = 'name'
          end>
        Properties.ListSource = dsorganization
        Style.BorderColor = clWindowFrame
        Style.BorderStyle = ebs3D
        Style.HotTrack = False
        Style.ButtonStyle = bts3D
        Style.PopupBorderStyle = epbsFrame3D
        TabOrder = 4
        Width = 242
      end
      object cIsBlocked: TComboBox
        Left = 338
        Top = 64
        Width = 242
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemIndex = 1
        TabOrder = 5
        Text = #1040#1082#1090#1080#1074#1085#1099#1077
        Items.Strings = (
          #1042#1089#1077
          #1040#1082#1090#1080#1074#1085#1099#1077
          #1053#1077' '#1072#1082#1090#1080#1074#1085#1099#1077)
      end
      object btFind: TBitBtn
        Left = 10
        Top = 91
        Width = 148
        Height = 25
        Action = actGetData
        Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
        TabOrder = 6
      end
      object btFindParamClear: TBitBtn
        Left = 164
        Top = 91
        Width = 197
        Height = 25
        Action = actParamClear
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
        TabOrder = 7
      end
      object lcParamsGroup_Root: TdxLayoutGroup
        AlignHorz = ahLeft
        AlignVert = avTop
        ButtonOptions.Buttons = <>
        Hidden = True
        ShowBorder = False
        Index = -1
      end
      object dxLayoutItem7: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup5
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = #1060#1072#1084#1080#1083#1080#1103':'
        Control = eLastName
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup
        Parent = dxLayoutAutoCreatedGroup3
        Index = 0
        AutoCreated = True
      end
      object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
        Parent = dxLayoutAutoCreatedGroup3
        AlignHorz = ahLeft
        Index = 1
        AutoCreated = True
      end
      object dxLayoutItem6: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup5
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = #1048#1084#1103':'
        Control = eFirstName
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLayoutItem8: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup5
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = #1054#1090#1095#1077#1089#1090#1074#1086':'
        Control = eMiddleName
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object dxLayoutItem2: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup2
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = #1051#1086#1075#1080#1085':'
        Control = eLogin
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object dxLayoutItem4: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup2
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103':'
        Control = cxOrg
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLayoutItem5: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup2
        AlignHorz = ahLeft
        AlignVert = avTop
        CaptionOptions.Text = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100':'
        Control = cIsBlocked
        ControlOptions.ShowBorder = False
        Index = 2
      end
      object dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup
        Parent = lcParamsGroup_Root
        AlignHorz = ahLeft
        AlignVert = avTop
        LayoutDirection = ldHorizontal
        Index = 0
        AutoCreated = True
      end
      object dxLayoutItem1: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup1
        AlignHorz = ahLeft
        CaptionOptions.Visible = False
        Control = btFind
        ControlOptions.ShowBorder = False
        Index = 0
      end
      object dxLayoutItem3: TdxLayoutItem
        Parent = dxLayoutAutoCreatedGroup1
        AlignHorz = ahLeft
        AlignVert = avClient
        CaptionOptions.Visible = False
        Control = btFindParamClear
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
        Parent = lcParamsGroup_Root
        LayoutDirection = ldHorizontal
        Index = 1
        AutoCreated = True
      end
    end
  end
  inherited pnSelect: TPanel
    Width = 1084
    TabOrder = 4
    ExplicitWidth = 1084
    inherited dxLCPnlSelect: TdxLayoutControl
      Left = 877
      ExplicitLeft = 877
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
    Top = 177
    Width = 1084
    Height = 310
    ExplicitTop = 177
    ExplicitWidth = 1084
    ExplicitHeight = 310
    inherited grBase: TcxGrid
      Width = 1082
      Height = 308
      ExplicitWidth = 1082
      ExplicitHeight = 308
      inherited grBaseDBTableView: TcxGridDBTableView
        OnCellDblClick = grBaseDBTableViewCellDblClick
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'id'
          Options.AutoWidthSizable = False
          SortIndex = 0
          SortOrder = soDescending
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1051#1086#1075#1080#1085
          DataBinding.FieldName = 'members_username'
          Options.AutoWidthSizable = False
          Width = 118
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1060#1072#1084#1080#1083#1080#1103
          DataBinding.FieldName = 'family_name'
          Options.AutoWidthSizable = False
          Width = 99
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1048#1084#1103
          DataBinding.FieldName = 'name'
          Options.AutoWidthSizable = False
          Width = 90
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
          DataBinding.FieldName = 'patronymic'
          Options.AutoWidthSizable = False
          Width = 135
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          DataBinding.FieldName = 'name_org'
          Options.AutoWidthSizable = False
          Width = 120
        end
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Options.AutoWidthSizable = False
          Width = 105
        end
        object grBaseDBTableViewColumn8: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
          DataBinding.FieldName = 'create_date'
          Options.AutoWidthSizable = False
          Width = 103
        end
        object grBaseDBTableViewColumn9: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
          DataBinding.FieldName = 'change_date'
          Options.AutoWidthSizable = False
          Width = 117
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    Top = 169
    Width = 1084
    ExplicitTop = 169
    ExplicitWidth = 1084
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
  object dsorganization: TDataSource
    Left = 696
    Top = 88
  end
end
