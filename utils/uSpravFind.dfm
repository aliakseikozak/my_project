inherited fmSpravFind: TfmSpravFind
  Left = 517
  Top = 75
  Width = 1027
  Height = 580
  Align = alNone
  BorderStyle = bsSizeable
  Caption = #1042#1099#1073#1086#1088' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
  DefaultMonitor = dmDesktop
  ParentBiDiMode = False
  Position = poDesktopCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    Top = 47
    Width = 1011
    TabOrder = 3
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
    end
  end
  inherited gbGridBase: TcxGroupBox
    Top = 94
    Height = 448
    Width = 1011
    inherited grBase: TcxGrid
      Width = 1007
      Height = 444
      inherited grBaseDBTableView: TcxGridDBTableView
        OnDblClick = actGetExecute
        OnKeyPress = grBaseDBTableViewKeyPress
      end
    end
  end
  inherited qryBase: TZQuery
    CachedUpdates = False
  end
  inherited BarManager: TdxBarManager
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    DockControlHeights = (
      0
      0
      47
      0)
    inherited BarManagerMainMenu: TdxBar
      Visible = True
    end
    inherited BarManagerMainBar: TdxBar
      DockedTop = 21
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btExit'
        end
        item
          Visible = True
          ItemName = 'btRefresh'
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
          ItemName = 'btGet'
        end
        item
          Visible = True
          ItemName = 'btGetData'
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
          ItemName = 'btSave'
        end
        item
          Visible = True
          ItemName = 'btCancel'
        end>
      Row = 1
    end
    object btGet: TdxBarButton [17]
      Action = actGet
      Category = 0
    end
    inherited mnFile: TdxBarSubItem
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1091
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
          ItemName = 'btGet'
        end
        item
          Visible = True
          ItemName = 'btExit'
        end>
    end
  end
  inherited ActionList: TActionList
    inherited actExit: TAction
      Visible = True
    end
    inherited actExcel: TAction
      Visible = False
    end
    object actGet: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 6
      OnExecute = actGetExecute
    end
  end
end
