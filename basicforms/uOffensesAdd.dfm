inherited fmOffensesAdd: TfmOffensesAdd
  Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1080#1074#1085#1099#1077' '#1087#1088#1072#1074#1086#1085#1072#1088#1091#1096#1077#1085#1080#1103
  ClientHeight = 269
  ClientWidth = 518
  Position = poMainFormCenter
  ExplicitWidth = 534
  ExplicitHeight = 308
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 518
    Height = 228
    Align = alClient
    TabOrder = 4
    object cxDateEdit2: TcxDateEdit
      Left = 233
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 121
    end
    object cxDateEdit1: TcxDateEdit
      Left = 233
      Top = 37
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
      Width = 121
    end
    object cxLookupComboBox4: TcxLookupComboBox
      Left = 233
      Top = 145
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1055#1088#1072#1074#1086#1085#1072#1088#1091#1096#1077#1085#1080#1077
          FieldName = 'name'
        end>
      Properties.ListSource = dsOffenses_type
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 5
      Width = 268
    end
    object cxTextEdit1: TcxTextEdit
      Left = 233
      Top = 64
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
      Width = 121
    end
    object cxLookupComboBox3: TcxLookupComboBox
      Left = 233
      Top = 118
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1057#1090#1072#1090#1100#1103
          FieldName = 'name'
        end>
      Properties.ListSource = dsDirectory_article
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 4
      Width = 268
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 233
      Top = 91
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1056#1054#1042#1044
          FieldName = 'name'
        end>
      Properties.ListSource = dsOrganization
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 3
      Width = 145
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1044#1072#1090#1072' '#1089#1086#1074#1077#1088#1096#1077#1085#1080#1103' '#1087#1088#1072#1074#1086#1085#1072#1088#1091#1096#1077#1085#1080#1103':'
      Control = cxDateEdit2
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1044#1072#1090#1072' '#1087#1088#1080#1074#1083#1077#1095#1077#1085#1080#1103' '#1082' '#1072#1076#1084'.'#1086#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1086#1089#1090#1080':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1042#1080#1076' '#1087#1088#1072#1074#1086#1085#1072#1088#1091#1096#1077#1085#1080#1103':'
      Control = cxLookupComboBox4
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1056#1077#1075'.'#1085#1086#1084#1077#1088' '#1040#1055' '#1074' '#1045#1043#1041#1044#1055':'
      Control = cxTextEdit1
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1057#1090#1072#1090#1100#1103' '#1050#1086#1040#1055':'
      Control = cxLookupComboBox3
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      CaptionOptions.Text = #1050#1077#1084' '#1087#1088#1080#1074#1083#1077#1082#1072#1083#1089#1103':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 228
    Width = 518
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      518
      41)
    object btnOk: TButton
      Tag = 6
      Left = 254
      Top = 6
      Width = 160
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ImageIndex = 14
      Images = Resource.ImageList
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 420
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 16
      Images = Resource.ImageList
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      0
      0)
    inherited BarManagerMainMenu: TdxBar
      Visible = False
    end
    inherited BarManagerMainBar: TdxBar
      Visible = False
    end
  end
  object dsOrganization: TDataSource
    Left = 376
    Top = 53
  end
  object dsDirectory_article: TDataSource
    Left = 448
    Top = 53
  end
  object dsOffenses_type: TDataSource
    Left = 376
    Top = 101
  end
end
