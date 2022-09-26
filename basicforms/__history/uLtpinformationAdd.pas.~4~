unit uLtpinformationAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, dxLayoutContainer,
  dxLayoutControlAdapters, Vcl.StdCtrls, cxTextEdit, Vcl.ExtCtrls,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit,
  cxCalendar, dxLayoutControl, System.Actions, Vcl.ActnList, dxBar, cxClasses,
  Data.DB, uExchDB, uExchDBData, uResource;

type
  TfmLtpinformationAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit2: TcxDateEdit;
    cxLookupComboBox2: TcxLookupComboBox;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    Panel1: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    GroupBox1: TGroupBox;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutControl2: TdxLayoutControl;
    dxLayoutItem8: TdxLayoutItem;
    cxDateEdit3: TcxDateEdit;
    dxLayoutItem9: TdxLayoutItem;
    cxTextEdit2: TcxTextEdit;
    CheckBox1: TCheckBox;
    dxLayoutItem10: TdxLayoutItem;
    dxLayoutItem11: TdxLayoutItem;
    CheckBox2: TCheckBox;
    dxLayoutItem12: TdxLayoutItem;
    CheckBox3: TCheckBox;
    dxLayoutItem13: TdxLayoutItem;
    CheckBox4: TCheckBox;
    GroupBox2: TGroupBox;
    dxLayoutItem14: TdxLayoutItem;
    dxLayoutControl3Group_Root: TdxLayoutGroup;
    dxLayoutControl3: TdxLayoutControl;
    dxLayoutItem16: TdxLayoutItem;
    cxDateEdit4: TcxDateEdit;
    dxLayoutItem17: TdxLayoutItem;
    cxTextEdit3: TcxTextEdit;
    GroupBox4: TGroupBox;
    dxLayoutControl5: TdxLayoutControl;
    cxTextEdit4: TcxTextEdit;
    cxDateEdit7: TcxDateEdit;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem22: TdxLayoutItem;
    dxLayoutItem23: TdxLayoutItem;
    dxLayoutItem21: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    cxLookupComboBox4: TcxLookupComboBox;
    dsOrganization: TDataSource;
    function GenParams(): string;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    dbIU: TDBData;
    dbOrganization: TDBData;
    procedure InitForm;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
    { Private declarations }
  public
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant);
  end;

var
  fmLtpinformationAdd: TfmLtpinformationAdd;

implementation

{$R *.dfm}

procedure TfmLtpinformationAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
end;

function TfmLtpinformationAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmLtpinformationAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
end;

procedure TfmLtpinformationAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLtpinformationAdd.btnOkClick(Sender: TObject);
begin
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('ltpinformation_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('ltpinformation_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;

end;

function TfmLtpinformationAdd.GenParams(): string;
begin
  result := '';

  result := result + GetLcbValue(cxLookupComboBox2) + '~';
  result := result + GetLcbValue(cxDateEdit2) + '~';
  result := result + GetLcbValue(cxDateEdit4) + '~';

  IF cxTextEdit3.Text <> '' then
    result := result + cxTextEdit3.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + GetLcbValue(cxLookupComboBox4) + '~';
  result := result + GetLcbValue(cxDateEdit7) + '~';

  IF cxTextEdit4.Text <> '' then
    result := result + cxTextEdit4.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + GetLcbValue(cxDateEdit3) + '~';
  IF cxTextEdit2.Text <> '' then
    result := result + cxTextEdit2.Text + '~'
  else
    result := result + 'NULL' + '~';

  Result := Result + BoolToStr(checkbox1.Checked, True) + '~';
  Result := Result + BoolToStr(checkbox2.Checked, True) + '~';
  Result := Result + BoolToStr(checkbox3.Checked, True) + '~';
  Result := Result + BoolToStr(checkbox4.Checked, True) + '~';

end;

procedure TfmLtpinformationAdd.FormShow(Sender: TObject);
begin

   InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxLookupComboBox2.EditValue := FieldByName('begin_ltp_id').Value;
        cxDateEdit2.EditValue := FieldByName('ltp_referral_date').Value;
        cxDateEdit4.EditValue := FieldByName('ltp_begin_date').Value;
        cxTextEdit3.Text := FieldByName('ltp_group').AsString;
        cxLookupComboBox4.EditValue := FieldByName('transfer_ltp_id').Value;
        cxDateEdit7.EditValue := FieldByName('transfer_ltp_date').Value;
        cxTextEdit4.Text := FieldByName('transfer_motive').AsString;
        cxDateEdit3.EditValue := FieldByName('ltp_end_date').Value;
        cxTextEdit2.Text := FieldByName('end_early_motive_id').AsString;
        CheckBox1.Checked := FieldByName('end_early').AsBoolean;
        CheckBox2.Checked := FieldByName('to_rehabilitation').AsBoolean;
        CheckBox3.Checked := FieldByName('message_to_uz').AsBoolean;
        CheckBox4.Checked := FieldByName('monitoring_ovd').AsBoolean;
      end;
   end;

end;

function TfmLtpinformationAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

procedure TfmLtpinformationAdd.InitForm;
begin
     {
  dbDecision := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM v_court_decision AS s  ', []);
  dsDecision.DataSet := dbDecision.DataSet;
       }
  dbOrganization := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM company_directory_organization AS s  '+
   '  where s.type_org = 3', []);
  dsOrganization.DataSet := dbOrganization.DataSet;
end;

end.
