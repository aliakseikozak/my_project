inherited fmSocAssessment: TfmSocAssessment
  Caption = #1054#1094#1077#1085#1082#1072' '#1089#1086#1094#1080#1072#1083#1100#1085#1086'-'#1090#1088#1091#1076#1086#1074#1086#1075#1086' '#1082#1088#1080#1090#1077#1088#1080#1103
  ClientWidth = 1126
  ExplicitWidth = 1142
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    Width = 1126
    TabOrder = 2
    ExplicitWidth = 1126
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 1124
    end
  end
  inherited pnSelect: TPanel
    Width = 1126
    TabOrder = 4
    ExplicitWidth = 1126
    inherited dxLCPnlSelect: TdxLayoutControl
      Left = 919
      ExplicitLeft = 919
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
    Width = 1126
    ExplicitWidth = 1126
    inherited grBase: TcxGrid
      Width = 1124
      ExplicitWidth = 1124
      inherited grBaseDBTableView: TcxGridDBTableView
        OnCellDblClick = grBaseDBTableViewCellDblClick
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'id'
          SortIndex = 0
          SortOrder = soDescending
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1094#1077#1085#1082#1080
          DataBinding.FieldName = 'assessment_date'
          Width = 104
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1057#1088#1086#1082' '#1086#1094#1077#1085#1082#1080
          DataBinding.FieldName = 'name_rehabilitation'
          Width = 134
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1059#1055#1056
          DataBinding.FieldName = 'name_upr'
          Width = 141
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1042#1086#1079#1088#1086#1089#1090
          DataBinding.FieldName = 'name_age'
          Width = 146
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1046#1080#1090#1077#1083#1100
          DataBinding.FieldName = 'name_resident'
          Width = 133
        end
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1057#1086#1094#1080#1072#1083#1100#1085#1086'-'#1087#1086#1083#1077#1079#1085#1099#1077' '#1089#1074#1103#1079#1080
          DataBinding.FieldName = 'name_communication'
          Width = 150
        end
        object grBaseDBTableViewColumn9: TcxGridDBColumn
          Caption = #1054#1094#1077#1085#1082#1072' '#1082#1088#1080#1090#1077#1088#1080#1103' '#1079#1072#1085#1103#1090#1086#1089#1090#1080' '#1074' '#1101#1082#1086#1085#1086#1084#1080#1082#1077' '#1089#1090#1088#1072#1085#1099
          DataBinding.FieldName = 'name_economy'
          Width = 195
        end
        object grBaseDBTableViewColumn8: TcxGridDBColumn
          Caption = #1054#1094#1077#1085#1082#1072' '#1082#1088#1080#1090#1077#1088#1080#1103' '#1072#1082#1090#1080#1074#1085#1086#1089#1090#1080' '#1074' '#1087#1086#1080#1089#1082#1072#1093' '#1088#1072#1073#1086#1090#1099
          DataBinding.FieldName = 'name_work'
          Width = 203
        end
        object grBaseDBTableViewColumn10: TcxGridDBColumn
          Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
          DataBinding.FieldName = 'add_information'
          Width = 155
        end
        object grBaseDBTableViewColumn11: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'create_date'
          Width = 96
        end
        object grBaseDBTableViewColumn12: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'change_date'
          Width = 113
        end
        object grBaseDBTableViewColumn13: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Width = 100
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    Width = 1126
    ExplicitWidth = 1126
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
