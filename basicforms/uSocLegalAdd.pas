unit uSocLegalAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.Actions, Vcl.ActnList,
  dxBar, cxClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxLayoutcxEditAdapters, Vcl.StdCtrls, Vcl.ExtCtrls, dxLayoutContainer,
  cxTextEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxMaskEdit, cxCalendar, dxLayoutControl, uResource, uExchDB,
  uExchDBData, Generics.Collections;

type
  TfmSocLegalAdd = class(TfmBaseForm)
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
    dxLayoutItem1: TdxLayoutItem;
    cxLookupComboBox3: TcxLookupComboBox;
    dxLayoutItem6: TdxLayoutItem;
    cxLookupComboBox4: TcxLookupComboBox;
    dxLayoutItem8: TdxLayoutItem;
    cxLookupComboBox5: TcxLookupComboBox;
    dxLayoutItem9: TdxLayoutItem;
    cxLookupComboBox6: TcxLookupComboBox;
    dsReabReriod: TDataSource;
    dsUpr: TDataSource;
    dsAge: TDataSource;
    dsRegion: TDataSource;
    dsCommunication: TDataSource;
    dsAlcohol: TDataSource;
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
    Fedit: Boolean;
    dbIU: TDBData;
    dbReabReriod: TDBData;
    dbUpr: TDBData;
    dbAge: TDBData;
    dbRegion: TDBData;
    dbCommunication: TDBData;
    dbAlcohol: TDBData;
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
  fmSocLegalAdd: TfmSocLegalAdd;

implementation
uses
  uKartUtils;

{$R *.dfm}

procedure TfmSocLegalAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSocLegalAdd.FillListRequired;
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

procedure TfmSocLegalAdd.btnOkClick(Sender: TObject);
begin
  FillListRequired;
  if NOT Validate(ListRequired, True) then
    exit;
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('rehabilitation_soclegal_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('rehabilitation_soclegal_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

procedure TfmSocLegalAdd.FormShow(Sender: TObject);
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
        cxLookupComboBox1.EditValue := FieldByName('rehabilitation_period_id').Value;
        cxDateEdit1.EditValue := FieldByName('assessment_date').Value;
        cxLookupComboBox5.EditValue := FieldByName('upr_id').Value;
        cxLookupComboBox4.EditValue := FieldByName('age_id').Value;
        cxLookupComboBox3.EditValue := FieldByName('resident_id').Value;
        cxLookupComboBox6.EditValue := FieldByName('soc_communication_id').Value;
        cxLookupComboBox2.EditValue := FieldByName('administrative_alcohol_id').Value;
        cxTextEdit1.Text := FieldByName('add_information').Value;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

function TfmSocLegalAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmSocLegalAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
  // result := DateToStr(pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmSocLegalAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

procedure TfmSocLegalAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;

function TfmSocLegalAdd.GenParams(): string;
begin
  result := '';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  result := result + GetLcbValue(cxLookupComboBox1) + '~';
  result := result + GetLcbValue(cxLookupComboBox5) + '~';
  result := result + GetLcbValue(cxLookupComboBox4) + '~';
  result := result + GetLcbValue(cxLookupComboBox3) + '~';
  result := result + GetLcbValue(cxLookupComboBox6) + '~';
  result := result + GetLcbValue(cxLookupComboBox1) + '~';

  IF cxTextEdit1.Text <> '' then
    result := result + cxTextEdit1.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + VarToStr(FID) + '~';

end;

procedure TfmSocLegalAdd.InitForm;
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
   '   FROM administrative_alcohol AS s  ' , []);
  dsAlcohol.DataSet := dbAlcohol.DataSet;
    ListRequired := TList<TComponent>.Create;
end;
end.
