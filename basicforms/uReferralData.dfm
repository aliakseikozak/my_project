inherited fmReferralData: TfmReferralData
  Caption = #1044#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1074' '#1051#1058#1055
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    TabOrder = 2
    inherited lbParam: TcxLabel
      Style.IsFontAssigned = True
    end
    object cxButton1: TcxButton
      Left = 160
      Top = 32
      Width = 145
      Height = 25
      Caption = #1053#1072#1087#1088#1072#1074#1080#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077
      TabOrder = 1
      Visible = False
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 9
      Top = 32
      Width = 145
      Height = 25
      Caption = #1056#1077#1096#1077#1085#1080#1077' '#1082#1086#1084#1080#1089#1089#1080#1080
      TabOrder = 2
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 9
      Top = 63
      Width = 145
      Height = 25
      Caption = #1056#1077#1096#1077#1085#1080#1077' '#1089#1091#1076#1072
      TabOrder = 3
      OnClick = cxButton3Click
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
    inherited grBase: TcxGrid
      inherited grBaseDBTableView: TcxGridDBTableView
        OptionsView.GroupByBox = True
        object grBaseDBTableViewColumn1: TcxGridDBColumn
          Caption = 'Id'
          DataBinding.FieldName = 'grdoctoltp_id'
          Visible = False
          GroupIndex = 0
        end
        object grBaseDBTableViewColumn2: TcxGridDBColumn
          Caption = #1050#1086#1076' '#1079#1072#1087#1080#1089#1080
          DataBinding.FieldName = 'id'
          Width = 144
        end
        object grBaseDBTableViewColumn3: TcxGridDBColumn
          Caption = #1044#1072#1090#1072
          DataBinding.FieldName = 'date_rec'
          Width = 236
        end
        object grBaseDBTableViewColumn4: TcxGridDBColumn
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          DataBinding.FieldName = 'note'
          Width = 207
        end
        object grBaseDBTableViewColumn5: TcxGridDBColumn
          DataBinding.FieldName = 'gropuby'
          Visible = False
        end
      end
    end
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
