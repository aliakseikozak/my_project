unit uOffensesAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, Data.DB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, cxTextEdit, Vcl.StdCtrls,
  Vcl.ExtCtrls, dxLayoutContainer, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxCalendar, dxLayoutControl, uExchDBData, uResource, uExchDB, Generics.Collections;

type
  TfmOffensesAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit2: TcxDateEdit;
    cxDateEdit1: TcxDateEdit;
    cxLookupComboBox2: TcxLookupComboBox;
    cxLookupComboBox3: TcxLookupComboBox;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    Panel1: TPanel;
    dxLayoutItem1: TdxLayoutItem;
    cxLookupComboBox4: TcxLookupComboBox;
    cxTextEdit1: TcxTextEdit;
    dxLayoutItem7: TdxLayoutItem;
    dsOrganization: TDataSource;
    dsDirectory_article: TDataSource;
    dsOffenses_type: TDataSource;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FillListRequired;
    function GenParams(): string;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    FEdit: Boolean;
    dbOrganization: TDBData;
    dbOffenses_type: TDBData;
    dbDirectory_article: TDBData;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
    procedure InitForm;
  public
    { Public declarations }
    ListRequired: TList<TComponent>;
    dbIU: TDBData;
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
  end;

var
  fmOffensesAdd: TfmOffensesAdd;

implementation
uses
  uKartUtils, uOVDAdd;
               ////offenses_set
{$R *.dfm}

procedure TfmOffensesAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmOffensesAdd.btnOkClick(Sender: TObject);
begin
  FillListRequired;
  if NOT Validate(ListRequired, True) then
    exit;
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('offenses_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('offenses_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
 // dbIU := DataSetQuery('offenses_set', [VarToStr(FID), Resource.sessionInfo.token_id, GenParams()]);

end;

procedure TfmOffensesAdd.FillListRequired;
begin
  Assert(Assigned(ListRequired));

  ListRequired.Clear;
  ListRequired.Add(cxDateEdit2);
  ListRequired.Add(cxLookupComboBox3);
  ListRequired.Add(cxLookupComboBox2);
  ListRequired.Add(cxtextedit1);
end;


function TfmOffensesAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmOffensesAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmOffensesAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

function TfmOffensesAdd.GenParams(): string;
begin
  result := '';
  result := result + GetLcbValue(cxDateEdit2) + '~';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  //result := result + cxbedtNameShort.Text + '~';

  IF cxTextEdit1.Text <> '' then
    result := result + cxTextEdit1.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + GetLcbValue(cxLookupComboBox2) + '~';
  result := result + GetLcbValue(cxLookupComboBox3) + '~';
  result := result + GetLcbValue(cxLookupComboBox4) + '~';


    result := result + VarToStr(FID) + '~';

end;

procedure TfmOffensesAdd.FormShow(Sender: TObject);
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxDateEdit2.EditValue := FieldByName('offenses_date').Value;
        cxDateEdit1.EditValue := FieldByName('attraction_date').Value;
        cxTextEdit1.EditValue := FieldByName('reg_num').AsString;
        cxLookupComboBox2.EditValue := FieldByName('organization_id').Value;
        cxLookupComboBox3.EditValue := FieldByName('article_id').Value;
        cxLookupComboBox4.EditValue := FieldByName('state_support_id').Value;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

procedure TfmOffensesAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;

procedure TfmOffensesAdd.InitForm;
begin

  dbOrganization := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM company_directory_organization AS s  ', []);
  dsOrganization.DataSet := dbOrganization.DataSet;
  dbOffenses_type := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM offenses_type AS s  ', []);
  dsOffenses_type.DataSet := dbOffenses_type.DataSet;
  dbDirectory_article := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_article AS s  where s.type_article = 2', []);
  dsDirectory_article.DataSet := dbDirectory_article.DataSet;

  ListRequired := TList<TComponent>.Create;
end;

end.
