unit uLTPRewardAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, Vcl.StdCtrls, Vcl.ExtCtrls,
  dxLayoutContainer, cxTextEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxCalendar, dxLayoutControl, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, Data.DB, uExchDB, uExchDBData, uKartUtils, uResource;

type
  TfmLTPRewardAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit1: TcxDateEdit;
    cxLookupComboBox2: TcxLookupComboBox;
    cxTextEdit3: TcxTextEdit;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem6: TdxLayoutItem;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dsrewardtype: TDataSource;
    function GenParams(): string;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    dbIU: TDBData;
    Fedit: Boolean;
    dbPost: TDBData;
    dbViolations: TDBData;
    dbPenaltytype: TDBData;
    dbrewardtype: TDBData;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
    procedure InitForm;
  public
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
  end;

var
  fmLTPRewardAdd: TfmLTPRewardAdd;

implementation

{$R *.dfm}

procedure TfmLTPRewardAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLTPRewardAdd.btnOkClick(Sender: TObject);
begin
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('ltpreward_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('ltpreward_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

function TfmLTPRewardAdd.GenParams(): string;
begin
  result := '';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  IF cxTextEdit3.Text <> '' then
    result := result + cxTextEdit3.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + GetLcbValue(cxLookupComboBox2) + '~';

  result := result + '1' + '~';

  //result := result + cxbedtNameShort.Text + '~';

end;

procedure TfmLTPRewardAdd.FormShow(Sender: TObject);
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxDateEdit1.EditValue := FieldByName('reward_date').Value;
        cxLookupComboBox2.EditValue := FieldByName('reward_type_id').Value;
        cxTextEdit3.EditValue := FieldByName('reward_motive').Value;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

function TfmLTPRewardAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmLTPRewardAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmLTPRewardAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

procedure TfmLTPRewardAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;

procedure TfmLTPRewardAdd.InitForm;
begin

  dbrewardtype := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_rewardtype AS s  ' , []);
  dsrewardtype.DataSet := dbrewardtype.DataSet;

end;

end.
