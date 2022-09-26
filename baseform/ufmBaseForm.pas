unit ufmBaseForm;

interface

uses
  Forms, ufmBase, Classes, ActnList, dxBar, cxClasses, DB,
  cxEdit, System.Actions, Winapi.Messages,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Variants,
  uBaseResource, uExchDB, uExchDBData, cxPC,
  Datasnap.DBClient,
  uArrays, uArrayV,
  cxDBPivotGrid, cxGridTableView, cxDBEdit,
  cxGrid, cxFilter, cxVariants,

  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxCustomData,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

const
  WM_AFTER_SHOW = 300; // ���������� ��� �������� �������� ����� ������������
  // type
  // TPermits = record
  // pView: boolean;
  // pNew: boolean;
  // pEdit: boolean;
  // pDel: boolean;
  // pPrint: boolean;
  // end;

type
  // ��������� ������� ����� �� XML
  TGridField = record
    orderid: word;
    name: string;
    fieldType: TFieldType;
    sort: string;
    title: string;
    size: word;
    width: word; // ������� ������ ������� � ����
    readonly: boolean;
    visible: boolean;
    genParam: boolean;
    group: boolean;
    propertyedit: string;
    listsource: string;
    listkey: string;
    listfield: string;
    FooterKind: TcxSummaryKind;
    FooterFormat: string;
  end;

  TGridFields = array of TGridField;
  TGridFieldsExt = array of TGridFields;

  // ��������� �������� ��������� ���������� ����� � ������������ �� ���� ���������
  TControlForm = record
    docType: Variant;
    // ��� ���������. � ������ ��� ���������� ������ �������� �������� �.�. NULL
    name: string; // ������������ �������� ����������
    Caption: string; // ��������� �������� ����������
    visible: boolean; // ��������� �������� ����������
    readonly: boolean; // ������� ���������� ������ ��� ������
    Enabled: boolean; // ������� ���������� ����������
  end;

  TControlForms = array of TControlForm;

  // ��������� �������� ����� �� XML
  TFormInfo = record
    id: integer;
    category: string;
    name: string;
    tablename: string;
    keyfield: string;
    listfield: string;
    namesys: string;
    multiselect: boolean;
  end;

  TfmBaseForm = class(TfmBase)
    BarManager: TdxBarManager;
    BarManagerMainMenu: TdxBar;
    BarManagerMainBar: TdxBar;
    ActionList: TActionList;
    actExit: TAction;
    btExit: TdxBarButton;
    mnFile: TdxBarSubItem;
    dsBase: TDataSource;
    actGridViewRestore: TAction;
    btGridViewCustomize: TdxBarButton;
    btGridViewRestore: TdxBarButton;
    siWindow: TdxBarSubItem;
    mnPlugins: TdxBarSubItem;
    actNewWindow: TAction;
    btNewWindow: TdxBarButton;
    aGroupPanel: TAction;
    nAutoAlign: TAction;
    aFill: TAction;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actExitExecute(Sender: TObject);
    procedure qryBaseAfterApplyUpdates(Sender: TObject);
    { ���������� ��� ��������� ���� ������� }
    procedure GridViewCustomization(Sender: TObject);
    procedure actGridViewCustomizeExecute(Sender: TObject);
    procedure actGridViewCustomizeUpdate(Sender: TObject);
    procedure actGridViewRestoreExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure dxBarButton4Click(Sender: TObject);
    procedure aGroupPanelExecute(Sender: TObject);
    procedure nAutoAlignExecute(Sender: TObject);
    procedure aFillExecute(Sender: TObject);
  private
    FDataReadOnly: boolean;
    FDataModify: boolean;
    FTableBasePrivil: string;
    FMultiform: integer;
    FFormNumber: integer;
    FXMLData: TXMLDocument;
    // ���������� ��� Actions
    FPermitsStr: string;
    FpListField: string;
    FComponentsImeName: string;

    procedure SetPermitsStr(const Value: string);

    // ��������� ������������ ����� FormShow - ���������� ��� �������� �����
    procedure WmAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    // ��������� �������� �������� ����
    function GetXMLNodeAttr(pNode: IXmlNode; pName: string): String;
    // ��������� ������ ����� � dataset �� XML
    procedure GenerateFieldsInDataset(pDBData: TDBData); overload;
    procedure GenerateFieldsInDataset(pDBData: TDBData;
      pGF: TGridFields); overload;
    function GetReturnCount: integer;
    function GetReturnIsExisit: boolean;
    function GetReturnId: integer;
    function GetReturnName: string;
    function GetReturnValue(index: Variant): IMltArray;
    function GetGridFieldsExtCount: integer;
    function GetGridFieldsExtIndex(index: integer): TGridFields;
    // ������� ImeName �����������
    procedure CleanerImeNameForComponent(Sender: TObject);
    // ��������� ImeName �����������
    procedure AddImeNameForComponent(Sender: TObject);
  protected
    FGridFields: TGridFields;
    FGridFieldsExt: TGridFieldsExt; // ������ �������������� ������ �� XML
    FControlForms: TControlForms;
    FFormInfo: TFormInfo;
    IsMod: integer; // ��� �������� 0 - Edit, 1 - Insert

    // ������ ������������ �������� ��������� ����� ������
    FRetValue: IMltArray;

    // ���������� ������������� �������� � �����
    procedure ReturnAddValue(); virtual;
    // ��������� �������� ������������� �������� ��� ����� ���������
    function GetReturnArray(): IMltArray; virtual;

    procedure SetTableBasePrivil(const pTableBasePrivil: string); virtual;
    procedure SetDataReadOnly(const pDataReadOnly: boolean); virtual;
    procedure SetDataModify(const pDataModify: boolean); virtual;
    procedure SetFormNumber(const pNumber: integer); virtual;
    procedure SetMultiform;
    function DataSetQuery(pSessionInfo: TSessionInfo; pType_mes: String;
      pType_Query: String; pName_Func: String; Params: array of String;
      pFieldsArr: IIntArray = nil; pDefFields: boolean = False; add_lod: boolean=true): TDBData;
      overload; virtual;
    function DataSetQuery(pName_Func: String; Params: array of String;
      pFieldsArr: IIntArray = nil; pDefFields: boolean = False): TDBData;
      overload; virtual;
    function DataSetQuery(pName_Func: String; Params: array of String;
      pFormName: string): TDBData; overload; virtual;
    function DataSetQueryExt(pName_Func: String; Params: array of String;
      pIndexExt: integer): TDBData; overload; virtual;
    procedure DataSetRefresh(); virtual;
    procedure DataSetInsert(); virtual;
    procedure DataSetUpdate(); virtual;
    procedure DataSetDelete(); virtual;
    function DataSetProcessError(pDBData: TDBData): boolean; virtual;
    function DataSetProcessResult(pDBData: TDBData): boolean; virtual;
    procedure DataSetPost();
    procedure DataSetCancel();
    procedure DataSetActivate();
    function ActNewEnable(Sender: TAction): boolean; virtual;
    function ActEditEnable(Sender: TAction): boolean; virtual;
    function ActDelEnable(Sender: TAction): boolean; virtual;
    function GetTableBasePrivil(const pPrivil: string): boolean;
    // ���������� ����������� �������� ����(�)
    function CanCloseForm(): boolean; virtual;

    // ���������� ������ ��������� ��������� ������ ��������� �����
    procedure ShowHistorylog(pFormInfo: TFormInfo; pIDRec: integer);
    // ���������� ����� �������� ����� � TBaseGrid � ������� ��������
    procedure FillGridColumnByXML(pFormName: string; pFooterRecCnt: boolean;
      pCxGridTV: TcxGridDBTableView); virtual;
    // ���������� ����� ���������� ����� �� ���������� ������ �������������� ������ XML
    procedure FillGridColumnByXMLExt(pOrderID: integer;
      pFooterRecCnt: boolean = False;
      pCxGridTV: TcxGridDBTableView = nil); virtual;

    // ���������� ��������� � ���� ��� ����������/��������� �������
    procedure GenerateParams(pDBData: TDBData; pUid: Variant;
      var pParams, pValues: string);
    //��������� ���������������� ���� ������� � ����������
    procedure SetPermitsComponent; virtual;
    function ControllerCompare(V1, V2: Variant; Compare, AItemIndex: Integer; aIndexFields: String): integer;

  public
    // FPermits: TPermits;
    aPluginParams: array of String;
    dbBase: TDBData;
    dbAccess: TDBData;
    // ���������/ �������� ������ �� ����� �������
    function CommitData(var pData: TDBData; FuncName: string; RefreshData: Boolean = True): boolean;
    // ������� ������ �� ����� �������
    class function IntegerFromVar(pVar: Variant): integer;
    class function ModuleName: string; virtual;
    class function BaseTableName: string; virtual;
    // ��������� ����� view �� ����� ������� edizms -> v_edizms
    class function GetViewFromTable(pTable: string): string;
    { ������ ���� ���������� ��� ����� }
    property pPermitsStr: string read FPermitsStr write SetPermitsStr;
    { ���� ��� ��� �������� ������ }
    property DataModify: boolean read FDataModify write SetDataModify;
    { ����� ��� ��� ������ ������ }
    property DataReadOnly: boolean read FDataReadOnly write SetDataReadOnly;
    { ���������� �� �������� ������� }
    property TableBasePrivil: string read FTableBasePrivil
      write SetTableBasePrivil;
    { ������������ ���������� ����������� ���� }
    property Multiform: integer read FMultiform write FMultiform;
    { XML � ����������� ����� }
    property XMLData: TXMLDocument read FXMLData;

    // ���������� ������������ ��������
    property ReturnCount: integer read GetReturnCount;
    // ������� ������������ ��������
    property ReturnIsExisit: boolean read GetReturnIsExisit;
    // ��������� ������� �������� id (������� ����� ������ ��������)
    property ReturnId: integer read GetReturnId;
    // ��������� ������� �������� name (������� ����� ������ ��������)
    property ReturnName: string read GetReturnName;
    // ��������� ���������� �������� ������������� ��������
    property ReturnValue[index: Variant]: IMltArray read GetReturnValue;
    // ��������� �������� ������������� �������� �� ����� ���������
    function ReturnValueByName(pIndex: Variant; pName: string): Variant;
    // ������� ������ ���������� ���� ����� ��� ������� � TDBHTTP
    function GetFieldsArray(pTGridFields: TGridFields = nil): IIntArray;
    // ���������� ������, ���������� �������� �������� �� ��� ����� � ���� ���������
    function FindControlDescription(pCodeDoc: Variant; pNameControl: string)
      : TControlForm;

    // ������������ �� XML ������������ �����
    property FormInfo: TFormInfo read FFormInfo;
    property GridFields: TGridFields read FGridFields;
    property GridFieldsExt[Index: integer]: TGridFields
      read GetGridFieldsExtIndex; // ���������� ������ ���. ������
    property GridFieldsExtCount: integer read GetGridFieldsExtCount;
    property ControlForms: TControlForms read FControlForms;

    // ������� �������� �����
    procedure GetSettingForm(pXml: string);
    procedure OnRefresh; virtual;
    procedure CreateMenuPlugins; virtual;
    procedure MenuPluginClick(Sender: TObject); virtual;
    // �������� ���� ������ (���������� � XML)
    property pListField: string read FpListField;
  public
    // ��������� ������ �� DataSet � ���������� ��� ������� ImeName
    procedure CleanerImeName(Owner: TfmBaseForm);
    // ��������� ������ �� DataSet � ���������� ��� ���������� ImeName
    procedure AddImeName(Owner: TfmBaseForm);

  end;

