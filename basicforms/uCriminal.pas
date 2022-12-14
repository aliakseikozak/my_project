unit uCriminal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, cxSplitter, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutContainer, Vcl.StdCtrls, dxLayoutControl, cxLabel, Vcl.ExtCtrls, uExchDBData,
  uResource, uExchDB, cxDBLookupComboBox, uCriminalAdd, uKartUtils, uResourceForms;

type
  TfmCriminal = class(TfmBaseGrid)
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    grBaseDBTableViewColumn6: TcxGridDBColumn;
    grBaseDBTableViewColumn7: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;

    procedure FormShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actGetDataExecute(Sender: TObject);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actDelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    dbDirectoryArticle: TDBData;
    dbIU: TDBData;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCriminal: TfmCriminal;
  pedit : Boolean;

implementation

uses
  uOVDAdd, uLogin;

{$R *.dfm}

procedure TfmCriminal.actDelExecute(Sender: TObject);
begin
  if DialogQuest('??????? ??????? ?? ????????', '???????? ??????') then
  begin
    dbIU := DataSetQuery('criminal_del', [dbBase.DataSet.FieldByName('id').Value, Resource.sessionInfo.token_id]);
    actGetData.Execute;
  end;

end;

procedure TfmCriminal.actEditExecute(Sender: TObject);
var
  fm: TfmCriminalAdd;
begin
  if dbBase.DataSet.IsEmpty then
    Exit;

  fm := TfmCriminalAdd(CreateForm('TfmCriminalAdd', 'fmCriminalAdd', Self, false));
  try

    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    fm.Free;
    actGetData.Execute;
  end;
end;

procedure TfmCriminal.actGetDataExecute(Sender: TObject);
var
  Columns: string;
  Params: string;
  Operations: string;
begin

  with Filtered(Self) do
  begin
    Columns := Column;
    Params := Param;
    Operations := Operation;
  end;

  FreeAndNil(dbBase);
  if ginformation <> 0 then
  begin
    dbBase := DataSetQuery('criminal_get', [Resource.sessionInfo.token_id, '1', 'bmf.grinformation_id', VarToStr(ginformation), '='], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
  end;
end;

procedure TfmCriminal.actNewExecute(Sender: TObject);
var
  fm: TfmCriminalAdd;
begin
 { if dbBase.DataSet.IsEmpty then
    Exit;
  }
  fm := TfmCriminalAdd(CreateForm('TfmCriminalAdd', 'fmCriminalAdd', Self, false));
  try

    fm.SetData(dbBase, 0, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    fm.Free;
    actGetData.Execute;
  end;
end;

procedure TfmCriminal.FormCreate(Sender: TObject);
var
  viewing : Boolean;
  deletion : Boolean;
begin
    dbAccess := DataSetQuery('access_form_get', [gUser, 'OVD_OFFENSE'], GetFieldsArray(), true);
    viewing := dbAccess.DataSet.FieldByName('on_viewing').AsBoolean;
    pedit := dbAccess.DataSet.FieldByName('on_edit').AsBoolean;
    deletion := dbAccess.DataSet.FieldByName('on_deletion').AsBoolean;
    if deletion = true then
    begin
      actDel.Enabled := True;
    end
    else
    begin
      actDel.Enabled := False;
    end;
    if pedit = true then
    begin
      actNew.Enabled := True;
    end
    else
    begin
      actNew.Enabled := False;
    end;

end;

procedure TfmCriminal.FormShow(Sender: TObject);
begin
  actGetData.Execute;
end;

procedure TfmCriminal.grBaseDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmCriminalAdd;
begin
  if dbBase.DataSet.IsEmpty then
    Exit;

  fm := TfmCriminalAdd(CreateForm('TfmCriminalAdd', 'fmCriminalAdd', Self, false));
  try

    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    fm.Free;
    actGetData.Execute;
  end;
end;

end.
