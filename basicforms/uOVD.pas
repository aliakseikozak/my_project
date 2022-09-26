unit uOVD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ufmBaseGrid, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxLayoutControlAdapters, dxLayoutcxEditAdapters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData,
  Vcl.Menus, cxButtons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, System.Actions, Vcl.ActnList, dxBar,
  cxClasses, cxSplitter, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutContainer, Vcl.StdCtrls,
  dxLayoutControl, cxLabel, Vcl.ExtCtrls, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar, Vcl.Buttons, uKartUtils, uResource, uExchDBData, uExchDB, uOVDAdd,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmOVD = class(TfmBaseGrid)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    actGoFilter: TAction;
    actAdvanced: TAction;
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    grBaseDBTableViewColumn7: TcxGridDBColumn;
    grBaseDBTableViewColumn8: TcxGridDBColumn;
    grBaseDBTableViewColumn9: TcxGridDBColumn;
    dsStatus: TDataSource;
    grBaseDBTableViewColumn6: TcxGridDBColumn;
    grBaseDBTableViewColumn10: TcxGridDBColumn;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem5: TdxLayoutItem;
    btFindParamClear: TBitBtn;
    dxLayoutItem6: TdxLayoutItem;
    btFind: TBitBtn;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    RadioGroup1: TRadioGroup;
    cxDateEdit1: TcxDateEdit;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutAutoCreatedGroup3: TdxLayoutAutoCreatedGroup;
    cxLookupComboBox1: TcxLookupComboBox;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem10: TdxLayoutItem;
    cxLookupComboBox2: TcxLookupComboBox;
    dxLayoutItem11: TdxLayoutItem;
    cxLookupComboBox3: TcxLookupComboBox;
    dxLayoutItem12: TdxLayoutItem;
    cxLookupComboBox4: TcxLookupComboBox;
    dxLayoutGroup2: TdxLayoutGroup;
    cxLookupComboBox5: TcxLookupComboBox;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    cxLookupComboBox6: TcxLookupComboBox;
    dxLayoutItem15: TdxLayoutItem;
    cxLookupComboBox7: TcxLookupComboBox;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    Edit5: TEdit;
    dxLayoutItem16: TdxLayoutItem;
    dsRegion: TDataSource;
    dsCity: TDataSource;
    dsCityRegion: TDataSource;
    dsYKRB: TDataSource;
    dsKOAP: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure actGetDataExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actParamClearExecute(Sender: TObject);
    procedure cxLookupComboBox4PropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupComboBox3PropertiesEditValueChanged(Sender: TObject);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    dbStatus: TDBData;
    dbCity: TDBData;
    dbCityRegion: TDBData;
    dbRegion: TDBData;
    dbKOAP: TDBData;
    dbYKRB: TDBData;
    procedure InitForm;
    procedure SetControlFormat;
  public
    dbBase: TDBData;
    { Public declarations }
  end;

var
  fmOVD: TfmOVD;
  pedit: Boolean;

implementation
uses
  uLogin;

{$R *.dfm}

procedure TfmOVD.actEditExecute(Sender: TObject);
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

procedure TfmOVD.actGetDataExecute(Sender: TObject);
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

   if (cxDateEdit1.EditValue <> NULL) then
   begin
     if Columns <> EmptyStr then
     begin
       Columns := Columns + '~';
       Operations := Operations + '~';
       Params := Params + '~';
     end;

     Columns := Columns + cxDateEdit1.Properties.ImeName;
     Operations := Operations + '=';
     Params:= Params + '''''' + FormatDateTime('YYYY-MM-DD', cxDateEdit1.Date) + '''''';
   end;

  { if ((cxLookupComboBox1.EditValue <> null) or (cxLookupComboBox2.EditValue <> null) or
   (cxLookupComboBox3.EditValue <> null) or (cxLookupComboBox4.EditValue <> null))  then
   begin }

     if (RadioGroup1.ItemIndex = 0) then
     begin
       if Columns <> EmptyStr then
       begin
         Columns := Columns + '~';
         Operations := Operations + '~';
         Params := Params + '~';
       end;

       Columns := Columns + 'adr.sign_address';
       Operations := Operations + '=';
       Params:= Params +  IntToStr(RadioGroup1.ItemIndex) ;
     end
     else
     begin
       if Columns <> EmptyStr then
       begin
         Columns := Columns + '~';
         Operations := Operations + '~';
         Params := Params + '~';
       end;

       Columns := Columns + 'adr.sign_address';
       Operations := Operations + '=';
       Params:= Params + '''''' + IntToStr(RadioGroup1.ItemIndex) + '''''';
     end;

  // end;

  FreeAndNil(dbBase);
  dbBase := DataSetQuery('grinformation_field_ovd_get', [Resource.sessionInfo.token_id, '1', Columns, Params, Operations], GetFieldsArray(), true);
  dsBase.DataSet := dbBase.DataSet;
  SetControlFormat;

