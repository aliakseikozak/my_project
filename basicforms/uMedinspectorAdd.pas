unit uMedinspectorAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxLayoutcxEditAdapters, dxLayoutContainer, cxClasses, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit,
  cxCalendar, dxLayoutControl, Vcl.StdCtrls, Vcl.ExtCtrls, uExchDB,
  uExchDBData, uResource, Data.DB, ufmBaseForm, uDisease,
  dxLayoutControlAdapters, uKartUtils, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Generics.Collections;

type
  TfmMedinspectorAdd = class(TfmBaseForm)
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxTextEdit1: TcxTextEdit;
    cxLookupComboBox1: TcxLookupComboBox;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    cxLookupComboBox2: TcxLookupComboBox;
    dsDependenceType: TDataSource;
    dsOrganization: TDataSource;
    GroupBox1: TGroupBox;
    dxLayoutItem6: TdxLayoutItem;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    btnAddDis: TButton;
    cxLookupComboBox3: TcxLookupComboBox;
    dsdisease: TDataSource;
    dsDisGet: TDataSource;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem8: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    function GenParams(): string;
    function GenParams_dis(): string;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddDisClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    Fedit: Boolean;
    dbIU: TDBData;
    dbIUdis: TDBData;
    dbDisGet: TDBData;
    dbOrganization: TDBData;
    dbDependenceType: TDBData;
    dbdisease:TDBData;
    procedure InitForm;
    procedure FillListRequired;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
  public
    ListRequired: TList<TComponent>;
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pEdit: Boolean);
  end;

var
  fmMedinspectorAdd: TfmMedinspectorAdd;
  grmedinspectorid: integer;

implementation
uses
  uOVDAdd;

{$R *.dfm}



procedure TfmMedinspectorAdd.btnAddDisClick(Sender: TObject);
begin
  if cxLookupComboBox3.EditValue = null then
  begin
    ShowMessage('�� ��������� ���� "�����������"');
    Exit;
  end;
  FillListRequired;
  if NOT Validate(ListRequired, True) then
    exit;
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('medinspector_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
    grmedinspectorid := dbIU.DataSet.FieldByName('r_id').Value;
    FMode := 1;
  end
  else
  begin
    dbIU := DataSetQuery('medinspector_set', [VarToStr(grmedinspectorid), VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  //  grmedinspectorid := FID;
  end;
  dbIUdis := DataSetQuery('medinspector_disease_set', ['0', '0', Resource.sessionInfo.token_id, GenParams_dis()]);
  dbDisGet := DataSetQuery('grmedinspector_disease_get', [Resource.sessionInfo.token_id, '1', 'bmf.grmedinspector_id', VarToStr(grmedinspectorid), '='], GetFieldsArray(), true);
  dsDisGet.DataSet := dbDisGet.DataSet;
end;

procedure TfmMedinspectorAdd.FillListRequired;
begin
  Assert(Assigned(ListRequired));

  ListRequired.Clear;
  ListRequired.Add(cxLookupComboBox1);
  ListRequired.Add(cxLookupComboBox2);
  ListRequired.Add(cxDateEdit1);
  ListRequired.Add(cxDateEdit2);
  ListRequired.Add(cxTextEdit1);
end;

procedure TfmMedinspectorAdd.Button3Click(Sender: TObject);
begin


  if FMode = 1 then
  begin
      dbIU := DataSetQuery('medinspector_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
      grmedinspectorid := FID;

  end
  else
  begin
     dbIU := DataSetQuery('medinspector_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
     grmedinspectorid := dbIU.DataSet.FieldByName('r_id').Value;
  end;
end;

procedure TfmMedinspectorAdd.FormShow(Sender: TObject);
var
  Columns: string;
  Params: string;
  Operations: string;
begin

  BarManagerMainBar.Visible := false;
  BarManagerMainMenu.Visible := false;
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxDateEdit1.EditValue := FieldByName('observation_date').Value;
        cxDateEdit2.EditValue := FieldByName('examenation_date').Value;
        cxLookupComboBox1.EditValue := FieldByName('dependence_type_id').Value;
        cxTextEdit1.Text := FieldByName('doctor_id').Value;
        cxLookupComboBox2.EditValue := FieldByName('org_id').Value;
        grmedinspectorid := FID;
      end;
    dbDisGet := DataSetQuery('grmedinspector_disease_get', [Resource.sessionInfo.token_id, '1', 'bmf.grmedinspector_id', VarToStr(FDB.DataSet.FieldByName('id').Value), '='], GetFieldsArray(), true);
    dsDisGet.DataSet := dbDisGet.DataSet;
   end
   else
   begin

   end;
   EnabledEdData(Self, FEdit);
end;

procedure TfmMedinspectorAdd.InitForm;
begin
  dbDependenceType := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM dependence_type AS s  ', []);
  dsDependenceType.DataSet := dbDependenceType.DataSet;

  dbOrganization := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM company_directory_organization AS s  '+
   '  where s.type_org = 1', []);
  dsOrganization.DataSet := dbOrganization.DataSet;

  dbdisease := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_disease AS s  ', []);
  dsdisease.DataSet := dbdisease.DataSet;
  ListRequired := TList<TComponent>.Create;
end;

procedure TfmMedinspectorAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;


function TfmMedinspectorAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmMedinspectorAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
  // result := DateToStr(pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmMedinspectorAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

function TfmMedinspectorAdd.GenParams(): string;
begin
  result := '';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  result := result + GetLcbValue(cxDateEdit2) + '~';
  result := result + GetLcbValue(cxLookupComboBox1) + '~';
  IF cxTextEdit1.Text <> '' then
    result := result + cxTextEdit1.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + GetLcbValue(cxLookupComboBox2) + '~';

  result := result + VarToStr(FID) + '~';

end;

function TfmMedinspectorAdd.GenParams_dis(): string;
begin
  result := '';

  result := result + VarToStr(grmedinspectorid) + '~';
  result := result + GetLcbValue(cxLookupComboBox3) + '~';

end;

procedure TfmMedinspectorAdd.btnCancelClick(Sender: TObject);
begin
  Close;

end;

procedure TfmMedinspectorAdd.btnOkClick(Sender: TObject);
begin
  FillListRequired;
  if NOT Validate(ListRequired, True) then
    exit;
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('medinspector_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
    Close;
  end
  else
  begin
    dbIU := DataSetQuery('medinspector_set', [VarToStr(grmedinspectorid), VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;


end.
