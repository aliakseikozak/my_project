inherited fmLTPCureAdd: TfmLTPCureAdd
  Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1083#1077#1095#1077#1085#1080#1080' '#1074' '#1051#1058#1055
  ClientHeight = 430
  ClientWidth = 605
  Position = poMainFormCenter
  ExplicitWidth = 621
  ExplicitHeight = 469
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 605
    Height = 389
    Align = alClient
    TabOrder = 4
    object cxTextEdit3: TcxTextEdit
      Left = 177
      Top = 91
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 3
      Width = 223
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 177
      Top = 64
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1055#1088#1086#1093#1086#1076#1080#1090'/'#1087#1088#1086#1096#1077#1083' '#1050#1052#1057#1056
          FieldName = 'name'
        end>
      Properties.ListSource = dskmcr
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 223
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 141
      Width = 559
      Height = 205
      Caption = #1052#1077#1076#1080#1094#1080#1085#1089#1082#1080#1077' '#1086#1089#1084#1086#1090#1088#1099
      TabOrder = 5
      object dxLayoutControl2: TdxLayoutControl
        Left = 2
        Top = 15
        Width = 555
        Height = 188
        Align = alClient
        TabOrder = 0
        object cxGrid1: TcxGrid
          Left = 10
          Top = 10
          Width = 511
          Height = 135
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsMedical
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            object cxGrid1DBTableView1Column1: TcxGridDBColumn
              Caption = #1050#1086#1076' '#1079#1072#1087#1080#1089#1080
              DataBinding.FieldName = 'id'
              Width = 73
            end
            object cxGrid1DBTableView1Column2: TcxGridDBColumn
              Caption = #1044#1072#1090#1072' '#1086#1089#1084#1086#1090#1088#1072
              DataBinding.FieldName = 'examination_date'
              Width = 93
            end
            object cxGrid1DBTableView1Column3: TcxGridDBColumn
              Caption = #1047#1072#1082#1083#1102#1095#1077#1085#1080#1077' '#1074#1088#1072#1095#1072
              DataBinding.FieldName = 'medical_report'
              Width = 113
            end
            object cxGrid1DBTableView1Column4: TcxGridDBColumn
              Caption = #1044#1072#1085#1085#1099#1077' '#1074#1088#1072#1095#1072
              DataBinding.FieldName = 'doctor'
              Width = 100
            end
            object cxGrid1DBTableView1Column5: TcxGridDBColumn
              Caption = #1055#1088#1080#1095#1080#1085#1072' '#1086#1089#1084#1086#1090#1088#1072
              DataBinding.FieldName = 'reason_name'
              Width = 105
            end
            object cxGrid1DBTableView1Column6: TcxGridDBColumn
              Caption = #1057#1087#1077#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103
              DataBinding.FieldName = 'specialistdoctor_name'
              Options.AutoWidthSizable = False
              Width = 107
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
        object Button2: TButton
          Left = 10
          Top = 151
          Width = 191
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          ImageIndex = 1
          Images = Resource.ImageList
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button1: TButton
          Left = 272
          Top = 151
          Width = 249
          Height = 25
          Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
          ImageIndex = 2
          Images = Resource.ImageList
          TabOrder = 2
          OnClick = Button1Click
        end
        object dxLayoutControl2Group_Root: TdxLayoutGroup
          AlignHorz = ahLeft
          AlignVert = avTop
          ButtonOptions.Buttons = <>
          Hidden = True
          ShowBorder = False
          Index = -1
        end
        object dxLayoutItem7: TdxLayoutItem
          Parent = dxLayoutControl2Group_Root
          AlignHorz = ahClient
          Control = cxGrid1
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem9: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup1
          AlignHorz = ahClient
          CaptionOptions.Text = 'Button2'
          CaptionOptions.Visible = False
          Control = Button2
          ControlOptions.ShowBorder = False
          Index = 0
        end
        object dxLayoutItem8: TdxLayoutItem
          Parent = dxLayoutAutoCreatedGroup1
          AlignVert = avClient
          CaptionOptions.Text = 'Button1'
          CaptionOptions.Visible = False
          Control = Button1
          ControlOptions.ShowBorder = False
          Index = 1
        end
        object dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup
          Parent = dxLayoutControl2Group_Root
          LayoutDirection = ldHorizontal
          Index = 1
          AutoCreated = True
        end
      end
    end
    object cxDateEdit1: TcxDateEdit
      Left = 177
      Top = 10
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 121
    end
    object cxDateEdit2: TcxDateEdit
      Left = 177
      Top = 37
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
      Width = 121
    end
    object CheckBox1: TCheckBox
      Left = 10
      Top = 118
      Width = 97
      Height = 17
      Caption = #1055#1088#1086#1093#1086#1076#1080#1090'/'#1087#1088#1086#1096#1077#1083' '#1087#1089#1080#1093#1086'-'#1082#1086#1088#1088#1077#1082#1094#1080#1086#1085#1085#1091#1102' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      TabOrder = 4
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
      CaptionOptions.Text = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099' '#1083#1077#1095#1077#1085#1080#1103':'
      Control = cxTextEdit3
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1055#1088#1086#1093#1086#1076#1080#1090'/'#1087#1088#1086#1096#1077#1083' '#1050#1052#1057#1056' '#1074' '#1051#1058#1055':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'GroupBox1'
      CaptionOptions.Visible = False
      Control = GroupBox1
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1083#1077#1095#1077#1085#1080#1103':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1083#1077#1095#1077#1085#1080#1103':'
      Control = cxDateEdit2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem10: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = 'CheckBox1'
      CaptionOptions.Visible = False
      Control = CheckBox1
      ControlOptions.AutoColor = True
      ControlOptions.ShowBorder = False
      Index = 4
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 389
    Width = 605
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      605
      41)
    object btnOk: TButton
      Tag = 6
      Left = 331
      Top = 6
      Width = 160
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      Enabled = False
      ImageIndex = 14
      Images = Resource.ImageList
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 497
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
    object Button3: TButton
      Tag = 6
      Left = 152
      Top = 6
      Width = 173
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086' '#1083#1077#1095#1077#1085#1080#1080
      ImageIndex = 14
      Images = Resource.ImageList
      TabOrder = 2
      OnClick = Button3Click
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
  object dskmcr: TDataSource
    Left = 432
    Top = 120
  end
  object dsMedical: TDataSource
    Left = 184
    Top = 312
  end
end
