unit uMedAssessment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, cxSplitter, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutContainer, Vcl.StdCtrls, dxLayoutControl, cxLabel, Vcl.ExtCtrls, uResource,
  uKartUtils, uResourceForms, uExchDB, uExchDBData;

type
  TfmMedAssessment = class(TfmBaseGrid)
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    grBaseDBTableViewColumn6: TcxGridDBColumn;
    grBaseDBTableViewColumn7: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actGetDataExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
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
  fmMedAssessment: TfmMedAssessment;
  pedit: Boolean;

implementation
uses
  uMedAssessmentAdd, uOVDAdd, uLogin;


{$R *.dfm}

procedure TfmMedAssessment.actDelExecute(Sender: TObject);
begin

  if DialogQuest('������� ������? �� �������?', '�������� ������') then
  begin
    dbIU := DataSetQuery('medassessment_del', [dbBase.DataSet.FieldByName('id').Value, Resource.sessionInfo.token_id]);
    actGetData.Execute;
  end;

end;

procedure TfmMedAssessment.actEditExecute(Sender: TObject);
var
  fm: TfmMedAssessmentAdd;
begin

  fm := TfmMedAssessmentAdd(CreateForm('TfmMedAssessmentAdd', 'fmMedAssessmentAdd', Self, false));
  try
    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    actGetData.Execute;
    fm.Free;
   // gCaptionName := '������';
  end;

end;

procedure TfmMedAssessment.actGetDataExecute(Sender: TObject);
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
    dbBase := DataSetQuery('rehabilitation_rehabilitation_medassessment_get', [Resource.sessionInfo.token_id, '1', 'bmf.grinformation_id', VarToStr(ginformation), '='], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
  end;
end;

procedure TfmMedAssessment.actNewExecute(Sender: TObject);
var
  fm: TfmMedAssessmentAdd;
begin

  fm := TfmMedAssessmentAdd(CreateForm('TfmMedAssessmentAdd', 'fmMedAssessmentAdd', Self, false));
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

procedure TfmMedAssessment.FormCreate(Sender: TObject);
var
  viewing : Boolean;
  deletion : Boolean;
begin
    dbAccess := DataSetQuery('access_form_get', [gUser, 'GRADE_MED'], GetFieldsArray(), true);
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

procedure TfmMedAssessment.FormShow(Sender: TObject);
begin
  actGetData.Execute;
end;

procedure TfmMedAssessment.grBaseDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmMedAssessmentAdd;
begin

  fm := TfmMedAssessmentAdd(CreateForm('TfmMedAssessmentAdd', 'fmMedAssessmentAdd', Self, false));
  try
    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    actGetData.Execute;
    fm.Free;
   // gCaptionName := '������';
  end;
end;

end.