implementation

{$R *.dfm}

uses
  uResourceForms, ufmBaseMain, uResource,
  SysUtils, Windows, Controls, utilSpravXML,
  ufmBaseGrid, Vcl.StdCtrls, cxCalendar, cxDBLookupComboBox,
  cxDBLabel, Vcl.ComCtrls, dximctrl, cxSpinEdit, cxDropDownEdit,
  cxMaskEdit, cxButtonEdit, System.StrUtils;
{ -------------- }
{ --- Events --- }
{ -------------- }

{ ������������ �������� }

// ���������� ������������� �������� � �����
procedure TfmBaseForm.ReturnAddValue;
begin

end;

procedure TfmBaseForm.OnRefresh;
begin

end;

// ���������/ �������� ������ �� ����� �������
function TfmBaseForm.CommitData(var pData: TDBData; FuncName: string; RefreshData: Boolean = True): boolean;
var
  i: integer;
  tmpDBQ: TDBData;
  Params, Values: string;
begin
  Result := False;

  for i := 0 to pData.CoreActionList.Count - 1 do
    case pData.CoreAction[i].oper of
      catInsert:
        begin
          if Pos('_set', FuncName) <> 0 then
          begin
            GenerateParams(pData, pData.CoreAction[i].UID, Params, Values);

            tmpDBQ := DataSetQuery(FuncName,
              ['~NULL', Resource.sessionInfo.token_id, Params, Values]);
            try
              // ������ ������ �� PHP �������
              if (DataSetProcessError(tmpDBQ)) then
              begin
                Exit;
              end;

              // ������ ����������� ������ ���������
              if (DataSetProcessResult(tmpDBQ)) then
              begin
                DialogStop('������ �� ���������!', '������ ����������');
                Exit;
              end
              else
              begin
                LocateID := tmpDBQ.DataSet.FieldByName('r_id').Value;
                pData.CoreActionList.Delete(i);
                if (pData.CoreActionList.Count = 0) and RefreshData then
                  pData.DataSetReQuery;
              end;
            finally
              FreeAndNil(tmpDBQ);
            end;
          end;
        end;
      catUpdate:
        begin
          if Pos('_set', FuncName) <> 0 then
          begin
            GenerateParams(pData, pData.CoreAction[i].UID, Params, Values);

            tmpDBQ := DataSetQuery(FuncName, [VarToStr(pData.CoreAction[i].id),
              Resource.sessionInfo.token_id, Params, Values]);
            try
              // ������ ������ �� PHP �������
              if (DataSetProcessError(tmpDBQ)) then
              begin
                Exit;
              end;

              // ������ ����������� ������ ���������
              if (DataSetProcessResult(tmpDBQ)) then
              begin
                DialogStop('������ �� ��������!', '������ ���������');
                Exit;
              end
              else
              begin
                LocateID := tmpDBQ.DataSet.FieldByName('r_id').Value;
                pData.CoreActionList.Delete(i);
                if (pData.CoreActionList.Count = 0) and RefreshData then
                  pData.DataSetReQuery;
              end;
            finally
              FreeAndNil(tmpDBQ);
            end;
          end;
        end;
      catDelete:
        begin
          if Pos('_del', FuncName) <> 0 then
          begin

            tmpDBQ := DataSetQuery(FuncName, [VarToStr(pData.CoreAction[i].id),
              Resource.sessionInfo.token_id]);
            try
              if tmpDBQ.DataSet.FieldByName('r_errCode').Value <> '0' then
              begin
                DialogStop
                  ('�� �� ������ ������� ��� ������,�.�. ��� ������������ � ������ �������� ��� ����� ����������� ������!');
                pData.DataSetReQuery;
              end
              else
              begin
                pData.CoreActionList.Delete(i);
                if (pData.CoreActionList.Count = 0) and RefreshData then
                  pData.DataSetReQuery;
              end;
            finally
              FreeAndNil(tmpDBQ);
            end;
          end;
        end;
    end;

  pData.DataSet.Locate(FormInfo.keyfield, LocateID, []);
  Result := true;
end;

procedure TfmBaseForm.GenerateParams(pDBData: TDBData; pUid: Variant;
  var pParams: string; var pValues: string);
var
  i: integer;
  b: boolean;
begin
  pParams := '';
  pValues := '';

  if (not pDBData.DataSet.Locate('uid', pUid, [])) then
  begin
    raise Exception.Create
      ('��� ������������ ���������� �� ���������� ������ �� ���������� ��������������!');
    Exit;
  end;

  b := False;
  for i := 0 to Length(GridFields) - 1 do
  begin
    if (NOT GridFields[i].genParam) or
      (pDBData.DataSet.FieldByName(GridFields[i].name).AsString = '') then
      Continue;

    if (b) then
    begin
      pParams := pParams + '~';
      pValues := pValues + '~';
    end;

    pParams := pParams + GridFields[i].name;
    if Pos('date', GridFields[i].name) = 0 then
      pValues := pValues + pDBData.DataSet.FieldByName
        (GridFields[i].name).AsString
    else
      pValues := pValues + FormatDateTime('yyyy-mm-dd',
        pDBData.DataSet.FieldByName(GridFields[i].name).AsDateTime);
    b := true;
  end;
end;

procedure TfmBaseForm.SetPermitsStr(const Value: string);
begin

  FPermitsStr := Value;
  SetPermitsComponent;
end;

function TfmBaseForm.ReturnValueByName(pIndex: Variant; pName: string): Variant;
begin
  Result := NULL;

  if (FRetValue.Exist(pIndex)) then
    if (FRetValue[pIndex].Exist(pName)) then
      Result := FRetValue[pIndex][pName].AsVariant;
end;

function TfmBaseForm.GetReturnCount: integer;
begin
  Result := FRetValue.Count;
end;

// ������� ������������ ��������
function TfmBaseForm.GetReturnIsExisit: boolean;
begin
  Result := (FRetValue.Count > 0);
end;

// ��������� ������� �������� id (������� ����� ������ ��������)
function TfmBaseForm.GetReturnId: integer;
begin
 Result:= -1;
  if ((FRetValue.Exist(integer(0))) and
    (FRetValue[integer(0)].Exist(FFormInfo.keyfield))) then
    Result := FRetValue[integer(0)][FFormInfo.keyfield].AsVariant;
