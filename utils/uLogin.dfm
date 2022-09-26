object fmLogin: TfmLogin
  Left = 0
  Top = 0
  Caption = 'fmLogin'
  ClientHeight = 213
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnUser: TPanel
    Left = 0
    Top = 0
    Width = 459
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 50
      Width = 42
      Height = 13
      Caption = #1057#1077#1088#1074#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edUser: TLabeledEdit
      Left = 116
      Top = 0
      Width = 131
      Height = 21
      EditLabel.Width = 99
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100'     '
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 0
    end
    object edPass: TLabeledEdit
      Left = 116
      Top = 24
      Width = 131
      Height = 21
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1072#1088#1086#1083#1100'   '
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
    object cbServer: TComboBox
      Left = 116
      Top = 47
      Width = 338
      Height = 21
      TabOrder = 2
    end
  end
  object pnChangePass: TPanel
    Left = 0
    Top = 70
    Width = 459
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object edPassNew1: TLabeledEdit
      Left = 116
      Top = 0
      Width = 131
      Height = 21
      EditLabel.Width = 106
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100'     '
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
    end
    object edPassNew2: TLabeledEdit
      Left = 116
      Top = 24
      Width = 131
      Height = 21
      EditLabel.Width = 82
      EditLabel.Height = 13
      EditLabel.Caption = #1087#1086#1074#1090#1086#1088#1080#1090#1100'     '
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object pnButton: TPanel
    Left = 0
    Top = 174
    Width = 459
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      459
      39)
    object btChangePass: TcxButton
      Left = 130
      Top = 7
      Width = 129
      Height = 25
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
      OptionsImage.Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
        333333333F777773FF333333008888800333333377333F3773F3333077870787
        7033333733337F33373F3308888707888803337F33337F33337F330777880887
        7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
        7703337F33377733337F33088888888888033373FFFFFFFFFF73333000000000
        00333337777777777733333308033308033333337F7F337F7F33333308033308
        033333337F7F337F7F33333308033308033333337F73FF737F33333377800087
        7333333373F77733733333333088888033333333373FFFF73333333333000003
        3333333333777773333333333333333333333333333333333333}
      OptionsImage.NumGlyphs = 2
      TabOrder = 3
      OnClick = btChangePassClick
    end
    object btAdvance: TcxButton
      Left = 4
      Top = 7
      Width = 124
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086' >>'
      TabOrder = 2
      OnClick = btAdvanceClick
    end
    object btOk: TcxButton
      Left = 261
      Top = 7
      Width = 97
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1042#1086#1081#1090#1080
      Default = True
      OptionsImage.Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      OptionsImage.NumGlyphs = 2
      TabOrder = 0
      OnClick = btOkClick
    end
    object btCancel: TcxButton
      Left = 360
      Top = 7
      Width = 97
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      OptionsImage.Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        000000000000000000000000000000007700000000000000000F000000000000
        0000000911700000970000000077F000000F0000000000091117000911700000
        07F37F000F77F00000000009111170911117000007F337F0F7337F0000000000
        911117111117000007F3337F733337F0000000000911111111700000007F3337
        3333F7000000000000911111170000000007F333333F70000000000000011111
        7000000000007F3333370000000000000009111170000000000007F333700000
        00000000009111117000000000000733337F0000000000000911171117000000
        00007333337F000000000000911170911170000000073337F337F00000000000
        9117000911170000007F33707F337F00000000000910000091110000007FF700
        07F337F000000000000000000919000000077000007FFF700000000000000000
        0000000000000000000777000000000000000000000000000000000000000000
        0000}
      OptionsImage.NumGlyphs = 2
      TabOrder = 1
      OnClick = btCancelClick
    end
  end
  object pnAdvance: TPanel
    Left = 0
    Top = 119
    Width = 459
    Height = 55
    Align = alClient
    AutoSize = True
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    Visible = False
    object cbSaveBD: TCheckBox
      Left = 116
      Top = 32
      Width = 87
      Height = 13
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object edHost: TLabeledEdit
      Left = 116
      Top = 5
      Width = 338
      Height = 21
      EditLabel.Width = 44
      EditLabel.Height = 13
      EditLabel.Caption = #1057#1077#1088#1074#1077#1088
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      LabelPosition = lpLeft
      LabelSpacing = 23
      ParentFont = False
      TabOrder = 0
    end
  end
end
