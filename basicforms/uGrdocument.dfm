inherited fmGrdocument: TfmGrdocument
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
  ClientHeight = 523
  ClientWidth = 915
  Position = poMainFormCenter
  ExplicitWidth = 931
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    Width = 915
    TabOrder = 2
    ExplicitWidth = 915
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
      ExplicitWidth = 913
    end
  end
  inherited pnSelect: TPanel
    Top = 475
    Width = 915
    TabOrder = 4
    ExplicitTop = 475
    ExplicitWidth = 915
    inherited dxLCPnlSelect: TdxLayoutControl
      Left = 708
      ExplicitLeft = 708
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
    Width = 915
    Height = 321
    ExplicitWidth = 915
    ExplicitHeight = 321
    inherited grBase: TcxGrid
      Width = 913
      Height = 319
      ExplicitWidth = 913
      ExplicitHeight = 319
      inherited grBaseDBTableView: TcxGridDBTableView
        OnCellDblClick = grBaseDBTableViewCellDblClick
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'id'
        end
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
          DataBinding.FieldName = 'begin_date'
          Width = 105
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103
          DataBinding.FieldName = 'end_date'
          Width = 95
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'doc_type_name'
          Width = 119
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1057#1077#1088#1080#1103
          DataBinding.FieldName = 'series_doc'
          Width = 110
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          DataBinding.FieldName = 'number_doc'
          Width = 136
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'create_date'
          Width = 134
        end
        object grBaseDBTableViewColumn8: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'change_date'
          Width = 139
        end
        object grBaseDBTableViewColumn9: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Width = 98
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    Width = 915
    ExplicitWidth = 915
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      24
      0)
  end
  inherited ActionList: TActionList
    inherited actRefresh: TAction
      OnExecute = actGetDataExecute
    end
    inherited actGetData: TAction
      OnExecute = actGetDataExecute
    end
  end
end