end;

// ��������� ������� �������� name (������� ����� ������ ��������)
function TfmBaseForm.GetReturnName: string;
begin
  if ((FRetValue.Exist(integer(0))) and
    (FRetValue[integer(0)].Exist(FFormInfo.listfield))) then
    Result := FRetValue[integer(0)][FFormInfo.listfield].AsVariant;
end;

// ��������� �������� ������������� �������� ��� ����� ���������
function TfmBaseForm.GetReturnArray: IMltArray;
begin
  Result := FRetValue;
end;

// ��������� ���������� �������� ������������� ��������
function TfmBaseForm.GetReturnValue(index: Variant): IMltArray;
begin
  if (FRetValue.Exist(index)) then
    Result := FRetValue[index];
end;

{ /������������ �������� }

{ Self }

procedure TfmBaseForm.FormCreate(Sender: TObject);
var
  index: integer;
begin
  inherited;
  FRetValue := CreateMultiArray;

  FXMLData := TXMLDocument.Create(Self);
  // FXMLData.ParseOptions := [poPreserveWhiteSpace];
  FXMLData.Active := true;

  DataReadOnly := False;
  DataModify := False;
  SetMultiform;
  // FTableBasePrivil:= GetTablePrivil(BaseTableName);
  if Self.Owner is TfmBaseMain then
    (Self.Owner as TfmBaseMain).ListFormsAdd(Self);
  for Index := 0 to Self.ComponentCount - 1 do
    if Self.Components[Index].InheritsFrom(TcxCustomGridView) then
      try
        TcxCustomGridView(Self.Components[Index])
          .RestoreFromIniFile(Resource.FileNameDEini);
      except
        on E: Exception do
          DialogStop('������ �������� �����', '������');
      end;
  CreateMenuPlugins;
end;

procedure TfmBaseForm.FormShow(Sender: TObject);
var
  SysMenu: HMenu;
begin
  inherited;
  if Self.FormStyle = fsMDIChild then
  begin
    siWindow.visible := ivAlways;
    SysMenu := GetSystemMenu(Handle, False);
    Windows.EnableMenuItem(SysMenu, SC_CLOSE, MF_DISABLED or MF_GRAYED);
  end;
  { IHSB-82 }
  if (Self.FormStyle = fsMDIForm) or (fsModal in Self.FormState) then
  begin
    siWindow.visible := ivAlways;
    btGridViewCustomize.visible := ivAlways;
    btGridViewRestore.visible := ivAlways;
  end
  else
  begin
    siWindow.visible := ivAlways;
    btGridViewCustomize.visible := ivAlways;
    btGridViewRestore.visible := ivAlways;
  end;

  // ������������� ��������� ����� ��� �����
  if Resource.FormSettings.DataSet.Locate('form_name', Self.FFormName,
    [loCaseInsensitive]) then
    pPermitsStr := VarToStr(Resource.FormSettings.DataSet.FieldByName
      ('user_permits').Value);
end;

procedure TfmBaseForm.WmAfterShow(var Msg: TMessage);
var
  OClass: TPersistentClass;
  FObj: TPersistent;
begin
  if Assigned(Self.Parent) then
  begin
    if Self.Parent.ClassType = TcxTabSheet then
      try
        (Self.Parent as TcxTabSheet).Destroy;
      except
        on E: Exception do
          DialogStop('������ ����������� ������: ' +
            Self.Parent.ClassType.ClassName, '������');
      end;
  end
  else
  begin
    OClass := FindClass(Self.ClassType.ClassName);
    if OClass = nil then
      Exit;
    try
      if OClass.InheritsFrom(TComponent) or OClass.InheritsFrom(TForm) then
      begin
        TForm(Self).Close;
        TForm(Self).Release;
      end
      else if OClass.InheritsFrom(TPersistent) then
        FObj := TPersistentClass(OClass).Create;
    except
      on E: Exception do
        DialogStop('������ ����������� ������: ' + Self.ClassType.ClassName,
          '������');
    end;
  end;
end;

function TfmBaseForm.FindControlDescription(pCodeDoc: Variant;
  pNameControl: string): TControlForm;
var
  i: integer;
begin
  for i := Low(FControlForms) to High(FControlForms) do
  begin
    if ((FControlForms[i].docType = pCodeDoc) and
      (CompareText(FControlForms[i].name, pNameControl) = 0)) then
    begin
      Result := FControlForms[i];
      Break;
    end;
  end;
end;

procedure TfmBaseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if DataModify then
    raise Exception.Create(Self.Caption + #$0D#$0A +
      '�������� ������������� ���������. ��������� ����� ������');
  if Self.Owner is TfmBaseMain then
    (Self.Owner as TfmBaseMain).ListFormsDel(Self);
end;

procedure TfmBaseForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  CanClose := CanCloseForm();
end;

{ ���������� ��� ��������� ���� ������� }

procedure TfmBaseForm.GridViewCustomization(Sender: TObject);
var
  cxCustomGridView: TcxCustomGridView;
begin
  cxCustomGridView := TcxCustomGridView(Sender);
  if (not cxCustomGridView.Controller.Customization) and
    DialogQuest('��������� ��� �������?', Self.Caption) then
  begin
    if (Self.ClassName = 'TfrmCuttingAreasOperational') then
    begin
      if DirectoryExists('Settings') then
      begin
        if DirectoryExists('Settings/Forms') then
        begin
          cxCustomGridView.StoreToIniFile(ExtractFilePath(Application.ExeName) + '/Settings/Forms/' + Self.ClassName + cxCustomGridView.Name + '.ini',false,[],cxCustomGridView.Name);
        end
        else
        begin
          ForceDirectories(ExtractFilePath(Application.ExeName) + '/Settings' + '/Forms');
          cxCustomGridView.StoreToIniFile(ExtractFilePath(Application.ExeName) + '/Settings/Forms/' + Self.ClassName + cxCustomGridView.Name + '.ini',false,[],cxCustomGridView.Name);
        end;
      end
      else
      begin
        ForceDirectories(ExtractFilePath(Application.ExeName) + '/Settings');
        ForceDirectories(ExtractFilePath(Application.ExeName) + '/Settings' + '/Forms');
        cxCustomGridView.StoreToIniFile(ExtractFilePath(Application.ExeName) + '/Settings/Forms/' + Self.ClassName + cxCustomGridView.Name + '.ini',false,[],cxCustomGridView.Name);
      end;
    end
    else
    begin
      if DirectoryExists('Settings') then
      begin
        if DirectoryExists('Settings/Forms') then
        begin
          cxCustomGridView.StoreToIniFile(ExtractFilePath(Application.ExeName) + '/Settings/Forms/' + Self.ClassName +  '.ini',false,[],cxCustomGridView.Name);
        end
        else
        begin
          ForceDirectories(ExtractFilePath(Application.ExeName) + '/Settings' + '/Forms');
          cxCustomGridView.StoreToIniFile(ExtractFilePath(Application.ExeName) + '/Settings/Forms/' + Self.ClassName  + '.ini',false,[],cxCustomGridView.Name);
        end;
      end
      else
      begin
        ForceDirectories(ExtractFilePath(Application.ExeName) + '/Settings');
        ForceDirectories(ExtractFilePath(Application.ExeName) + '/Settings' + '/Forms');
        cxCustomGridView.StoreToIniFile(ExtractFilePath(Application.ExeName) + '/Settings/Forms/' + Self.ClassName + '.ini',false,[],cxCustomGridView.Name);
      end;
    end;
  end;
end;

class function TfmBaseForm.IntegerFromVar(pVar: Variant): integer;
begin
  if VarIsNull(pVar) then
    Result := -1
  else
    Result := integer(pVar);
end;

{ qryBase }

procedure TfmBaseForm.qryBaseAfterApplyUpdates(Sender: TObject);
begin
  inherited;
end;

{ ------------------ }
{ --- Properties --- }
{ ------------------ }

{ TableBasePrivil }

procedure TfmBaseForm.SetTableBasePrivil(const pTableBasePrivil: string);
begin
  FTableBasePrivil := pTableBasePrivil;
end;

procedure TfmBaseForm.ShowHistorylog(pFormInfo: TFormInfo; pIDRec: integer);
var
  fm: TForm;
begin

end;

procedure TfmBaseForm.SetPermitsComponent;
 var
  i: integer;
  Value: Boolean;
begin
 for i := 0 to Self.ComponentCount - 1 do
  if (Self.Components[i] As TComponent).Tag <> 0 then
  begin
    if Pos(IntToStr((Self.Components[i] As TComponent).Tag), FPermitsStr) = 0
     then Value := False
     else Value := True;

    if Self.Components[i] is TControl then
      (Self.Components[i] As TControl).Enabled := Value
    else if Self.Components[i] is TAction then
      (Self.Components[i] As TAction).Enabled := Value;
  end;