end;

procedure TfmOVD.actNewExecute(Sender: TObject);
var
  fm: TfmOVDAdd;
begin
{  if dbBase.DataSet.IsEmpty then
    Exit;
            }
  fm := TfmOVDAdd(CreateForm('TfmOVDAdd', 'fmOVDAdd', Self, false));
  try
    fm.SetData(dbBase, 0, 0);
    if ( fm.ShowModal() = mrOk ) then begin

      dbBase.DataSetReQuery;

    end;
  finally
    fm.Free;
    actGetData.Execute;
   // gCaptionName := '������';
  end;

end;

procedure TfmOVD.actParamClearExecute(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Clear;
  cxLookupComboBox5.Clear;
  cxLookupComboBox2.Clear;
  cxLookupComboBox3.Clear;
  cxLookupComboBox1.Clear;
  cxLookupComboBox4.Clear;
  cxLookupComboBox7.Clear;
  cxLookupComboBox6.Clear;
  RadioGroup1.ItemIndex := 0;
  cxDateEdit1.Clear;
end;

procedure TfmOVD.Button1Click(Sender: TObject);
begin
  inherited;
  //Panel1.Visible := False;
end;

procedure TfmOVD.cxLookupComboBox3PropertiesEditValueChanged(Sender: TObject);
begin
  if cxLookupComboBox3.EditValue <> null then
  begin
    dbCityRegion := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
     ' SELECT s.id, s.name  '+
       '   FROM directory_city_region AS s  '+
     ' where s.city_id = '+ VarToStr(cxLookupComboBox3.EditValue), []);
    dsCityRegion.DataSet := dbCityRegion.DataSet;
  end;

end;

procedure TfmOVD.cxLookupComboBox4PropertiesEditValueChanged(Sender: TObject);
begin

  if cxLookupComboBox4.EditValue <> null then
  begin
    dbCity := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
     ' SELECT s.id, s.name  '+
     '   FROM directory_city AS s  '+
     ' where s.region_id = '+ VarToStr(cxLookupComboBox4.EditValue), []);
    dsCity.DataSet := dbCity.DataSet;
  end;
end;

procedure TfmOVD.FormCreate(Sender: TObject);
var
  viewing : Boolean;
  deletion : Boolean;
begin
 {   dbAccess := DataSetQuery('access_form_get', [gUser, 'OVD_OSN'], GetFieldsArray(), true);
    viewing := dbAccess.DataSet.FieldByName('on_viewing').AsBoolean;
    pedit := dbAccess.DataSet.FieldByName('on_edit').AsBoolean;
    deletion := dbAccess.DataSet.FieldByName('on_deletion').AsBoolean;
      }
 {   if deletion = true then
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
    end;   }
end;

procedure TfmOVD.SetControlFormat;
var
  i: integer;
begin
  i := grBaseDBTableView.GetColumnByFieldName('grinformation_id').Index;
  grBaseDBTableView.Columns[i].Summary.FooterKind := skCount;
  grBaseDBTableView.Columns[i].Summary.FooterFormat := '�������: #';
end;

procedure TfmOVD.FormShow(Sender: TObject);
begin
  InitForm;
  SetControlFormat;
  gNameForm := 'fmOVD';
  dbBase := DataSetQuery('grinformation_field_ovd_get', [Resource.sessionInfo.token_id, '1', 'bmf.id', '-1', '='], GetFieldsArray(), true);
  dsBase.DataSet := dbBase.DataSet;
  //actGetData.Execute;
end;

procedure TfmOVD.grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
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

procedure TfmOVD.InitForm;
begin
   dbRegion := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
     '   FROM directory_region AS s  ', []);
   dsRegion.DataSet := dbRegion.DataSet;

  dbStatus := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.status_form  '+
   '   FROM mvd_personal_inf_statusform AS s  ', []);
  dsStatus.DataSet := dbStatus.DataSet;

  dbYKRB := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_article AS s  '+
   '  where s.type_article = 1', []);
  dsYKRB.DataSet := dbYKRB.DataSet;


  dbKOAP := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_article AS s  '+
   '  where s.type_article = 2', []);
  dsKOAP.DataSet := dbKOAP.DataSet;




end;

end.

