inherited fmNotifications: TfmNotifications
  Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    Top = 0
    Height = 73
    TabOrder = 2
    ExplicitTop = 0
    ExplicitHeight = 73
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
    end
    object Button1: TButton
      Left = 8
      Top = 24
      Width = 105
      Height = 35
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100
      TabOrder = 1
      OnClick = Button1Click
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
    Top = 81
    Height = 406
    ExplicitWidth = 904
    inherited grBase: TcxGrid
      Height = 404
      ExplicitTop = -2
      ExplicitWidth = 902
      ExplicitHeight = 404
      inherited grBaseDBTableView: TcxGridDBTableView
        OnCustomDrawCell = grBaseDBTableViewCustomDrawCell
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'id'
          Width = 91
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #8470' '#1076#1077#1083#1072
          DataBinding.FieldName = 'grinforamtion_id'
          Width = 122
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
          DataBinding.FieldName = 'message_type'
          Width = 412
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1086#1090#1087#1088#1072#1074#1082#1080' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
          DataBinding.FieldName = 'create_date'
          Width = 102
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1085#1086
          DataBinding.FieldName = 'has_seen_user'
          Width = 100
        end
      end
    end
  end
  inherited cxspltrParam: TcxSplitter
    Top = 73
    ExplicitWidth = 904
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarManagerMainBar: TdxBar
      Visible = False
    end
  end
  object dsNotific: TDataSource
    Left = 392
    Top = 153
  end
end