end;

{ DataReadOnly }

procedure TfmBaseForm.SetDataReadOnly(const pDataReadOnly: boolean);
begin
  FDataReadOnly := pDataReadOnly;
end;

{ DataModify }

procedure TfmBaseForm.SetDataModify(const pDataModify: boolean);
begin
  if DataReadOnly and pDataModify then
    raise Exception.Create('����� ���������. �������������� ������ ���������')
  else
    FDataModify := pDataModify;
end;

{ Multiform }
procedure TfmBaseForm.SetMultiform;
begin
  // sName := ClassName;
  // if Resource.IniFile.ValueExists(sName, 'CountWindows') then
  // FMultiform  := Resource.IniFile.ReadInteger(sName, 'CountWindows',);
  FMultiform := 3;
end;

{ Multiform }
procedure TfmBaseForm.SetFormNumber(const pNumber: integer);
begin
  FFormNumber := pNumber;
end;

{ --------------- }
{ --- Actions --- }
{ --------------- }

{ actExit }

procedure TfmBaseForm.actExitExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

{ actGridViewCustomize }

procedure TfmBaseForm.actGridViewCustomizeExecute(Sender: TObject);
begin
  inherited;
  if Screen.ActiveControl is TcxGridSite then
    with (Screen.ActiveControl as TcxGridSite) do
      TcxGridTableController(GridView.Controller).Customization :=
        not TcxGridTableController(GridView.Controller).Customization;
  // TcxCustomGridTableView(TcxGridSite(Screen.ActiveForm.ActiveControl).GridView).Controller.Customization := TRUE;
end;

procedure TfmBaseForm.actGridViewCustomizeUpdate(Sender: TObject);
var
  WinControl: TWinControl;
begin
  inherited;
  WinControl := Screen.ActiveControl;
  TAction(Sender).Enabled := Assigned(WinControl) and
    WinControl.ClassNameIs('TcxGridSite');
end;

{ actGridViewRestore }

procedure TfmBaseForm.actGridViewRestoreExecute(Sender: TObject);
begin
  inherited;
  if DialogQuest('������������ ��� �������?', '�������������� ���� �������')
  then
  begin
   // SectionName := Screen.ActiveForm.name + '.' +
     // TcxGridSite(Screen.ActiveForm.ActiveControl).GridView.name;
  //  IniGridParamsClear(SectionName);
    //TcxGridSite(Screen.ActiveForm.ActiveControl).GridView.RestoreFromIniFile
    //  (Resource.FileNameDEini);
    TcxGridSite(Screen.ActiveForm.ActiveControl).GridView.RestoreFromIniFile(Self.ClassName + '.ini',true, false, [],TcxGridSite(Screen.ActiveForm.ActiveControl).GridView.Name);
    DialogInfo
      ('�������� ��� ������� ����� ������������ ����� ���������� �������� ����',
      '�������������� ���� �������');
  end;
end;

{ --------------- }
{ --- Methods --- }
{ --------------- }

{ ��������� ������ ����� � dataset �� XML }

procedure TfmBaseForm.GenerateFieldsInDataset(pDBData: TDBData;
  pGF: TGridFields);
var
  i: integer;
begin
  if ((Assigned(pDBData.DataSet)) and (pDBData.DataSet.IsEmpty) and
    (Length(pGF) > 0)) then
  begin
    pDBData.DataSet.Close;
    pDBData.DataSet.FieldDefs.Clear;

    for i := Low(pGF) to High(pGF) do
    begin
      pDBData.DataSet.FieldDefs.Add(pGF[i].name, pGF[i].fieldType, pGF[i].size);
    end;
    pDBData.DataSet.FieldDefs.Add('uid', ftInteger);
    pDBData.DataSet.FieldDefs.Add('check', ftBoolean);

    TClientDataSet(pDBData.DataSet).CreateDataSet;
    pDBData.DataSet.Open;
  end;
end;

procedure TfmBaseForm.GenerateFieldsInDataset(pDBData: TDBData);
var
  i: integer;
begin
  if ((Assigned(pDBData.DataSet)) and (pDBData.DataSet.FieldDefs.Count = 0) and
    (Length(FGridFields) > 0)) then
  begin
    pDBData.DataSet.Close;
    pDBData.DataSet.Fields.Clear;

    for i := Low(FGridFields) to High(FGridFields) do
    begin
      pDBData.DataSet.FieldDefs.Add(FGridFields[i].name,
        FGridFields[i].fieldType, FGridFields[i].size);
    end;
    pDBData.DataSet.FieldDefs.Add('uid', ftInteger);
    pDBData.DataSet.FieldDefs.Add('check', ftBoolean);

    TClientDataSet(pDBData.DataSet).CreateDataSet;
    pDBData.DataSet.Open;
  end;
end;

{ ��������� ������ }

function StrArrayJoin(const StringArray: array of string;
  const Separator: string): string;
var
  i: integer;
begin
  Result := '';
  for i := low(StringArray) to high(StringArray) do
    Result := Result + '''' + StringArray[i] + '''' + Separator;
  Delete(Result, Length(Result), 1);
end;

function TfmBaseForm.DataSetQuery(pSessionInfo: TSessionInfo; pType_mes: String;
  pType_Query: String; pName_Func: String; Params: array of String;
  pFieldsArr: IIntArray = nil; pDefFields: boolean = False; add_lod: boolean=true): TDBData;
var
  DB: TDBData;
begin
   SetCursorWait(True);
  if add_lod then
  begin
    if Resource.DS = nil then
      Resource.DS := TStringList.Create;
    if Resource.DS2 = nil then
      Resource.DS2 := TStringList.Create;
    Resource.DS.Add(FormatDateTime('� dd.mm.yyyy hh:nn:ss ', now) +
      pName_Func + ' �');
    Resource.DS.Add('select * from ' + pName_Func + '(' + StrArrayJoin(Params,
      ',') + ')');
  end;

  DB := TDBData.Create(pSessionInfo, pType_mes, pType_Query, pName_Func, Params,
    pFieldsArr);

    if add_lod then
  begin
    if Resource.DS.Count > 600 then
      while Resource.DS.Count > 570 do
        Resource.DS.Delete(0);
  end;

  if (pDefFields) then
    GenerateFieldsInDataset(DB);

  Result := DB;
  SetCursorWait(False);
end;



function TfmBaseForm.DataSetQuery(pName_Func: String; Params: array of String;
  pFieldsArr: IIntArray; pDefFields: boolean): TDBData;
begin

  if Resource.DS = nil then
    Resource.DS := TStringList.Create;
  if Resource.DS2 = nil then
    Resource.DS2 := TStringList.Create;
  Resource.DS.Add(FormatDateTime('� dd.mm.yyyy hh:nn:ss ', now) +
    pName_Func + ' �');
  Resource.DS.Add('select * from ' + pName_Func + '(' + StrArrayJoin(Params,
    ',') + ')');

  Result := DataSetQuery(Resource.sessionInfo, TDBHTTP.TypeRequest,
    TDBHTTP.TypeQuery, pName_Func, Params, pFieldsArr, pDefFields, false);

  Resource.DS.Add(FormatDateTime('� dd.mm.yyyy hh:nn:ss ', now) +
    ' --- END ---' + ' �');
  if Resource.DS.Count > 600 then
    while Resource.DS.Count > 570 do
      Resource.DS.Delete(0);
end;

function TfmBaseForm.DataSetQuery(pName_Func: String; Params: array of String;
  pFormName: string): TDBData;
var
  DB: TDBData;
  bf: TfmBaseForm;
begin
  // ��������� � ��������� ���������
  bf := TfmBaseForm(createForm(ClassName, pFormName, Self, False));

  try
    bf.GetSettingForm(Resource.GetFormSettings(pFormName));

    DB := DataSetQuery(pName_Func, Params, bf.GetFieldsArray(), true);

    GenerateFieldsInDataset(DB, bf.GridFields);
  finally
    FreeAndNil(bf);
  end;

  Result := DB;
end;

function TfmBaseForm.DataSetQueryExt(pName_Func: String;
  Params: array of String; pIndexExt: integer): TDBData;
var
  DB: TDBData;
begin
  Result:= nil;
  // �������� ������� �������� ��� ���������� �������
  if (GridFieldsExtCount < pIndexExt) then
  begin
    Application.MessageBox(PChar('�������� ��������������� ����� [' +
      IntToStr(pIndexExt) + '] ���������� � XML!'), '������',
      MB_ICONERROR + MB_OK);
    Exit;
  end;

  DB := DataSetQuery(pName_Func, Params,
    GetFieldsArray(GridFieldsExt[pIndexExt]), False);

  GenerateFieldsInDataset(DB, GridFieldsExt[pIndexExt]);

  Result := DB;
end;

{ ��������� ���������� ������� }

