unit uLtptraining;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, cxSplitter, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutContainer, Vcl.StdCtrls, dxLayoutControl, cxLabel, Vcl.ExtCtrls
  , uResourceForms , uExchDB, uExchDBData;

type
  TfmLtptraining = class(TfmBaseGrid)
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    grBaseDBTableViewColumn6: TcxGridDBColumn;
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actGetDataExecute(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    dbIU: TDBData;
  public
    { Public declarations }               //ltptraining_get
  end;

var
  fmLtptraining: TfmLtptraining;
  pedit: Boolean;

implementation
uses
  uKartUtils, uResource,uOVDAdd,uLtptrainingAdd, uLogin;

{$R *.dfm}

procedure TfmLtptraining.actDelExecute(Sender: TObject);
begin

  if DialogQuest('������� ������? �� �������?', '�������� ������') then
  begin
    dbIU := DataSetQuery('ltptraining_del', [dbBase.DataSet.FieldByName('id').Value, Resource.sessionInfo.token_id]);
    actGetData.Execute;
  end;

end;

procedure TfmLtptraining.actEditExecute(Sender: TObject);
var
  fm: TfmLtptrainingAdd;
begin
  fm := TfmLtptrainingAdd(CreateForm('TfmLtptrainingAdd', 'fmLtptrainingAdd', Self, false));
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

procedure TfmLtptraining.actGetDataExecute(Sender: TObject);
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

  dbBase := DataSetQuery('ltptraining_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
  dsBase.DataSet := dbBase.DataSet;


end;

procedure TfmLtptraining.actNewExecute(Sender: TObject);
var
  fm: TfmLtptrainingAdd;
begin
  fm := TfmLtptrainingAdd(CreateForm('TfmLtptrainingAdd', 'fmLtptrainingAdd', Self, false));
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

procedure TfmLtptraining.btnCancelClick(Sender: TObject);
begin
  Close;

end;

procedure TfmLtptraining.FormCreate(Sender: TObject);
var
  viewing : Boolean;
  deletion : Boolean;
begin
    dbAccess := DataSetQuery('access_form_get', [gUser, 'LTP_STAY'], GetFieldsArray(), true);
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

procedure TfmLtptraining.FormShow(Sender: TObject);
begin
  actGetData.Execute;

end;

procedure TfmLtptraining.grBaseDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmLtptrainingAdd;
begin
  fm := TfmLtptrainingAdd(CreateForm('TfmLtptrainingAdd', 'fmLtptrainingAdd', Self, false));
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
