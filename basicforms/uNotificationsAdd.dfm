inherited fmNotificationsAdd: TfmNotificationsAdd
  Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
  ClientHeight = 183
  ClientWidth = 323
  Position = poMainFormCenter
  ExplicitWidth = 339
  ExplicitHeight = 222
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo [0]
    Left = 8
    Top = 8
    Width = 305
    Height = 121
    TabOrder = 4
  end
  object Button1: TButton [1]
    Left = 8
    Top = 150
    Width = 162
    Height = 25
    Caption = #1055#1077#1088#1077#1081#1090#1080' '#1074' '#1083#1080#1095#1085#1086#1077' '#1076#1077#1083#1086
    ImageIndex = 17
    Images = Resource.ImageList
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton [2]
    Left = 176
    Top = 150
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    ImageIndex = 16
    Images = Resource.ImageList
    TabOrder = 6
    OnClick = Button2Click
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
  object dsBaseGR: TDataSource
    Left = 208
    Top = 96
  end
end