procedure TfmBaseForm.DataSetRefresh();
begin
  dbBase.DataSet.DisableControls;
  try
    dbBase.DataSetReQuery;
    GenerateFieldsInDataset(dbBase);
  finally
    dbBase.DataSet.EnableControls;
  end;
end;

{ ������ ��������� ������ }

procedure TfmBaseForm.DataSetPost();
begin
  // ��������� �������� ������

end;

{ ��������� ����������� ������: ������ PHP }
function TfmBaseForm.DataSetProcessError(pDBData: TDBData): boolean;
var
  j: integer;
begin
  Result := False;
  if ((Assigned(pDBData)) and (pDBData.IsError)) then
    for j := Low(pDBData.Errors) to High(pDBData.Errors) do
    begin
      Result := true;
      DialogStop(PChar('������ ��� ���������� ������: ' + pDBData.Errors[j]
        .message), PChar(pDBData.Errors[j].mes_type));
    end;
end;

{ ��������� ����������� ������: ������������ ��������� (Execute) }
function TfmBaseForm.DataSetProcessResult(pDBData: TDBData): boolean;
begin

end;

{ �������� ��������� � ������� }

procedure TfmBaseForm.DataSetCancel();
begin
  DataSetRefresh();
end;

{ ����������� ��������� ������ }

procedure TfmBaseForm.DataSetUpdate();
begin
  if Assigned(dbBase) and (dbBase.DataSet.Active) then
    dbBase.CoreUpdateRecord(dbBase.DataSet.FieldByName('uid').AsInteger,
      dbBase.DataSet.FieldByName(FormInfo.keyfield).AsInteger);
end;

procedure TfmBaseForm.dxBarButton4Click(Sender: TObject);
begin
  inherited;

end;

{ ����������� �������� ������ }

procedure TfmBaseForm.DataSetDelete();
begin
  if Assigned(dbBase) and (dbBase.DataSet.Active) then
    dbBase.CoreDeleteRecord(dbBase.DataSet.FieldByName('uid').AsInteger,
      dbBase.DataSet.FieldByName(FormInfo.keyfield).AsInteger);
end;

{ ����������� ���������� ������ }

procedure TfmBaseForm.DataSetInsert();
begin
  dbBase.CoreInsertRecord();
end;

{ "����������" ������: ��������� ��� ���������, ���� ������ }

procedure TfmBaseForm.DataSetActivate();
begin

end;

{
  ���������� ���������� ������������ �� �������
  DELETE - ��������
  EDIT   - ��������������
  INSERT - �������
  SELECT - �������
}

function TfmBaseForm.GetTableBasePrivil(const pPrivil: string): boolean;
begin
  if pPrivil = 'DELETE' then
    Result := FTableBasePrivil[1] = '1'
  else if pPrivil = 'EDIT' then
    Result := FTableBasePrivil[2] = '1'
  else if pPrivil = 'INSERT' then
    Result := FTableBasePrivil[3] = '1'
  else if pPrivil = 'SELECT' then
    Result := FTableBasePrivil[4] = '1'
  else
    Result := False;
end;

{ ��������� �� �������� �� ���������� ������� }

procedure TfmBaseForm.aGroupPanelExecute(Sender: TObject);
begin
  inherited;

  // TcxCustomGridTableView(TcxGridSite(Screen.ActiveForm.ActiveControl).GridView).OptionsView.GroupByBox Controller.Customization := TRUE;

  if Screen.ActiveControl is TcxGridSite then
    with (Screen.ActiveControl as TcxGridSite) do
      if GridView is TcxGridTableView then
        with TcxGridTableView(GridView).OptionsView do
          GroupByBox := not GroupByBox;
end;

procedure TfmBaseForm.nAutoAlignExecute(Sender: TObject);
begin
  inherited;
  if Screen.ActiveControl is TcxGridSite then
    with (Screen.ActiveControl as TcxGridSite) do
      if GridView is TcxGridTableView then
        with TcxGridTableView(GridView).OptionsView do
          ColumnAutoWidth := not ColumnAutoWidth;
end;

procedure TfmBaseForm.aFillExecute(Sender: TObject);
begin
  inherited;
  if Screen.ActiveControl is TcxGridSite then
    with (Screen.ActiveControl as TcxGridSite) do
      if GridView is TcxGridTableView then
        TcxGridTableView(GridView).ApplyBestFit;
end;

function TfmBaseForm.ActNewEnable(Sender: TAction): boolean;
begin
  Result := (not DataReadOnly);
end;

procedure TfmBaseForm.AddImeName(Owner: TfmBaseForm);
var
 i: Integer;
begin

 for i := 0 to Owner.ComponentCount - 1 do
  begin
    if (Owner.Components[i] is TEdit) or (Owner.Components[i] is TcxDateEdit) or (Owner.Components[i] is TcxLookupComboBox) or (Owner.Components[i] is TCombobox) or (Owner.Components[i] is TcxDBLabel)
      or (Owner.Components[i] is TCheckBox) or (Owner.Components[i] is TRichEdit) or (Owner.Components[i] is TdxImageComboBox)or (Owner.Components[i] is TcxSpinEdit)or (Owner.Components[i] is TcxCombobox)
      or (Owner.Components[i] is TcxMaskEdit) or (Owner.Components[i] is TcxButtonEdit) then
    begin
      AddImeNameForComponent(Owner.Components[i]);
    end;
  end;

end;

procedure TfmBaseForm.AddImeNameForComponent(Sender: TObject);

 //������� ��� ��������� ImeName ����������
 function GetImeName(Name: string): string;
 var
   StartPosition, EndPosition, PosImeName, LengthImeName : integer;
 begin
   //�������� ������ ������� ����� ����������
   StartPosition := Pos(Name+'~', FComponentsImeName);
   //�������� ����� ����� ���������� + 1
   EndPosition := StartPosition + length(Name) + 1;
   //����� ������� ImeName
   PosImeName := PosEx('-', FComponentsImeName, EndPosition);
   //�������� ����� ImeName
   LengthImeName := PosImeName - EndPosition;
   //�������� �������� ImeName
   Result := Copy(FComponentsImeName, EndPosition, LengthImeName);
 end;

begin

  if Sender is TcxSpinEdit then
  begin
    if (Pos((Sender as TcxSpinEdit).Name, FComponentsImeName) > 0) then
    begin
     (Sender as TcxSpinEdit).ImeName := GetImeName((Sender as TcxSpinEdit).Name);
      exit;
    end;
  end;

  if Sender is TEdit then
  begin
    if (Pos((Sender as TEdit).Name, FComponentsImeName) > 0) then
    begin
      (Sender as TEdit).ImeName := GetImeName((Sender as TEdit).Name);
      exit;
    end;
  end;

  if Sender is TcxButtonEdit then
  begin
    if (Pos((Sender as TcxButtonEdit).Name, FComponentsImeName) > 0) then
    begin
      (Sender as TcxButtonEdit).Properties.ImeName := GetImeName((Sender as TcxButtonEdit).Name);;
      exit;
    end;
  end;

  if Sender is TcxDBLabel then
  begin
    if (Pos((Sender as TcxDBLabel).Name, FComponentsImeName) > 0) then
    begin
      (Sender as TcxDBLabel).ImeName := GetImeName((Sender as TcxDBLabel).Name);
      exit;
    end;
  end;

  if Sender is TcxLookupComboBox then
  begin
    if (Pos((Sender as TcxLookupComboBox).Name, FComponentsImeName) > 0) then
    begin
      (Sender as TcxLookupComboBox).Properties.ImeName := GetImeName((Sender as TcxLookupComboBox).Name);
      exit;
    end;
  end;

  if Sender is TCombobox then
  begin
    if (Pos((Sender as TCombobox).Name, FComponentsImeName) > 0) then
    begin
      (Sender as TCombobox).ImeName := GetImeName((Sender as TCombobox).Name);
      exit;
    end;
  end;


  if Sender is TcxComboBox then
  begin
    if (Pos((Sender as TcxComboBox).Name, FComponentsImeName) > 0) then
    begin
      (Sender as TcxComboBox).Properties.ImeName := GetImeName((Sender as TcxComboBox).Name);
      exit;
    end;
  end;

  if Sender is TdxImageComboBox then
  begin
    if (Pos((Sender as TdxImageComboBox).Name, FComponentsImeName) > 0) then
    begin
      (Sender as TdxImageComboBox).Hint := GetImeName((Sender as TdxImageComboBox).Name);
      exit;
    end;
  end;

  if Sender is TRichEdit then
  begin
    if (Pos((Sender as TRichEdit).Name, FComponentsImeName) > 0) then
    begin
      (Sender as TRichEdit).ImeName := GetImeName((Sender as TRichEdit).Name);
      exit;
    end;
  end;

  if Sender is TcxDateEdit then
  begin
    if (Pos((Sender as TcxDateEdit).Name, FComponentsImeName) > 0) then
    begin
      (Sender as TcxDateEdit).Properties.ImeName := GetImeName((Sender as TcxDateEdit).Name);
      exit;
    end;
  end;

  if Sender is TcxMaskEdit then
  begin
    if (Pos((Sender as TcxMaskEdit).Name, FComponentsImeName) > 0) then
    begin
      (Sender as TcxMaskEdit).Properties.ImeName := GetImeName((Sender as TcxMaskEdit).Name);
      exit;
    end;
  end;

