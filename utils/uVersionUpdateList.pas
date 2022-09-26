unit uVersionUpdateList;

interface

uses
  Forms, ufmBaseGrid, cxLookAndFeelPainters, cxStyles, cxCustomData,cxDBData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, Menus,
  Classes, ActnList, dxBar, cxClasses, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGroupBox, cxContainer, cxLabel, Controls, ExtCtrls, cxTextEdit,
  cxCurrencyEdit, cxEditRepositoryItems, StdCtrls, cxButtons,
  cxExtEditRepositoryItems, cxLookAndFeels, cxNavigator, RxPlacemnt,
  System.Actions, Data.DB;

type
  TfmVersionUpdateList = class(TfmBaseGrid)
    qryVersionFiles: TZQuery;
    dsVersionFiles: TDataSource;
    tvVersionFiles: TcxGridDBTableView;
    grBaseDBTableViewIDVERSION: TcxGridDBColumn;
    grBaseDBTableViewNUMBERVER: TcxGridDBColumn;
    grBaseDBTableViewDATEVER: TcxGridDBColumn;
    grBaseDBTableViewNOTE: TcxGridDBColumn;
    grBaseDBTableViewDATEKOR: TcxGridDBColumn;
    grBaseDBTableViewUSERNAME: TcxGridDBColumn;
    tvVersionFilesFILENAME: TcxGridDBColumn;
    tvVersionFilesIDVERSION: TcxGridDBColumn;
    tvVersionFilesNOTE: TcxGridDBColumn;
    tvVersionFilesDATEKOR: TcxGridDBColumn;
    tvVersionFilesUSERNAME: TcxGridDBColumn;
    edIDVersion: TcxCurrencyEdit;
    lbIDVersion: TcxLabel;
    cxEditRepository: TcxEditRepository;
    CurrencyEditIDVERSION: TcxEditRepositoryCurrencyItem;
    actUpdate: TAction;
    btUpdatePn: TcxButton;
    btUpdate: TdxBarButton;
    qryFiles: TZQuery;
    dsFiles: TDataSource;
    qryVersionFilesfilename: TStringField;
    qryVersionFilesidversion: TIntegerField;
    qryVersionFilesnote: TMemoField;
    qryVersionFilesdatekor: TDateTimeField;
    qryVersionFilesusername: TStringField;
    qryVersionFilesurl: TStringField;
    grBaseDBTableViewFILENAME: TcxGridDBColumn;
    grBaseDBTableViewID: TcxGridDBColumn;
    qryBaseid: TIntegerField;
    qryBasefilename: TStringField;
    qryBaseidversion: TIntegerField;
    qryBasenote: TMemoField;
    qryBasedatekor: TDateTimeField;
    qryBaseusername: TStringField;
    qryBaseurl: TStringField;
    qryFile: TZQuery;
    grBaseDBTableViewURL: TcxGridDBColumn;
    qryBasenumberver: TStringField;
    procedure CurrencyEditIDVERSIONPropertiesEditValueChanged(Sender: TObject);
    procedure actGetDataExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure dsFilesDataChange(Sender: TObject; Field: TField);
  private { methods }
  //  function CreateFindSQL: string; override;
    procedure SetSQLParams; override;
    procedure ReadOrWriteIniFile(const pOperation: Char);
    procedure FillFilesTbl;
    procedure TestDataModify; override;
    procedure EditSave; override;
    procedure EditCancel; override;
  private { properties }
     IDVersion: Integer;
     IDVersionMax: Integer;
     dtctrl :  TcxDBDataController;
    { IDVersion }
   // function GetIDVersion: Integer;
    procedure SetIDVersion(const pIDVersion: Integer);
  //  property IDVersion: Integer read GetIDVersion write SetIDVersion;
  public
    class procedure VersionUpdateList(const pShow: Boolean);
  end;

implementation

{$R *.dfm}

uses
  uResource, uResourceForms, SysUtils, IniFiles, uVersionUpdateCard;

{ -------------- }
{ --- Events --- }
{ -------------- }

{ Self }

procedure TfmVersionUpdateList.FormCreate(Sender: TObject);
begin
  inherited;
  ReadOrWriteIniFile('R');
//  actGetData.Execute;
end;

