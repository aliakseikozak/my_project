inherited fmWork: TfmWork
  Caption = #1056#1072#1073#1086#1090#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    TabOrder = 2
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
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'id'
          SortIndex = 0
          SortOrder = soDescending
          Width = 69
        end
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1073#1086#1090#1099
          DataBinding.FieldName = 'begin_work_date'
          Width = 111
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1088#1072#1073#1086#1090#1099
          DataBinding.FieldName = 'end_work_date'
          Width = 113
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1052#1077#1089#1090#1086' '#1088#1072#1073#1086#1090#1099
          DataBinding.FieldName = 'place_work_id'
          Width = 171
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          DataBinding.FieldName = 'post_name'
          Width = 114
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'create_date'
          Width = 122
        end
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'change_date'
          Width = 132
        end
        object grBaseDBTableViewColumn8: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Width = 107
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    ExplicitWidth = 904
  end
  inherited BarManager: TdxBarManager
    Left = 600
    Top = 88
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
end
