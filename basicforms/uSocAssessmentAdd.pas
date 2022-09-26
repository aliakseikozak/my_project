unit uSocAssessmentAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, Vcl.StdCtrls, Vcl.ExtCtrls,
  dxLayoutContainer, cxDropDownEdit, cxCalendar, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, dxLayoutControl, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.Actions, Vcl.ActnList,
  dxBar, cxClasses, cxCheckBox, uResource, uExchDB,
  uExchDBData, dxLayoutControlAdapters, uKartUtils, Generics.Collections;

type
  TfmSocAssessmentAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxTextEdit1: TcxTextEdit;
    cxLookupComboBox3: TcxLookupComboBox;
    cxLookupComboBox4: TcxLookupComboBox;
    cxLookupComboBox5: TcxLookupComboBox;
    cxLookupComboBox6: TcxLookupComboBox;
    cxLookupComboBox2: TcxLookupComboBox;
    cxLookupComboBox1: TcxLookupComboBox;
    cxDateEdit1: TcxDateEdit;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dxLayoutItem1: TdxLayoutItem;
    cxLookupComboBox7: TcxLookupComboBox;
    dsEconomy: TDataSource;
    dsCommunication: TDataSource;
    dsRegion: TDataSource;
    dsAge: TDataSource;
    dsUpr: TDataSource;
    dsReabReriod: TDataSource;
    dsWork: TDataSource;
    cxCheckBox1: TCheckBox;
    dxLayoutItem11: TdxLayoutItem;
    function GenParams(): string;
  	procedure FillListRequired;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
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
    dbAlcohol: TDBData;
    dbWork: TDBData;
    procedure InitForm;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
  public
    { Public declarations }
    ListRequired: TList<TComponent>;
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit : Boolean );
  end;

var
  fmSocAssessmentAdd: TfmSocAssessmentAdd;

implementation
uses
uOVDAdd;

{$R *.dfm}

procedure TfmSocAssessmentAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSocAssessmentAdd.btnOkClick(Sender: TObject);
begin

  FillListRequired;
  if NOT Validate(ListRequired, True) then
    exit;
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('rehabilitation_socassessment_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('rehabilitation_socassessment_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;

end;

procedure TfmSocAssessmentAdd.FillListRequired;
begin
  Assert(Assigned(ListRequired));

  ListRequired.Clear;
  ListRequired.Add(cxLookupComboBox1);
  ListRequired.Add(cxLookupComboBox2);
  ListRequired.Add(cxLookupComboBox3);
  ListRequired.Add(cxLookupComboBox4);
  ListRequired.Add(cxLookupComboBox5);
  ListRequired.Add(cxLookupComboBox6);
  ListRequired.Add(cxLookupComboBox7);
end;

procedure TfmSocAssessmentAdd.FormShow(Sender: TObject);
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
        cxLookupComboBox1.EditValue := FieldByName('rehabilitation_period_id').Value;
        cxDateEdit1.EditValue := FieldByName('assessment_date').Value;
        cxLookupComboBox5.EditValue := FieldByName('upr_id').Value;
        cxLookupComboBox4.EditValue := FieldByName('age_id').Value;
        cxLookupComboBox3.EditValue := FieldByName('resident_id').Value;
        cxLookupComboBox6.EditValue := FieldByName('soc_communication_id').Value;
        cxLookupComboBox2.EditValue := FieldByName('requirement_1_id').Value;
        cxLookupComboBox7.EditValue := FieldByName('requirement_2_id').Value;
        cxTextEdit1.Text := FieldByName('add_information').Value;
        cxCheckBox1.Checked := FieldByName('work_citizen').AsBoolean;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

function TfmSocAssessmentAdd.GenParams(): string;
begin
  result := '';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  Result := Result + BoolToStr(cxCheckBox1.Checked, True) + '~';
  IF cxTextEdit1.Text <> '' then
    result := result + cxTextEdit1.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + GetLcbValue(cxLookupComboBox1) + '~';
  result := result + GetLcbValue(cxLookupComboBox2) + '~';
  result := result + GetLcbValue(cxLookupComboBox7) + '~';
  result := result + GetLcbValue(cxLookupComboBox6) + '~';
  result := result + GetLcbValue(cxLookupComboBox5) + '~';
  result := result + GetLcbValue(cxLookupComboBox4) + '~';
  result := result + GetLcbValue(cxLookupComboBox3) + '~';
  result := result + 'NULL' + '~';
  result := result + VarToStr(FID) + '~';

end;

function TfmSocAssessmentAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmSocAssessmentAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
  // result := DateToStr(pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmSocAssessmentAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;


procedure TfmSocAssessmentAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit : boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  Fedit := pedit;
end;

procedure TfmSocAssessmentAdd.InitForm;
begin
  dbReabReriod := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM soc_rehabilitation_period AS s  ' , []);
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

  dbAlcohol := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM economy AS s  ' , []);
  dsEconomy.DataSet := dbAlcohol.DataSet;

  dbWork := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM find_work AS s  ' , []);
  dsWork.DataSet := dbWork.DataSet;

  ListRequired := TList<TComponent>.Create;
end;

end.
