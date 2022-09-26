unit uLTPMedicalAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, Data.DB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, dxLayoutcxEditAdapters, dxLayoutContainer,
  dxLayoutControlAdapters, Vcl.ExtCtrls, Vcl.StdCtrls, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxMaskEdit, cxCalendar, dxLayoutControl, uExchDB, uExchDBData, uResource, Generics.Collections, uKartUtils;

type
  TfmLTPMedicalAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit1: TcxDateEdit;
    GroupBox1: TGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLookupComboBox3: TcxLookupComboBox;
    Button2: TButton;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutAutoCreatedGroup2: TdxLayoutAutoCreatedGroup;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    cxTextEdit2: TcxTextEdit;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    cxTextEdit3: TcxTextEdit;
    dsspecialistdoctor: TDataSource;
    dxLayoutItem4: TdxLayoutItem;
    cxLookupComboBox1: TcxLookupComboBox;
    dxLayoutItem7: TdxLayoutItem;
    cxLookupComboBox2: TcxLookupComboBox;
    dsinspectionreason: TDataSource;
    dsDisease: TDataSource;
    dsDisGet: TDataSource;
    procedure FillListRequired;
    function GenParams(): string;
    function GenParams_dis(): string;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    dbIU: TDBData;
    dbOrganization: TDBData;
    dbInvalid: TDBData;
    dbDisease: TDBData;
    dbDisGet: TDBData;
    dbspecialistdoctor : TDBData;
    dbinspectionreason : TDBData;
    dbIUdis: TDBData;
//    procedure InitForm;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
    procedure InitForm;
  public
    ListRequired: TList<TComponent>;
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant);
  end;

var
  fmLTPMedicalAdd: TfmLTPMedicalAdd;
  gCureId: integer;
  gmedicalid: integer;

implementation

{$R *.dfm}

procedure TfmLTPMedicalAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLTPMedicalAdd.btnOkClick(Sender: TObject);
begin
  FillListRequired;
  if NOT Validate(ListRequired, True) then
    exit;

  if FMode = 0 then
  begin
    dbIU := DataSetQuery('ltpmedical_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('ltpmedical_set', [VarToStr(gmedicalid), VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;

end;

function TfmLTPMedicalAdd.GenParams(): string;
begin
  result := '';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  IF cxTextEdit3.Text <> '' then
    result := result + cxTextEdit3.Text + '~'
  else
    result := result + 'NULL' + '~';
  IF cxTextEdit2.Text <> '' then
    result := result + cxTextEdit2.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + GetLcbValue(cxLookupComboBox2) + '~';
  result := result + GetLcbValue(cxLookupComboBox1) + '~';
  result := result + VarToStr(gCureId) + '~';
  //result := result + cxbedtNameShort.Text + '~';

  result := result + '1' + '~';

end;

procedure TfmLTPMedicalAdd.Button2Click(Sender: TObject);
begin
  if cxLookupComboBox3.EditValue = null then
  begin
    ShowMessage('�� ��������� ���� "�����������"');
    Exit;
  end;

  if FMode = 0 then
  begin
    dbIU := DataSetQuery('ltpmedical_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
    gmedicalid := dbIU.DataSet.FieldByName('r_id').Value;
    FMode := 1;
  end
  else
  begin
    dbIU := DataSetQuery('ltpmedical_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
    gmedicalid := FDB.DataSet.FieldByName('id').Value;
  end;
  dbIUdis := DataSetQuery('ltpmedical_disease_set', ['0', '0', Resource.sessionInfo.token_id, GenParams_dis()]);
  dbDisGet := DataSetQuery('ltpmedical_disease_get', [Resource.sessionInfo.token_id, '1', 'bmf.ltpmedical_id', VarToStr(gmedicalid), '='], GetFieldsArray(), true);
  dsDisGet.DataSet := dbDisGet.DataSet;

end;

function TfmLTPMedicalAdd.GenParams_dis(): string;
begin
  result := '';

  result := result + VarToStr(gmedicalid) + '~';
  result := result + GetLcbValue(cxLookupComboBox3) + '~';

end;

procedure TfmLTPMedicalAdd.FormShow(Sender: TObject);
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxDateEdit1.EditValue := FieldByName('examination_date').Value;
        cxTextEdit2.EditValue := FieldByName('doctor').Value;
        cxLookupComboBox1.EditValue := FieldByName('specialistdoctor_id').Value;
        cxLookupComboBox2.EditValue := FieldByName('examination_reason_id').Value;
        cxTextEdit3.EditValue := FieldByName('medical_report').Value;
      end;
      gmedicalid := FID;
      dbDisGet := DataSetQuery('ltpmedical_disease_get', [Resource.sessionInfo.token_id, '1', 'bmf.ltpmedical_id', VarToStr(FDB.DataSet.FieldByName('id').Value), '='], GetFieldsArray(), true);
      dsDisGet.DataSet := dbDisGet.DataSet;
   end;
end;

procedure TfmLTPMedicalAdd.InitForm;
begin
  dbinspectionreason := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_inspectionreason AS s  ', []);
  dsinspectionreason.DataSet := dbinspectionreason.DataSet;

  dbspecialistdoctor := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_specialistdoctor AS s  ', []);
  dsspecialistdoctor.DataSet := dbspecialistdoctor.DataSet;

  dbdisease := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_disease AS s  ', []);
  dsdisease.DataSet := dbdisease.DataSet;

  ListRequired := TList<TComponent>.Create;
end;

procedure TfmLTPMedicalAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
end;

function TfmLTPMedicalAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmLTPMedicalAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
  // result := DateToStr(pLcb.EditValue{, Resource.JsonFormatSettings});
end;

procedure TfmLTPMedicalAdd.FillListRequired;
begin
  Assert(Assigned(ListRequired));

  ListRequired.Clear;
  ListRequired.Add(cxDateEdit1);
  ListRequired.Add(cxLookupComboBox1);
end;

function TfmLTPMedicalAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

end.
