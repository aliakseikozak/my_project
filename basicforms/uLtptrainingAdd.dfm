inherited fmLtptrainingAdd: TfmLtptrainingAdd
  Caption = #1054#1073#1091#1095#1077#1085#1080#1077' '
  ClientHeight = 114
  ClientWidth = 366
  Position = poMainFormCenter
  ExplicitWidth = 382
  ExplicitHeight = 153
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 366
    Height = 73
    Align = alClient
    TabOrder = 4
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 99
      Top = 37
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100
          FieldName = 'name'
        end>
      Properties.ListSource = dsProfession
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
      Width = 223
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 99
      Top = 10
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1059#1095#1077#1073#1085#1086#1077' '#1091#1095#1088#1077#1078#1076#1077#1085#1080#1077
          FieldName = 'name'
        end>
      Properties.ListSource = dsOrganization
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
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
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1057#1087#1077#1094#1080#1072#1083#1100#1085#1086#1089#1090#1100':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = #1052#1077#1089#1090#1086' '#1086#1073#1091#1095#1077#1085#1080#1103':'
      Control = cxLookupComboBox1
      ControlOptions.ShowBorder = False
      Index = 0
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 73
    Width = 366
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      366
      41)
    object btnOk: TButton
      Tag = 6
      Left = 92
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
      Left = 258
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
      DockedTop = 0
      Visible = False
    end
  end
  object dsProfession: TDataSource
    Left = 40
    Top = 73
  end
  object dsOrganization: TDataSource
    Left = 40
    Top = 32
  end
end
