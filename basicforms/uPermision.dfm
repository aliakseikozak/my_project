inherited fmPermision: TfmPermision
  Caption = #1055#1088#1072#1074#1072' '#1076#1086#1089#1090#1091#1087#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    TabOrder = 2
    Visible = False
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
    end
  end
  inherited pnSelect: TPanel
    TabOrder = 4
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
    ExplicitWidth = 904
    inherited grBase: TcxGrid
      ExplicitWidth = 902
      inherited grBaseDBTableView: TcxGridDBTableView
        OnCellDblClick = grBaseDBTableViewCellDblClick
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1056#1086#1083#1100
          DataBinding.FieldName = 'role_name'
          Width = 87
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1052#1086#1076#1091#1083#1100
          DataBinding.FieldName = 'module_name'
          Width = 101
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1055#1088#1086#1089#1084#1086#1090#1088
          DataBinding.FieldName = 'on_viewing'
          Width = 105
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'module_note'
          Width = 131
        end
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'on_edit'
          Width = 105
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1059#1076#1072#1083#1077#1085#1080#1077
          DataBinding.FieldName = 'on_deletion'
          Width = 105
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    ExplicitWidth = 904
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      24
      0)
    inherited btRefresh: TdxBarButton
      Visible = ivNever
    end
    inherited btSave: TdxBarButton
      Visible = ivNever
    end
    inherited btFilter: TdxBarButton
      Visible = ivNever
    end
    inherited btExcel: TdxBarButton
      Visible = ivNever
    end
    inherited btParamClear: TdxBarButton
      Visible = ivNever
    end
  end
  inherited ActionList: TActionList
    inherited actGetData: TAction
      OnExecute = actGetDataExecute
    end
  end
end
