unit uMedexamination;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, System.Actions, Vcl.ActnList, dxBar, cxClasses,
  cxSplitter, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutContainer, Vcl.StdCtrls,
  dxLayoutControl, cxLabel, Vcl.ExtCtrls, uKartUtils, uResource, uExchDB, uExchDBData
  , uResourceForms;

type
  TfmMedexamination = class(TfmBaseGrid)
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    grBaseDBTableViewColumn6: TcxGridDBColumn;
    grBaseDBTableViewColumn7: TcxGridDBColumn;
    grBaseDBTableViewColumn8: TcxGridDBColumn;
    grBaseDBTableViewColumn9: TcxGridDBColumn;
    grBaseDBTableViewColumn10: TcxGridDBColumn;
    grBaseDBTableViewColumn11: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actGetDataExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    dbAccess: TDBData;
        dbIU: TDBData;

  public
    { Public declarations }
  end;

var
  fmMedexamination: TfmMedexamination;
  pedit : Boolean;


implementation
uses
uOVDAdd, uMedexaminationAdd, uLogin;

{$R *.dfm}

procedure TfmMedexamination.actDelExecute(Sender: TObject);
begin

  if DialogQuest('Удалить запись? Вы уверены?', 'Удаление записи') then
  begin
    dbIU := DataSetQuery('medexamination_del', [dbBase.DataSet.FieldByName('id').Value, Resource.sessionInfo.token_id]);
    actGetData.Execute;
  end;

end;

procedure TfmMedexamination.actEditExecute(Sender: TObject);
var
  fm: TfmMedexaminationAdd;
begin

  fm := TfmMedexaminationAdd(CreateForm('TfmMedexaminationAdd', 'fmMedexaminationAdd', Self, false));
  try
    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    actGetData.Execute;
    fm.Free;
   // gCaptionName := 'Склады';
  end;
end;

procedure TfmMedexamination.actGetDataExecute(Sender: TObject);
var
  Columns: string;
  Params: string;
  Operations: string;
begin
  pnParam.Visible := false;
  cxspltrParam.Visible:= False;

  with Filtered(Self) do
  begin
    Columns := Column;
    Params := Param;
    Operations := Operation;
  end;

  FreeAndNil(dbBase);

    dbBase := DataSetQuery('medexamination_get', [Resource.sessionInfo.token_id, '1', 'bmf.grinformation_id', VarToStr(ginformation), '='], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;

end;

procedure TfmMedexamination.actNewExecute(Sender: TObject);
var
  fm: TfmMedexaminationAdd;
begin

  fm := TfmMedexaminationAdd(CreateForm('TfmMedexaminationAdd', 'fmMedexaminationAdd', Self, false));
  try
    fm.SetData(dbBase, 0, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    actGetData.Execute;
    fm.Free;
  end;
end;

procedure TfmMedexamination.FormCreate(Sender: TObject);
var
  viewing : Boolean;
  deletion : Boolean;
begin
    dbAccess := DataSetQuery('access_form_get', [gUser, 'OZ'], GetFieldsArray(), true);
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

procedure TfmMedexamination.FormShow(Sender: TObject);
begin
  actGetData.Execute;
end;

procedure TfmMedexamination.grBaseDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmMedexaminationAdd;
begin

  fm := TfmMedexaminationAdd(CreateForm('TfmMedexaminationAdd', 'fmMedexaminationAdd', Self, false));
  try
    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    actGetData.Execute;
    fm.Free;
   // gCaptionName := 'Склады';
  end;
end;

end.

