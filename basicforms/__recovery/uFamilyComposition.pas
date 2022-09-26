unit uFamilyComposition;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, cxSplitter, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutContainer, Vcl.StdCtrls, dxLayoutControl, cxLabel, Vcl.ExtCtrls, uFamilyCompositionAdd,
  uResource, uExchDBData, uKartUtils, uResourceForms ;

type
  TfmFamilyComposition = class(TfmBaseGrid)
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    grBaseDBTableViewColumn6: TcxGridDBColumn;
    grBaseDBTableViewColumn7: TcxGridDBColumn;
    grBaseDBTableViewColumn8: TcxGridDBColumn;
    grBaseDBTableViewColumn9: TcxGridDBColumn;
    procedure actNewExecute(Sender: TObject);
    procedure actGetDataExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    dbIU: TDBData;
  public
    { Public declarations }

  end;

var
  fmFamilyComposition: TfmFamilyComposition;
  pedit: Boolean;

implementation

uses
  uOVDAdd, uLogin;


{$R *.dfm}

procedure TfmFamilyComposition.actDelExecute(Sender: TObject);
begin

  if DialogQuest('Удалить запись? Вы уверены?', 'Удаление записи') then
  begin
    dbIU := DataSetQuery('family_del', [dbBase.DataSet.FieldByName('id').Value, Resource.sessionInfo.token_id]);
    actGetData.Execute;
  end;

end;

procedure TfmFamilyComposition.actEditExecute(Sender: TObject);
var
  fm: TfmFamilyCompositionAdd;
begin
  if dbBase.DataSet.IsEmpty then
    Exit;

  fm := TfmFamilyCompositionAdd(CreateForm('TfmFamilyCompositionAdd', 'fmFamilyCompositionAdd', Self, false));
  try

    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    actGetData.Execute;
    fm.Free;
  end;
end;

procedure TfmFamilyComposition.actGetDataExecute(Sender: TObject);
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
    dbBase := DataSetQuery('grfamily_get', [Resource.sessionInfo.token_id, '1', 'bmf.grinformation_id', VarToStr(ginformation), '='], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
  end;
end;

procedure TfmFamilyComposition.actNewExecute(Sender: TObject);
var
  fm: TfmFamilyCompositionAdd;
begin
  {
  if dbBase.DataSet.IsEmpty then
    Exit;
   }
  fm := TfmFamilyCompositionAdd(CreateForm('TfmFamilyCompositionAdd', 'fmFamilyCompositionAdd', Self, false));
  try
    fm.SetData(dbBase, 0, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then begin

      dbBase.DataSetReQuery;

    end;
  finally
    actGetData.Execute;
    fm.Free;
   // gCaptionName := 'Склады';
  end;
end;

procedure TfmFamilyComposition.FormCreate(Sender: TObject);
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

procedure TfmFamilyComposition.FormShow(Sender: TObject);
begin
  actGetData.Execute;
end;

procedure TfmFamilyComposition.grBaseDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmFamilyCompositionAdd;
begin
  if dbBase.DataSet.IsEmpty then
    Exit;

  fm := TfmFamilyCompositionAdd(CreateForm('TfmFamilyCompositionAdd', 'fmFamilyCompositionAdd', Self, false));
  try

    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    actGetData.Execute;
    fm.Free;
  end;
end;

end.
