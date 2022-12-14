unit uMedAssessmentAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, Data.DB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, dxLayoutControlAdapters,
  Vcl.StdCtrls, Vcl.ExtCtrls, dxLayoutContainer, cxDropDownEdit, cxCalendar,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  dxLayoutControl, uKartUtils, uExchDB, uExchDBData, uResource, Generics.Collections;

type
  TfmMedAssessmentAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxTextEdit1: TcxTextEdit;
    cxLookupComboBox3: TcxLookupComboBox;
    cxLookupComboBox4: TcxLookupComboBox;
    cxLookupComboBox5: TcxLookupComboBox;
    cxLookupComboBox6: TcxLookupComboBox;
    cxLookupComboBox2: TcxLookupComboBox;
    cxLookupComboBox1: TcxLookupComboBox;
    cxDateEdit1: TcxDateEdit;
    cxCheckBox1: TCheckBox;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dxLayoutItem1: TdxLayoutItem;
    cxDateEdit2: TcxDateEdit;
    dxLayoutItem12: TdxLayoutItem;
    cxLookupComboBox8: TcxLookupComboBox;
    dxLayoutItem13: TdxLayoutItem;
    cxLookupComboBox9: TcxLookupComboBox;
    dxLayoutItem14: TdxLayoutItem;
    cxLookupComboBox10: TcxLookupComboBox;
    dxLayoutItem15: TdxLayoutItem;
    cxLookupComboBox11: TcxLookupComboBox;
    cxLookupComboBox12: TcxLookupComboBox;
    dxLayoutItem16: TdxLayoutItem;
    dsReabReriod: TDataSource;
    dsCommunication: TDataSource;
    dsRegion: TDataSource;
    dsUpr: TDataSource;
    dsAge: TDataSource;
    dsdependency: TDataSource;
    dsrequirement1: TDataSource;
    dsrequirement2: TDataSource;
    dsrequirement3: TDataSource;
    dsrequirement4: TDataSource;
    dsrequirement5: TDataSource;
    Edit1: TEdit;
    dxLayoutItem18: TdxLayoutItem;
    function GenParams(): string;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    Fedit: Boolean;
    dbIU: TDBData;
    dbReabReriod: TDBData;
    dbUpr: TDBData;
    dbAge: TDBData;
    dbRegion: TDBData;
    dbCommunication: TDBData;
    dbrequirement1: TDBData;
    dbrequirement2: TDBData;
    dbrequirement3: TDBData;
    dbrequirement4: TDBData;
    dbrequirement5: TDBData;
    dbdependency: TDBData;
    dbAlcohol: TDBData;
    dbWork: TDBData;
    procedure FillListRequired;
    procedure InitForm;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
  public
    { Public declarations }
    ListRequired: TList<TComponent>;
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
  end;

var
  fmMedAssessmentAdd: TfmMedAssessmentAdd;

implementation
uses
  uOVDAdd;

{$R *.dfm}

procedure TfmMedAssessmentAdd.btnCancelClick(Sender: TObject);
begin
  Close;

end;

