unit uEducationAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, Data.DB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, dxLayoutContainer,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, dxLayoutControl, Vcl.StdCtrls, Vcl.ExtCtrls, uExchDBData
  , uResource, uExchDB;

type
  TfmEducationAdd = class(TfmBaseForm)
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit2: TcxDateEdit;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    cxDateEdit1: TcxDateEdit;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    cxLookupComboBox2: TcxLookupComboBox;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    cxLookupComboBox3: TcxLookupComboBox;
    dsOrganization: TDataSource;
    dsProfession: TDataSource;
    dsType: TDataSource;
    Edit1: TEdit;
    dxLayoutItem6: TdxLayoutItem;
    function GenParams(): string;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    dbIU: TDBData;
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    FEdit: Boolean;
    dbOrganization: TDBData;
    dbProfession: TDBData;
    dbType: TDBData;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
    procedure InitForm;
  public
    { Public declarations }
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
  end;

var
  fmEducationAdd: TfmEducationAdd;
   //education_set
implementation
uses
  uKartUtils, uOVDAdd;

{$R *.dfm}

procedure TfmEducationAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEducationAdd.btnOkClick(Sender: TObject);
begin
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('education_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('education_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

procedure TfmEducationAdd.FormShow(Sender: TObject);
begin
   InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        Edit1.Text := FieldByName('organization_id').Value;
        cxDateEdit2.EditValue := FieldByName('start_educ_date').Value;
        cxDateEdit1.EditValue := FieldByName('end_educ_date').Value;
        cxLookupComboBox2.EditValue := FieldByName('educ_type_id').Value;
        cxLookupComboBox3.EditValue := FieldByName('profession_id').Value;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

function TfmEducationAdd.GenParams(): string;
begin
  result := '';

  //result := result + cxbedtNameShort.Text + '~';

  result := result + GetLcbValue(cxDateEdit2) + '~';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  result := result + GetLcbValue(cxLookupComboBox2) + '~';
  IF Edit1.Text <> '' then
    result := result + Edit1.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + GetLcbValue(cxLookupComboBox3) + '~';
  result := result + VarToStr(FID) + '~';

end;

procedure TfmEducationAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;


function TfmEducationAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmEducationAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmEducationAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

procedure TfmEducationAdd.InitForm;
begin

  dbOrganization := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM company_directory_organization AS s  ', []);
  dsOrganization.DataSet := dbOrganization.DataSet;
  dbType := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM education_type AS s  ', []);
  dsType.DataSet := dbType.DataSet;
  dbProfession := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_profession AS s  ', []);
  dsProfession.DataSet := dbProfession.DataSet;
end;

end.