end;


{ ���������� �������� }

{ ��������� �� �������� �� �������������� ������� }

function TfmBaseForm.ActEditEnable(Sender: TAction): boolean;
begin
  inherited;
  Result := (not DataReadOnly) { � �� ������ ���� ����� "��� ������" }
end;

{ ��������� �� �������� �� �������� ������� }

function TfmBaseForm.ActDelEnable(Sender: TAction): boolean;
begin
  Result := (not DataReadOnly);
end;

{ ---------------- }
{ --- External --- }
{ ---------------- }

class function TfmBaseForm.ModuleName: string;
begin
  Result := '';
end;

class function TfmBaseForm.BaseTableName: string;
begin
  Result := '';
end;

procedure TfmBaseForm.MenuPluginClick(Sender: TObject);
var
  i: integer;
  vdesc, vdll, vproc: String;
  LibHnd: THandle; // ����� �������
  // RunPlugin : TRunPlugin;
  aParams: array of PChar;

begin
  vdesc := TdxBarButton(Sender).Description;
  i := Pos(';', vdesc);
  vdll := copy(vdesc, 1, i - 1);
  vproc := copy(vdesc, i + 1, Length(vdesc) - i);
  if TdxBarButton(Sender).Tag = 0 then
  begin
    // LoadPlugins(self,vdll,LibHnd);
    TdxBarButton(Sender).Tag := LibHnd;
  end
  else
    LibHnd := TdxBarButton(Sender).Tag;
  // @RunPlugin := GetProcAddress(LibHnd,pchar(vproc));

  SetLength(aParams, Length(aPluginParams));
  for i := 0 to Length(aPluginParams) - 1 do
    aParams[i] := PChar(aPluginParams[i]);
  // RunPlugin (Application.Handle, aparams);
end;

function TfmBaseForm.CanCloseForm: boolean;
begin
  Result := true;
end;

procedure TfmBaseForm.CleanerImeName(Owner: TfmBaseForm);
var
  i: integer;
begin
  if FComponentsImeName <> EmptyStr
   then Exit;

  for i := 0 to Owner.ComponentCount - 1 do
  begin
    if (Owner.Components[i] is TEdit) or (Owner.Components[i] is TcxDateEdit) or (Owner.Components[i] is TcxLookupComboBox) or (Owner.Components[i] is TCombobox) or (Owner.Components[i] is TcxDBLabel)
      or (Owner.Components[i] is TCheckBox) or (Owner.Components[i] is TRichEdit) or (Owner.Components[i] is TdxImageComboBox)or (Owner.Components[i] is TcxSpinEdit)or (Owner.Components[i] is TcxCombobox)
      or (Owner.Components[i] is TcxMaskEdit) or (Owner.Components[i] is TcxButtonEdit) then
    begin
      CleanerImeNameForComponent(Owner.Components[i]);
    end;
  end;
end;

procedure TfmBaseForm.CleanerImeNameForComponent(Sender: TObject);
begin
  if Sender is TcxSpinEdit then
  begin
    if ((Sender as TcxSpinEdit).ImeName <> '') then
    begin
      FComponentsImeName := FComponentsImeName + (Sender as TcxSpinEdit).Name + '~';
      FComponentsImeName := FComponentsImeName + (Sender as TcxSpinEdit).ImeName + '-';
      (Sender as TcxSpinEdit).ImeName := '';
      exit;
    end;
  end;

  if Sender is TEdit then
  begin
    if ((Sender as TEdit).ImeName <> '') then
    begin
      FComponentsImeName := FComponentsImeName + (Sender as TEdit).Name + '~';
      FComponentsImeName := FComponentsImeName + (Sender as TEdit).ImeName + '-';
      (Sender as TEdit).ImeName := '';
      exit;
    end;
  end;

  if Sender is TcxButtonEdit then
  begin
    if ((Sender as TcxButtonEdit).ImeName <> '') then
    begin
      FComponentsImeName := FComponentsImeName + (Sender as TcxButtonEdit).Name + '~';
      FComponentsImeName := FComponentsImeName + (Sender as TcxButtonEdit).ImeName + '-';
      (Sender as TcxButtonEdit).Properties.ImeName := '';
      exit;
    end;
  end;

  if Sender is TcxDBLabel then
  begin
    if ((Sender as TcxDBLabel).ImeName <> '') then
    begin
      FComponentsImeName := FComponentsImeName + (Sender as TcxDBLabel).Name + '~';
      FComponentsImeName := FComponentsImeName + (Sender as TcxDBLabel).ImeName + '-';
      (Sender as TcxDBLabel).ImeName := '';
      exit;
    end;
  end;

  if Sender is TcxLookupComboBox then
  begin
    if ((Sender as TcxLookupComboBox).Properties.ImeName <> '') then
    begin
      FComponentsImeName := FComponentsImeName + (Sender as TcxLookupComboBox).Name + '~';
      FComponentsImeName := FComponentsImeName + (Sender as TcxLookupComboBox).Properties.ImeName + '-';
      (Sender as TcxLookupComboBox).Properties.ImeName := '';
      exit;
    end;
  end;

  if Sender is TCombobox then
  begin
    if ((Sender as TCombobox).ImeName <> '') then
    begin
      FComponentsImeName := FComponentsImeName + (Sender as TCombobox).Name + '~';
      FComponentsImeName := FComponentsImeName + (Sender as TCombobox).ImeName + '-';
      (Sender as TCombobox).ImeName := '';
      exit;
    end;
  end;


  if Sender is TcxComboBox then
  begin
    if ((Sender as TcxComboBox).Properties.ImeName <> '') then
    begin
      FComponentsImeName := FComponentsImeName + (Sender as TcxComboBox).Name + '~';
      FComponentsImeName := FComponentsImeName + (Sender as TcxComboBox).Properties.ImeName + '-';
      (Sender as TcxComboBox).Properties.ImeName := '';
      exit;
    end;
  end;

  if Sender is TdxImageComboBox then
  begin
    if ((Sender as TdxImageComboBox).Hint <> '') then
    begin
      FComponentsImeName := FComponentsImeName + (Sender as TdxImageComboBox).Name + '~';
      FComponentsImeName := FComponentsImeName + (Sender as TdxImageComboBox).Hint + '-';
      (Sender as TdxImageComboBox).Hint := '';
      exit;
    end;
  end;

  if Sender is TRichEdit then
  begin
    if ((Sender as TRichEdit).ImeName <> '') then
    begin
      FComponentsImeName := FComponentsImeName + (Sender as TRichEdit).Name + '~';
      FComponentsImeName := FComponentsImeName + (Sender as TRichEdit).ImeName + '-';
      (Sender as TRichEdit).ImeName := '';
      exit;
    end;
  end;

  if Sender is TcxDateEdit then
  begin
    if ((Sender as TcxDateEdit).Properties.ImeName <> '') then
    begin
      FComponentsImeName := FComponentsImeName + (Sender as TcxDateEdit).Name + '~';
      FComponentsImeName := FComponentsImeName + (Sender as TcxDateEdit).Properties.ImeName + '-';
      (Sender as TcxDateEdit).Properties.ImeName := '';
      exit;
    end;
  end;

  if Sender is TcxMaskEdit then
  begin
    if (CompareStr((Sender as TcxMaskEdit).Properties.ImeName, EmptyStr) <> 0) then
    begin
      FComponentsImeName := FComponentsImeName + (Sender as TcxMaskEdit).Name + '~';
      FComponentsImeName := FComponentsImeName + (Sender as TcxMaskEdit).Properties.ImeName + '-';
      (Sender as TcxMaskEdit).Properties.ImeName := '';
      exit;
    end;
  end;
end;

procedure TfmBaseForm.CreateMenuPlugins;
begin
end;

procedure TfmBaseForm.FormDestroy(Sender: TObject);
var
  i: integer;
begin
  SetLength(FGridFields, 0);

  // ����������� ���������� ������� �������������� ������
  for i := Low(FGridFieldsExt) to High(FGridFieldsExt) do
    SetLength(FGridFieldsExt[i], 0);

  // � ����� ��� ������ �������������� ������
  SetLength(FGridFieldsExt, 0);
  SetLength(FControlForms, 0);
  FreeAndNil(dbBase);

  FXMLData.Free;

  inherited;
end;

