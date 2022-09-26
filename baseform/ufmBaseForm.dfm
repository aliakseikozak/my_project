inherited fmBaseForm: TfmBaseForm
  Left = 528
  Top = 152
  Caption = 'fmBaseForm'
  ClientHeight = 303
  ClientWidth = 912
  KeyPreview = True
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitWidth = 928
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 13
  object dsBase: TDataSource
    Left = 640
    Top = 16
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'window'
      'default')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    ImageOptions.Images = BaseResource.ImageList
    ImageOptions.StretchGlyphs = False
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 624
    Top = 136
    DockControlHeights = (
      0
      0
      45
      0)
    object BarManagerMainMenu: TdxBar
      BorderStyle = bbsNone
      Caption = 'MainManu'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 310
      FloatTop = 133
      FloatClientWidth = 0
      FloatClientHeight = 0
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'mnFile'
        end
        item
          Visible = True
          ItemName = 'siWindow'
        end
        item
          Visible = True
          ItemName = 'mnPlugins'
        end>
      MultiLine = True
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object BarManagerMainBar: TdxBar
      AllowQuickCustomizing = False
      BorderStyle = bbsNone
      Caption = 'MainBar'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 21
      DockingStyle = dsTop
      FloatLeft = 310
      FloatTop = 133
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btExit'
        end
        item
          Visible = True
          ItemName = 'mnPlugins'
        end>
      OneOnRow = True
      Row = 1
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object siWindow: TdxBarSubItem
      Caption = #1054#1082#1085#1086
      Category = 0
      Visible = ivNever
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btGridViewCustomize'
        end
        item
          Visible = True
          ItemName = 'btGridViewRestore'
        end>
    end
    object btGridViewCustomize: TdxBarButton
      Action = actGridViewCustomize
      Category = 0
    end
    object btGridViewRestore: TdxBarButton
      Action = actGridViewRestore
      Category = 0
    end
    object btExit: TdxBarButton
      Action = actExit
      Category = 1
    end
    object mnFile: TdxBarSubItem
      Caption = #1060#1072#1081#1083
      Category = 1
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btExit'
        end>
    end
    object mnPlugins: TdxBarSubItem
      Caption = #1054#1090#1095#1077#1090#1099
      Category = 1
      Visible = ivNever
      ItemLinks = <>
    end
    object btNewWindow: TdxBarButton
      Action = actNewWindow
      Category = 1
      ImageIndex = 48
    end
  end
  object ActionList: TActionList
    Images = Resource.ImageList
    Left = 704
    Top = 16
    object actExit: TAction
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076
      ImageIndex = 0
      OnExecute = actExitExecute
    end
    object actGridViewCustomize: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1074#1080#1076' '#1090#1072#1073#1083#1080#1094#1099
      Hint = #1053#1072#1089#1090#1088#1086#1080#1090#1100' '#1074#1080#1076' '#1090#1072#1073#1083#1080#1094#1099
      ImageIndex = 39
      OnExecute = actGridViewCustomizeExecute
      OnUpdate = actGridViewCustomizeUpdate
    end
    object actGridViewRestore: TAction
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1080#1076' '#1090#1072#1073#1083#1080#1094#1099
      Hint = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1080#1076' '#1090#1072#1073#1083#1080#1094#1099
      ImageIndex = 5
      OnExecute = actGridViewRestoreExecute
      OnUpdate = actGridViewCustomizeUpdate
    end
    object actNewWindow: TAction
      Caption = #1053#1086#1074#1086#1077' '#1086#1082#1085#1086
      Hint = #1053#1086#1074#1086#1077' '#1086#1082#1085#1086
      ImageIndex = 28
    end
    object aGroupPanel: TAction
      Caption = #1055#1072#1085#1077#1083#1100' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1080
      ImageIndex = 19
      OnExecute = aGroupPanelExecute
    end
    object nAutoAlign: TAction
      Caption = #1042#1099#1088#1086#1074#1085#1103#1090#1100' '#1103#1095#1077#1081#1082#1080' '#1087#1086' '#1096#1080#1088#1080#1085#1077' '#1090#1072#1073#1083#1080#1094#1099
      ImageIndex = 83
      OnExecute = nAutoAlignExecute
    end
    object aFill: TAction
      Caption = #1047#1072#1087#1086#1083#1085#1080#1090#1100' '#1087#1086' '#1096#1080#1088#1080#1085#1077' '#1079#1085#1072#1095#1077#1085#1080#1081
      OnExecute = aFillExecute
    end
  end
end
