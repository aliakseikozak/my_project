inherited fmDiseaseAdd: TfmDiseaseAdd
  Caption = #1047#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103
  ClientHeight = 239
  ClientWidth = 436
  Position = poMainFormCenter
  ExplicitWidth = 452
  ExplicitHeight = 278
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 436
    Height = 198
    Align = alClient
    TabOrder = 4
    object CheckBox1: TCheckBox
      Left = 10
      Top = 118
      Width = 97
      Height = 17
      Caption = #1053#1072#1093#1086#1078#1076#1077#1085#1080#1077' '#1074' '#1051#1058#1055
      TabOrder = 4
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 94
      Top = 91
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1053#1080#1079#1096#1080#1081' '#1082#1083#1072#1089#1089
          FieldName = 'name'
        end>
      Properties.ListSource = dsDiseaseunderclass
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 3
      Width = 223
    end
    object cxLookupComboBox3: TcxLookupComboBox
      Left = 94
      Top = 64
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1055#1086#1076#1082#1083#1072#1089#1089
          FieldName = 'name'
        end>
      Properties.ListSource = dsDiseasesubclass
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 307
    end
    object cxTextEdit2: TcxTextEdit
      Left = 94
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 0
      Width = 121
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 94
      Top = 37
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          FieldName = 'name'
        end>
      Properties.ListSource = dsDiseaseclass
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
      Width = 223
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'CheckBox1'
      CaptionOptions.Visible = False
      Control = CheckBox1
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = #1053#1080#1079#1096#1080#1081' '#1082#1083#1072#1089#1089':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = #1055#1086#1076#1082#1083#1072#1089#1089':'
      Control = cxLookupComboBox3
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      CaptionOptions.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
      Control = cxTextEdit2
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #1050#1083#1072#1089#1089':'
      Control = cxLookupComboBox1
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 198
    Width = 436
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      436
      41)
    object btnOk: TButton
      Tag = 6
      Left = 162
      Top = 6
      Width = 160
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ImageIndex = 14
      Images = Resource.ImageList
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 328
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 16
      Images = Resource.ImageList
      TabOrder = 1
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
  object dsDiseaseclass: TDataSource
    Left = 128
    Top = 149
  end
  object dsDiseasesubclass: TDataSource
    Left = 216
    Top = 149
  end
  object dsDiseaseunderclass: TDataSource
    Left = 320
    Top = 149
  end
end
