inherited fmBaseCard: TfmBaseCard
  Left = 809
  Top = 397
  Caption = 'fmBaseCard'
  ClientHeight = 434
  ClientWidth = 797
  OldCreateOrder = False
  ExplicitWidth = 813
  ExplicitHeight = 473
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel [0]
    Left = 0
    Top = 394
    Width = 797
    Height = 40
    Align = alBottom
    TabOrder = 4
    DesignSize = (
      797
      40)
    object btnOk: TButton
      Left = 570
      Top = 6
      Width = 110
      Height = 25
      Action = actSave
      Anchors = [akTop, akRight]
      Images = Resource.ImageList
      TabOrder = 0
      ExplicitLeft = 450
    end
    object btnCancel: TButton
      Left = 696
      Top = 6
      Width = 90
      Height = 25
      Action = actCancel
      Anchors = [akTop, akRight]
      ImageIndex = 16
      Images = Resource.ImageList
      TabOrder = 1
      ExplicitLeft = 576
    end
  end
  inherited BarManager: TdxBarManager
    Left = 640
    Top = 80
    DockControlHeights = (
      0
      0
      45
      0)
    inherited BarManagerMainBar: TdxBar
      Images = Resource.ImageList
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btExit'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btSave'
        end
        item
          Visible = True
          ItemName = 'btCancel'
        end>
    end
    object btSave: TdxBarButton [5]
      Action = actSave
      Category = 0
    end
    object btCancel: TdxBarButton [6]
      Action = actCancel
      Category = 0
    end
    object btPrint: TdxBarButton [7]
      Action = actPrint
      Category = 0
    end
    inherited mnFile: TdxBarSubItem
      Caption = #1050#1072#1088#1090#1086#1095#1082#1072
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btPrint'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btSave'
        end
        item
          Visible = True
          ItemName = 'btCancel'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btExit'
        end>
    end
  end
  inherited ActionList: TActionList
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 14
      ShortCut = 113
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100
      ImageIndex = 36
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100
      ImageIndex = 5
    end
  end
  inherited qryBase: TZQuery
    AfterOpen = nil
    AfterApplyUpdates = nil
    AfterInsert = nil
    AfterEdit = nil
    AfterPost = nil
    AfterCancel = nil
    AfterDelete = nil
  end
end
