inherited fmBaseForm1: TfmBaseForm1
  Caption = 'fmBaseForm1'
  ClientHeight = 551
  ClientWidth = 647
  ExplicitWidth = 663
  ExplicitHeight = 590
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottomButton: TPanel [0]
    Left = 0
    Top = 511
    Width = 647
    Height = 40
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 263
    ExplicitWidth = 834
    DesignSize = (
      647
      40)
    object btnOk: TButton
      Tag = 6
      Left = 375
      Top = 6
      Width = 160
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ImageIndex = 14
      Images = Resource.ImageList
      TabOrder = 0
      ExplicitLeft = 562
    end
    object btnCancel: TButton
      Left = 549
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 16
      Images = Resource.ImageList
      TabOrder = 1
      ExplicitLeft = 736
    end
  end
  object dxLayoutControl1: TdxLayoutControl [1]
    Left = 0
    Top = 45
    Width = 647
    Height = 250
    Align = alTop
    TabOrder = 5
    ExplicitLeft = 312
    ExplicitTop = 256
    ExplicitWidth = 300
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 303
    Width = 647
    Height = 208
    Align = alClient
    TabOrder = 6
    ExplicitLeft = 264
    ExplicitTop = 360
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
  object cxSplitter1: TcxSplitter [3]
    Left = 0
    Top = 295
    Width = 647
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    AlignSplitter = salTop
    ExplicitWidth = 216
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      45
      0)
  end
end
