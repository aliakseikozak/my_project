unit uCommissionDecisionAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.Actions, Vcl.ActnList,
  dxBar, cxClasses, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxLayoutcxEditAdapters, dxLayoutContainer, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit, cxCalendar,
  dxLayoutControl, Vcl.StdCtrls, Vcl.ExtCtrls, uExchDB, uExchDBData, uResource,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfmCommissionDecisionAdd = class(TfmBaseForm)
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxTextEdit1: TcxTextEdit;
    cxLookupComboBox1: TcxLookupComboBox;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dsResolution: TDataSource;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    function GenParams(): string;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    dbResolution: TDBData;
    dbIU: TDBData;
    dbfile: TDBData;
    Fedit: Boolean;
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    procedure InitForm;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
  public
    { Public declarations }
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
  end;

var
  fmCommissionDecisionAdd: TfmCommissionDecisionAdd;

implementation
uses
  uKartUtils;

{$R *.dfm}

procedure TfmCommissionDecisionAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;

function TfmCommissionDecisionAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmCommissionDecisionAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := DateToStr(pLcb.EditValue{, Resource.JsonFormatSettings});
end;

procedure TfmCommissionDecisionAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCommissionDecisionAdd.btnOkClick(Sender: TObject);
begin
   dbIU := DataSetQuery('commissiondecision_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
   close;
end;

procedure TfmCommissionDecisionAdd.FormShow(Sender: TObject);
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxDateEdit1.EditValue := FieldByName('doc_to_commission_date').Value;
        cxDateEdit2.EditValue := FieldByName('commission_meeting_date').Value;
        cxTextEdit1.EditValue := FieldByName('commission_info').AsString;
        cxLookupComboBox1.EditValue := FieldByName('commission_resolution').Value;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;


function TfmCommissionDecisionAdd.GenParams(): string;
begin
  result := '';

  result := result + GetLcbValue(cxDateEdit1) + '~';

  IF cxTextEdit1.Text <> '' then
    result := result + cxTextEdit1.Text + '~'
  else
    result := result + 'NULL' + '~';

  result := result + GetLcbValue(cxDateEdit2) + '~';
  //result := result + cxbedtNameShort.Text + '~';

  result := result + GetLcbValue(cxLookupComboBox1) + '~';

   //���������� � ����������� ����
  result := result + '1' + '~';


end;

procedure TfmCommissionDecisionAdd.InitForm;
begin

  dbResolution := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM v_commission_resolution AS s  ', []);
  dsResolution.DataSet := dbResolution.DataSet;

end;

function TfmCommissionDecisionAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;

end.
