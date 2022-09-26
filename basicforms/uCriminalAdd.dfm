inherited fmCriminalAdd: TfmCriminalAdd
  Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1089#1086#1076#1080#1084#1086#1089#1090#1080
  ClientHeight = 191
  ClientWidth = 511
  Position = poMainFormCenter
  ExplicitWidth = 527
  ExplicitHeight = 230
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 150
    Width = 511
    Height = 41
    Align = alBottom
    TabOrder = 4
    DesignSize = (
      511
      41)
    object btnOk: TButton
      Tag = 6
      Left = 237
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
      Left = 403
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
  object dxLayoutControl1: TdxLayoutControl [1]
    Left = 0
    Top = 0
    Width = 511
    Height = 150
    Align = alClient
    TabOrder = 5
    object cxDateEdit1: TcxDateEdit
      Left = 107
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 121
    end
    object cxTextEdit3: TcxTextEdit
      Left = 107
      Top = 37
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 1
      Width = 121
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 107
      Top = 64
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          FieldName = 'name'
        end>
      Properties.ListSource = dsDirectoryArticle
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
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
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1044#1072#1090#1072' '#1089#1091#1076#1080#1084#1086#1089#1090#1080':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = #1056#1077#1075'. '#1085#1086#1084#1077#1088' '#1045#1043#1044#1055':'
      Control = cxTextEdit3
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'C'#1090#1072#1090#1100#1103':'
      Control = cxLookupComboBox1
      ControlOptions.ShowBorder = False
      Index = 2
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
  object dsDirectoryArticle: TDataSource
    Left = 400
    Top = 83
  end
end
