unit uLTPPreventiveAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, Vcl.StdCtrls, Vcl.ExtCtrls,
  dxLayoutContainer, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar, dxLayoutControl,
  System.Actions, Vcl.ActnList, dxBar, cxClasses, Data.DB, uResource, uKartUtils,
  uExchDB, uExchDBData;

type
  TfmLTPPreventiveAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit1: TcxDateEdit;
    cxTextEdit3: TcxTextEdit;
    cxLookupComboBox2: TcxLookupComboBox;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dxLayoutItem1: TdxLayoutItem;
    cxTextEdit1: TcxTextEdit;
    dxLayoutItem4: TdxLayoutItem;
    cxDateEdit2: TcxDateEdit;
    dsViolations: TDataSource;
    function GenParams(): string;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    Fedit: Boolean;
    dbIU: TDBData;
    dbPost: TDBData;
    dbViolations: TDBData;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
    procedure InitForm;
  public
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
  end;

var
  fmLTPPreventiveAdd: TfmLTPPreventiveAdd;

implementation

{$R *.dfm}

procedure TfmLTPPreventiveAdd.btnCancelClick(Sender: TObject);
begin
  Close;

end;

function TfmLTPPreventiveAdd.GenParams(): string;
begin

  result := '';
  IF cxTextEdit3.Text <> '' then
    result := result + cxTextEdit3.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + GetLcbValue(cxDateEdit1) + '~';

  IF cxTextEdit1.Text <> '' then
    result := result + cxTextEdit1.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + GetLcbValue(cxDateEdit2) + '~';
  result := result + GetLcbValue(cxLookupComboBox2) + '~';

  result := result + '1' + '~';


end;

procedure TfmLTPPreventiveAdd.btnOkClick(Sender: TObject);
begin
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('ltppreventive_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('ltppreventive_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

procedure TfmLTPPreventiveAdd.FormShow(Sender: TObject);
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxLookupComboBox2.EditValue := FieldByName('category_preventive_id').Value;
        cxTextEdit3.EditValue := FieldByName('protocol_begin_number').Value;
        cxDateEdit1.EditValue := FieldByName('protocol_begin_date').Value;
        cxTextEdit1.EditValue := FieldByName('protocol_end_number').Value;
        cxDateEdit2.EditValue := FieldByName('protocol_end_date').Value;

        //cxLookupComboBox1.EditValue := FieldByName('work_LTP_post_id').Value;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

function TfmLTPPreventiveAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmLTPPreventiveAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmLTPPreventiveAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

procedure TfmLTPPreventiveAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;

procedure TfmLTPPreventiveAdd.InitForm;
begin

  dbViolations := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM category_preventive AS s  ' , []);
  dsViolations.DataSet := dbViolations.DataSet;

end;

end.
