inherited fmLTPPreventiveAdd: TfmLTPPreventiveAdd
  Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080' '#1087#1088#1086#1092#1091#1095#1077#1090#1072
  ClientHeight = 200
  ClientWidth = 382
  Position = poMainFormCenter
  ExplicitWidth = 398
  ExplicitHeight = 239
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 382
    Height = 159
    Align = alClient
    TabOrder = 4
    object cxTextEdit3: TcxTextEdit
      Left = 129
      Top = 37
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Width = 223
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 129
      Top = 10
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
          FieldName = 'name'
        end>
      Properties.ListSource = dsViolations
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 223
    end
    object cxTextEdit1: TcxTextEdit
      Left = 129
      Top = 91
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 3
      Width = 223
    end
    object cxDateEdit1: TcxDateEdit
      Left = 129
      Top = 64
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 121
    end
    object cxDateEdit2: TcxDateEdit
      Left = 129
      Top = 118
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 4
      Width = 121
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1055#1088#1086#1090#1086#1082#1086#1083' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080':'
      Control = cxTextEdit3
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1087#1088#1086#1092#1091#1095#1077#1090#1072':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1055#1088#1086#1090#1086#1082#1086#1083' '#1089#1085#1103#1090#1080#1103':'
      Control = cxTextEdit1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1055#1088#1086#1090#1086#1082#1086#1083' '#1087#1086#1089#1090#1072#1085#1086#1074#1082#1080':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1055#1088#1086#1090#1086#1082#1086#1083' '#1089#1085#1103#1090#1080#1103':'
      Control = cxDateEdit2
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 159
    Width = 382
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      382
      41)
    object btnOk: TButton
      Tag = 6
      Left = 108
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
      Left = 274
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
  object dsViolations: TDataSource
    Left = 32
    Top = 144
  end
end
