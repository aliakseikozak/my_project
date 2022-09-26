inherited fmBaseFind: TfmBaseFind
  Left = 737
  Top = 23
  Caption = 'fmBaseFind'
  ClientHeight = 521
  ExplicitHeight = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    TabOrder = 3
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
    end
  end
  inherited pnSelect: TPanel
    Top = 473
    inherited dxLCPnlSelect: TdxLayoutControl
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
    Height = 319
    ExplicitHeight = 319
    inherited grBase: TcxGrid
      Height = 317
      ExplicitHeight = 317
      inherited grBaseDBTableView: TcxGridDBTableView
        OnDblClick = grBaseDBTableViewDblClick
        OnKeyPress = grBaseDBTableViewKeyPress
        OnCellDblClick = grBaseDBTableViewCellDblClick
        OptionsBehavior.PullFocusing = True
      end
    end
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      24
      0)
    inherited BarManagerMainBar: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btExit'
        end
        item
          Visible = True
          ItemName = 'btOK'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btSave'
        end
        item
          Visible = True
          ItemName = 'btCancel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btGetData'
        end
        item
          Visible = True
          ItemName = 'btParamClear'
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
          BeginGroup = True
          Visible = True
          ItemName = 'btExcel'
        end
        item
          BeginGroup = True
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
        end>
    end
    inherited dxBarSeparator1: TdxBarSeparator
      Visible = ivNever
    end
    object btOK: TdxBarButton [16]
      Action = actOK
      Category = 0
    end
    inherited mnFile: TdxBarSubItem
      Caption = #1042#1099#1073#1088#1072#1090#1100
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
          ItemName = 'btOK'
        end
        item
          Visible = True
          ItemName = 'btExit'
        end>
    end
  end
  inherited ActionList: TActionList
    inherited actNew: TAction
      Visible = False
    end
    inherited actEdit: TAction
      Visible = False
    end
    inherited actDel: TAction
      Visible = False
    end
    inherited actSave: TAction
      Visible = False
    end
    inherited actCancel: TAction
      Visible = False
    end
    inherited actExcel: TAction
      Visible = False
    end
    object actOK: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Hint = #1042#1099#1073#1088#1072#1090#1100
      ImageIndex = 6
      OnExecute = actOKExecute
    end
  end
end