procedure TfmMedAssessmentAdd.btnOkClick(Sender: TObject);
begin
  FillListRequired;
  if NOT Validate(ListRequired, True) then
    exit;
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('rehabilitation_rehabilitation_medassessment_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('rehabilitation_rehabilitation_medassessment_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

procedure TfmMedAssessmentAdd.FillListRequired;
begin
  Assert(Assigned(ListRequired));

  ListRequired.Clear;
  ListRequired.Add(cxLookupComboBox1);
  ListRequired.Add(cxLookupComboBox2);
  ListRequired.Add(cxLookupComboBox3);
  ListRequired.Add(cxLookupComboBox4);
  ListRequired.Add(cxLookupComboBox5);
  ListRequired.Add(cxLookupComboBox6);
end;

procedure TfmMedAssessmentAdd.FormShow(Sender: TObject);
var
  Columns: string;
  Params: string;
  Operations: string;
  i : integer;
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxDateEdit1.EditValue := FieldByName('assessment_date').Value;
        cxDateEdit2.EditValue := FieldByName('rehabilitation_end_date').Value;
        cxCheckBox1.Checked := FieldByName('give_psr').AsBoolean;
        cxLookupComboBox5.EditValue := FieldByName('upr_id').Value;
        cxLookupComboBox4.EditValue := FieldByName('age_id').Value;
        cxLookupComboBox3.EditValue := FieldByName('resident_id').Value;
        cxLookupComboBox6.EditValue := FieldByName('soc_communication_id').Value;
        cxLookupComboBox1.EditValue := FieldByName('rehabilitation_period_id').Value;
        cxLookupComboBox2.EditValue := FieldByName('dependency_type_id').Value;
       // cxLookupComboBox7.EditValue := FieldByName('assessment_result_id').Value;

        cxLookupComboBox10.EditValue := FieldByName('requirement_1_id').Value;
        cxLookupComboBox9.EditValue := FieldByName('requirement_2_id').Value;
        cxLookupComboBox8.EditValue := FieldByName('requirement_3_id').Value;
        cxLookupComboBox12.EditValue := FieldByName('requirement_4_id').Value;
        cxLookupComboBox11.EditValue := FieldByName('requirement_5_id').Value;
        cxTextEdit1.Text := FieldByName('result_rehabilitation').Value;

        if FieldByName('assessment_result_id').Value = 0 then
        begin
          Edit1.Text := '???????';
        end;
        if FieldByName('assessment_result_id').Value = 1 then
        begin
          Edit1.Text := '???????';
        end;
        if FieldByName('assessment_result_id').Value = 2 then
        begin
          Edit1.Text := '??????';
        end;
        if FieldByName('assessment_result_id').Value = 3 then
        begin
          Edit1.Text := '???';
        end;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

function TfmMedAssessmentAdd.GenParams(): string;
var
  i : Integer;
  t : integer;
begin

  if ((cxLookupComboBox8.EditValue = null) and
     (cxLookupComboBox9.EditValue = null) and
     (cxLookupComboBox10.EditValue = null) and
     (cxLookupComboBox11.EditValue = null) and
     (cxLookupComboBox12.EditValue = null)) then
  begin
    t := 3
  end
  else
  begin
    if cxLookupComboBox8.EditValue <> null then
    begin
      i := i + (cxLookupComboBox8.EditValue - 1);
    end;

    if cxLookupComboBox9.EditValue <> null then
    begin
      i := i + (cxLookupComboBox9.EditValue - 1);
    end;

    if cxLookupComboBox10.EditValue <> null then
    begin
      i := i + (cxLookupComboBox10.EditValue - 1);
    end;

    if cxLookupComboBox11.EditValue <> null then
    begin
      i := i + (cxLookupComboBox11.EditValue - 1);
    end;

    if cxLookupComboBox12.EditValue <> null then
    begin
      i := i + (cxLookupComboBox12.EditValue - 1);
    end;
 
    if ((i >= 0) and (i <= 6)) then
    begin
     t := 0;
    end;
    if ((i >= 7) and (i <= 13)) then
    begin
     t := 1;
    end;
    if ((i >= 14) and (i <= 20)) then
    begin
     t := 2;
    end;
  end;


  result := '';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  result := result + GetLcbValue(cxDateEdit2) + '~';
  result := Result + BoolToStr(cxCheckBox1.Checked, True) + '~';
  result := result + GetLcbValue(cxLookupComboBox4) + '~';
  result := result + IntToStr(t) + '~';
  result := result + GetLcbValue(cxLookupComboBox2) + '~';
  result := result + GetLcbValue(cxLookupComboBox1) + '~';
  result := result + GetLcbValue(cxLookupComboBox10) + '~';
  result := result + GetLcbValue(cxLookupComboBox9) + '~';
  result := result + GetLcbValue(cxLookupComboBox8) + '~';
  result := result + GetLcbValue(cxLookupComboBox12) + '~';
  result := result + GetLcbValue(cxLookupComboBox11) + '~';
  result := result + GetLcbValue(cxLookupComboBox3) + '~';
  result := result + GetLcbValue(cxLookupComboBox6) + '~';
  result := result + GetLcbValue(cxLookupComboBox5) + '~';
  IF cxTextEdit1.Text <> '' then
    result := result + cxTextEdit1.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + 'NULL' + '~';
  result := result + VarToStr(FID) + '~';

end;

function TfmMedAssessmentAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmMedAssessmentAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
  // result := DateToStr(pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmMedAssessmentAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;


procedure TfmMedAssessmentAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;

procedure TfmMedAssessmentAdd.InitForm;
begin
  dbReabReriod := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM med_rehabilitation_period AS s  ' , []);
  dsReabReriod.DataSet := dbReabReriod.DataSet;

  dbUpr := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM upr AS s  ' , []);
  dsUpr.DataSet := dbUpr.DataSet;

  dbAge := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM age AS s  ' , []);
  dsAge.DataSet := dbAge.DataSet;

  dbRegion := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM region AS s  ' , []);
  dsRegion.DataSet := dbRegion.DataSet;

  dbCommunication := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM soc_communication AS s  ' , []);
  dsCommunication.DataSet := dbCommunication.DataSet;
  //??? ???????????
  dbdependency := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM dependence_type AS s  ' , []);
  dsdependency.DataSet := dbdependency.DataSet;
  //?????? ??????-??????????? ????????
 { dbassessment := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM find_work AS s  ' , []);
  dsassessment.DataSet := dbassessment.DataSet; }
  //??????????????? ?????????? ????????? ?????-??????????-?????????
  dbrequirement1 := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM doctor_visit AS s  ' , []);
  dsrequirement1.DataSet := dbrequirement1.DataSet;
  //???? ??????????????? ????????
  dbrequirement2 := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM remission AS s  ' , []);
  dsrequirement2.DataSet := dbrequirement2.DataSet;
  //?????????? ????????? ???????????
  dbrequirement3 := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM relapse AS s  ' , []);
  dsrequirement3.DataSet := dbrequirement3.DataSet;
  //??????? ???????????? ???????? ? ???????????? ???
  dbrequirement4 := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM attraction AS s  ' , []);
  dsrequirement4.DataSet := dbrequirement4.DataSet;
  //??????? ???????????? ???
  dbrequirement5 := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM pas_periodicity AS s  ' , []);
  dsrequirement5.DataSet := dbrequirement5.DataSet;
  ListRequired := TList<TComponent>.Create;
end;

end.
