unit uLTPCureAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, Vcl.StdCtrls, Vcl.ExtCtrls,
  dxLayoutContainer, cxDropDownEdit, cxCalendar, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, dxLayoutControl,
  System.Actions, Vcl.ActnList, dxBar, cxClasses, Data.DB, uResource,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, uExchDB, uExchDBData;

type
  TfmLTPCureAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxTextEdit3: TcxTextEdit;
    cxLookupComboBox2: TcxLookupComboBox;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    GroupBox1: TGroupBox;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutControl2Group_Root: TdxLayoutGroup;
    dxLayoutControl2: TdxLayoutControl;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxLayoutItem7: TdxLayoutItem;
    Button1: TButton;
    dxLayoutItem8: TdxLayoutItem;
    Button2: TButton;
    dxLayoutItem9: TdxLayoutItem;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    CheckBox1: TCheckBox;
    dxLayoutItem10: TdxLayoutItem;
    dskmcr: TDataSource;
    dsMedical: TDataSource;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    Button3: TButton;
    function GenParams(): string;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    FEdit: Boolean;
    dbIU: TDBData;
    dbkmcr: TDBData;
    dbMedical: TDBData;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
    procedure InitForm;
  public
    { Public declarations }
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
  end;

var
  fmLTPCureAdd: TfmLTPCureAdd;

implementation
uses
  uLTPMedicalAdd, uKartUtils;

{$R *.dfm}


function TfmLTPCureAdd.GenParams(): string;
begin
  result := '';

  result := result + GetLcbValue(cxDateEdit1) + '~';
  result := result + GetLcbValue(cxDateEdit2) + '~';
  Result := Result + BoolToStr(CheckBox1.Checked, True) + '~';

  IF cxTextEdit3.Text <> '' then
    result := result + cxTextEdit3.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + GetLcbValue(cxLookupComboBox2) + '~';

  result := result + '1' + '~';


  //result := result + cxbedtNameShort.Text + '~';



end;

function TfmLTPCureAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmLTPCureAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
end;

procedure TfmLTPCureAdd.btnCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TfmLTPCureAdd.btnOkClick(Sender: TObject);
begin
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('ltpcure_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('ltpcure_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

procedure TfmLTPCureAdd.Button1Click(Sender: TObject);
var
  fm: TfmLTPMedicalAdd;
begin
  fm := TfmLTPMedicalAdd(CreateForm('TfmLTPMedicalAdd', 'fmLTPMedicalAdd', Self, false));
  try

    fm.SetData(dbMedical, 1, FDB.DataSet.FieldByName('id').value);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    dbMedical := DataSetQuery('ltpmedical_get', [Resource.sessionInfo.token_id, '1', 'bmf.ltpcure_id', VarToStr(gCureId), '='], GetFieldsArray(), true);
    dsMedical.DataSet := dbMedical.DataSet;
    fm.Free;
  end;
end;

procedure TfmLTPCureAdd.Button2Click(Sender: TObject);
var
  fm: TfmLTPMedicalAdd;
begin
  fm := TfmLTPMedicalAdd(CreateForm('TfmLTPMedicalAdd', 'fmLTPMedicalAdd', Self, false));
  try

    fm.SetData(dbBase, 0, FDB.DataSet.FieldByName('id').value);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    dbMedical := DataSetQuery('ltpmedical_get', [Resource.sessionInfo.token_id, '1', 'bmf.ltpcure_id', VarToStr(gCureId), '='], GetFieldsArray(), true);
    dsMedical.DataSet := dbMedical.DataSet;
    fm.Free;
  end;
end;

procedure TfmLTPCureAdd.Button3Click(Sender: TObject);
begin
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('ltpcure_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
    gCureId := dbIU.DataSet.FieldByName('r_id').Value;
    FMode := 1;
  end
  else
  begin
    dbIU := DataSetQuery('ltpcure_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
    gCureId := FID;
  end;
  btnOk.Enabled := True;
  Button3.Enabled := False;
  Button1.Enabled := True;
  Button2.Enabled := True;
end;

procedure TfmLTPCureAdd.FormShow(Sender: TObject);
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxDateEdit1.EditValue := FieldByName('cure_start_date').Value;
        cxDateEdit2.EditValue := FieldByName('cure_end_date').Value;
        cxLookupComboBox2.EditValue := FieldByName('kmcr_attribute_id').Value;
        cxTextEdit3.EditValue := FieldByName('cure_result').Value;
        CheckBox1.Checked := FieldByName('pkp_attribute').AsBoolean;
      end;

      gCureId := FID;

      dbMedical := DataSetQuery('ltpmedical_get', [Resource.sessionInfo.token_id, '1', 'bmf.ltpcure_id', VarToStr(gCureId), '='], GetFieldsArray(), true);
      dsMedical.DataSet := dbMedical.DataSet;

      Button3.Enabled := False;
      btnOk.Enabled := True;
   end
   else
   begin
     Button1.Enabled := False;
     Button2.Enabled := False;
   end;
   EnabledEdData(Self, FEdit);
end;

procedure TfmLTPCureAdd.InitForm;
begin

  dbkmcr := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM attribute_kmcr AS s  ' , []);
  dskmcr.DataSet := dbkmcr.DataSet;

end;

function TfmLTPCureAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

procedure TfmLTPCureAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;

end.
