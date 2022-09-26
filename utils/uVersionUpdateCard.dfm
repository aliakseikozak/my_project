inherited fmVersionUpdateCard: TfmVersionUpdateCard
  Left = 684
  Top = 159
  Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1074#1077#1088#1089#1080#1080
  ClientHeight = 375
  OnActivate = FormActivate
  ExplicitHeight = 413
  PixelsPerInch = 96
  TextHeight = 13
  object spBase: TSplitter
    Left = 0
    Top = 177
    Width = 712
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 344
    ExplicitWidth = 945
  end
  object memLog: TcxMemo
    Left = 0
    Top = 180
    Align = alBottom
    RepositoryItem = MemoEditREADONLY
    TabOrder = 0
    Height = 154
    Width = 712
  end
  object grBase: TcxGrid
    Left = 0
    Top = 0
    Width = 712
    Height = 177
    Align = alClient
    TabOrder = 1
    object tvBase: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.PullFocusing = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideSelection = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.NoDataToDisplayInfoText = '<'#1085#1077#1090' '#1076#1072#1085#1085#1099#1093'>'
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.Content = Resource.cxStyleGridData
      Styles.Header = Resource.cxStyleHeader
      object tvBaseCHECKED: TcxGridColumn
        Caption = #1047#1072#1075#1088#1091#1078#1077#1085
        DataBinding.ValueType = 'Boolean'
        RepositoryItem = CheckBoxTRUEFALSE
        Width = 70
      end
      object tvBaseFILENAME: TcxGridColumn
        Caption = #1060#1072#1081#1083
        RepositoryItem = TextEditSTANDART
        Width = 150
      end
      object tvBaseNOTE: TcxGridColumn
        Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        RepositoryItem = MemoEditSTANDART
        Width = 400
      end
      object tvBaseURL: TcxGridColumn
        Visible = False
      end
      object tvBaseJREO: TcxGridColumn
      end
      object tvBaseID: TcxGridColumn
        Visible = False
      end
    end
    object lvBase: TcxGridLevel
      GridView = tvBase
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 334
    Width = 712
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btExitPn: TcxButton
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Action = actExit
      TabOrder = 0
    end
  end
  object cxEditRepository: TcxEditRepository
    Left = 8
    Top = 32
    object MemoEditREADONLY: TcxEditRepositoryMemoItem
      Properties.ReadOnly = True
      Properties.ScrollBars = ssBoth
      Properties.WordWrap = False
    end
    object CheckBoxTRUEFALSE: TcxEditRepositoryCheckBoxItem
      Properties.Alignment = taCenter
    end
    object TextEditSTANDART: TcxEditRepositoryTextItem
      Properties.Alignment.Horz = taLeftJustify
    end
    object MemoEditSTANDART: TcxEditRepositoryMemoItem
      Properties.WordWrap = False
    end
  end
  object ActionList: TActionList
    Images = Resource.ImageList
    Left = 40
    Top = 32
    object actExit: TAction
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076
      ImageIndex = 0
      OnExecute = actExitExecute
    end
  end
end
