object fmRolesAdd: TfmRolesAdd
  Left = 0
  Top = 0
  Caption = #1056#1086#1083#1080
  ClientHeight = 110
  ClientWidth = 309
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
  object dxLayoutControl2: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 309
    Height = 69
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 403
    ExplicitHeight = 201
    object Edit1: TEdit
      Left = 68
      Top = 12
      Width = 221
      Height = 17
      BorderStyle = bsNone
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 68
      Top = 39
      Width = 121
      Height = 17
      BorderStyle = bsNone
      TabOrder = 1
    end
    object dxLayoutGroup1: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object dxLayoutItem8: TdxLayoutItem
      Parent = dxLayoutGroup1
      AlignHorz = ahLeft
      CaptionOptions.Text = #1048#1084#1103' '#1088#1086#1083#1080':'
      Control = Edit1
      Index = 0
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = dxLayoutGroup1
      CaptionOptions.Text = #1050#1086#1076' '#1088#1086#1083#1080':'
      Control = Edit2
      Index = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 69
    Width = 309
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 201
    ExplicitWidth = 403
    DesignSize = (
      309
      41)
    object btnOk: TButton
      Tag = 6
      Left = 35
      Top = 6
      Width = 160
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ImageIndex = 14
      Images = Resource.ImageList
      TabOrder = 0
      OnClick = btnOkClick
      ExplicitLeft = 129
    end
    object btnCancel: TButton
      Left = 201
      Top = 6
      Width = 90
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 16
      Images = Resource.ImageList
      TabOrder = 1
      OnClick = btnCancelClick
      ExplicitLeft = 295
    end
  end
end
