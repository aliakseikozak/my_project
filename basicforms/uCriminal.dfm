inherited fmCriminal: TfmCriminal
  Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1089#1086#1076#1080#1084#1086#1089#1090#1080
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
        object grBaseDBTableViewColumn7: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'id'
        end
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1091#1076#1080#1084#1086#1089#1090#1080
          DataBinding.FieldName = 'date_criminal'
          Width = 97
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1086#1085#1085#1099#1081' '#1085#1086#1084#1077#1088' '
          DataBinding.FieldName = 'reg_num'
          Width = 112
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1057#1090#1072#1090#1100#1103
          DataBinding.FieldName = 'name_type'
          Options.AutoWidthSizable = False
          Width = 100
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'create_date'
          Width = 111
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'change_date'
          Width = 124
        end
        object grBaseDBTableViewColumn6: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          DataBinding.FieldName = 'username'
          Width = 105
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    ExplicitWidth = 904
  end
  inherited BarManager: TdxBarManager
    Left = 648
    Top = 104
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
  object dsDirectoryArticle: TDataSource
    Left = 416
    Top = 226
  end
end
