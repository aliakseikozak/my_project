inherited fmLTPPenalty: TfmLTPPenalty
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1085#1072#1082#1072#1079#1072#1085#1080#1080
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
          Caption = #1044#1072#1090#1072' '#1087#1088#1086#1089#1090#1091#1087#1082#1072
          DataBinding.FieldName = 'breach_date'
          Options.AutoWidthSizable = False
          Width = 91
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1055#1088#1086#1089#1090#1091#1087#1086#1082
          DataBinding.FieldName = 'penalty_name'
          Options.AutoWidthSizable = False
          Width = 125
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1074#1085#1077#1089#1077#1085#1080#1103' '#1074#1079#1099#1089#1082#1072#1085#1080#1103
          DataBinding.FieldName = 'penalty_date'
          Options.AutoWidthSizable = False
          Width = 96
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1042#1079#1099#1089#1082#1072#1085#1080#1077
          DataBinding.FieldName = 'breach_name'
          Options.AutoWidthSizable = False
          Width = 109
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'create_date'
          Options.AutoWidthSizable = False
          Width = 106
        end
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'change_date'
          Options.AutoWidthSizable = False
          Width = 110
        end
        object grBaseDBTableViewColumn9: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Options.AutoWidthSizable = False
          Width = 113
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