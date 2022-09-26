unit uCourtdecision;

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
  dxLayoutControl, cxLabel, Vcl.ExtCtrls, uKartUtils, uResource, uCourtdecisionAdd, uOVDAdd,
  uExchDB, uExchDBData, uResourceForms;

type
  TfmCourtdecision = class(TfmBaseGrid)
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
    procedure FormShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    dbIU: TDBData;
    { Private declarations }
  public
    { Public declarations }
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant);
  end;

var
  fmCourtdecision: TfmCourtdecision;

implementation

{$R *.dfm}

procedure TfmCourtdecision.actDelExecute(Sender: TObject);
begin
  if DialogQuest('������� ������? �� �������?', '�������� ������') then
  begin
    dbIU := DataSetQuery('courtdecision_del', [dbBase.DataSet.FieldByName('id').Value, Resource.sessionInfo.token_id]);
    actGetData.Execute;
  end;

end;

procedure TfmCourtdecision.actEditExecute(Sender: TObject);
var
  fm: TfmCourtdecisionAdd;
begin
  if dbBase.DataSet.IsEmpty then
    Exit;

  fm := TfmCourtdecisionAdd(CreateForm('TfmCourtdecisionAdd', 'fmCourtdecisionAdd', Self, false));
  try

    fm.SetData(dbBase, 1, VarToStr(FID));
    if ( fm.ShowModal() = mrOk ) then begin

      dbBase.DataSetReQuery;

    end;
  finally
    dbBase := DataSetQuery('courtdecision_get', [Resource.sessionInfo.token_id, '1', 'bmf.grdoctoltp_id', VarToStr(FID), '='], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
    fm.Free;
  end;
end;

procedure TfmCourtdecision.actNewExecute(Sender: TObject);
var
  fm: TfmCourtdecisionAdd;
begin
 { if dbBase.DataSet.IsEmpty then
    Exit;
        }
  fm := TfmCourtdecisionAdd(CreateForm('TfmCourtdecisionAdd', 'fmCourtdecisionAdd', Self, false));
  try

    fm.SetData(dbBase, 0, VarToStr(FID));
    if ( fm.ShowModal() = mrOk ) then begin

      dbBase.DataSetReQuery;

    end;
  finally
    dbBase := DataSetQuery('courtdecision_get', [Resource.sessionInfo.token_id, '1', 'bmf.grdoctoltp_id', VarToStr(FID), '='], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
    fm.Free;
  end;
end;

procedure TfmCourtdecision.FormShow(Sender: TObject);
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

    dbBase := DataSetQuery('courtdecision_get', [Resource.sessionInfo.token_id, '1', 'bmf.grdoctoltp_id', VarToStr(FID), '='], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;


end;

procedure TfmCourtdecision.grBaseDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmCourtdecisionAdd;
begin
  if dbBase.DataSet.IsEmpty then
    Exit;

  fm := TfmCourtdecisionAdd(CreateForm('TfmCourtdecisionAdd', 'fmCourtdecisionAdd', Self, false));
  try

    fm.SetData(dbBase, 1, VarToStr(FID));
    if ( fm.ShowModal() = mrOk ) then begin

      dbBase.DataSetReQuery;

    end;
  finally
    fm.Free;
  end;
end;

procedure TfmCourtdecision.SetData(pDb: TDBData; pMode: integer; pID: Variant);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
end;

end.
