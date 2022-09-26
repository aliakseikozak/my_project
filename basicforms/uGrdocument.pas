unit uGrdocument;

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
  uGrdocumentAdd, uResource, uKartUtils, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, uResourceForms, uExchDB, uExchDBData;

type
  TfmGrdocument = class(TfmBaseGrid)
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    grBaseDBTableViewColumn6: TcxGridDBColumn;
    grBaseDBTableViewColumn7: TcxGridDBColumn;
    grBaseDBTableViewColumn8: TcxGridDBColumn;
    grBaseDBTableViewColumn9: TcxGridDBColumn;
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actGetDataExecute(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    dbIU: TDBData;
  public
    { Public declarations }
  end;

var
  fmGrdocument: TfmGrdocument;
  pedit :Boolean;

implementation

uses
  uOVDAdd, uLogin;

{$R *.dfm}

procedure TfmGrdocument.actDelExecute(Sender: TObject);
begin

  if DialogQuest('Удалить запись? Вы уверены?', 'Удаление записи') then
  begin
    dbIU := DataSetQuery('document_del', [dbBase.DataSet.FieldByName('id').Value, Resource.sessionInfo.token_id]);
    actGetData.Execute;
  end;

end;

procedure TfmGrdocument.actEditExecute(Sender: TObject);
var
  fm: TfmGrdocumentAdd;
begin
  if dbBase.DataSet.IsEmpty then
    Exit;

  fm := TfmGrdocumentAdd(CreateForm('TfmGrdocumentAdd', 'fmGrdocumentAdd', Self, false));
  try

    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then begin

      dbBase.DataSetReQuery;

    end;
  finally
    fm.Free;
    actGetData.Execute;
  end;
end;

procedure TfmGrdocument.actGetDataExecute(Sender: TObject);
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
    dbBase := DataSetQuery('document_get', [Resource.sessionInfo.token_id, '1', 'bmf.grinformation_id',  VarToStr(ginformation), '='], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
  end;
end;

procedure TfmGrdocument.actNewExecute(Sender: TObject);
var
  fm: TfmGrdocumentAdd;
begin

  fm := TfmGrdocumentAdd(CreateForm('TfmGrdocumentAdd', 'fmGrdocumentAdd', Self, false));
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

procedure TfmGrdocument.btnCancelClick(Sender: TObject);
begin
  Close;

end;

procedure TfmGrdocument.FormCreate(Sender: TObject);
var
  viewing : Boolean;
  deletion : Boolean;
begin
    dbAccess := DataSetQuery('access_form_get', [gUser, 'OVD_OSN'], GetFieldsArray(), true);
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

procedure TfmGrdocument.FormShow(Sender: TObject);
begin
  actGetData.Execute;
end;

procedure TfmGrdocument.grBaseDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmGrdocumentAdd;
begin
  if dbBase.DataSet.IsEmpty then
    Exit;

  fm := TfmGrdocumentAdd(CreateForm('TfmGrdocumentAdd', 'fmGrdocumentAdd', Self, false));
  try

    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then begin

      dbBase.DataSetReQuery;

    end;
  finally
    fm.Free;
    actGetData.Execute;
  end;
end;

end.
