unit uPermision;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, cxSplitter, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutContainer, Vcl.StdCtrls, dxLayoutControl, cxLabel, Vcl.ExtCtrls,
  uResource, uPermisionAdd, uResourceForms, uExchDB, uExchDBData;

type
  TfmPermision = class(TfmBaseGrid)
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    grBaseDBTableViewColumn6: TcxGridDBColumn;
    procedure actGetDataExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actDelExecute(Sender: TObject);
  private
    dbIU: TDBData;
  public
    { Public declarations }
  end;

var
  fmPermision: TfmPermision;

implementation

{$R *.dfm}

procedure TfmPermision.actDelExecute(Sender: TObject);
begin
  if DialogQuest('??????? ??????? ?? ????????', '???????? ??????') then
  begin
    dbIU := DataSetQuery('role_permissions_del', [dbBase.DataSet.FieldByName('id').Value, Resource.sessionInfo.token_id]);
    actGetData.Execute;
  end;

end;

procedure TfmPermision.actEditExecute(Sender: TObject);

var
  fm: TfmPermisionAdd;
begin

  fm := TfmPermisionAdd(CreateForm('TfmPermisionAdd', 'fmPermisionAdd', Self, false));
  try
    fm.SetData(dbBase, 1, 1);
    if ( fm.ShowModal() = mrOk ) then
    begin
      dbBase.DataSetReQuery;
    end;
  finally
    dbBase := DataSetQuery('role_permissions_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
    fm.Free;
  end;

end;

procedure TfmPermision.actGetDataExecute(Sender: TObject);
begin

    dbBase := DataSetQuery('role_permissions_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;


end;

procedure TfmPermision.actNewExecute(Sender: TObject);
var
  fm: TfmPermisionAdd;
begin
  fm := TfmPermisionAdd(CreateForm('TfmPermisionAdd', 'fmPermisionAdd', Self, false));
  try
    fm.SetData(dbBase, 0, 1);
    if ( fm.ShowModal() = mrOk ) then
    begin
      dbBase.DataSetReQuery;
    end;
  finally
    dbBase := DataSetQuery('role_permissions_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
    fm.Free;
  end;
end;

procedure TfmPermision.FormShow(Sender: TObject);
begin
  actGetData.Execute;
end;

procedure TfmPermision.grBaseDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmPermisionAdd;
begin

  fm := TfmPermisionAdd(CreateForm('TfmPermisionAdd', 'fmPermisionAdd', Self, false));
  try
    fm.SetData(dbBase, 1, 1);
    if ( fm.ShowModal() = mrOk ) then
    begin
      dbBase.DataSetReQuery;
    end;
  finally
    dbBase := DataSetQuery('role_permissions_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
    fm.Free;
  end;
end;

end.
