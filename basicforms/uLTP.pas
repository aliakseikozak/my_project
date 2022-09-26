unit uLTP;

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
  dxLayoutcxEditAdapters, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit,
  cxCalendar, Vcl.Buttons, uExchDB, uExchDBData;

type
  TfmLTP = class(TfmBaseGrid)
    dxLayoutControl2: TdxLayoutControl;
    Edit5: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    cxLookupComboBox7: TcxLookupComboBox;
    cxLookupComboBox8: TcxLookupComboBox;
    cxDateEdit2: TcxDateEdit;
    cxLookupComboBox9: TcxLookupComboBox;
    cxLookupComboBox10: TcxLookupComboBox;
    CheckBox2: TCheckBox;
    cxDateEdit3: TcxDateEdit;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutGroup5: TdxLayoutGroup;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutItem12: TdxLayoutItem;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutAutoCreatedGroup4: TdxLayoutAutoCreatedGroup;
    dxLayoutAutoCreatedGroup5: TdxLayoutAutoCreatedGroup;
    dxLayoutItem19: TdxLayoutItem;
    dxLayoutItem20: TdxLayoutItem;
    dxLayoutItem21: TdxLayoutItem;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutAutoCreatedGroup6: TdxLayoutAutoCreatedGroup;
    dxLayoutItem23: TdxLayoutItem;
    dxLayoutItem24: TdxLayoutItem;
    dxLayoutItem25: TdxLayoutItem;
    dxLayoutItem27: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutItem15: TdxLayoutItem;
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
    dsStatus: TDataSource;
    dsDisease: TDataSource;
    dsDependence: TDataSource;
    dsKmcr: TDataSource;
    grBaseDBTableViewColumn11: TcxGridDBColumn;
    grBaseDBTableViewColumn12: TcxGridDBColumn;
    grBaseDBTableViewColumn13: TcxGridDBColumn;
    procedure actGetDataExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actParamClearExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    dbStatus: TDBData;
    dbDisease: TDBData;
    dbKmcr: TDBData;
    dbDependence: TDBData;
    procedure InitForm;
    procedure SetControlFormat;
  public
    { Public declarations }

  end;

var
  fmLTP: TfmLTP;

implementation
uses
  uKartUtils, uResource, uOVDAdd, uLogin;

{$R *.dfm}

procedure TfmLTP.actEditExecute(Sender: TObject);
var
  fm: TfmOVDAdd;
begin
  if dbBase.DataSet.IsEmpty then
    Exit;

  fm := TfmOVDAdd(CreateForm('TfmOVDAdd', 'fmOVDAdd', Self, false));
  try
    fm.SetData(dbBase, 1, dbBase.DataSet.FieldByName('grinformation_id').Value);
    if ( fm.ShowModal() = mrOk ) then
    begin
      dbBase.DataSetReQuery;
    end;
  finally
    fm.Free;
    actGetData.Execute;
  end;
end;

procedure TfmLTP.InitForm;
begin


  dbStatus := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.status_form  '+
   '   FROM ltp_status_form AS s  ', []);
  dsStatus.DataSet := dbStatus.DataSet;

  dbDisease := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.code  '+
   '   FROM directory_disease AS s  ', []);
  dsDisease.DataSet := dbDisease.DataSet;

  dbDependence := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM dependence_type AS s  ', []);
  dsDependence.DataSet := dbDependence.DataSet;

  dbKmcr := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM attribute_kmcr AS s  ', []);
  dsKmcr.DataSet := dbKmcr.DataSet;


end;


procedure TfmLTP.actGetDataExecute(Sender: TObject);
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

  if (cxDateEdit2.EditValue <> NULL) then
  begin
    if Columns <> EmptyStr then
    begin
      Columns := Columns + '~';
      Operations := Operations + '~';
      Params := Params + '~';
    end;

    Columns := Columns + cxDateEdit2.Properties.ImeName;
    Operations := Operations + '=';
    Params:= Params + '''''' + FormatDateTime('YYYY-MM-DD', cxDateEdit2.Date) + '''''';

  end;

  if (cxDateEdit3.EditValue <> NULL) then
  begin
    if Columns <> EmptyStr then
    begin
      Columns := Columns + '~';
      Operations := Operations + '~';
      Params := Params + '~';
    end;

    Columns := Columns + cxDateEdit3.Properties.ImeName;
    Operations := Operations + '=';
    Params:= Params + '''''' + FormatDateTime('YYYY-MM-DD', cxDateEdit2.Date) + '''''';

  end;

  if (CheckBox2.Checked = True) then
  begin
    if (Columns <> '') then
    begin
      Columns := Columns + '~';
      Operations := Operations + '~';
      Params := Params + '~';
    end;
    Columns := Columns + 'ltc.pkp_attribute';
    Params := Params + 'true';
    Operations := Operations + '=';
  end;

  FreeAndNil(dbBase);

  dbBase := DataSetQuery('ltpinformation_field_get', [gUser, '1', Columns, Params, Operations], GetFieldsArray(), true);
  dsBase.DataSet := dbBase.DataSet;
  SetControlFormat;
end;

procedure TfmLTP.SetControlFormat;
var
  i: integer;
begin
  i := grBaseDBTableView.GetColumnByFieldName('ltpinformation_id').Index;
  grBaseDBTableView.Columns[i].Summary.FooterKind := skCount;
  grBaseDBTableView.Columns[i].Summary.FooterFormat := '�������: #';
end;

procedure TfmLTP.actNewExecute(Sender: TObject);
var
  fm: TfmOVDAdd;
begin
  if dbBase.DataSet.IsEmpty then
    Exit;

  fm := TfmOVDAdd(CreateForm('TfmOVDAdd', 'fmOVDAdd', Self, false));
  try
    fm.SetData(dbBase, 0, dbBase.DataSet.FieldByName('grinformation_id').Value);
    if ( fm.ShowModal() = mrOk ) then
    begin
      dbBase.DataSetReQuery;
    end;
  finally
    fm.Free;
    actGetData.Execute;
  end;
end;

procedure TfmLTP.actParamClearExecute(Sender: TObject);
begin
  Edit5.Clear;
  Edit6.Clear;
  Edit7.Clear;
  Edit8.Clear;
  cxDateEdit2.Clear;
  cxLookupComboBox7.Clear;
  cxLookupComboBox8.Clear;
  cxLookupComboBox9.Clear;
  cxLookupComboBox10.Clear;
  CheckBox2.Checked := false;

end;

procedure TfmLTP.FormShow(Sender: TObject);
begin
  gNameForm := 'fmLTP';
  InitForm;
  SetControlFormat;
end;

procedure TfmLTP.grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmOVDAdd;
begin
  if dbBase.DataSet.IsEmpty then
    Exit;

  fm := TfmOVDAdd(CreateForm('TfmOVDAdd', 'fmOVDAdd', Self, false));
  try
    fm.SetData(dbBase, 1, dbBase.DataSet.FieldByName('grinformation_id').Value);
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
