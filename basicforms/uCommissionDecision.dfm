inherited fmCommissionDecision: TfmCommissionDecision
  Caption = #1056#1077#1096#1077#1085#1080#1077' '#1082#1086#1084#1080#1089#1089#1080#1080
  WindowState = wsMaximized
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
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' '#1074' '#1082#1086#1084#1080#1089#1089#1080#1102
          DataBinding.FieldName = 'doc_to_commission_date'
          Width = 152
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1086#1084#1080#1089#1089#1080#1080
          DataBinding.FieldName = 'commission_info'
          Width = 102
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1079#1072#1089#1077#1076#1072#1085#1080#1103' '#1082#1086#1084#1080#1089#1089#1080#1080
          DataBinding.FieldName = 'commission_meeting_date'
          Width = 121
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1056#1077#1096#1077#1085#1080#1077' '#1082#1086#1084#1080#1089#1089#1080#1080
          DataBinding.FieldName = 'resolution_name'
          Width = 116
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '
          Width = 113
        end
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          Width = 108
        end
        object grBaseDBTableViewColumn8: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Width = 127
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    ExplicitWidth = 904
  end
  inherited BarManager: TdxBarManager
    Left = 552
    Top = 72
    DockControlHeights = (
      0
      0
      24
      0)
  end
  object DataSource1: TDataSource
    Left = 432
    Top = 72
  end
end
