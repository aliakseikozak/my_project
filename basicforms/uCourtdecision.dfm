inherited fmCourtdecision: TfmCourtdecision
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1089#1091#1076#1072
  ClientWidth = 1126
  WindowState = wsMaximized
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
          Caption = 'ID'
          DataBinding.FieldName = 'id'
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1074' '#1089#1091#1076
          DataBinding.FieldName = 'date_referral'
          Width = 149
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1074#1099#1085#1077#1089#1077#1085#1080#1103' '#1088#1077#1096#1077#1085#1080#1103
          DataBinding.FieldName = 'date_referral'
          Width = 144
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1074#1089#1090#1091#1087#1083#1077#1085#1080#1103' '#1074' '#1089#1080#1083#1091' '#1088#1077#1096#1077#1085#1080#1103' '#1089#1091#1076#1072
          DataBinding.FieldName = 'date_referral'
          Width = 144
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1056#1077#1096#1077#1085#1080#1077'  '#1089#1091#1076#1072
          DataBinding.FieldName = 'rdecision_name'
          Width = 110
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1057#1088#1086#1082' '#1085#1072#1093#1086#1078#1076#1077#1085#1080#1103' '#1074' '#1051#1058#1055' '#1087#1086' '#1088#1077#1096#1077#1085#1080#1102' '#1089#1091#1076#1072
          DataBinding.FieldName = 'length_stay'
          Width = 153
        end
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1091#1076#1077' ('#1089#1091#1076#1100#1077')'
          DataBinding.FieldName = 'court_information'
          Width = 112
        end
        object grBaseDBTableViewColumn8: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'create_date'
          Width = 114
        end
        object grBaseDBTableViewColumn9: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'change_date'
          Width = 109
        end
        object grBaseDBTableViewColumn10: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Width = 102
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
end
