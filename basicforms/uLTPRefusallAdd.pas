unit uLTPRefusallAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, Vcl.StdCtrls, Vcl.ExtCtrls,
  dxLayoutContainer, cxDropDownEdit, cxCalendar, cxTextEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxLayoutControl,
  System.Actions, Vcl.ActnList, dxBar, cxClasses, Data.DB, uKartUtils, uExchDB, uExchDBData,
  uResource;

type
  TfmLTPRefusallAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxLookupComboBox2: TcxLookupComboBox;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
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
  fmLTPRefusallAdd: TfmLTPRefusallAdd;

implementation

{$R *.dfm}

procedure TfmLTPRefusallAdd.btnCancelClick(Sender: TObject);
begin
  Close;

end;

function TfmLTPRefusallAdd.GenParams(): string;
begin

  result := '';

  result := result + GetLcbValue(cxDateEdit1) + '~';
  result := result + GetLcbValue(cxDateEdit2) + '~';
  result := result + GetLcbValue(cxLookupComboBox2) + '~';

  result := result + '1' + '~';


end;

procedure TfmLTPRefusallAdd.btnOkClick(Sender: TObject);
begin
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('ltprefusal_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('ltprefusal_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

procedure TfmLTPRefusallAdd.FormShow(Sender: TObject);
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxLookupComboBox2.EditValue := FieldByName('refusal_reason_id').Value;
        cxDateEdit1.EditValue := FieldByName('refusal_date').Value;
        cxDateEdit2.EditValue := FieldByName('court_notification_date').Value;

        //cxLookupComboBox1.EditValue := FieldByName('work_LTP_post_id').Value;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

function TfmLTPRefusallAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmLTPRefusallAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmLTPRefusallAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

procedure TfmLTPRefusallAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;

procedure TfmLTPRefusallAdd.InitForm;
begin

  dbViolations := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_noltpreason AS s  ' , []);
  dsViolations.DataSet := dbViolations.DataSet;

end;

end.
