unit uLtpWorkAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, dxLayoutContainer, Vcl.StdCtrls,
  Vcl.ExtCtrls, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar, dxLayoutControl,
  System.Actions, Vcl.ActnList, dxBar, cxClasses, Data.DB, uExchDB, uExchDBData, uResource;

type
  TfmLtpWorkAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit1: TcxDateEdit;
    cxTextEdit3: TcxTextEdit;
    cxLookupComboBox1: TcxLookupComboBox;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dxLayoutItem1: TdxLayoutItem;
    cxDateEdit2: TcxDateEdit;
    dxLayoutAutoCreatedGroup1: TdxLayoutAutoCreatedGroup;
    dxLayoutItem4: TdxLayoutItem;
    cxTextEdit1: TcxTextEdit;
    dsPost: TDataSource;
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
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
    procedure InitForm;
    { Private declarations }
  public
    { Public declarations }
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pEdit: Boolean);
  end;

var
  fmLtpWorkAdd: TfmLtpWorkAdd;

implementation
uses
uKartUtils;

{$R *.dfm}

procedure TfmLtpWorkAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

function TfmLtpWorkAdd.GenParams(): string;
begin
  result := '';
  IF cxTextEdit3.Text <> '' then
    result := result + cxTextEdit3.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  result := result + GetLcbValue(cxDateEdit2) + '~';
  IF cxTextEdit1.Text <> '' then
    result := result + cxTextEdit1.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + '1' + '~';

  result := result + GetLcbValue(cxLookupComboBox1) + '~';
  //result := result + cxbedtNameShort.Text + '~';



end;

procedure TfmLtpWorkAdd.btnOkClick(Sender: TObject);
begin
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('ltpwork_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('ltpwork_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;

end;

procedure TfmLtpWorkAdd.FormShow(Sender: TObject);
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxTextEdit3.EditValue := FieldByName('work_place').Value;
        cxDateEdit1.EditValue := FieldByName('work_LTP_begin_date').Value;
        cxDateEdit2.EditValue := FieldByName('work_LTP_end_date').Value;
        cxTextEdit1.EditValue := FieldByName('work_LTP_result').Value;
        cxLookupComboBox1.EditValue := FieldByName('work_LTP_post_id').Value;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

function TfmLtpWorkAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmLtpWorkAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmLtpWorkAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

procedure TfmLtpWorkAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;

procedure TfmLtpWorkAdd.InitForm;
begin

  dbPost := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_post AS s  ' , []);
  dsPost.DataSet := dbPost.DataSet;

end;

end.
