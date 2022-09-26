inherited fmBaseGrid: TfmBaseGrid
  Top = 120
  Caption = 'fmBaseGrid'
  ClientHeight = 535
  ClientWidth = 904
  ExplicitWidth = 920
  ExplicitHeight = 574
  PixelsPerInch = 96
  TextHeight = 13
  object pnParam: TPanel [0]
    Left = 0
    Top = 24
    Width = 904
    Height = 122
    Align = alTop
    TabOrder = 4
    object lbParam: TcxLabel
      Left = 1
      Top = 1
      Align = alTop
      Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1074#1099#1073#1086#1088#1082#1080
      ParentColor = False
      ParentFont = False
      Style.Color = clGray
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = clWindow
      Style.IsFontAssigned = True
    end
  end
  object pnSelect: TPanel [1]
    Left = 0
    Top = 487
    Width = 904
    Height = 48
    Align = alBottom
    TabOrder = 5
    Visible = False
    object dxLCPnlSelect: TdxLayoutControl
      Left = 697
      Top = 1
      Width = 206
      Height = 46
      Align = alRight
      TabOrder = 0
      AutoSize = True
      DesignSize = (
        206
        46)
      object btnCancel: TButton
        Left = 96
        Top = 10
        Width = 89
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1054#1090#1084#1077#1085#1072
        ImageIndex = 16
        Images = Resource.ImageList
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object btnSelect: TButton
        Left = 10
        Top = 10
        Width = 80
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        ImageIndex = 6
        Images = Resource.ImageList
        TabOrder = 0
        OnClick = btnSelectClick
      end
      object dxLCPnlSelectGroup_Root: TdxLayoutGroup
        AlignHorz = ahRight
        AlignVert = avCenter
        ButtonOptions.Buttons = <>
        Hidden = True
        LayoutDirection = ldHorizontal
        ShowBorder = False
        Index = -1
      end
      object dxLIbtnCancel: TdxLayoutItem
        Parent = dxLCPnlSelectGroup_Root
        AlignHorz = ahRight
        AlignVert = avCenter
        CaptionOptions.Text = 'btnCancel'
        CaptionOptions.Visible = False
        Control = btnCancel
        ControlOptions.ShowBorder = False
        Index = 1
      end
      object dxLIbtnSelect: TdxLayoutItem
        Parent = dxLCPnlSelectGroup_Root
        AlignHorz = ahLeft
        AlignVert = avCenter
        CaptionOptions.Text = 'btnSelect'
        CaptionOptions.Visible = False
        Control = btnSelect
        ControlOptions.ShowBorder = False
        Index = 0
      end
    end
  end
  object gbGridBase: TPanel [2]
    Left = 0
    Top = 154
    Width = 904
    Height = 333
    Align = alClient
    TabOrder = 6
    ExplicitWidth = 855
    object grBase: TcxGrid
      Left = 1
      Top = 1
      Width = 902
      Height = 331
      Align = alClient
      PopupMenu = pmGrid
      TabOrder = 0
      ExplicitWidth = 853
      object grBaseDBTableView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Visible = True
        Navigator.Buttons.PriorPage.Visible = True
        Navigator.Buttons.Prior.Visible = True
        Navigator.Buttons.Next.Visible = True
        Navigator.Buttons.NextPage.Visible = True
        Navigator.Buttons.Last.Visible = True
        Navigator.Buttons.Insert.Visible = True
        Navigator.Buttons.Append.Visible = False
        Navigator.Buttons.Delete.Visible = True
        Navigator.Buttons.Edit.Visible = True
        Navigator.Buttons.Post.Visible = True
        Navigator.Buttons.Cancel.Visible = True
        Navigator.Buttons.Refresh.Visible = True
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Visible = False
        DataController.DataSource = dsBase
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoInsertOnNewItemRowFocusing]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NewItemRow.InfoText = #1050#1083#1080#1082#1085#1080#1090#1077' '#1084#1099#1096#1082#1086#1081' '#1095#1090#1086' '#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<'#1085#1077#1090' '#1076#1072#1085#1085#1099#1093'>'
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
        Styles.Content = Resource.cxStyleEdit
        Styles.Footer = Resource.cxStyleHeader
        Styles.Group = Resource.cxStyleGroup
        Styles.GroupSummary = Resource.cxStyleHeader
        Styles.Header = Resource.cxStyleHeader
        OnCustomization = GridViewCustomization
      end
      object grBaseLevel1: TcxGridLevel
        GridView = grBaseDBTableView
      end
    end
  end
  object cxspltrParam: TcxSplitter [3]
    Left = 0
    Top = 146
    Width = 904
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    HotZone.SizePercent = 35
    AlignSplitter = salTop
    ExplicitWidth = 855
  end
  inherited dsBase: TDataSource
    Left = 648
    Top = 32
  end
  inherited BarManager: TdxBarManager
    Left = 640
    DockControlHeights = (
      0
      0
      24
      0)
    inherited BarManagerMainMenu: TdxBar
      Visible = False
    end
    inherited BarManagerMainBar: TdxBar
      DockedTop = 0
      Images = Resource.ImageList
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btNew'
        end
        item
          Visible = True
          ItemName = 'btEdit'
        end
        item
          Visible = True
          ItemName = 'btDel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btSave'
        end
        item
          Visible = True
          ItemName = 'btRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btParamClear'
        end
        item
          Visible = True
          ItemName = 'btFilter'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btExcel'
        end
        item
          Visible = True
          ItemName = 'btCancel'
        end
        item
          Visible = True
          ItemName = 'btGetData'
        end
        item
          Visible = True
          ItemName = 'btExit'
        end>
      Row = 0
    end
    object btRefresh: TdxBarButton [5]
      Action = actRefresh
      Category = 0
    end
    object btGetData: TdxBarButton [6]
      Action = actGetData
      Category = 0
      Visible = ivNever
    end
    object dxBarSeparator1: TdxBarSeparator [7]
      Caption = 'separator'
      Category = 0
      Hint = 'separator'
      Visible = ivAlways
      ShowCaption = False
    end
    object btNew: TdxBarButton [8]
      Tag = 1
      Action = actNew
      Category = 0
    end
    object btEdit: TdxBarButton [9]
      Tag = 2
      Action = actEdit
      Category = 0
    end
    object btDel: TdxBarButton [10]
      Tag = 4
      Action = actDel
      Category = 0
    end
    object btSave: TdxBarButton [11]
      Action = actSave
      Category = 0
    end
    object btCancel: TdxBarButton [12]
      Action = actCancel
      Category = 0
      Visible = ivNever
    end
    object btFilter: TdxBarButton [13]
      Action = actFilter
      Category = 0
      ButtonStyle = bsChecked
    end
    object btExcel: TdxBarButton [14]
      Tag = 5
      Action = actExcel
      Category = 0
    end
    object btParamClear: TdxBarButton [15]
      Action = actParamClear
      Category = 0
    end
    inherited btExit: TdxBarButton
      Visible = ivNever
    end
    inherited mnFile: TdxBarSubItem
      Caption = #1060#1086#1088#1084#1072
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btRefresh'
        end
        item
          Visible = True
          ItemName = 'btGetData'
        end
        item
          Visible = True
          ItemName = 'btFilter'
        end
        item
          Visible = True
          ItemName = 'btExcel'
        end
        item
          Visible = True
          ItemName = 'btParamClear'
        end
        item
          Visible = True
          ItemName = 'dxBarSeparator1'
        end
        item
          Visible = True
          ItemName = 'btNew'
        end
        item
          Visible = True
          ItemName = 'btEdit'
        end
        item
          Visible = True
          ItemName = 'btDel'
        end
        item
          Visible = True
          ItemName = 'dxBarSeparator1'
        end
        item
          Visible = True
          ItemName = 'btSave'
        end
        item
          Visible = True
          ItemName = 'btCancel'
        end
        item
          Visible = True
          ItemName = 'dxBarSeparator1'
        end
        item
          Visible = True
          ItemName = 'btExit'
        end>
    end
  end
  inherited ActionList: TActionList
    Top = 32
    inherited actGridViewCustomize: TAction
      Hint = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1074#1080#1076#1080#1084#1086#1089#1090#1100' '#1089#1090#1086#1083#1073#1094#1086#1074
    end
    object actNew: TAction [4]
      Tag = 1
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081
      ImageIndex = 1
      OnExecute = actNewExecute
      OnUpdate = actNewUpdate
    end
    object actEdit: TAction [5]
      Tag = 2
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 2
      OnExecute = actEditExecute
      OnUpdate = actEditUpdate
    end
    object actDel: TAction [6]
      Tag = 4
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actDelExecute
      OnUpdate = actDelUpdate
    end
    object actRefresh: TAction [7]
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 13
      OnExecute = actRefreshExecute
      OnUpdate = actRefreshUpdate
    end
    object actSave: TAction [8]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 14
      ShortCut = 113
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
    end
    object actGetData: TAction [9]
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 19
      OnUpdate = actRefreshUpdate
    end
    object actCancel: TAction [10]
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 5
      OnExecute = actCancelExecute
      OnUpdate = actCancelUpdate
    end
    object actFilter: TAction [11]
      Caption = #1060#1080#1083#1100#1090#1088
      Hint = #1060#1080#1083#1100#1090#1088
      ImageIndex = 22
      OnExecute = actFilterExecute
    end
    object actExcel: TAction [12]
      Tag = 5
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      ImageIndex = 9
      ShortCut = 16466
      OnExecute = actExcelExecute
    end
    object actParamClear: TAction [13]
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
      ImageIndex = 7
      OnExecute = actParamClearExecute
    end
    object actHistoryLog: TAction [14]
      Caption = #1048#1089#1090#1086#1088#1080#1103
      Hint = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1080#1089#1090#1086#1088#1080#1102' '#1080#1079#1084#1077#1085#1077#1085#1080#1081' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 48
      OnExecute = actHistoryLogExecute
    end
    object actSelectAll: TAction [15]
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077
      Hint = #1054#1090#1084#1077#1090#1080#1090#1100' '#1074#1089#1077' '#1079#1072#1087#1080#1089#1080
      ImageIndex = 30
      OnExecute = actSelectAllExecute
      OnUpdate = actSelectAllUpdate
    end
    object actUnselectAll: TAction [16]
      Caption = #1057#1085#1103#1090#1100' '#1074#1089#1077
      Hint = #1057#1085#1103#1090#1100' '#1086#1090#1084#1077#1090#1082#1091' '#1089#1086' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081
      ImageIndex = 31
      OnExecute = actUnselectAllExecute
      OnUpdate = actSelectAllUpdate
    end
  end
  object pmGrid: TPopupMenu
    Left = 560
    Top = 215
    object N1: TMenuItem
      Action = actRefresh
    end
    object N2: TMenuItem
      Action = actGetData
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Action = actNew
    end
    object N5: TMenuItem
      Action = actEdit
    end
    object N6: TMenuItem
      Action = actDel
    end
    object N100Select: TMenuItem
      Caption = '-'
    end
    object actSelectAll1: TMenuItem
      Action = actSelectAll
    end
    object actUnselectAll1: TMenuItem
      Action = actUnselectAll
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Action = actHistoryLog
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Action = actSave
    end
    object N9: TMenuItem
      Action = actCancel
    end
    object nGridMenuSub: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1074#1080#1076' '#1090#1072#1073#1083#1080#1094#1099
      object nGridViewCustomize: TMenuItem
        Action = actGridViewCustomize
      end
      object nGridViewRestore: TMenuItem
        Action = actGridViewRestore
      end
      object nGridMenuGroup: TMenuItem
        Action = aGroupPanel
      end
      object nGridMenuAvtoSize: TMenuItem
        Action = nAutoAlign
      end
      object nGridMenuWidthSelf: TMenuItem
        Action = aFill
      end
    end
  end
end