{ CurrencyEditIDVERSION }

procedure TfmVersionUpdateList.CurrencyEditIDVERSIONPropertiesEditValueChanged(Sender: TObject);
var
  cxCustomEdit: TcxCustomEdit;
begin
  inherited;
  cxCustomEdit := TcxCustomEdit(Sender);
  if cxCustomEdit.EditModified then
  begin
    IDVersion := cxCustomEdit.EditValue;
    SetIdVersion(IDVersion);
    actRefresh.Execute;
   // DataModify := TRUE;
  end;
end;

procedure TfmVersionUpdateList.dsFilesDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;

end;

{ --------------- }
{ --- Actions --- }
{ --------------- }

{ actGetData }

procedure TfmVersionUpdateList.actGetDataExecute(Sender: TObject);
begin
 // qryVersionFiles.Close;
 // inherited;
 // DataSetOpen(qryBase);
 SetIdVersion(edIDVersion.EditValue);
end;

{ actRefresh }

procedure TfmVersionUpdateList.actRefreshExecute(Sender: TObject);
begin
  inherited;
  DataSetRefresh(qryBase);
end;

{ actUpdate }

procedure TfmVersionUpdateList.actUpdateExecute(Sender: TObject);
var
  IDVersion: Integer;
begin
  inherited;
  IDVersion := Self.IDVersion;
  if TfmVersionUpdateCard.VersionUpdateCard(IDVersion, dtctrl) then
  begin
    Self.IDVersion := IDVersionMax;
    ReadOrWriteIniFile('W');
    actRefresh.Execute;
  end;
end;

{ --------------- }
{ --- Methods --- }
{ --------------- }

{ Сохраняет изменения }

procedure TfmVersionUpdateList.EditSave;
begin
  {inherited;}
  ReadOrWriteIniFile('W');
end;

{ Отменяет внесенные изменения }

procedure TfmVersionUpdateList.EditCancel;
begin
  {inherited;}
  ReadOrWriteIniFile('R');
  actRefresh.Execute;
end;

{ Устанавливает флаг измененных данных }

procedure TfmVersionUpdateList.TestDataModify;
begin
  {inherited;}
  DataModify := FALSE;
end;

{ Составляет поисковой запрос }

{function TfmVersionUpdateList.CreateFindSQL: string;
begin
  Result := qryBase.SQL.Text;
end;  }

{ Устанавливает параметры запроса }

procedure TfmVersionUpdateList.SetSQLParams;
begin
  inherited;
  { empty }
end;

{ Читает/записывает номер версии из/в ini-файл }

procedure TfmVersionUpdateList.ReadOrWriteIniFile(const pOperation: Char);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(Resource.IniFile.FileName);
  try
    if pOperation = 'W' then
    begin
      IniFile.WriteInteger('COMMON', 'IDVersion', IDVersion);
      IniFile.UpdateFile;
    end
    else if IniFile.ValueExists('COMMON', 'IDVersion') then
    begin
      IDVersion := IniFile.ReadInteger('COMMON', 'IDVersion', 0);
      SetIDVersion(IDVersion);
    end
    else
      IDVersion := 0;
  finally
    edIDVersion.EditValue := IDVersion;

    FreeAndNil(IniFile);
  end;
end;

{ ------------------ }
{ --- Properties --- }
{ ------------------ }

{ IDVersion

function TfmVersionUpdateList.GetIDVersion: Integer;
begin
  Result := qryFiles.ParamByName('PIDVERSION').AsInteger;
end;}

procedure TfmVersionUpdateList.SetIDVersion(const pIDVersion: Integer);
begin
//  if qryFiles.ParamByName('PIDVERSION').AsInteger = pIDVersion then
 //   Exit;
  qryFiles.Close;
  qryFiles.ParamByName('PIDVERSION').AsInteger := IDVersion;
  qryFiles.ParamByName('PJREO').AsInteger := Resource.sessionInfo.Client_id;
  qryFiles.Open;
  FillFilesTbl;
 // qryBase.ParamByName('PIDVERSION').AsInteger := pIDVersion;
 // qryBase.ParamByName('PJREO').AsInteger := Resource.sessionInfo.Client_id;
 //// qryVersionFiles.ParamByName('PIDVERSION').AsInteger := pIDVersion;
 // qryVersionFiles.ParamByName('PJREO').AsInteger := Resource.sessionInfo.Client_id;
 // edIDVersion.EditValue := pIDVersion;
