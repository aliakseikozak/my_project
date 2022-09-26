unit uDIN;

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
  cxCalendar, Vcl.Buttons, uKartUtils, uResource, uOVDAdd, uExchDB, uExchDBData;

type
  TfmDIN = class(TfmBaseGrid)
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
    CheckBox2: TCheckBox;
    dxLayoutItem1: TdxLayoutItem;
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
    dsDisease: TDataSource;
    dsdependency: TDataSource;
    dskmcr: TDataSource;
    dsStatus: TDataSource;
    dxLayoutItem2: TdxLayoutItem;
    cxDateEdit3: TcxDateEdit;
    procedure FormShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actGetDataExecute(Sender: TObject);
    procedure actParamClearExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure SetControlFormat;
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDIN: TfmDIN;
 // pedit: Boolean;

implementation

{$R *.dfm}

procedure TfmDIN.actEditExecute(Sender: TObject);
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

procedure TfmDIN.actGetDataExecute(Sender: TObject);
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
  dbBase := DataSetQuery('grinformation_field_din_get', [Resource.sessionInfo.token_id, '1', Columns, Params, Operations], GetFieldsArray(), true);
  dsBase.DataSet := dbBase.DataSet;
  SetControlFormat;
end;

procedure TfmDIN.SetControlFormat;
var
  i: integer;
begin
  i := grBaseDBTableView.GetColumnByFieldName('grinformation_id').Index;
  grBaseDBTableView.Columns[i].Summary.FooterKind := skCount;
  grBaseDBTableView.Columns[i].Summary.FooterFormat := 'Записей: #';
end;

procedure TfmDIN.actNewExecute(Sender: TObject);
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

procedure TfmDIN.actParamClearExecute(Sender: TObject);
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

end;

procedure TfmDIN.FormShow(Sender: TObject);
begin
  gNameForm := 'fmDIN';
  SetControlFormat;

end;

procedure TfmDIN.grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
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