// ������� ������ ���������� ���� ����� ��� ������� � TDBHTTP
function TfmBaseForm.GetFieldsArray(pTGridFields: TGridFields = nil): IIntArray;
var
  i: integer;
begin
  if ((not Assigned(pTGridFields)) and (Assigned(FGridFields))) then
    pTGridFields := Self.FGridFields;

  if (not Assigned(pTGridFields)) then
  begin
    Result := nil;
    Exit;
  end;

  Result := CreateArray;

  for i := Low(pTGridFields) to High(pTGridFields) do
  begin
    Result[pTGridFields[i].name] := pTGridFields[i].size;
  end;
end;

function TfmBaseForm.GetGridFieldsExtCount: integer;
begin
 Result:= 0;
  if Assigned(FGridFieldsExt) then
    Result := Length(FGridFieldsExt);
end;

function TfmBaseForm.GetGridFieldsExtIndex(index: integer): TGridFields;
begin
  if ((Assigned(FGridFieldsExt)) and (Index - 1 <= High(FGridFieldsExt))) then
    Result := FGridFieldsExt[Index - 1];
end;

// ������� �������� �����
procedure TfmBaseForm.GetSettingForm(pXml: string);
var
  root: IXmlNode;

  ContrNode: IXmlNode;
  ContrList: IXMLNodeList;
  docTypesList: IXMLNodeList;

  grid: IXMLNodeList;
  gridElement: IXmlNode;

  i, j: integer;
begin
  inherited;
  try
    FXMLData.Xml.Clear;
    FXMLData.LoadFromXML(pXml);

    root := FXMLData.DocumentElement;

    { ��������� �������� ����� }
    if (root.NodeName <> 'sprav') then
      raise Exception.Create
        ('���������� �������� ������� ����������� <sprav>!');

    FFormInfo.id := StrToInt(GetXMLNodeAttr(root, 'id'));
    FFormInfo.category := GetXMLNodeAttr(root, 'category');
    FFormInfo.name := GetXMLNodeAttr(root, 'name');
    FFormInfo.tablename := GetXMLNodeAttr(root, 'tablename');
    FFormInfo.keyfield := GetXMLNodeAttr(root, 'keyfield');
    FFormInfo.listfield := GetXMLNodeAttr(root, 'listfield');
    FFormInfo.namesys := GetXMLNodeAttr(root, 'namesys');
    FFormInfo.multiselect := StrToBool(GetXMLNodeAttr(root, 'multiselect'));

    FpListField := FFormInfo.listfield;

    { ��������� ����� ���������� ����� }
    grid := root.ChildNodes.Nodes['fields-list'].ChildNodes;

    if VarIsNull(grid) then
      raise Exception.Create
        ('���������� �������� ����� ����������� <fields-list>!');

    SetLength(FGridFields, grid.Count);

    for i := 0 to grid.Count - 1 do
    begin

      gridElement := grid.Nodes[i];

      FGridFields[i].orderid :=
        StrToInt(GetXMLNodeAttr(gridElement, 'orderid'));
      FGridFields[i].name := GetXMLNodeAttr(gridElement, 'name');
      FGridFields[i].fieldType :=
        ParseFieldType(GetXMLNodeAttr(gridElement, 'datatype'));
      FGridFields[i].sort := GetXMLNodeAttr(gridElement, 'sort');
      FGridFields[i].title := GetXMLNodeAttr(gridElement, 'title');
      FGridFields[i].size := StrToInt(GetXMLNodeAttr(gridElement, 'size'));
      FGridFields[i].width := StrToInt(GetXMLNodeAttr(gridElement, 'width'));
      FGridFields[i].readonly :=
        StrToBool(GetXMLNodeAttr(gridElement, 'readonly'));
      FGridFields[i].visible :=
        StrToBool(GetXMLNodeAttr(gridElement, 'visible'));
      FGridFields[i].genParam :=
        StrToBool(GetXMLNodeAttr(gridElement, 'genparam'));
      FGridFields[i].group := StrToBool(GetXMLNodeAttr(gridElement, 'group'));
      FGridFields[i].propertyedit := GetXMLNodeAttr(gridElement,
        'propertyedit');
      FGridFields[i].listsource := GetXMLNodeAttr(gridElement, 'listsource');
      FGridFields[i].listkey := GetXMLNodeAttr(gridElement, 'listkey');
      FGridFields[i].listfield := GetXMLNodeAttr(gridElement, 'listfield');
      FGridFields[i].FooterKind :=
        ParseGridFooterType(GetXMLNodeAttr(gridElement, 'footerkind'));
      FGridFields[i].FooterFormat := GetXMLNodeAttr(gridElement,
        'footerformat');
    end;
    { /��������� ����� ���������� ����� }

    { ��������� ������ ��������� ���������� }
    ContrNode := root.ChildNodes.FindNode('controls-list');

    if Assigned(ContrNode) then
    begin
      docTypesList := ContrNode.ChildNodes.Nodes['documentTypes'].ChildNodes;

      if Assigned(docTypesList) then
      begin
        for i := 0 to docTypesList.Count - 1 do
        begin
          ContrList := docTypesList.Nodes[i].ChildNodes['controls'].ChildNodes;

          if Assigned(ContrList) then
          begin
            for j := 0 to ContrList.Count - 1 do
            begin
              // ��� ��� ������� ������ ����� �������� �������� ���������� �������� ��������
              // ������ �������� ������� ����� ��� ����������� ��� ������������ ���������
              SetLength(FControlForms, Length(FControlForms) + 1);

              FControlForms[Length(FControlForms) - 1].docType :=
                GetXMLNodeAttr(docTypesList.Nodes[i], 'doctype');
              FControlForms[Length(FControlForms) - 1].name :=
                GetXMLNodeAttr(ContrList.Nodes[j], 'name');
              FControlForms[Length(FControlForms) - 1].Caption :=
                GetXMLNodeAttr(ContrList.Nodes[j], 'caption');
              FControlForms[Length(FControlForms) - 1].visible :=
                StrToBoolDef(GetXMLNodeAttr(ContrList.Nodes[j],
                'visible'), true);
              FControlForms[Length(FControlForms) - 1].readonly :=
                StrToBoolDef(GetXMLNodeAttr(ContrList.Nodes[j],
                'readonly'), False);
              FControlForms[Length(FControlForms) - 1].Enabled :=
                StrToBoolDef(GetXMLNodeAttr(ContrList.Nodes[j],
                'enabled'), true);
            end;
          end;
        end;
      end;
    end;
    { /��������� ������ ��������� ���������� }

    ContrNode := nil;
    docTypesList := nil;

    { ��������� ������ �������������� ������ }
    ContrNode := root.ChildNodes.FindNode('gridsExt-list');

    if Assigned(ContrNode) then
    begin
      docTypesList := ContrNode.ChildNodes;

      if Assigned(docTypesList) then
      begin
        for i := 0 to docTypesList.Count - 1 do
        begin
          ContrList := docTypesList.Nodes[i].ChildNodes;

          if Assigned(ContrList) then
          begin
            SetLength(FGridFieldsExt, Length(FGridFieldsExt) + 1);
            SetLength(FGridFieldsExt[Length(FGridFieldsExt) - 1],
              ContrList.Count);

            for j := 0 to ContrList.Count - 1 do
            begin
              with TGridFields(FGridFieldsExt[Length(FGridFieldsExt) - 1])[j] do
              begin
                orderid := StrToInt(GetXMLNodeAttr(ContrList.Nodes[j],
                  'orderid'));
                name := GetXMLNodeAttr(ContrList.Nodes[j], 'name');
                fieldType := ParseFieldType(GetXMLNodeAttr(ContrList.Nodes[j],
                  'datatype'));
                sort := GetXMLNodeAttr(ContrList.Nodes[j], 'sort');
                title := GetXMLNodeAttr(ContrList.Nodes[j], 'title');
                size := StrToInt(GetXMLNodeAttr(ContrList.Nodes[j], 'size'));
                width := StrToInt(GetXMLNodeAttr(ContrList.Nodes[j], 'width'));
                readonly := StrToBool(GetXMLNodeAttr(ContrList.Nodes[j],
                  'readonly'));
                visible := StrToBool(GetXMLNodeAttr(ContrList.Nodes[j],
                  'visible'));
                genParam := StrToBool(GetXMLNodeAttr(ContrList.Nodes[j],
                  'genparam'));
                group := StrToBool(GetXMLNodeAttr(ContrList.Nodes[j], 'group'));
                propertyedit := GetXMLNodeAttr(ContrList.Nodes[j],
                  'propertyedit');
                listsource := GetXMLNodeAttr(ContrList.Nodes[j], 'listsource');
                listkey := GetXMLNodeAttr(ContrList.Nodes[j], 'listkey');
                listfield := GetXMLNodeAttr(ContrList.Nodes[j], 'listfield');
                FooterKind := ParseGridFooterType
                  (GetXMLNodeAttr(ContrList.Nodes[j], 'footerkind'));
                FooterFormat := GetXMLNodeAttr(ContrList.Nodes[j],
                  'footerformat');
              end;
            end;
          end;
        end;
      end;
    end;
    { /��������� ������ �������������� ������ }
  except
    on E: Exception do
    begin
      DialogStop('������ ���������� ��� �������� �������� ���������: ' +
        E.message, '�������� ���������� ���');
    end;
  end;
