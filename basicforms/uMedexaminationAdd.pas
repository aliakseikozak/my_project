unit uMedexaminationAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, Vcl.StdCtrls, Vcl.ExtCtrls,
  dxLayoutContainer, cxTextEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxCalendar, dxLayoutControl, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.Actions, Vcl.ActnList,
  uExchDB, uExchDBData, dxBar, cxClasses, uResource, dxLayoutControlAdapters,
  cxMemo, uDisease, uKartUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, Generics.Collections;

type
  TfmMedexaminationAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit1: TcxDateEdit;
    cxLookupComboBox1: TcxLookupComboBox;
    cxTextEdit1: TcxTextEdit;
    cxLookupComboBox2: TcxLookupComboBox;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    CheckBox1: TCheckBox;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    CheckBox2: TCheckBox;
    dsInvalid: TDataSource;
    dsOrganization: TDataSource;
    dxLayoutItem3: TdxLayoutItem;
    cxLookupComboBox3: TcxLookupComboBox;
    dsDisease: TDataSource;
    cxMemo1: TMemo;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    GroupBox1: TGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    btnAddDis: TButton;
    cxLookupComboBox4: TcxLookupComboBox;
    dsDisGet: TDataSource;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dsSpecialistdoctor: TDataSource;
    dsInspectionreason: TDataSource;
    function GenParams(): string;
    function GenParams_dis(): string;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddDisClick(Sender: TObject);
  private
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    dbIU: TDBData;
    Fedit: Boolean;
    dbinspectionreason: TDBData;
    dbspecialistdoctor: TDBData;
    dbDisease: TDBData;
    dbInvalid: TDBData;
    dbDisGet: TDBData;
    dbIUdis: TDBData;
    dbOrganization: TDBData;
    procedure InitForm;
    procedure FillListRequired;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
    { Private declarations }
  public
    ListRequired: TList<TComponent>;
	procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
  end;

var
  fmMedexaminationAdd: TfmMedexaminationAdd;
  grmedexaminationid: integer;

implementation
uses
  uOVDAdd;

{$R *.dfm}

procedure TfmMedexaminationAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMedexaminationAdd.btnOkClick(Sender: TObject);
begin
  FillListRequired;
  if NOT Validate(ListRequired, True) then
    exit;
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('medexamination_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('medexamination_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

procedure TfmMedexaminationAdd.FillListRequired;
begin
  Assert(Assigned(ListRequired));

  ListRequired.Clear;
  ListRequired.Add(cxLookupComboBox1);
  ListRequired.Add(cxLookupComboBox2);
  ListRequired.Add(cxLookupComboBox3);
  ListRequired.Add(cxDateEdit1);
  ListRequired.Add(cxMemo1);
  ListRequired.Add(cxTextEdit1);
end;

procedure TfmMedexaminationAdd.btnAddDisClick(Sender: TObject);
begin
  if cxLookupComboBox4.EditValue = null then
  begin
    ShowMessage('Не заполнено поле "Заболевания"');
    Exit;
  end;

  FillListRequired;
  if NOT Validate(ListRequired, True) then
    exit;
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('medexamination_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
    grmedexaminationid := dbIU.DataSet.FieldByName('r_id').Value;
    FMode := 1;
  end
  else
  begin
    dbIU := DataSetQuery('medexamination_set', [VarToStr(grmedexaminationid), VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  //  grmedexaminationid := FDB.DataSet.FieldByName('id').Value;
  end;
  dbIUdis := DataSetQuery('medexamination_disease_set', ['0', '0', Resource.sessionInfo.token_id, GenParams_dis()]);
  dbDisGet := DataSetQuery('grmedexamination_disease_get', [Resource.sessionInfo.token_id, '1', 'bmf.grmedexamination_id', VarToStr(grmedexaminationid), '='], GetFieldsArray(), true);
  dsDisGet.DataSet := dbDisGet.DataSet;
end;

function TfmMedexaminationAdd.GenParams_dis(): string;
begin
  result := '';

  result := result + VarToStr(grmedexaminationid) + '~';
  result := result + GetLcbValue(cxLookupComboBox4) + '~';
  //result := result + cxbedtNameShort.Text + '~';

end;

procedure TfmMedexaminationAdd.FormShow(Sender: TObject);
var
  Columns: string;
  Params: string;
  Operations: string;
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxDateEdit1.EditValue := FieldByName('observation_date').Value;
        cxMemo1.Text := FieldByName('medical_report').Value;
        CheckBox2.Checked := FieldByName('no_court_disease').AsBoolean;
        CheckBox1.Checked := FieldByName('pr_pregnancy').AsBoolean;
        cxTextEdit1.Text := FieldByName('doctor_id').Value;
        cxLookupComboBox1.EditValue := FieldByName('org_id').Value;
        cxLookupComboBox2.EditValue := FieldByName('pr_invalid_id').Value;
        cxLookupComboBox3.EditValue := FieldByName('disease_id').Value;
        grmedexaminationid := FDB.DataSet.FieldByName('id').Value;

      end;
      dbDisGet := DataSetQuery('grmedexamination_disease_get', [Resource.sessionInfo.token_id, '1', 'bmf.grmedexamination_id', VarToStr(grmedexaminationid), '='], GetFieldsArray(), true);
      dsDisGet.DataSet := dbDisGet.DataSet;
   end
   else
   begin
     //btnOk.Enabled := false;
     //Button1.Enabled := false;
   end;
   EnabledEdData(Self, FEdit);
end;

procedure TfmMedexaminationAdd.InitForm;
begin
  dbspecialistdoctor := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_specialistdoctor AS s  ', []);
  dsspecialistdoctor.DataSet := dbspecialistdoctor.DataSet;

  dbinspectionreason := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_inspectionreason AS s ', []);
  dsinspectionreason.DataSet := dbinspectionreason.DataSet;

  dbOrganization := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM company_directory_organization AS s  '+
   '  where s.type_org = 1', []);
  dsOrganization.DataSet := dbOrganization.DataSet;

  dbdisease := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_disease AS s  ', []);
  dsdisease.DataSet := dbdisease.DataSet;

  dbInvalid := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM pr_invalid AS s  ', []);
  dsInvalid.DataSet := dbInvalid.DataSet;
  ListRequired := TList<TComponent>.Create;
end;

procedure TfmMedexaminationAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  Fedit := pedit;
end;

function TfmMedexaminationAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmMedexaminationAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
  // result := DateToStr(pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmMedexaminationAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

function TfmMedexaminationAdd.GenParams(): string;
begin
  result := '';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  IF cxMemo1.Text <> '' then
    result := result + cxMemo1.Text + '~'
  else
    result := result + 'NULL' + '~';
  Result := Result + BoolToStr(CheckBox2.Checked, True) + '~';
  Result := Result + BoolToStr(CheckBox1.Checked, True) + '~';

  IF cxTextEdit1.Text <> '' then
    result := result + cxTextEdit1.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + GetLcbValue(cxLookupComboBox1) + '~';

  result := result + GetLcbValue(cxLookupComboBox3) + '~';

  result := result + GetLcbValue(cxLookupComboBox2) + '~';
  //result := result + cxbedtNameShort.Text + '~';

  result := result + VarToStr(FID) + '~';

end;

end.
