inherited fmMedexamination: TfmMedexamination
  Caption = #1054#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
  ClientWidth = 1136
  ExplicitWidth = 1152
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    Width = 1136
    TabOrder = 2
    ExplicitWidth = 1136
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 1134
    end
  end
  inherited pnSelect: TPanel
    Width = 1136
    TabOrder = 4
    ExplicitWidth = 1136
    inherited dxLCPnlSelect: TdxLayoutControl
      Left = 929
      ExplicitLeft = 929
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
    Width = 1136
    ExplicitWidth = 1136
    inherited grBase: TcxGrid
      Width = 1134
      ExplicitWidth = 1134
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
          Caption = #1044#1072#1090#1072' '#1086#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
          DataBinding.FieldName = 'observation_date'
          Options.AutoWidthSizable = False
          Width = 104
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077' '#1074#1088#1072#1095#1072
          DataBinding.FieldName = 'medical_report'
          Options.AutoWidthSizable = False
          Width = 243
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1053#1072#1083#1080#1095#1080#1077' '#1076#1080#1072#1075#1085#1086#1079#1072' '#1087#1088#1077#1087#1103#1090#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1102' '#1074' '#1089#1091#1076
          DataBinding.FieldName = 'no_court_disease'
          Options.AutoWidthSizable = False
          Width = 290
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1053#1072#1083#1080#1095#1080#1077' '#1073#1077#1088#1077#1084#1077#1085#1085#1086#1089#1090#1080
          DataBinding.FieldName = 'pr_pregnancy'
          Options.AutoWidthSizable = False
          Width = 126
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1044#1086#1082#1090#1086#1088
          DataBinding.FieldName = 'doctor'
          Options.AutoWidthSizable = False
          Width = 180
        end
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1043#1076#1077' '#1087#1088#1086#1074#1086#1076#1080#1083#1086#1089#1100' '#1086#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'name_org'
          Options.AutoWidthSizable = False
          Width = 213
        end
        object grBaseDBTableViewColumn8: TcxGridDBColumn
          Caption = #1053#1072#1083#1080#1095#1080#1077' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080
          DataBinding.FieldName = 'invalid'
          Options.AutoWidthSizable = False
          Width = 167
        end
        object grBaseDBTableViewColumn9: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'create_date'
          Options.AutoWidthSizable = False
          Width = 123
        end
        object grBaseDBTableViewColumn10: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'change_date'
          Options.AutoWidthSizable = False
          Width = 131
        end
        object grBaseDBTableViewColumn11: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Options.AutoWidthSizable = False
          Width = 107
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    Width = 1136
    ExplicitWidth = 1136
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