end;

// ��������� �������� �������� ����
function TfmBaseForm.GetXMLNodeAttr(pNode: IXmlNode; pName: string): String;
begin
  if VarIsNull(pNode) then
    Exit;

  try
    if (pNode.HasAttribute(pName)) then
      Result := pNode.Attributes[pName]
    else
      Result := '';
  except
    on E: EVariantTypeCastError do
    begin
      Result := '';
      raise Exception.Create('������ ����������� ��������� [' + pName + ']: ' +
        E.message);
    end;
    on E: Exception do
    begin
      Result := '';
      raise Exception.Create('������ ��������� ���������[' + pName + ']: ' +
        E.message);
    end;
  end;
end;

// ��������� ����� view �� ����� ������� edizms -> v_edizms
class function TfmBaseForm.GetViewFromTable(pTable: string): string;
var
  k: integer;
begin
  k := Pos('.', pTable);

  Result := copy(pTable, 1, k) + 'v_' + copy(pTable, k + 1, Length(pTable) - k);
end;

// ���������� ����� �������� ����� � TBaseGrid � ������� ��������
procedure TfmBaseForm.FillGridColumnByXML(pFormName: string;
  pFooterRecCnt: boolean; pCxGridTV: TcxGridDBTableView);
var
  ClassName: string;
  bf: TfmBaseForm;
  cl: TcxGridDBColumn;
  f: boolean;
  NeedFree: boolean;
  i: integer;
begin
  // ������� ����� ����� �� �����
  ClassName := Resource.GetFormClass(pFormName);
  NeedFree := true;

  f := true;
  if (pFormName = '') or (not Assigned(pCxGridTV)) or (ClassName = '') then
  begin
    DialogStop('������� [FillGridColumnByXML] �� ���������!',
      '������������ ������');
    Exit;
  end;

  // ��������� � ��������� ���������
  // ��������� ����� ����� ������ � ������, ���� ������ ��������� �� ������� �����
  if (Self.ClassName <> ClassName) then
    bf := TfmBaseForm(createForm(ClassName, pFormName, Self, False))
  else
  begin
    // ���� ����� ����, �� ����� ���, ��, ����� �� �������� ������ ����� ��������
    if (Length(Self.GridFields) = 0) then
      bf := TfmBaseForm(createForm(ClassName, pFormName, Self, False))
    else
    begin
      bf := Self;
      NeedFree := False;
    end;
  end;

  // ���� � ������������ ����� ��������� ��� ��������� - �������� �������� �� ����� ������
  if (Length(bf.GridFields) = 0) then
    bf.GetSettingForm(Resource.GetFormSettings(pFormName));

  try
    pCxGridTV.BeginUpdate;
    // ������� ���� �� ������� �������
    for i := pCxGridTV.ColumnCount - 1 downto 0 do
      pCxGridTV.Columns[i].Free;

    // � � ����� �������� �����
    for i := Low(bf.GridFields) to High(bf.GridFields) do
    begin
      cl := pCxGridTV.CreateColumn;
      cl.DataBinding.FieldName := bf.GridFields[i].name;
      cl.Caption := bf.GridFields[i].title;
      cl.Options.Editing := not bf.GridFields[i].readonly;
      cl.Styles.Header := Resource.cxStyleHeader;
      cl.visible := bf.GridFields[i].visible;
      // cl.Styles.Content := Resource.cxStyleEdit;

      // ���� ������� ����� ��� ����� - �������� �� XML ������ ������ �� ����
      if (pCxGridTV.OptionsView.Footer = true) then
      begin
        cl.Summary.FooterKind := bf.GridFields[i].FooterKind;
        cl.Summary.FooterFormat := bf.GridFields[i].FooterFormat;
      end;

      if (bf.GridFields[i].width > 0) then
        cl.width := bf.GridFields[i].width;

      // ���� �������� ������� ��� ��������� ����� � ���� � ����� ������ �����,
      // �� � ������ ������� ���� �������� ���� ���������� �������
      if ((pFooterRecCnt = true) and (pCxGridTV.OptionsView.Footer = true)) then
        if (bf.GridFields[i].visible and f) then
        begin
          cl.Summary.FooterKind := skCount;
          cl.Summary.FooterFormat := '�������: #';
          f := False;
        end;
    end;
    pCxGridTV.EndUpdate;
  finally
    if (NeedFree) then
      bf.Free;
  end;
end;

// ���������� ����� ���������� ����� �� ���������� ������ �������������� ������ XML
procedure TfmBaseForm.FillGridColumnByXMLExt(pOrderID: integer;
  pFooterRecCnt: boolean; pCxGridTV: TcxGridDBTableView);
var
  cl: TcxGridDBColumn;
  f: boolean;
  i: integer;
  gf: TGridFields;
begin
  f := true;

  if (not Assigned(pCxGridTV)) then
  begin
    DialogStop('������� [FillGridColumnByXML] �� ���������!',
      '������������ ������');
    Exit;
  end;

  // ��������� ���������
  gf := GridFieldsExt[pOrderID];

  pCxGridTV.BeginUpdate;
  // ������� ���� �� ������� �������
  for i := pCxGridTV.ColumnCount - 1 downto 0 do
    pCxGridTV.Columns[i].Free;

  // � � ����� �������� �����
  for i := Low(gf) to High(gf) do
  begin
    cl := pCxGridTV.CreateColumn;
    cl.DataBinding.FieldName := gf[i].name;
    cl.Caption := gf[i].title;
    cl.Options.Editing := not gf[i].readonly;
    cl.Styles.Header := Resource.cxStyleHeader;
    cl.visible := gf[i].visible;
    // cl.Styles.Content := Resource.cxStyleEdit;

    // ���� ������� ����� ��� ����� - �������� �� XML ������ ������ �� ����
    if (pCxGridTV.OptionsView.Footer = true) then
    begin
      cl.Summary.FooterKind := gf[i].FooterKind;
      cl.Summary.FooterFormat := gf[i].FooterFormat;
    end;

    if (gf[i].width > 0) then
      cl.width := gf[i].width;

    // ���� �������� ������� ��� ��������� ����� � ���� � ����� ������ �����,
    // �� � ������ ������� ���� �������� ���� ���������� �������
    if ((pFooterRecCnt = true) and (pCxGridTV.OptionsView.Footer = true)) then
      if (gf[i].visible and f) then
      begin
        cl.Summary.FooterKind := skCount;
        cl.Summary.FooterFormat := '�������: #';
        f := False;
      end;
  end;
  pCxGridTV.EndUpdate;

end;

function TfmBaseForm.ControllerCompare(V1, V2: Variant; Compare, AItemIndex: Integer; aIndexFields: String): integer;
var
  aDel, bDel : string;
  iPos, xCopy, yCopy, code : integer;
begin

  if Pos(',' + IntToStr(AItemIndex) + ',' , aIndexFields ) <> 0 then
  begin
    // ���� V1 ��� V2 null ����� ���������� ����������� �-��� ��� ������, ����� ������� ������
    if ((V1 <> NULL) and (V2 <> NULL)) then
    begin
      aDel := StringReplace(V1, ' ','',[rfReplaceAll]);
      bDel := StringReplace(V2, ' ','',[rfReplaceAll]);
      Compare := 0;
      //��������� �������� �� "," � ���������� ��
      while ((aDel <> '') or (bDel <> '')) do begin
        iPos := Pos(',', aDel);
        if (iPos = 0) then
        begin
          iPos := 30;
        end;
        Val(Copy(aDel, 1, iPos-1), xCopy, Code);
        Delete(aDel, 1, iPos);
        iPos := Pos(',' , bDel);
        if (iPos = 0) then
        begin
          iPos := 30;
        end;
        Val(Copy(bDel, 1, iPos-1), yCopy, Code);
        Delete(bDel, 1, iPos);
        if (xCopy > yCopy) then
        begin
          Result := -1;
          Break;
        end
        else
        if (xCopy < yCopy) then
        begin
          Result := 1;
          Break;
        end;
        //��� ������ ���� ���� ���������� �������� ��������, �������� "02" � "2" ��������� �� �����
        if (xCopy = yCopy) then
        begin
          if (Length(V1) < Length(V2)) then
          begin
            Result := -1;
          end;
          if (Length(V1) > Length(V2)) then
          begin
            Result := 1;
          end;
        end;
      end;
    end
    else
    begin
      Result := VarCompare(V1, V2);
    end;
  end
  else
  begin
    Result := VarCompare(V1, V2);
  end;
end;

end.
