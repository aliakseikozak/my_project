inherited fmMedexaminationAdd: TfmMedexaminationAdd
  Caption = #1052#1077#1076#1089#1074#1077#1076#1077#1085#1080#1103'.'#1054#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 552
  ClientWidth = 592
  Position = poMainFormCenter
  ExplicitWidth = 608
  ExplicitHeight = 591
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 592
    Height = 511
    Align = alClient
    TabOrder = 4
    object cxDateEdit1: TcxDateEdit
      Left = 247
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 121
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 247
      Top = 205
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          FieldName = 'name'
        end>
      Properties.ListSource = dsOrganization
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 5
      Width = 303
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 247
      Top = 259
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1053#1072#1083#1080#1095#1080#1103' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080
          FieldName = 'name'
        end>
      Properties.ListSource = dsInvalid
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 7
      Width = 303
    end
    object CheckBox2: TCheckBox
      Left = 10
      Top = 132
      Width = 511
      Height = 17
      Caption = #1053#1072#1083#1080#1095#1080#1077' '#1076#1080#1072#1075#1085#1086#1079#1072' '#1087#1088#1077#1087#1103#1090#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1102' '#1074' '#1089#1091#1076
      TabOrder = 2
    end
    object CheckBox1: TCheckBox
      Left = 10
      Top = 155
      Width = 97
      Height = 17
      Caption = #1053#1072#1083#1080#1095#1080#1077' '#1073#1077#1088#1077#1084#1077#1085#1085#1086#1089#1090#1080
      TabOrder = 3
    end
    object cxTextEdit1: TcxTextEdit
      Left = 247
      Top = 178
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 4
      Width = 303
    end
    object cxLookupComboBox3: TcxLookupComboBox
      Left = 247
      Top = 232
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1047#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103
          FieldName = 'name'
        end>
      Properties.ListSource = dsDisease
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 6
      Width = 303
    end
    object cxMemo1: TMemo
      Left = 249
      Top = 39
      Width = 301
      Height = 85
      BorderStyle = bsNone
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 319
      Width = 540
      Height = 178
      Caption = #1047#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103
      TabOrder = 10
      object cxGrid1: TcxGrid
        Left = 3
        Top = 16
        Width = 526
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
    object cxLookupComboBox4: TcxLookupComboBox
      Left = 247
      Top = 286
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
      TabOrder = 8
      Width = 162
    end
    object btnAddDis: TButton
      Left = 415
      Top = 286
      Width = 135
      Height = 27
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      Images = Resource.ImageList
      TabOrder = 9
      OnClick = btnAddDisClick
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
      CaptionOptions.Text = #1044#1072#1090#1072' '#1086#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1103':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1043#1076#1077' '#1087#1088#1086#1074#1086#1076#1080#1083#1086#1089#1100' '#1086#1073#1089#1083#1077#1076#1086#1074#1072#1085#1080#1077':'
      Control = cxLookupComboBox1
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1053#1072#1083#1080#1095#1080#1077' '#1080#1085#1074#1072#1083#1080#1076#1085#1086#1089#1090#1080':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Visible = False
      Control = CheckBox2
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'CheckBox1'
      CaptionOptions.Visible = False
      Control = CheckBox1
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1050#1090#1086' '#1087#1088#1086#1074#1086#1076#1080#1083' '#1086#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086#1074#1072#1085#1080#1077':'
      Control = cxTextEdit1
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1044#1080#1072#1075#1085#1086#1079' '#1087#1088#1080#1087#1103#1089#1090#1074#1091#1102#1097#1080#1081' '#1085#1072#1093#1086#1078#1076#1077#1085#1080#1102' '#1074' '#1051#1058#1055':'
      Control = cxLookupComboBox3
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077' '#1074#1088#1072#1095#1072
      Control = cxMemo1
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Visible = False
      Control = GroupBox1
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 9
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = #1047#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103':'
      Control = cxLookupComboBox4
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem11: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      CaptionOptions.Text = 'Button2'
      CaptionOptions.Visible = False
      Control = btnAddDis
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
      Parent = dxLayoutControl1Group_Root
      LayoutDirection = ldHorizontal
      Index = 8
      AutoCreated = True
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 511
    Width = 592
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      592
      41)
    object btnOk: TButton
      Tag = 6
      Left = 318
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
      Left = 484
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
  object dsInvalid: TDataSource
    Left = 552
    Top = 296
  end
  object dsOrganization: TDataSource
    Left = 656
    Top = 296
  end
  object dsDisease: TDataSource
    Left = 752
    Top = 293
  end
  object dsDisGet: TDataSource
    Left = 314
    Top = 554
  end
  object dsSpecialistdoctor: TDataSource
    Left = 48
    Top = 496
  end
  object dsInspectionreason: TDataSource
    Left = 144
    Top = 496
  end
end
