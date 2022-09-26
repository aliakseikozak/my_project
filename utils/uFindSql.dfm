inherited fmFindSql: TfmFindSql
  Left = 496
  Top = 75
  Caption = 'fmFindSql'
  ClientWidth = 780
  Position = poScreenCenter
  Visible = False
  ExplicitWidth = 796
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    Width = 780
    Height = 26
    TabOrder = 2
    Visible = False
    ExplicitWidth = 780
    ExplicitHeight = 26
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 780
    end
  end
  inherited gbGridBase: TcxGroupBox
    Top = 78
    ExplicitTop = 78
    ExplicitWidth = 780
    ExplicitHeight = 443
    Height = 443
    Width = 780
    inherited grBase: TcxGrid
      Width = 776
      Height = 439
      ExplicitWidth = 776
      ExplicitHeight = 439
      inherited grBaseDBTableView: TcxGridDBTableView
        DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        OptionsData.Appending = False
        OptionsData.CancelOnExit = False
        OptionsData.DeletingConfirmation = True
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
      end
    end
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      49
      0)
  end
  inherited ActionList: TActionList
    inherited actRefresh: TAction
      Visible = False
    end
    inherited actGetData: TAction
      Visible = False
    end
    inherited actParamClear: TAction
      Visible = False
    end
  end
end
