inherited fmNumSelectDlg: TfmNumSelectDlg
  Caption = 'caption'
  ClientHeight = 83
  ClientWidth = 493
  ExplicitWidth = 519
  ExplicitHeight = 132
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel: TBevel
    Height = 83
    ExplicitLeft = 8
    ExplicitTop = -8
    ExplicitHeight = 104
  end
  object edNum: TcxCurrencyEdit
    Left = 120
    Top = 47
    Properties.AssignedValues.DisplayFormat = True
    Properties.DecimalPlaces = 0
    Style.BorderColor = clWindowFrame
    Style.BorderStyle = ebs3D
    Style.HotTrack = False
    TabOrder = 2
    Width = 121
  end
  object lbText: TcxLabel
    Left = 0
    Top = 8
    AutoSize = False
    Caption = 'lbText'
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Height = 33
    Width = 360
    AnchorX = 180
    AnchorY = 25
  end
end
