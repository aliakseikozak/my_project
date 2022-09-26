unit uNotifications;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, cxSplitter, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutContainer, Vcl.StdCtrls, dxLayoutControl, cxLabel, Vcl.ExtCtrls, ulogin, uNotificationsAdd
  , uResource, uExchDB, uExchDBData;

type
  TfmNotifications = class(TfmBaseGrid)
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    Button1: TButton;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    dsNotific: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure grBaseDBTableViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    dbNotific: TDBData;
  public
    { Public declarations }

  end;

var
  fmNotifications: TfmNotifications;

implementation

{$R *.dfm}

procedure TfmNotifications.Button1Click(Sender: TObject);
var
  fm: TfmNotificationsAdd;
begin

 {
  dbNotific := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' UPDATE mvd_personal_inf_notification n SET has_seen_user = true ', []);
  dsNotific.DataSet := dbNotific.DataSet;  }
 {
  dbNotific := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' UPDATE mvd_personal_inf_notification n SET has_seen_user = true ' , []);
 //  ' where n.id =  ''' + VarToStr(dbBase.DataSet.FieldByName('id').Value) + '''' , []);
  dsNotific.DataSet := dbNotific.DataSet;
                                            }
  fm := TfmNotificationsAdd(CreateForm('TfmNotificationsAdd', 'fmNotificationsAdd', Self, false));
  try
    fm.SetData(dbBase);
    if ( fm.ShowModal() = mrOk ) then
    begin
      dbBase.DataSetReQuery;
    end;
  finally
    dbBase := DataSetQuery('notification_get', [gUser], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
    fm.Free;
  end;

end;

procedure TfmNotifications.FormShow(Sender: TObject);
begin
  dbBase := DataSetQuery('notification_get', [gUser], GetFieldsArray(), true);
  dsBase.DataSet := dbBase.DataSet;
end;

procedure TfmNotifications.grBaseDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin


 if AViewInfo.GridRecord.Values[grBaseDBTableViewColumn5.Index] = false then
 begin
    ACanvas.Font.Color:= clRed;
 end;

end;

end.