end;

procedure TfmVersionUpdateList.FillFilesTbl;
const sql_file_jreo =
'select v.numberver,v.idversion, vf.filename, vf.id, CAST(vf.note AS TEXT) AS note, vf.datekor, vf.username , vf.url from ver.version v,ver.versionfiles vf' +
 ' where  vf.filename=:PFILENAME and v.idversion>:PIDVERSION and vf.idversion=v.idversion and v.opened=true and vf.jreo=:PJREO';
const sql_file_jreo_null =
'select v.numberver,v.idversion, vf.filename, vf.id, CAST(vf.note AS TEXT) AS note, vf.datekor, vf.username , vf.url from ver.version v,ver.versionfiles vf' +
 ' where  vf.filename=:PFILENAME and v.idversion>:PIDVERSION and vf.idversion=v.idversion and v.opened=true and vf.jreo is null';
 var
 RecordIndex : integer;

begin
  IDVersionMax := IDVersion;
  dtctrl := grBaseDBTableView.DataController;
  qryFiles.First;
  grBaseDBTableView.BeginUpdate;
  dtctrl.RecordCount:=0 ;
  qryBase.Close;
  while not qryFiles.Eof do
  begin
   qryFile.Close;
   qryFile.SQL.Text := sql_file_jreo;
   qryFile.ParamByName('PIDVERSION').AsInteger := IDVersion;
   qryFile.ParamByName('PJREO').AsInteger := Resource.sessionInfo.Client_id;
   qryFile.ParamByName('PFILENAME').AsString := qryFiles.FieldByName('FILENAME').AsString;
   qryFile.Open;
   if qryFile.RecordCount = 0 then
   begin
    qryFile.Close;
    qryFile.SQL.Text := sql_file_jreo_null;
    qryFile.ParamByName('PIDVERSION').AsInteger := IDVersion;
    qryFile.ParamByName('PFILENAME').AsString := qryFiles.FieldByName('FILENAME').AsString;
    qryFile.Open;
   end;
   RecordIndex :=dtctrl.AppendRecord;
   dtctrl.Values[RecordIndex,grBaseDBTableViewIDVERSION.Index] := qryFile.FieldByName('IDVERSION').AsInteger;
   dtctrl.Values[RecordIndex, grBaseDBTableViewFILENAME.Index] := qryFile.FieldByName('FILENAME').AsString;
   dtctrl.Values[RecordIndex,grBaseDBTableViewID.Index] := qryFile.FieldByName('ID').AsInteger;
   dtctrl.Values[RecordIndex,grBaseDBTableViewNOTE.Index] := qryFile.FieldByName('NOTE').AsString;
   dtctrl.Values[RecordIndex,grBaseDBTableViewNUMBERVER.Index] := qryFile.FieldByName('NUMBERVER').AsString;
   dtctrl.Values[RecordIndex,grBaseDBTableViewURL.Index] := qryFile.FieldByName('URL').AsString;
   if  dtctrl.Values[RecordIndex,grBaseDBTableViewIDVERSION.Index]> IDVersionMax then
      IDVersionMax :=  dtctrl.Values[RecordIndex,grBaseDBTableViewIDVERSION.Index];
   qryFiles.Next;
  end;
  grBaseDBTableView.EndUpdate;
 // qryBase.Open;
end;




{ ---------------- }
{ --- External --- }
{ ---------------- }

class procedure TfmVersionUpdateList.VersionUpdateList(const pShow: Boolean);
var
  fmVersionUpdateList: TfmVersionUpdateList;
begin
  fmVersionUpdateList := TfmVersionUpdateList.Create(nil);
  try
    if pShow then
      fmVersionUpdateList.ShowModal
    else if (not fmVersionUpdateList.qryFiles.IsEmpty)
    and Resource.CheckUpdates
    and DialogQuest('Найдены новые версии. Обновить?', 'Обновление') then
      fmVersionUpdateList.actUpdate.Execute;
  finally
    FreeAndNil(fmVersionUpdateList);
  end;
end;

end.
