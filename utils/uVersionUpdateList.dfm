inherited fmVersionUpdateList: TfmVersionUpdateList
  Left = 553
  Top = 311
  HelpContext = 134
  Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1074#1077#1088#1089#1080#1081
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParam: TPanel
    Top = 0
    Height = 60
    TabOrder = 3
    ExplicitTop = 0
    ExplicitHeight = 60
    inherited lbParam: TcxLabel
      Caption = #1058#1077#1082#1091#1097#1072#1103' '#1074#1077#1088#1089#1080#1103
      Style.IsFontAssigned = True
    end
    object edIDVersion: TcxCurrencyEdit
      Left = 144
      Top = 24
      RepositoryItem = CurrencyEditIDVERSION
      EditValue = 0
      TabOrder = 1
      Width = 121
    end
    object lbIDVersion: TcxLabel
      Left = 0
      Top = 24
      AutoSize = False
      Caption = #8470' '#1090#1077#1082#1091#1097#1077#1081' '#1074#1077#1088#1089#1080#1080
      Height = 25
      Width = 137
    end
    object btUpdatePn: TcxButton
      Left = 280
      Top = 24
      Width = 121
      Height = 25
      Action = actUpdate
      TabOrder = 3
    end
  end
  inherited gbGridBase: TcxGroupBox
    Top = 112
    ExplicitTop = 112
    ExplicitHeight = 418
    Height = 418
    inherited grBase: TcxGrid
      Height = 414
      ExplicitLeft = 3
      ExplicitTop = 6
      ExplicitHeight = 414
      inherited grBaseDBTableView: TcxGridDBTableView
        OptionsBehavior.PullFocusing = True
        OptionsData.Appending = False
        OptionsData.CancelOnExit = False
        OptionsData.DeletingConfirmation = True
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        Styles.Header = Resource.cxStyleHeader
        object grBaseDBTableViewIDVERSION: TcxGridDBColumn
          Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1074#1077#1088#1089#1080#1080
          DataBinding.FieldName = 'idversion'
          RepositoryItem = CurrencyEditIDVERSION
          Width = 70
        end
        object grBaseDBTableViewNUMBERVER: TcxGridDBColumn
          Caption = #1042#1077#1088#1089#1080#1103
          DataBinding.FieldName = 'numberver'
          Width = 150
        end
        object grBaseDBTableViewDATEVER: TcxGridDBColumn
          DataBinding.FieldName = 'datever'
          Visible = False
          Width = 100
        end
        object grBaseDBTableViewNOTE: TcxGridDBColumn
          Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          DataBinding.FieldName = 'note'
          Width = 500
        end
        object grBaseDBTableViewDATEKOR: TcxGridDBColumn
          Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          Visible = False
          Width = 100
        end
        object grBaseDBTableViewUSERNAME: TcxGridDBColumn
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
          Visible = False
          Width = 100
        end
        object grBaseDBTableViewFILENAME: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1072
          DataBinding.FieldName = 'filename'
          Width = 300
        end
        object grBaseDBTableViewID: TcxGridDBColumn
          Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
          DataBinding.FieldName = 'id'
        end
        object grBaseDBTableViewURL: TcxGridDBColumn
          Caption = 'FTP'
          DataBinding.FieldName = 'url'
          Width = 300
        end
      end
      object tvVersionFiles: TcxGridDBTableView [1]
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = dsVersionFiles
        DataController.DetailKeyFieldNames = 'idversion'
        DataController.KeyFieldNames = 'filename'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.PullFocusing = True
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.NoDataToDisplayInfoText = '<'#1085#1077#1090' '#1076#1072#1085#1085#1099#1093'>'
        OptionsView.CellAutoHeight = True
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
        Styles.Content = Resource.cxStyleGridData
        Styles.Header = Resource.cxStyleHeader
        object tvVersionFilesFILENAME: TcxGridDBColumn
          DataBinding.FieldName = 'filename'
          Width = 100
        end
        object tvVersionFilesIDVERSION: TcxGridDBColumn
          DataBinding.FieldName = 'idversion'
          RepositoryItem = CurrencyEditIDVERSION
          Visible = False
          Width = 70
        end
        object tvVersionFilesNOTE: TcxGridDBColumn
          DataBinding.FieldName = 'note'
          Width = 500
        end
        object tvVersionFilesDATEKOR: TcxGridDBColumn
          DataBinding.FieldName = 'datekor'
          Visible = False
          Width = 100
        end
        object tvVersionFilesUSERNAME: TcxGridDBColumn
          DataBinding.FieldName = 'username'
          Visible = False
          Width = 100
        end
      end
    end
  end
  inherited dsBase: TDataSource
    Left = 256
    Top = 192
  end
  inherited qryBase: TZQuery
    AfterOpen = nil
    AfterApplyUpdates = nil
    AfterInsert = nil
    AfterEdit = nil
    AfterPost = nil
    AfterCancel = nil
    SQL.Strings = (
      
        'select v.numberver, vf.id, vf.filename, vf.idversion, CAST(vf.no' +
        'te AS TEXT) AS note, vf.datekor, vf.username , vf.url from ver.v' +
        'ersion v,ver.versionfiles vf'
      
        ' where  vf.filename=:PFILENAME and v.idversion>:PIDVERSION and v' +
        'f.idversion=v.idversion and v.opened=true and vf.jreo=:PJREO')
    Params = <
      item
        DataType = ftUnknown
        Name = 'PFILENAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDVERSION'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'PJREO'
        ParamType = ptUnknown
      end>
    Left = 216
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PFILENAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDVERSION'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'PJREO'
        ParamType = ptUnknown
      end>
    object qryBaseid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qryBasefilename: TStringField
      FieldName = 'filename'
      Required = True
      Size = 250
    end
    object qryBaseidversion: TIntegerField
      FieldName = 'idversion'
      Required = True
    end
    object qryBasenote: TMemoField
      FieldName = 'note'
      Required = True
      BlobType = ftMemo
    end
    object qryBasedatekor: TDateTimeField
      FieldName = 'datekor'
      Required = True
    end
    object qryBaseusername: TStringField
      FieldName = 'username'
      Required = True
    end
    object qryBaseurl: TStringField
      FieldName = 'url'
      Size = 1000
    end
    object qryBasenumberver: TStringField
      FieldName = 'numberver'
      Required = True
      Size = 50
    end
  end
  inherited BarManager: TdxBarManager
    Left = 472
    DockControlHeights = (
      0
      0
      49
      0)
    inherited BarManagerMainBar: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btExit'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btRefresh'
        end
        item
          Visible = True
          ItemName = 'btSave'
        end
        item
          Visible = True
          ItemName = 'btCancel'
        end
        item
          Visible = True
          ItemName = 'btUpdate'
        end>
    end
    inherited mnFile: TdxBarSubItem [5]
      Caption = #1054#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1074#1077#1088#1089#1080#1081
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btRefresh'
        end
        item
          Visible = True
          ItemName = 'btSave'
        end
        item
          Visible = True
          ItemName = 'btCancel'
        end
        item
          Visible = True
          ItemName = 'btUpdate'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btExit'
        end>
    end
    inherited btExit: TdxBarButton [6]
    end
    inherited btRefresh: TdxBarButton [7]
      Category = 1
    end
    inherited btSave: TdxBarButton [8]
      Category = 1
    end
    inherited btCancel: TdxBarButton [9]
      Category = 1
    end
    object btUpdate: TdxBarButton [10]
      Action = actUpdate
      Category = 1
    end
    inherited dxBarSeparator1: TdxBarSeparator [11]
      Category = 1
    end
    inherited btGetData: TdxBarButton [12]
      Category = 1
    end
    inherited btParamClear: TdxBarButton [13]
      Category = 1
    end
    inherited btNew: TdxBarButton [14]
      Category = 1
    end
    inherited btFilter: TdxBarButton [15]
      Category = 1
    end
    inherited btEdit: TdxBarButton [16]
      Category = 1
    end
    inherited btExcel: TdxBarButton [17]
      Category = 1
    end
    inherited btDel: TdxBarButton [18]
      Category = 1
    end
  end
  inherited ActionList: TActionList
    Left = 504
    inherited actGetData: TAction [3]
      OnUpdate = nil
    end
    inherited actRefresh: TAction [4]
      OnUpdate = nil
    end
    inherited actSave: TAction [5]
    end
    inherited actCancel: TAction [6]
      OnUpdate = actSaveUpdate
    end
    object actUpdate: TAction [7]
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ImageIndex = 49
      OnExecute = actUpdateExecute
      OnUpdate = actRefreshUpdate
    end
    inherited actNew: TAction [8]
    end
    inherited actEdit: TAction [9]
    end
    inherited actDel: TAction [10]
    end
    inherited actNewWindow: TAction [11]
    end
  end
  inherited FormPlacement: TFormPlacement
    Left = 536
  end
  inherited pmGrid: TPopupMenu
    Left = 408
    Top = 16
  end
  object qryVersionFiles: TZQuery
    Connection = Resource.ZConn
    SQL.Strings = (
      
        'select v.idversion, vf.filename, vf.idversion, CAST(vf.note AS T' +
        'EXT) AS note, vf.datekor, vf.username , vf.url from ver.version ' +
        'v,ver.versionfiles vf'
      
        '  where  vf.filename=:NMFL and v.idversion>:PIDVERSION and vf.id' +
        'version=v.idversion and v.opened=true and vf.jreo=:PJREO ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'NMFL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDVERSION'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'PJREO'
        ParamType = ptUnknown
      end>
    Left = 408
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NMFL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDVERSION'
        ParamType = ptUnknown
        Value = 0
      end
      item
        DataType = ftUnknown
        Name = 'PJREO'
        ParamType = ptUnknown
      end>
    object qryVersionFilesfilename: TStringField
      FieldName = 'filename'
      Required = True
      Size = 250
    end
    object qryVersionFilesidversion: TIntegerField
      FieldName = 'idversion'
      Required = True
    end
    object qryVersionFilesnote: TMemoField
      FieldName = 'note'
      Required = True
      BlobType = ftMemo
    end
    object qryVersionFilesdatekor: TDateTimeField
      FieldName = 'datekor'
      Required = True
    end
    object qryVersionFilesusername: TStringField
      FieldName = 'username'
      Required = True
    end
    object qryVersionFilesurl: TStringField
      FieldName = 'url'
      Size = 1000
    end
  end
  object dsVersionFiles: TDataSource
    DataSet = qryVersionFiles
    Left = 256
    Top = 296
  end
  object cxEditRepository: TcxEditRepository
    Left = 440
    Top = 16
    object CurrencyEditIDVERSION: TcxEditRepositoryCurrencyItem
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0'
      Properties.OnEditValueChanged = CurrencyEditIDVERSIONPropertiesEditValueChanged
    end
  end
  object qryFiles: TZQuery
    Connection = Resource.ZConn
    SQL.Strings = (
      'select vf1.filename from ver.version v1,ver.versionfiles vf1'
      
        'where v1.idversion>:PIDVERSION and vf1.idversion=v1.idversion an' +
        'd v1.opened=true and vf1.jreo=:PJREO'
      'union'
      'select vf2.filename from ver.version v2,ver.versionfiles vf2'
      
        'where v2.idversion>:PIDVERSION and vf2.idversion=v2.idversion an' +
        'd v2.opened=true and vf2.jreo is null')
    Params = <
      item
        DataType = ftUnknown
        Name = 'PIDVERSION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PJREO'
        ParamType = ptUnknown
      end>
    Left = 612
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDVERSION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PJREO'
        ParamType = ptUnknown
      end>
  end
  object dsFiles: TDataSource
    DataSet = qryFiles
    OnDataChange = dsFilesDataChange
    Left = 708
    Top = 176
  end
  object qryFile: TZQuery
    Connection = Resource.ZConn
    SQL.Strings = (
      
        'SELECT b.idobject, b.terobj, b.kodul,sj.name,sot.objname,ad.adre' +
        's,b.mainattr,'
      'b.jreo, b.jes, b.kvartal, b.ndom, b.korp, b.ind, b.postind,'
      
        'b.state, b.objtip, b.datekor, b.username,b.kodout,b.pointbegin,b' +
        '.pointend'
      'FROM gf.bobject AS b,gf.sjes sj,gf.sobjtip sot,gf.v_adres ad'
      
        'WHERE b.idobject = :IDOBJECT and b.jes=sj.jes and b.objtip=sot.o' +
        'bjtip and ad.idobject=:IDOBJECT')
    Params = <
      item
        DataType = ftUnknown
        Name = 'idobject'
        ParamType = ptUnknown
      end>
    Left = 70
    Top = 315
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idobject'
        ParamType = ptUnknown
      end>
  end
end
