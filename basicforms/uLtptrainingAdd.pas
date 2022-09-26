unit uLtptrainingAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutcxEditAdapters, Vcl.StdCtrls, Vcl.ExtCtrls, dxLayoutContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxLayoutControl, System.Actions, Vcl.ActnList, dxBar,
  cxClasses, Data.DB, uExchDB, uExchDBData, uResource;

type
  TfmLtptrainingAdd = class(TfmBaseForm)
    dxLayoutControl1: TdxLayoutControl;
    cxLookupComboBox2: TcxLookupComboBox;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem3: TdxLayoutItem;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dxLayoutItem1: TdxLayoutItem;
    cxLookupComboBox1: TcxLookupComboBox;
    dsProfession: TDataSource;
    dsOrganization: TDataSource;
    function GenParams(): string;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    Fedit: Boolean;
    dbIU: TDBData;
    dbPost: TDBData;
    dbViolations: TDBData;
    dbPenaltytype: TDBData;
    dbOrganization: TDBData;
    dbProfession: TDBData;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
    procedure InitForm;
  public
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
  end;

var
  fmLtptrainingAdd: TfmLtptrainingAdd;

implementation
uses
  uKartUtils;

{$R *.dfm}


function TfmLtptrainingAdd.GenParams(): string;
begin
  result := '';
  result := result + GetLcbValue(cxLookupComboBox2) + '~';
  result := result + GetLcbValue(cxLookupComboBox1) + '~';


  result := result + '1' + '~';

  //result := result + cxbedtNameShort.Text + '~';

end;

function TfmLtptrainingAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmLtptrainingAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

procedure TfmLtptrainingAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;

procedure TfmLtptrainingAdd.InitForm;
begin

  dbOrganization := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM company_directory_organization AS s  ', []);
  dsOrganization.DataSet := dbOrganization.DataSet;

  dbProfession := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_profession AS s  ', []);
  dsProfession.DataSet := dbProfession.DataSet;
end;

procedure TfmLtptrainingAdd.btnCancelClick(Sender: TObject);
begin
  close;

end;

procedure TfmLtptrainingAdd.btnOkClick(Sender: TObject);
begin
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('ltptraining_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('ltptraining_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

procedure TfmLtptrainingAdd.FormShow(Sender: TObject);
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxLookupComboBox1.EditValue := FieldByName('stady_palace_id').Value;
        cxLookupComboBox2.EditValue := FieldByName('specialization_id').Value;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

end.
