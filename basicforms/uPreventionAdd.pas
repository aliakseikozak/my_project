unit uPreventionAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, Data.DB, uResource, uExchDB,
  uExchDBData, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxLayoutcxEditAdapters, dxLayoutContainer, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  dxLayoutControl, Vcl.StdCtrls, Vcl.ExtCtrls, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TfmPreventionAdd = class(TfmBaseForm)
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit1: TcxDateEdit;
    cxTextEdit3: TcxTextEdit;
    cxLookupComboBox1: TcxLookupComboBox;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    cxLookupComboBox2: TcxLookupComboBox;
    dsFamily: TDataSource;
    dsConversation: TDataSource;
    function GenParams(): string;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    dbIU: TDBData;
    Fedit: Boolean;
    dbFamily: TDBData;
    dbConversation: TDBData;
    procedure InitForm;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
  public
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit : boolean);
    { Public declarations }
  end;

var
  fmPreventionAdd: TfmPreventionAdd;

implementation
uses
  uKartUtils, uOVDAdd;

{$R *.dfm}

procedure TfmPreventionAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPreventionAdd.btnOkClick(Sender: TObject);
begin
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('prevention_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('prevention_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

procedure TfmPreventionAdd.FormShow(Sender: TObject);
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxDateEdit1.EditValue := FieldByName('conversation_date').Value;
        cxTextEdit3.EditValue := FieldByName('conversation_result').Value;
        cxLookupComboBox2.EditValue := FieldByName('with_who_conversation_id').Value;
        cxLookupComboBox1.EditValue := FieldByName('family_id').Value;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

procedure TfmPreventionAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit : boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  fEdit := pedit;
end;


function TfmPreventionAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmPreventionAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmPreventionAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

function TfmPreventionAdd.GenParams(): string;
begin
  result := '';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  IF cxTextEdit3.Text <> '' then
    result := result + cxTextEdit3.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + GetLcbValue(cxLookupComboBox1) + '~';
  result := result + GetLcbValue(cxLookupComboBox2) + '~';
  //result := result + cxbedtNameShort.Text + '~';

  result := result + VarToStr(FID) + '~';

end;

procedure TfmPreventionAdd.InitForm;
begin
  dbConversation := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM v_conversation AS s  ' , []);
  dsConversation.DataSet := dbConversation.DataSet;

  dbFamily := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name   '+
   '   FROM mvd_personal_inf_grfamily AS s  '+
   '  where s.grinformation_id = '+ VarToStr(FID), []);
  dsFamily.DataSet := dbFamily.DataSet;
 // ShowMessage(dsFamily.DataSet.RecordCount.ToString);

end;

end.
