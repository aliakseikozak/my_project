unit uRoles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, cxSplitter, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutContainer, Vcl.StdCtrls, dxLayoutControl, cxLabel, Vcl.ExtCtrls, uResource
  , uResourceForms, uExchDB, uExchDBData;

type
  TfmRoles = class(TfmBaseGrid)
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    dbIU: TDBData;
  public
    { Public declarations }
  end;

var
  fmRoles: TfmRoles;

implementation
uses
  uRolesAdd;

{$R *.dfm}

procedure TfmRoles.actDelExecute(Sender: TObject);
begin

  if DialogQuest('??????? ??????? ?? ????????', '???????? ??????') then
  begin
    dbIU := DataSetQuery('roles_del', [dbBase.DataSet.FieldByName('id').Value, Resource.sessionInfo.token_id]);
    dbBase := DataSetQuery('roles_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
  end;


end;

procedure TfmRoles.actEditExecute(Sender: TObject);
var
  fm: TfmRolesAdd;
begin
{  if dbBase.DataSet.IsEmpty then
    Exit;
         }
  fm := TfmRolesAdd(CreateForm('TfmRolesAdd', 'fmRolesAdd', Self, false));
  try

    fm.SetData(dbBase, 1);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    dbBase := DataSetQuery('roles_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;

    fm.Free;
  end;
end;

procedure TfmRoles.actNewExecute(Sender: TObject);
var
  fm: TfmRolesAdd;
begin
{  if dbBase.DataSet.IsEmpty then
    Exit;
         }
  fm := TfmRolesAdd(CreateForm('TfmRolesAdd', 'fmRolesAdd', Self, false));
  try

    fm.SetData(dbBase, 0);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    dbBase := DataSetQuery('roles_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;

    fm.Free;
  end;
end;

procedure TfmRoles.FormShow(Sender: TObject);
begin

    dbBase := DataSetQuery('roles_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;


end;

procedure TfmRoles.grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmRolesAdd;
begin
{  if dbBase.DataSet.IsEmpty then
    Exit;
         }
  fm := TfmRolesAdd(CreateForm('TfmRolesAdd', 'fmRolesAdd', Self, false));
  try

    fm.SetData(dbBase, 1);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    dbBase := DataSetQuery('roles_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;

    fm.Free;
  end;
end;

end.
