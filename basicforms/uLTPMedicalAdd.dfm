inherited fmLTPMedicalAdd: TfmLTPMedicalAdd
  Caption = #1052#1077#1076#1077#1094#1080#1085#1089#1082#1080#1077' '#1086#1089#1084#1086#1090#1088#1099
  ClientHeight = 442
  ClientWidth = 562
  Position = poMainFormCenter
  ExplicitWidth = 578
  ExplicitHeight = 481
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 562
    Height = 401
    Align = alClient
    TabOrder = 4
    object cxDateEdit1: TcxDateEdit
      Left = 112
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 121
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 178
      Width = 519
      Height = 183
      Caption = #1047#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103
      TabOrder = 7
      object cxGrid1: TcxGrid
        Left = 3
        Top = 16
        Width = 542
        Height = 151
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsDisGet
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1Column1: TcxGridDBColumn
            Caption = #1047#1072#1073#1086#1083#1077#1074#1072#1085#1080#1077
            DataBinding.FieldName = 'disease_name'
            Width = 486
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object cxLookupComboBox3: TcxLookupComboBox
      Left = 112
      Top = 145
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1044#1080#1072#1075#1085#1086#1079
          FieldName = 'name'
        end>
      Properties.ListSource = dsDisease
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 5
      Width = 223
    end
    object Button2: TButton
      Left = 341
      Top = 145
      Width = 135
      Height = 27
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      Images = Resource.ImageList
      TabOrder = 6
      OnClick = Button2Click
    end
    object cxTextEdit3: TcxTextEdit
      Left = 112
      Top = 118
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Width = 364
    end
    object cxTextEdit2: TcxTextEdit
      Left = 112
      Top = 64
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 2
      Width = 364
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 112
      Top = 37
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1057#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
          FieldName = 'name'
        end>
      Properties.ListSource = dsspecialistdoctor
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
      Width = 364
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 112
      Top = 91
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1057#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
          FieldName = 'name'
        end>
      Properties.ListSource = dsinspectionreason
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 3
      Width = 364
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
      CaptionOptions.Text = #1044#1072#1090#1072' '#1086#1089#1084#1086#1090#1088#1072':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'GroupBox1'
      CaptionOptions.Visible = False
      Control = GroupBox1
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      AlignHorz = ahLeft
      CaptionOptions.Text = #1047#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103':'
      Control = cxLookupComboBox3
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup2
      CaptionOptions.Text = 'Button2'
      CaptionOptions.Visible = False
      Control = Button2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 5
      AutoCreated = True
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077' '#1074#1088#1072#1095#1072':'
      Control = cxTextEdit3
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1044#1072#1085#1085#1099#1077' '#1074#1088#1072#1095#1072':'
      Control = cxTextEdit2
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1057#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103':'
      Control = cxLookupComboBox1
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1055#1088#1080#1095#1080#1085#1072' '#1086#1089#1084#1086#1090#1088#1072':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 3
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 401
    Width = 562
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      562
      41)
    object btnOk: TButton
      Tag = 6
      Left = 288
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
      Left = 454
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
  object dsspecialistdoctor: TDataSource
    Left = 192
    Top = 376
  end
  object dsinspectionreason: TDataSource
    Left = 96
    Top = 376
  end
  object dsDisease: TDataSource
    Left = 134
    Top = 317
  end
  object dsDisGet: TDataSource
    Left = 34
    Top = 338
  end
end
