inherited fmSocLegalAdd: TfmSocLegalAdd
  Caption = #1054#1094#1077#1085#1082#1072' '#1089#1086#1094#1080#1072#1083#1100#1085#1086'-'#1087#1088#1072#1074#1086#1074#1086#1075#1086' '#1082#1088#1080#1090#1077#1088#1080#1103
  ClientHeight = 332
  ClientWidth = 698
  ExplicitWidth = 714
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl [0]
    Left = 0
    Top = 0
    Width = 698
    Height = 291
    Align = alClient
    TabOrder = 4
    object cxTextEdit1: TcxTextEdit
      Left = 407
      Top = 199
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      TabOrder = 7
      Width = 57
    end
    object cxLookupComboBox3: TcxLookupComboBox
      Left = 407
      Top = 118
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1046#1080#1090#1077#1083#1100
          FieldName = 'name'
        end>
      Properties.ListSource = dsRegion
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 4
      Width = 223
    end
    object cxLookupComboBox4: TcxLookupComboBox
      Left = 407
      Top = 91
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1042#1086#1079#1088#1086#1089#1090
          FieldName = 'name'
        end>
      Properties.ListSource = dsAge
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 3
      Width = 223
    end
    object cxLookupComboBox5: TcxLookupComboBox
      Left = 407
      Top = 64
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1059#1056#1055
          FieldName = 'name'
        end>
      Properties.ListSource = dsUpr
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 2
      Width = 223
    end
    object cxLookupComboBox6: TcxLookupComboBox
      Left = 407
      Top = 145
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1057#1074#1103#1079#1080
          FieldName = 'name'
        end>
      Properties.ListSource = dsCommunication
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 5
      Width = 223
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 407
      Top = 172
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1057#1090#1077#1087#1077#1085#1100
          FieldName = 'name'
        end>
      Properties.ListSource = dsAlcohol
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 6
      Width = 223
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 407
      Top = 10
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          Caption = #1057#1088#1086#1082' '#1086#1094#1077#1085#1082#1080
          FieldName = 'name'
        end>
      Properties.ListSource = dsReabReriod
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 0
      Width = 223
    end
    object cxDateEdit1: TcxDateEdit
      Left = 407
      Top = 37
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebs3D
      Style.HotTrack = False
      Style.ButtonStyle = bts3D
      Style.PopupBorderStyle = epbsFrame3D
      TabOrder = 1
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
    object dxLayoutItem4: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahClient
      AlignVert = avTop
      CaptionOptions.Text = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1089#1074#1077#1076#1077#1085#1080#1103':'
      Control = cxTextEdit1
      ControlOptions.ShowBorder = False
      Index = 7
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = #1046#1080#1090#1077#1083#1100':'
      Control = cxLookupComboBox3
      ControlOptions.ShowBorder = False
      Index = 4
    end
    object dxLayoutItem6: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = #1042#1086#1079#1088#1072#1089#1090':'
      Control = cxLookupComboBox4
      ControlOptions.ShowBorder = False
      Index = 3
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      CaptionOptions.Text = #1059#1056#1055':'
      Control = cxLookupComboBox5
      ControlOptions.ShowBorder = False
      Index = 2
    end
    object dxLayoutItem9: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = #1057#1086#1094#1080#1072#1083#1100#1085#1086'-'#1087#1086#1083#1077#1079#1085#1099#1077' '#1089#1074#1103#1079#1080':'
      Control = cxLookupComboBox6
      ControlOptions.ShowBorder = False
      Index = 5
    end
    object dxLayoutItem5: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      CaptionOptions.Text = 
        #1057#1086#1074#1077#1088#1096#1077#1085#1080#1077' '#1040#1055' '#1074' '#1089#1086#1089#1090#1086#1103#1085#1080#1080' '#1072#1083#1082#1086#1075#1086#1083#1100#1085#1086#1075#1086' '#1086#1087#1100#1103#1085#1077#1085#1080#1103' '#1087#1086#1089#1083#1077' '#1091#1073#1099#1090#1080#1103' '#1080#1079 +
        ' '#1051#1058#1055':'
      Control = cxLookupComboBox2
      ControlOptions.ShowBorder = False
      Index = 6
    end
    object dxLayoutItem7: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1057#1088#1086#1082' '#1086#1094#1077#1085#1082#1080':'
      Control = cxLookupComboBox1
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutItem2: TdxLayoutItem
      Parent = dxLayoutControl1Group_Root
      AlignHorz = ahLeft
      AlignVert = avTop
      CaptionOptions.Text = #1044#1072#1090#1072' '#1086#1094#1077#1085#1082#1080':'
      Control = cxDateEdit1
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 291
    Width = 698
    Height = 41
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      698
      41)
    object btnOk: TButton
      Tag = 6
      Left = 424
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
      Left = 590
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
  object dsReabReriod: TDataSource
    Left = 152
    Top = 77
  end
  object dsUpr: TDataSource
    Left = 208
    Top = 69
  end
  object dsAge: TDataSource
    Left = 208
    Top = 109
  end
  object dsRegion: TDataSource
    Left = 208
    Top = 149
  end
  object dsCommunication: TDataSource
    Left = 208
    Top = 189
  end
  object dsAlcohol: TDataSource
    Left = 208
    Top = 229
  end
end
