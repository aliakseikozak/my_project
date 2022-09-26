unit uCommissionDecision;

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
  dxLayoutControl, cxLabel, Vcl.ExtCtrls, uKartUtils, uResource, uCommissionDecisionAdd,
  uExchDB, uExchDBData, uResourceForms;

type
  TfmCommissionDecision = class(TfmBaseGrid)
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    grBaseDBTableViewColumn6: TcxGridDBColumn;
    grBaseDBTableViewColumn7: TcxGridDBColumn;
    grBaseDBTableViewColumn8: TcxGridDBColumn;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  fmCommissionDecision: TfmCommissionDecision;
  pedit : Boolean;

implementation
uses
  ulogin, uOVDAdd;

{$R *.dfm}

procedure TfmCommissionDecision.actDelExecute(Sender: TObject);
begin

  if DialogQuest('Удалить запись? Вы уверены?', 'Удаление записи') then
  begin
    dbIU := DataSetQuery('commissiondecision_del', [dbBase.DataSet.FieldByName('id').Value, Resource.sessionInfo.token_id]);
    actGetData.Execute;
  end;

end;

procedure TfmCommissionDecision.actEditExecute(Sender: TObject);
var
  fm: TfmCommissionDecisionAdd;
begin
 { if dbBase.DataSet.IsEmpty then
    Exit;
          }
  fm := TfmCommissionDecisionAdd(CreateForm('TfmCommissionDecisionAdd', 'fmCommissionDecisionAdd', Self, false));
  try

    fm.SetData(dbBase, 1, 1{покуда так---ginformation}, pedit);
    if ( fm.ShowModal() = mrOk ) then begin

      dbBase.DataSetReQuery;

    end;
  finally
    fm.Free;
  end;
end;

procedure TfmCommissionDecision.actNewExecute(Sender: TObject);
var
  fm: TfmCommissionDecisionAdd;
begin
 { if dbBase.DataSet.IsEmpty then
    Exit;
          }
  fm := TfmCommissionDecisionAdd(CreateForm('TfmCommissionDecisionAdd', 'fmCommissionDecisionAdd', Self, false));
  try

    fm.SetData(dbBase, 0, 1{покуда так---ginformation}, pedit);
    if ( fm.ShowModal() = mrOk ) then begin

      dbBase.DataSetReQuery;

    end;
  finally
    fm.Free;
  end;
end;

procedure TfmCommissionDecision.FormCreate(Sender: TObject);
var
  viewing : Boolean;
  deletion : Boolean;
begin
    dbAccess := DataSetQuery('access_form_get', [gUser, 'OVD_LTP'], GetFieldsArray(), true);
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

procedure TfmCommissionDecision.FormShow(Sender: TObject);
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

  dbBase := DataSetQuery('commissiondecisio_get', [Resource.sessionInfo.token_id, '1', 'bmf.grdoctoltp_id', VarToStr(FID), '='], GetFieldsArray(), true);
  dsBase.DataSet := dbBase.DataSet;

end;

procedure TfmCommissionDecision.grBaseDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmCommissionDecisionAdd;
begin
 { if dbBase.DataSet.IsEmpty then
    Exit;
          }
  fm := TfmCommissionDecisionAdd(CreateForm('TfmCommissionDecisionAdd', 'fmCommissionDecisionAdd', Self, false));
  try

    fm.SetData(dbBase, 1, 1{покуда так---ginformation}, pedit);
    if ( fm.ShowModal() = mrOk ) then begin

      dbBase.DataSetReQuery;

    end;
  finally
    fm.Free;
  end;

end;

procedure TfmCommissionDecision.SetData(pDb: TDBData; pMode: integer; pID: Variant);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
end;


end.
