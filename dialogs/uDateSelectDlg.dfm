inherited fmDateSelectDlg: TfmDateSelectDlg
  Caption = 'caption'
  ClientWidth = 401
  ExplicitWidth = 427
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel: TBevel
    Width = 257
    ExplicitWidth = 257
    ExplicitHeight = 168
  end
  inherited btOk: TcxButton
    Left = 280
    Top = 22
    ModalResult = 1
    ExplicitLeft = 280
    ExplicitTop = 22
  end
  inherited btCancel: TcxButton
    Left = 280
    Top = 53
    ModalResult = 2
    ExplicitLeft = 280
    ExplicitTop = 53
  end
  object deDate: TcxDateEdit
    Left = 64
    Top = 84
    TabOrder = 2
    Width = 121
  end
  object lbText: TcxLabel
    Left = 8
    Top = 8
    AutoSize = False
    Caption = 'lbText'
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.WordWrap = True
    Height = 70
    Width = 241
    AnchorX = 129
    AnchorY = 43
  end
end
