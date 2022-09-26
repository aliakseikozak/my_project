unit uCriminalAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, dxLayoutcxEditAdapters, dxLayoutContainer,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit,
  cxMaskEdit, cxCalendar, dxLayoutControl, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, dxBar, cxClasses, Data.DB, uResource, uExchDB,
  uExchDBData, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfmCriminalAdd = class(TfmBaseForm)
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
    dsDirectoryArticle: TDataSource;
    procedure btnOkClick(Sender: TObject);
    function GenParams(): string;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FMode: integer;
    FID: Variant;
    FDB: TDBData;
    FEdit: Boolean;
    dbDirectoryArticle: TDBData;
    dbIU: TDBData;
    procedure InitForm;
    function GetLcbValue(pLcb: TcxLookupComboBox): string; overload;
    function GetLcbValue(pLcb: TcxDateEdit): string; overload;
    function GetLcbValue(pLcb: TcxComboBox): string; overload;
  public
    { Public declarations }
    procedure SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
  end;

var
  fmCriminalAdd: TfmCriminalAdd;

implementation
uses
  uKartUtils, uOVDAdd;

{$R *.dfm}

procedure TfmCriminalAdd.SetData(pDb: TDBData; pMode: integer; pID: Variant; pedit: Boolean);
begin
  FDB := pDb;
  FID := pID;
  FMode := pMode;
  FEdit := pedit;
end;


function TfmCriminalAdd.GetLcbValue(pLcb: TcxLookupComboBox): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := VarToStr(pLcb.EditValue);
end;

function TfmCriminalAdd.GetLcbValue(pLcb: TcxDateEdit): string;
begin
  if VarIsNull(pLcb.EditValue) then
    result := 'NULL'
  else
    result := FormatDateTime('mm-dd-yyyy',pLcb.EditValue{, Resource.JsonFormatSettings});
end;

function TfmCriminalAdd.GetLcbValue(pLcb: TcxComboBox): string;
begin
  case (pLcb.ItemIndex) of
    0:
      result := 'true';
    1:
      result := 'false';
  end;
end;


function TfmCriminalAdd.GenParams(): string;
begin
  result := '';
  result := result + GetLcbValue(cxDateEdit1) + '~';
  IF cxTextEdit3.Text <> '' then
    result := result + cxTextEdit3.Text + '~'
  else
    result := result + 'NULL' + '~';
  result := result + GetLcbValue(cxLookupComboBox1) + '~';
  //result := result + cxbedtNameShort.Text + '~';

  result := result + VarToStr(FID) + '~';

end;

procedure TfmCriminalAdd.InitForm;
begin
  dbDirectoryArticle := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' SELECT s.id, s.name  '+
   '   FROM directory_article AS s where s.type_article = 1 ' , []);
  dsDirectoryArticle.DataSet := dbDirectoryArticle.DataSet;

end;

procedure TfmCriminalAdd.btnCancelClick(Sender: TObject);
begin
  Close;

end;

procedure TfmCriminalAdd.btnOkClick(Sender: TObject);
begin

  if FMode = 0 then
  begin
    dbIU := DataSetQuery('criminal_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('criminal_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

procedure TfmCriminalAdd.FormShow(Sender: TObject);
begin
  InitForm;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        cxDateEdit1.EditValue := FieldByName('date_criminal').Value;
        cxTextEdit3.EditValue := FieldByName('reg_num').Value;
        cxLookupComboBox1.EditValue := FieldByName('article_id').Value;
      end;
   end;
   EnabledEdData(Self, FEdit);
end;

end.
