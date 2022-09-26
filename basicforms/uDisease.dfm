inherited fmDisease: TfmDisease
  Caption = #1047#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103
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
    ExplicitLeft = -64
    ExplicitTop = 149
    ExplicitWidth = 904
    inherited grBase: TcxGrid
      ExplicitWidth = 902
      inherited grBaseDBTableView: TcxGridDBTableView
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = 'ID'
          DataBinding.FieldName = 'id'
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1047#1072#1073#1086#1083#1077#1074#1072#1085#1080#1077
          DataBinding.FieldName = 'disease_name'
          Width = 106
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1050#1083#1072#1089#1089
          DataBinding.FieldName = 'name_class'
          Width = 102
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1055#1086#1076#1082#1083#1072#1089#1089
          DataBinding.FieldName = 'subclass'
          Width = 107
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1053#1080#1079#1096#1080#1081' '#1082#1083#1072#1089#1089
          DataBinding.FieldName = 'underclass'
          Width = 101
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1053#1072#1093#1086#1078#1076#1077#1085#1080#1077' '#1074' '#1051#1058#1055
          DataBinding.FieldName = 'no_court_disease'
          Width = 104
        end
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          DataBinding.FieldName = 'create_date'
          Width = 89
        end
        object grBaseDBTableViewColumn8: TcxGridDBColumn
          DataBinding.FieldName = 'change_date'
          Width = 95
        end
        object grBaseDBTableViewColumn9: TcxGridDBColumn
          DataBinding.FieldName = 'user_id'
        end
        object grBaseDBTableViewColumn10: TcxGridDBColumn
          DataBinding.FieldName = 'username'
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    ExplicitWidth = 904
  end
  inherited BarManager: TdxBarManager
    Left = 648
    Top = 248
    DockControlHeights = (
      0
      0
      24
      0)
  end
end
