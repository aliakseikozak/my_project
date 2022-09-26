object fmMedinspectorAdd: TfmMedinspectorAdd
  Left = 0
  Top = 0
  Caption = #1052#1077#1076#1089#1074#1077#1076#1077#1085#1080#1103'.'#1054#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086#1074#1072#1085#1080#1077
  ClientHeight = 441
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 400
    Width = 607
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      607
      41)
    object btnOk: TButton
      Tag = 6
      Left = 333
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
      Left = 499
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
  object dxLayoutControl1: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 607
    Height = 400
    Align = alClient
    TabOrder = 1
    object cxDateEdit1: TcxDateEdit
      Left = 206
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
      Left = 206
      Top = 64
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1047#1072#1074#1080#1089#1080#1084#1086#1089#1090#1100
          FieldName = 'name'
        end>
      Properties.ListSource = dsDependenceType
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 364
    end
    object cxDateEdit2: TcxDateEdit
      Left = 206
      Top = 37
      Properties.AssignedValues.DisplayFormat = True
      Properties.AssignedValues.EditFormat = True
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
      Width = 121
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 206
      Top = 118
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
      TabOrder = 4
      Width = 364
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
    object cxTextEdit1: TcxTextEdit
      Left = 206
      Top = 91
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 3
      Width = 364
    end
    object cxLookupComboBox3: TcxLookupComboBox
      Left = 206
      Top = 145
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1044#1080#1072#1075#1085#1086#1079
          FieldName = 'name'
        end>
      Properties.ListSource = dsdisease
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 5
      Width = 223
    end
    object btnAddDis: TButton
      Left = 435
      Top = 145
      Width = 135
      Height = 27
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 1
      Images = Resource.ImageList
      TabOrder = 6
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
      CaptionOptions.Text = #1044#1072#1090#1072' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1103' '#1085#1072#1073#1083#1102#1076#1077#1085#1080#1103':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1042#1080#1076' '#1079#1072#1074#1080#1089#1080#1084#1086#1089#1090#1080':'
      Control = cxLookupComboBox1
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem3: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1044#1072#1090#1072' '#1086#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086#1074#1072#1085#1080#1103':'
      Control = cxDateEdit2
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080' '#1054#1047':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 4
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
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1050#1090#1086' '#1087#1088#1086#1074#1086#1076#1080#1083' '#1086#1089#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086#1074#1072#1085#1080#1077':'
      Control = cxTextEdit1
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutAutoCreatedGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = #1047#1072#1073#1086#1083#1077#1074#1072#1085#1080#1103
      Control = cxLookupComboBox3
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem8: TdxLayoutItem
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
      Index = 5
      AutoCreated = True
    end
  end
  object dsDependenceType: TDataSource
    Left = 472
    Top = 32
  end
  object dsOrganization: TDataSource
    Left = 576
    Top = 32
  end
  object dsdisease: TDataSource
    Left = 378
    Top = 360
  end
  object dsDisGet: TDataSource
    Left = 504
    Top = 168
  end
end
