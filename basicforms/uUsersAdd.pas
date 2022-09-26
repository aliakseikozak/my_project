unit uUsersAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, Data.DB, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, dxLayoutContainer, dxLayoutControlAdapters,
  Vcl.StdCtrls, Vcl.ExtCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl, uExchDB, uExchDBData
  , uKartUtils, uResource, uResourceForms, Vcl.Menus, cxButtons;

type
  TfmUsersAdd = class(TfmBaseForm)
    dxLayoutControl2: TdxLayoutControl;
    cxLookupComboBox2: TcxLookupComboBox;
    cxLookupComboBox3: TcxLookupComboBox;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    Edit1: TEdit;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    Edit2: TEdit;
    dxLayoutItem7: TdxLayoutItem;
    Edit3: TEdit;
    dxLayoutItem8: TdxLayoutItem;
    Edit4: TEdit;
    dxLayoutItem9: TdxLayoutItem;
    Edit5: TEdit;
    dxLayoutItem10: TdxLayoutItem;
    Edit6: TEdit;
    dxLayoutItem11: TdxLayoutItem;
    Edit7: TEdit;
    dxLayoutItem12: TdxLayoutItem;
    cxLookupComboBox1: TcxLookupComboBox;
    CheckBox1: TCheckBox;
    dxLayoutItem13: TdxLayoutItem;
    dxLayoutItem14: TdxLayoutItem;
    cxLookupComboBox4: TcxLookupComboBox;
    dxLayoutItem2: TdxLayoutItem;
    cxLookupComboBox5: TcxLookupComboBox;
    dxLayoutItem3: TdxLayoutItem;
    Edit8: TEdit;
    dxLayoutItem15: TdxLayoutItem;
    Edit9: TEdit;
    dsRole: TDataSource;
    dsspecialistdoctor: TDataSource;
    dsorganization: TDataSource;
    dsdepartment: TDataSource;
    dsPost: TDataSource;
    CheckBox2: TCheckBox;
    dxLayoutItem16: TdxLayoutItem;
    actHidePassword: TAction;
    actShowPassword: TAction;
    dxLayoutItem17: TdxLayoutItem;
    btnPassword: TcxButton;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    function GenParams(): string;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure actHidePasswordExecute(Sender: TObject);
    procedure actShowPasswordExecute(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
  private
    { Private declarations }
    dbIU: TDBData;
    dbRole : TDBData;
    dbdepartment : TDBData;
    dborganization : TDBData;
    dbPost : TDBData;
    dbspecialistdoctor : TDBData;
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    FIsModifyControlPassword: Boolean;
    procedure InitForm;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
  public
    { Public declarations }
    procedure SetData(pDb: TDBData; pMode: integer);
  end;

var
  fmUsersAdd: TfmUsersAdd;

implementation

{$R *.dfm}

procedure TfmUsersAdd.actHidePasswordExecute(Sender: TObject);
begin
  edit3.PasswordChar := '*';
  edit2.PasswordChar := '*';
  btnPassword.Action := actShowPassword;

end;

procedure TfmUsersAdd.actShowPasswordExecute(Sender: TObject);
begin
 edit3.PasswordChar := #0;
 edit2.PasswordChar := #0;
 btnPassword.Action := actHidePassword;

end;

procedure TfmUsersAdd.btnCancelClick(Sender: TObject);
begin
  Close;

end;

procedure TfmUsersAdd.btnOkClick(Sender: TObject);
begin
  if (Edit2.Text = Edit3.Text) or
  ((Edit2.Text <> Edit3.Text) and (FIsModifyControlPassword = false)) then
  begin
    if FMode = 0 then
    begin
      dbIU := DataSetQuery('members_user_set', ['0', VarToStr(FMode),  Resource.sessionInfo.token_id, GenParams()]);
    end
    else
    begin
      if FIsModifyControlPassword = true then
      begin                                    //было изменение пароля
        dbIU := DataSetQuery('members_user_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), '1', Resource.sessionInfo.token_id, GenParams()]);
      end
      else
      begin
        dbIU := DataSetQuery('members_user_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), '0', Resource.sessionInfo.token_id, GenParams()]);
      end;
    end;
  end
  else
  begin
    DialogStop('Подтверждение пароля не соответствует паролю! Повторите ввод!');
    exit;
  end;
  Close;

end;

procedure TfmUsersAdd.Edit3Change(Sender: TObject);
begin
  edit2.Enabled := edit3.Text <> '';
end;

procedure TfmUsersAdd.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  FIsModifyControlPassword := True;
  Edit2.Enabled := true;


end;

function TfmUsersAdd.GenParams(): string;
begin
  result := '';
  IF Edit1.Text <> '' then
    result := result + Edit1.Text + '~'
  else
    result := result + 'NULL' + '~';
  IF Edit8.Text <> '' then
    result := result + Edit8.Text + '~'
  else
    result := result + 'NULL' + '~';
  Result := Result + BoolToStr(CheckBox2.Checked, True) + '~';
  IF Edit6.Text <> '' then
    result := result + Edit6.Text + '~'
  else
    result := result + 'NULL' + '~';
  IF Edit7.Text <> '' then
    result := result + Edit7.Text + '~'
  else
    result := result + 'NULL' + '~';
  IF Edit5.Text <> '' then
    result := result + Edit5.Text + '~'
  else
    result := result + 'NULL' + '~';
  IF Edit4.Text <> '' then
    result := result + Edit4.Text + '~'
  else
    result := result + 'NULL' + '~';
  Result := Result + BoolToStr(CheckBox1.Checked, True) + '~';
  IF Edit9.Text <> '' then
    result := result + Edit9.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + GetLcbValue(cxLookupComboBox1) + '~';
  result := result + GetLcbValue(cxLookupComboBox2) + '~';
  result := result + GetLcbValue(cxLookupComboBox3) + '~';
  result := result + GetLcbValue(cxLookupComboBox5) + '~';
  result := result + GetLcbValue(cxLookupComboBox4) + '~';
  result := result + GenerateSHA1(Edit1.Text +' '+ Edit3.Text) + '~';
  result := result + GenerateSHA1(Edit3.Text);


end;

function TfmUsersAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

procedure TfmUsersAdd.FormCreate(Sender: TObject);
begin
  btnPassword.Action := actShowPassword;

end;

procedure TfmUsersAdd.FormShow(Sender: TObject);
begin
 InitForm;
  FIsModifyControlPassword := False;
 if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin

        Edit1.Text := FieldByName('members_username').AsString;;
        Edit4.Text := FieldByName('code').AsString;
        Edit7.Text := FieldByName('family_name').AsString;
        Edit6.Text := FieldByName('name').AsString;
        Edit5.Text := FieldByName('patronymic').AsString;
        Edit8.Text := FieldByName('email').AsString;
        Edit9.Text := FieldByName('telephone_number').AsString;
        cxLookupComboBox1.EditValue := FieldByName('department_id').Value;
        cxLookupComboBox2.EditValue := FieldByName('name_org_id').Value;
        cxLookupComboBox3.EditValue := FieldByName('post_id').Value;
        cxLookupComboBox4.EditValue := FieldByName('specialization_id').Value;
        cxLookupComboBox5.EditValue := FieldByName('role_id').Value;
        CheckBox1.Checked := FieldByName('is_doctor').AsBoolean;
        CheckBox2.Checked := FieldByName('is_active').AsBoolean;
        Edit3.Text := FieldByName('password').AsString;
      {  cxDateEdit2.EditValue := FieldByName('end_work_date').Value;
        cxLookupComboBox2.EditValue := FieldByName('place_work_id').Value;
        cxLookupComboBox3.EditValue := FieldByName('post_work_id').Value;
                                                                            }
        Edit2.Enabled := false;
      end;
   end;
end;

procedure TfmUsersAdd.InitForm;
begin
  dbRole := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM role AS s  ' , []);
  dsRole.DataSet := dbrole.DataSet;

  dbdepartment := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM company_directory_department AS s  ' , []);
  dsdepartment.DataSet := dbdepartment.DataSet;

  dborganization := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM company_directory_organization AS s  ' , []);
  dsorganization.DataSet := dborganization.DataSet;

  dbPost := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_post AS s  ' , []);
  dsPost.DataSet := dbPost.DataSet;

  dbspecialistdoctor := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_specialistdoctor AS s  ' , []);
  dsspecialistdoctor.DataSet := dbspecialistdoctor.DataSet;
end;

procedure TfmUsersAdd.SetData(pDb: TDBData; pMode: integer);
begin
  FDB := pDb;
  FMode := pMode;
end;

end.
