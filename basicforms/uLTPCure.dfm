inherited fmLTPCure: TfmLTPCure
  Caption = 'fmLTPCure'
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
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'id'
          Options.AutoWidthSizable = False
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1083#1077#1095#1077#1085#1080#1103
          DataBinding.FieldName = 'cure_start_date'
          Options.AutoWidthSizable = False
          Width = 111
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1083#1077#1095#1077#1085#1080#1103
          DataBinding.FieldName = 'cure_end_date'
          Options.AutoWidthSizable = False
          Width = 105
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1055#1088#1086#1093#1086#1076#1080#1090'/'#1087#1088#1086#1096#1077#1083' '#1087#1089#1080#1093#1086'-'#1082#1086#1088#1088#1077#1082#1094#1080#1086#1085#1085#1091#1102' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
          DataBinding.FieldName = 'pkp_attribute'
          Options.AutoWidthSizable = False
          Width = 181
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1083#1077#1095#1077#1085#1080#1103
          DataBinding.FieldName = 'cure_result'
          Options.AutoWidthSizable = False
          Width = 123
        end
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1055#1088#1086#1093#1086#1076#1080#1090'/'#1087#1088#1086#1096#1077#1083' '#1050#1052#1057#1056' '#1074' '#1051#1058#1055
          DataBinding.FieldName = 'attribute_name'
          Options.AutoWidthSizable = False
          Width = 143
        end
        object grBaseDBTableViewColumn8: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'create_date'
          Options.AutoWidthSizable = False
          Width = 120
        end
        object grBaseDBTableViewColumn9: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'change_date'
          Options.AutoWidthSizable = False
          Width = 114
        end
        object grBaseDBTableViewColumn10: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Options.AutoWidthSizable = False
          Width = 103
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
  end
  inherited ActionList: TActionList
    inherited actGetData: TAction
      OnExecute = actGetDataExecute
    end
  end
end
