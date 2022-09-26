unit uResource;

interface

uses
  Vcl.Forms, System.SysUtils, IniFiles, Windows, cxTextEdit,
  cxCheckListBox, uArrays, cxEditRepositoryItems,
  cxDBEditRepository, cxExtEditRepositoryItems, cxEdit, Data.DB,
  cxLocalization, cxStyles, System.Classes, Vcl.ImgList, Vcl.Controls,
  Vcl.ExtCtrls, cxClasses, Vcl.Graphics, cxDBLookupComboBox,
  System.ImageList, ufmBase, uBaseResource, uExchDBData, cxLookAndFeels,
  cxPC, cxProgressBar, uExchDBDataThread, RTTI, cxGraphics,// uLabels,
  uProgressBar, cxCalendar, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZSqlMonitor, ZAbstractConnection, ZConnection;

type
  TFilterProc = procedure of object;
  TFilterProcAdd = procedure of object;

type
  TBaseFormRef = class of TfmBase;//TfmBaseForm;

  TDbDataRes = class
  end;

  TArrDBData = array[0..9] of TDBData;

  TArrHandles = array of THandle;
    FArrHandles = ^TArrHandles;

  TCommonDbData = class(TDbDataRes)
    private
      FdbArr: TArrDBData;
      procedure SetG(index:integer; Value: TDBData);
      function GetG(index:integer) : TDBData;
    public
      dbDepartments: TDBData;         // �������������
      dbWooddocTypePermitUse : TDBData;
      dbFellingTypes : TDBData;
      dbCuttingTypes : TDBData;
      dbWoodDocTypes : TDBData;
      dbStatus : TDBData;
      dbDocStorageTypeActivity : TDBData;
      dbOrgUse : TDBData;
      dbStoragesLeave : TDBData;
      dbStorageEmployees : TDBData;
      dbCuttingAreas : TDBData;
      dbHigherDepartments: TDBData;   // ����������� �������������
      dbFirstDepartments: TDBData;    // ������������� ������� ������
      dbSecondDepartments: TDBData;   // ������������� ������� ������
      dbSortiment: TDBData;           // ���������� ���������
      dbPoroda: TDBData;              // ������ (������ �����)
      dbOrganization: TDBData;        // �����������
      dbPost: TDBData;                // ���������
    //  dbNomenclature: TDBData;        // ������������
      dbWoodProdCat: TDBData;         // ��������� ���������
      dbWoodDiamGroups: TDBData;      // ������ ���������
      dbWoodDiams: TDBData;           // ��������
      dbDocStorageTypes: TDBData;     // ���� ���������
      dbBasisDocumentTypes: TDBData;  // ���� ����������-��������� ��� ���������� ��������
      dbDocStorageStatus: TDBData;    // ������� ��������� ����������
      dbWoodLength: TDBData;              // ����� ���������
      dbStoragesCounterparty: TDBData; //������ �����������
      constructor Create;
      Destructor Destroy; override;
      property PdbDocStorageTypeActivity : TDBData read dbDocStorageTypeActivity write dbDocStorageTypeActivity;
      property PdbDepartments : TDBData read dbDepartments write dbDepartments;
      property PdbCuttingAreas : TDBData read dbCuttingAreas write dbCuttingAreas;
      property PdbStorageEmployees : TDBData read dbStorageEmployees write dbStorageEmployees;
      property PdbStoragesLeave : TDBData read dbStoragesLeave write dbStoragesLeave;
      property PdbStatus : TDBData read dbStatus write dbStatus;
      property PdbWoodDocTypes : TDBData read dbWoodDocTypes write dbWoodDocTypes;
      property PdbOrgUse : TDBData read dbOrgUse write dbOrgUse;
      property PdbWooddocTypePermitUse : TDBData read dbWooddocTypePermitUse write dbWooddocTypePermitUse;
      property PdbFellingTypes : TDBData read dbFellingTypes write dbFellingTypes;
      property PdbCuttingTypes : TDBData read dbCuttingTypes write dbCuttingTypes;
      property PdbHigherDepartments : TDBData read dbHigherDepartments write dbHigherDepartments;
      property PdbFirstDepartments : TDBData read dbFirstDepartments write dbFirstDepartments;
      property PdbSecondDepartments : TDBData read dbSecondDepartments write dbSecondDepartments;
      property PdbSortiment : TDBData read dbSortiment write dbSortiment;
      property PdbPoroda : TDBData read dbPoroda write dbPoroda;
      property PdbOrganization : TDBData read dbOrganization write dbOrganization;
      property PdbPost : TDBData read dbPost write dbPost;
  //    property PdbNomenclature : TDBData read dbNomenclature write dbNomenclature;
      property PdbWoodProdCat : TDBData read dbWoodProdCat write dbWoodProdCat;
      property PdbWoodDiamGroups : TDBData read dbWoodDiamGroups write dbWoodDiamGroups;
      property PdbWoodDiams : TDBData read dbWoodDiams write dbWoodDiams;
      property PdbDocStorageTypes : TDBData read dbDocStorageTypes write dbDocStorageTypes;
      property PdbBasisDocumentTypes : TDBData read dbBasisDocumentTypes write dbBasisDocumentTypes;
      property PdbDocStorageStatus : TDBData read dbDocStorageStatus write dbDocStorageStatus;
      property PdbWoodLength : TDBData read dbWoodLength write dbWoodLength;
      property PdbStoragesCounterparty: TDBData read dbStoragesCounterparty write dbStoragesCounterparty;
  end;


  TResource = class(TBaseResource)
    cxStyleRepository: TcxStyleRepository;
    cxStyleHeader: TcxStyle;
    cxStyleEdit: TcxStyle;
    cxStyleReadOnly: TcxStyle;
    cxStyleGroup: TcxStyle;
    cxStyleGridData: TcxStyle;
    cxStyleDataRed: TcxStyle;
    cxStyleDataBlue: TcxStyle;
    Localizer: TcxLocalizer;
    cxLookAndFeelController: TcxLookAndFeelController;
    cxStyleBkgrGradientInactiveCaption: TcxStyle;
    cxStyleBkgrCream: TcxStyle;
    cxEditRepository: TcxEditRepository;
    LabelSEARCH_PANEL: TcxEditRepositoryLabel;
    cxLookupComboBoxSPERIOD: TcxEditRepositoryLookupComboBoxItem;
    cxLookupComboBoxSOBJTIP: TcxEditRepositoryLookupComboBoxItem;
    cxLookupComboBoxVTYPERES: TcxEditRepositoryLookupComboBoxItem;
    TextEditSTANDART: TcxEditRepositoryTextItem;
    CurrencyEditNDOM: TcxEditRepositoryCurrencyItem;
    CurrencyEditKORP: TcxEditRepositoryCurrencyItem;
    CheckBox0_1: TcxEditRepositoryCheckBoxItem;
    MaskEditIND: TcxEditRepositoryMaskItem;
    dsTerObj: TDataSource;
    MemoEdit: TcxEditRepositoryMemoItem;
    cxEditRepositoryDateEDIT: TcxEditRepositoryDateItem;
    cxStyleDeleted: TcxStyle;
    cxStyleBlocked: TcxStyle;
    cxStyleDelBlock: TcxStyle;
    ImageListAppform: TcxImageList;
    cxStyleSumColumn: TcxStyle;
    cxStyleSelected: TcxStyle;
    cxStyleOddBackground: TcxStyle;
    cxStyleProcent90_99: TcxStyle;
    cxStyleProcentPlus99: TcxStyle;
    cxStyleDuplicate: TcxStyle;
    TimerFilter: TTimer;
    procedure DataModuleCreate(Sender: TObject);
    procedure ZConnBeforeConnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure TimerFilterTimer(Sender: TObject);
  private { fields }
    FFontSize: Integer;
    FCheckUpdates: Boolean;
    FFileNameDEini : String;
    ProgressBar: TcxProgressBar;
    GFilterProc: TFilterProc;
    GFilterProcAdd: TFilterProcAdd;
  private { methods }
    procedure LoadEnvironmentInfo;
    // ������������� ���������� ���������
    procedure InitCommonDbData;
  private
    FUpdateFolderURL: string;
    FUpdateDownloadURL: string;
     { properties }

  public { fields }
     FormSettings: TDBData;
    { ��� �������� "�������� ������� ����" }
    KodAttrFactorSeb: Integer;
    { ��� �������� "��� ���������" }
    KodAttrKodAnalit: Integer;
    { ������ ��������! �� ������������!!!
      ������������ ����� "period" �� ���������������� DataSet-�
      ������� ����������� ������ }
    PeriodFact: string;
    ObjTipHi: Integer; // ��� ������� "����� ���"
    // ����� ��������
    CommonDbData: TCommonDbData;
    ArrHandles: array of THandle;


  public { methods }
    procedure ChangePass(PassNew: String);
    procedure SaveEnvironmentInfo;

    // ��������� ������������ ���� ����������
    procedure LoadFormSettings;
    //������� ����� � ���������
    procedure EmbedFormInPanel(TheForm : TForm; ThePanel : TWinControl; ShowForm: Boolean);
    //��������� ����� �������
    procedure CloseEmbeddedForms(ThePanel : TcxTabSheet);

    // ��������� ������������ �����
    function GetFormSettings(pIdForm: integer): string; overload;
    function GetFormSettings(pNameForm: string): string; overload;
    // ��������� ������ �����
    function GetFormClass(pNameForm: string): string;
    // ���������� ������������ ����� � ������� ������
    function SetFormSettingsXML(pNameForm: string; pXML: string): boolean;

    procedure LoadSessionInfo(var pSessionInfo: TSessionInfo; var pJSFormatSettings: TFormatSettings);
    procedure SaveSessionInfo(const pSessionInfo: TSessionInfo; const pJSFormatSettings: TFormatSettings; const HOSTs: TStrings = nil);
    procedure SetGlobalInfo(pToken_id: String; pUserName: String; pShema: String; pURL: String);
    //�������� ������ ���������
    function GetBuildInfo(FileName: string; var V1, V2, V3, V4: word): boolean;
    //���������� ������ ��������� ����������� � ������
    function GetBuildInfoAsString(FileName: string): string;
    //�������� �������� ������ �����
    function GetFileVersion(FileName: string; var VerInfo : TVSFixedFileInfo): boolean;
    //���������� ������ ��������� ����������� � ������
    function GetFileVersionAsString(FileName: string): string;
    //������ �� ����������� (���������� token_id (id-������������))
    function  Authorisation(pUserName: String; pPassWord: String; pShema: String; pURL: String): String;
    //������� ��� �������� ������������� DbData � ������ TCommonDbData (����� �����������)
    function CheckCommonDbData(pArrDbData: array of String): boolean; overload;
    function CheckCommonDbData(pArrDbData: array of TDBData): boolean; overload;
    //������� ��� ��������� � ������ Handle-�� � ������
    function  GetArrHandleDBData(Index: integer): THandle;
    procedure SetArrHandleDBData(Index: integer; const Value: THandle);overload;
    procedure SetArrHandleDBData(const Value: THandle);overload;
    // ��������� ������. � ���������� ���-�� �������.
    // ���� ���� ������ - ��� �������������� � ������������ -1
    function OpenQuery():Integer;
    // �� �� �����, �� �������������� ��������� � ����������� TZQuery
    function ExecSQL(const pSQL: string; pListParam: array of Variant): Integer; overload;
    procedure SetTimerAdd(f: TFilterProcAdd; Interval: Integer = 1050);
  public { properties }
    FRequestAutoRefresh: Integer;
    const
    NotTextColor: TColor = $00D2D2FF;
    function GetRequestAutoRefresh: Integer;
    procedure SetRequestAutoRefresh(const pRequestAutoRefresh: Integer);
    property RequestAutoRefresh: Integer read GetRequestAutoRefresh write SetRequestAutoRefresh;
    { FontSize
      ������ ������: 8 ... 12 }
    function GetFontSize: Integer;
    procedure SetFontSize(const pFontSize: Integer);
    property FontSize: Integer read GetFontSize write SetFontSize;
    { CheckUpdates
      TRUE - ��������� ������� ����������, FALSE - ��� }
    property CheckUpdates: Boolean read FCheckUpdates;
    property UpdateFolderURL: string read FUpdateFolderURL;
    property UpdateDownloadURL: string read FUpdateDownloadURL;
    property FileNameDEini : String read FFileNameDEini;
    procedure LPropertiesInitPopup(Sender: TObject);
/// <summary>
///  ��������� ��������� ���� � �������� MinDate..MaxDate
/// </summary>
/// <remarks>
/// ���� ���� �� ������ � �������� ��������, ��
///  ������������� �� ��������� (MinDate ��� MaxDate)
/// </remarks>
    procedure cxDatePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  end;

  TRunOutlayImport = procedure(pAppHandle: Integer; pTer, pIDTer: Integer; pPeriod: PChar); stdcall;

const
  DEFAULT_DATABASE: string  = 'public';
  modNew  = 1;
  modEdit = 0;
 /// <summary>
 ///   ��������� SQL-���������� (SQL_PARAM_DELIMITER)
 /// </summary>
  SQL_P_D = '~';

var
  Resource: TResource;
  fmform: Tform;
  hlpfile : String;
  StringArray : TStringArray;
  Tc: Cardinal = 0;
  Tc2: Cardinal = 0;
  old_interval: integer = 1000;
  new_interval: integer = 1000;
  CntArrDbData: integer;
  gArrDbData: array of String;

{ ��������� ������� �� ����� ���������� ������ � ��� ������������� ������� �� }
function FindForm(AClass: TBaseFormRef; FormClass : string; Form_Name: string): TForm;

{ ������� ����� ���������� ������ }
function CreateForm(FormClass: string; Form_Name: string; Owner: TComponent; FormModal: boolean = False; MultiSel: boolean = False; pLocateID: Integer = 0; AClass: TForm = nil): TForm;

{������������� ������� �����}
procedure SetAsMainForm(aForm:TForm);

// �������� �� ������� ������, ����� DevExpress, �� ����� � ��������� ��
function emptyText(cmp: array of TcxCustomTextEdit):boolean;

{ ������� ��������� � ������ ��������� ������� ����� }
procedure MessageInfo(const pText: string = '');
procedure MessageInfoFmt(const pText: string; const pArgs: array of const);

// ���������� ���������� ���������� �������� � ������
function countchecklist (lcomp :TcxCheckListBox)  :integer;

// ��������� �� ������� ������ � Value
// ���� �� ����� = - ���������� ����������� source=source+divider+value
// value
procedure AddDivider(var Source :String; const Value: String; divider : char = ',');

// ��������� - ��������� ��� ��� ��� ����������� ���� dataSet
function TestFieldsRequired(ds : TdataSet) : Boolean;

// ������� ����������� ��������� ����� �� inifile
procedure IniGridParamsClear(SectionName : String);

// ���������� ��� �������� ������� (����)
function Client_Id : String;

/// <summary>
///   ������������� �������� ��������� ��� ������ ���
/// </summary>
function setIntervalDate(cxDateEdit: TcxDateEdit): Boolean;
/// <summary>
///   ��������� DataSet �� �������������
/// </summary>
function DataSetIsExists(ADataSet: TDataSet;  ARecordCount:Integer = 0): Boolean;

type
/// <summary>
/// ����� ���������� ������
/// <param name="maDefault">�� ��������� </param>
/// <param name="maGrid"> ����� ���� </param>
/// </summary>
 TModeAdd = (maDefault, maGrid);
/// <summary>
///  ������� ��������������� ���������
/// <param name="wdsNew">�����(�������� �� �������)</param>
/// <param name="wdsProject">������</param>
/// <param name="wdsActive">�����������</param>
/// <param name="wdsCompleted">��������</param>
/// <param name="wdsCanceled">�����������</param>
/// </summary>
 TWoodDocsStatus = (wdsNew = 0, wdsProject = 1, wdsActive = 2, wdsCompleted = 3, wdsCanceled = 4);
/// <summary>
///   ������� ��������
/// <param name="casAvailable">��������</param>
/// <param name="casActive">�����������</param>
/// <param name="casCompleted">���������</param>
/// <param name="casLocked">�������������</param>
/// </summary>
 TCuttingAreasStatus = (casAvailable = 1, casActive = 2, casCompleted = 3, casLocked = 4);

implementation

{$R *.dfm}

uses
  uMessageExp, ExceptLibPg, cxLookAndFeelPainters, Variants,
  uFileUtils, uResourceForms, uExchDB, uLogin, ufmBaseMain, uKartUtils,
  System.Math, uOVD, uOVDAdd, uFamilyComposition, uFamilyCompositionAdd,
  uOffensesAdd, uOffenses, uEducation, uEducationAdd, uGrdocument, uGrdocumentAdd,
  uCriminal, uCriminalAdd, uWork, uWorkAdd, uPrevention, uPreventionAdd,
  uReferralData, uCourtdecision, uCommissionDecision, uCommissionDecisionAdd,
  uCourtdecisionAdd,uMedinspector, uMedinspectorAdd, uMedexamination,
  uMedexaminationAdd, uDisease, uSocLegal, uSocLegalAdd, uSocAssessment,
  uSocAssessmentAdd, uOZ, uMedAssessment, uMedAssessmentAdd,
  uLTPInformation, uLTPInformationAdd, uLTPWork, uLTPWorkAdd,
  uLTPPenaltyAdd, uLTPPenalty, uLTPReward, uLTPRewardAdd, uLTPExtension,
  uLTPExtensionAdd, uLtptrainingAdd, uLtptraining, uLTPPreventive, uLTPPreventiveAdd,
  uLTPRefusall, uLTPRefusallAdd, uTCSON, uDIN, uLTP, uLTPCureAdd, uLTPCure,
  uLTPMedicalAdd, uUsers, uUsersAdd, uRoles, uRolesAdd, uPermision, uPermisionAdd,
  uNotifications, uNotificationsAdd;

const
  IDIMAGE_QUERY:   Integer = 0;
  IDIMAGE_INFO:    Integer = 1;
  IDIMAGE_WARNING: Integer = 2;
  IDIMAGE_STOP:    Integer = 3;

  {������������ ���� ���� ����������, ���������� ��� �����������}
const

FormsAppArr: array [0..63] of TBaseFormRef = (TfmBaseMain
                                            , TfmOVD
                                            , TfmOVDAdd
                                            , TfmFamilyComposition
                                            , TfmFamilyCompositionAdd
                                            , TfmOffensesAdd
                                            , TfmOffenses
                                            , TfmEducation
                                            , TfmEducationAdd
                                            , TfmGrdocument
                                            , TfmGrdocumentAdd
                                            , TfmCriminal
                                            , TfmCriminalAdd
                                            , TfmWork
                                            , TfmWorkAdd
                                            , TfmPrevention
                                            , TfmPreventionAdd
                                            , TfmReferralData
                                            , TfmCourtdecision
                                            , TfmCommissionDecision
                                            , TfmCommissionDecisionAdd
                                            , TfmCourtdecisionAdd
                                            , TfmMedinspector
                                            , TfmMedinspectorAdd
                                            , TfmMedexamination
                                            , TfmMedexaminationAdd
                                            , TfmSocLegal
                                            , TfmSocLegalAdd
                                            , TfmSocAssessment
                                            , TfmSocAssessmentAdd
                                            , TfmDisease
                                            , TfmOZ
                                            , TfmMedAssessment
                                            , TfmMedAssessmentAdd
                                            , TfmLTPInformation
                                            , TfmLTPInformationAdd
                                            , TfmLTPWork
                                            , TfmLTPWorkAdd
                                            , TfmLTPPenalty
                                            , TfmLTPPenaltyAdd
                                            , TfmLTPReward
                                            , TfmLTPRewardAdd
                                            , TfmLTPExtensionAdd
                                            , TfmLTPExtension
                                            , TfmLtptrainingAdd
                                            , TfmLtptraining
                                            , TfmLTPPreventive
                                            , TfmLTPPreventiveAdd
                                            , TfmLTPRefusall
                                            , TfmLTPRefusallAdd
                                            , TfmTCSON
                                            , TfmLTP
                                            , TfmDIN
                                            , TfmLTPCureAdd
                                            , TfmLTPCure
                                            , TfmLTPMedicalAdd
                                            , TfmUsers
                                            , TfmUsersAdd
                                            , TfmRoles
                                            , TfmRolesAdd
                                            , TfmPermision
                                            , TfmPermisionAdd
                                            , TfmNotifications
                                            , TfmNotificationsAdd);

{ ��������� ������� �� ����� ���������� ������ }
function FindForm(AClass: TBaseFormRef; FormClass : string; Form_Name: string): TForm;
var Index: Integer;
begin
  Result := nil;
  { ���� ����� }
  Index := 0;

  while (Index < Screen.FormCount) and (not Assigned(Result)) do
  begin
    if (Screen.Forms[Index].ClassType = AClass)  and (Screen.Forms[Index].Name = Form_Name) then
      Result := Screen.Forms[Index]
    else
      Inc(Index);
  end;
end;

{ ������� ����� ���������� ������ }
function CreateForm(FormClass: string; Form_Name: string; Owner: TComponent; FormModal: boolean = False; MultiSel: boolean = False; pLocateID: Integer = 0; AClass: TForm = nil): TForm;
var
 CRef : TPersistentClass;
begin
  Result := nil;
  { ���� ����� }
 { Index := 0;
  while (Index < Screen.FormCount) and (not Assigned(Result)) do
  begin
    if (Screen.Forms[Index].ClassType = AClass) and (Screen.Forms[Index].Name = Form_Name) then
      Result := Screen.Forms[Index]
    else
      Inc(Index);
  end;}
  { ���� �� ����� - ��������� �� �����, ���� ���� ����� - ������� }
  try
    if AClass <> nil then
    begin
      Result := TComponentClass(AClass).Create(Owner) as TForm;
      if Assigned(Result) then
      begin
       Result.Name := Form_Name;
       if FormModal then
         Result.Showmodal;
      end;
    end
    else
    begin
      CRef := FindClass(FormClass);
      if Assigned(CRef) then
      begin
        //Result := AClass.Create(Application.MainForm);
        Result := TBaseFormRef(CRef).Create(Owner, Form_Name, FormModal, MultiSel, pLocateID);
        if (Result <> nil) and ( not Resource.FormSettings.DataSet.IsEmpty) then
          if Resource.FormSettings.DataSet.Locate('form_name', Form_Name, [loCaseInsensitive]) then
           Result.Caption := VarToStr(Resource.FormSettings.DataSet.FieldByName('form_comment').Value);
      end;
    end;
  except
   on E: EClassNotFound do
     DialogStop('����� �� ������', '������');
   on E: Exception do
     DialogStop('�� ������� ��������� �����: ' + E.Message);
  end;
end;


procedure SetAsMainForm(aForm:TForm);
 var
   P:Pointer;
 begin
   P := @Application.Mainform;
   Pointer(P^) := aForm;
 end;


//���������� ���-�� ���������� �������� � ������
function countchecklist (lcomp :TcxCheckListBox)  :integer;
    var i:Integer;
begin
  result:=0;
  for i:=0 to lcomp.count-1 do
      if lcomp.Items[i].State=cbsChecked   then
            inc(result);
end;


// �������� �� ������� ������, ����� DevExpress, �� ����� � ��������� ��
function emptyText(cmp: array of TcxCustomTextEdit):boolean;
var i: integer;
    icomp: TcxCustomTextEdit; // ������� ��� ��� ������� <Text> � <Style>
    testcomp:Boolean;
begin
  result := false;
  for i := 0 to length(cmp)-1 do begin
   icomp := cmp[i];
   if icomp.Enabled then  begin // ��������� ������ ��������� (��������) ����
    if icomp.InheritsFrom(TcxCheckListBox) then
       testcomp:= countchecklist( tcxCheckListBox(icomp))>0
    else
     testcomp := Length(icomp.Text)>0;
    if testcomp then
      icomp.Style.Color := clWindow
    else begin
      icomp.Style.Color := $00B1B6FE;
      result := true;
    end;
   end;
  end;
end;

{ ������� ��������� � ������ ��������� ������� ����� }

procedure MessageInfo(const pText: string = '');
begin
{  fmMain.StatBar.Panels[1].Text := pText;
  Application.ProcessMessages; }
end;

procedure MessageInfoFmt(const pText: string; const pArgs: array of const);
begin
  MessageInfo(Format(pText, pArgs));
end;

// ��������� �� ������� ������ � Value
// ���� �� ����� = - ���������� �����������
procedure AddDivider(var Source :String; const Value: String; divider : char = ',');
begin
  if Length(Source)>0 then
    Source:=Source+divider+Value
  else
    Source:=Value;
end;


// ��������� - ��������� ��� ��� ��� ����������� ���� dataSet
function TestFieldsRequired(ds : TdataSet) : Boolean;
var
  i:Integer;
  errmess : String;
begin
  result:=true;
  errmess:='';
  for i:=0 to ds.FieldCount-1 do
    if (ds.Fields[i].Required) and (ds.Fields[i].IsNull) then begin
     result:=False;
     if length(errmess)>0 then errmess:=errmess+',';
     errmess:=errmess+' "'+ds.Fields[i].DisplayLabel+'"';
    end;
  if not result then
    DialogInfo('���� : '+errmess+' ������ ���� ���������','������� ��������� ��������');
end;


// ������� ����������� ��������� ����� �� inifile
procedure IniGridParamsClear(SectionName : String);
var
 i, n :Integer;
 lst : TStringList;
begin
  lst:=TStringList.Create;
  try
  lst.LoadFromFile(Resource.FileNameDEini);
  n:=length(SectionName);
  for i:=0 to lst.Count-1 do
    if copy(lst.Strings[i],1,n+1)=('['+SectionName) then
      Resource.IniFile.EraseSection( copy(lst.Strings[i],2,Length(lst.Strings[i])-2));
  finally
    lst.Free;
  end;
end;
// ���������� ��� �������� ������� (����)
function Client_Id : String;
begin
  result:= Resource.sessionInfo.token_id;
end;


//����� �  CommonDbData
Constructor TCommonDbData.Create();
begin
 inherited Create;
end;

Destructor TCommonDbData.Destroy;
var
  FContext: TRttiContext;
  FType: TRttiType;
  FProp    : TRttiProperty ;
begin
  try
    FContext := TRttiContext.Create;
    if Assigned(Resource.CommonDbData) then
    begin
      FType := FContext.GetType(Resource.CommonDbData.ClassType);
      for FProp in FType.GetProperties do
      begin
        if not FProp.GetValue(Resource.CommonDbData).IsEmpty then
        begin
         FreeAndNil(TDBData(FProp.GetValue(Resource.CommonDbData).GetReferenceToRawData^));
        end;
      end;
    end;
  finally
    FContext.free;
  end;

 inherited Destroy;
end;

procedure TCommonDbData.SetG(Index: integer; Value: TDBData);
begin
  FdbArr[index] := Value;
end;

function TCommonDbData.GetG(Index: Integer) : TDBData;
begin
  result := FdbArr[index];
end;

function setIntervalDate(cxDateEdit: TcxDateEdit): Boolean;
begin
 Result:= False;
 if not Assigned(cxDateEdit)
  then Exit;
  cxDateEdit.Properties.MinDate:= StrToDate('01.01.2015');
  cxDateEdit.Properties.MaxDate:= StrToDate('31.12.2099');
  cxDateEdit.Properties.ShowOnlyValidDates:= True;
  cxDateEdit.Properties.OnValidate:= Resource.cxDatePropertiesValidate;

  Result:= True;
end;

function DataSetIsExists(ADataSet: TDataSet;  ARecordCount:Integer = 0): Boolean;
begin
 Result:= False;
 if Assigned(ADataSet) and (ADataSet.Active) and
       (ADataSet.RecordCount > ARecordCount)
  then Result:= True;
end;

procedure TResource.ChangePass(PassNew: String);
begin
  if Length(PassNew)=0 then exit;
  try
    DialogInfo('������ �������', '��������� ������ ������������');
  except
  end;
end;

procedure TResource.DataModuleCreate(Sender: TObject);
var
  FileName: string;
  Index: Integer;
  fmT : TForm;
begin
  inherited;

  Localizer.Active := False;

  FileName := StringReplace(Application.ExeName, '.exe', '.ini', [rfReplaceAll, rfIgnoreCase]);
  IniFile := TIniFile.Create(FileName);
  if not FileExists(IniFile.FileName) then
    IniFile.UpdateFile;

  FFileNameDEini := StringReplace(Application.ExeName, '.exe', 'DE.ini', [rfReplaceAll, rfIgnoreCase]);

  ModuleInfo.superuser := 'gf';
  LoadEnvironmentInfo;

  // ����������� �����������
  FileName := ModuleInfo.AppDir + 'dxRussian.ini';
  if FileExists(FileName) then
  begin
    try
      Localizer.Active := FALSE;
      Localizer.FileName := FileName;
      Localizer.Active := TRUE;
      Localizer.Locale := 1049;
    except
    end;
  end;

  // ��� ����� �������
  hlpfile := ModuleInfo.AppDir + StringReplace(ExtractFileName(Application.ExeName), '.exe', '.chm', [rfReplaceAll, rfIgnoreCase]);
  if not FileExists(hlpfile) then
    hlpfile := '';

  //����������� ���� ���� ����������
  for Index := Low(FormsAppArr) to High(FormsAppArr) do
  begin
  //  RegisterClass(TfmLogin);
    RegisterClass(FormsAppArr[Index]);
  end;

  //��������� ����� ������
   fmT := CreateForm('TfmLogin', 'fmLogin', nil, False, False, 0, Tform(TfmLogin));
  try
    SetWindowLong(fmT.Handle, GWL_EXSTYLE, WS_EX_APPWINDOW);
    fmT.ShowModal;
  finally
    fmT.Free;
  end;
end;

procedure TResource.DataModuleDestroy(Sender: TObject);
begin
  CommonDbData.Free;
  FreeAndNil(FormSettings);
  inherited;
end;

{ ����������, �� ������������ !!! }
function TResource.ExecSQL(const pSQL: string; pListParam: array of Variant): Integer;
begin
  Result := 1;
end;


{ ������������� �������� ���������� �������� }
procedure TResource.SetGlobalInfo(pToken_id: String; pUserName: String; pShema: String; pURL: String);
begin
  SessionInfo.UserName := pUserName;
  SessionInfo.token_id := pToken_id;
  SessionInfo.Shema    := pShema;
  SessionInfo.HostName := pURL;
end;

function TResource.Authorisation(pUserName: String; pPassWord: String; pShema: String; pURL: String): String;
var
 GetData : TDBHTTP;
begin
  GetData  := TDBHTTP.Create;
  Result :='';
  try
   Result:= GetData.Autorization(pUserName, pPassWord, pShema, pURL);
  finally
   GetData.Free;
  end;
end;

function TResource.OpenQuery(): Integer;
begin
  SetCursorWait(TRUE);
  MessageInfo('�����... ����������� ������ � ��');
  try
    try
      Result := 1;
    except
      on e:Exception do
      begin
        Result := -1;
      end;
    end;
  finally
    SetCursorWait(FALSE);
    MessageInfo('');
  end;
end;



{ ��������� ���������� � ������ �� ini-����� }

procedure TResource.LoadSessionInfo(var pSessionInfo: TSessionInfo; var pJSFormatSettings: TFormatSettings);
begin
  { UserName }
  if pSessionInfo.UserName = '' then
    if IniFile.ValueExists('DB', 'UserName') then
      pSessionInfo.UserName := IniFile.ReadString('DB', 'UserName', '' )
    else
      pSessionInfo.UserName := '';
  { Host }
  if pSessionInfo.HostName = '' then
    if IniFile.ValueExists('HOST', 'HostName') then
      pSessionInfo.HostName := IniFile.ReadString('HOST', 'HostName', DEFAULT_HOST)
    else
      pSessionInfo.HostName := '';
  { Database }
  if IniFile.ValueExists('DB', 'bgl') then
    pSessionInfo.DataBase := IniFile.ReadString('DB', 'bgl', DEFAULT_DATABASE)
  else
    pSessionInfo.DataBase := DEFAULT_DATABASE;

  if IniFile.SectionExists('JSFormatSettings') then
  begin

   { pJSFormatSettings.DateSeparator := (IniFile.ReadString('JSFormatSettings', 'DateSeparator', '')[1]);
    pJSFormatSettings.TimeSeparator := (IniFile.ReadString('JSFormatSettings', 'TimeSeparator', '')[1]);
    pJSFormatSettings.ShortDateFormat := IniFile.ReadString('JSFormatSettings', 'ShortDateFormat', '');
    pJSFormatSettings.ShortTimeFormat := IniFile.ReadString('JSFormatSettings', 'ShortTimeFormat', '');
    pJSFormatSettings.LongTimeFormat := IniFile.ReadString('JSFormatSettings', 'LongTimeFormat', '');
    pJSFormatSettings.DecimalSeparator := (IniFile.ReadString('JSFormatSettings', 'DecimalSeparator', '')[1]);
  }

    pJSFormatSettings.DateSeparator := '-';
    pJSFormatSettings.TimeSeparator := ':';
    pJSFormatSettings.ShortDateFormat := 'yyyy-mm-dd';
    pJSFormatSettings.ShortTimeFormat := 'hh:nn:ss.zzz';
    pJSFormatSettings.LongTimeFormat := 'hh:nn:ss.zzz';
    pJSFormatSettings.DecimalSeparator := ',';

  end;

end;

{ ���������� ������ � ������ � ini-����� }

procedure TResource.SaveSessionInfo(const pSessionInfo: TSessionInfo; const pJSFormatSettings: TFormatSettings; const HOSTs: TStrings = nil);
var
  Value: string;
  Index: Integer;
begin
  Value := 'HostName';
  if Assigned(HOSTs) then
    for Index := 0 to HOSTs.Count - 1 do
    begin
        IniFile.WriteString('HOST', Value + IntToStr(Index + 1), HOSTs.Strings[Index]);
    end
   else
     IniFile.WriteString('HOST', Value, pSessionInfo.HostName);

  IniFile.WriteString('DB','Shema', pSessionInfo.Shema);
  IniFile.WriteString('DB','UserName', pSessionInfo.UserName);
  IniFile.WriteString('Settings', '', '');
  IniFile.WriteString('email','admin', 'admin@test.com');
  IniFile.WriteString('email','support', 'support@test.com');
  IniFile.WriteString('JSFormatSettings','DateSeparator', pJSFormatSettings.DateSeparator);
  IniFile.WriteString('JSFormatSettings','TimeSeparator', pJSFormatSettings.TimeSeparator);
  IniFile.WriteString('JSFormatSettings','ShortDateFormat', pJSFormatSettings.ShortDateFormat);
  IniFile.WriteString('JSFormatSettings','ShortTimeFormat', pJSFormatSettings.ShortTimeFormat);
  IniFile.WriteString('JSFormatSettings','LongTimeFormat', pJSFormatSettings.LongTimeFormat);
  IniFile.WriteString('JSFormatSettings','DecimalSeparator', pJSFormatSettings.DecimalSeparator);
  IniFile.UpdateFile;
end;

{ ��������� ��������� �� INI-����� }

procedure TResource.LoadEnvironmentInfo;
var
  DefaultDir: string;
begin
  { FontSize }
  if IniFile.ValueExists('COMMON', 'FontSize') then
    FontSize := IniFile.ReadInteger('COMMON', 'FontSize', DEFAULT_FONT_SIZE)
  else
    FontSize := DEFAULT_FONT_SIZE;
  { ThousandSeparator }
  { ����������� ����� �������� ������ ��� �����, �.�. ��� �������� �
    ini-����� ���� �������� � ������� �������� � ������ � ����� ������ �,
    ���� ������������ �������� ������, �� ��� �� ������ }
  if IniFile.ValueExists('COMMON', 'ThousandSeparator') then
    ModuleInfo.ThousandSeparator := Chr(IniFile.ReadInteger('COMMON', 'ThousandSeparator', Ord(DEFAULT_THOUSAND_SEPARATOR)))
  else
    ModuleInfo.ThousandSeparator := DEFAULT_THOUSAND_SEPARATOR;
  FormatSettings.ThousandSeparator := ModuleInfo.ThousandSeparator;
  { TempDir }
  DefaultDir := ModuleInfo.AppDir + 'Temp\';
  if IniFile.ValueExists('COMMON', 'TempDir') then
    ModuleInfo.TempDir := IniFile.ReadString('COMMON', 'TempDir', DefaultDir)
  else
    ModuleInfo.TempDir := DefaultDir;
  if not CreateDirIfNotExists(ModuleInfo.TempDir) then
    DialogStop(Format('���������� ������� ������� "%s"', [ModuleInfo.TempDir]));
  { BeaconInterval }
  if IniFile.ValueExists('COMMON', 'RequestAutoRefresh') then
    RequestAutoRefresh := IniFile.ReadInteger('COMMON', 'RequestAutoRefresh', 3)
  else
    RequestAutoRefresh := 3;

  { CheckUpdates }
  if IniFile.ValueExists('COMMON', 'CheckUpdates') then
    FCheckUpdates := IniFile.ReadBool('COMMON', 'CheckUpdates', TRUE)
  else
    FCheckUpdates := TRUE;

  { UpdateFolderURL }
  if IniFile.ValueExists('PATH', 'UpdateFolderURL') then
    FUpdateFolderURL := IniFile.ReadString('PATH', 'UpdateFolderURL', '')
  else
    FUpdateFolderURL := '';

  { UpdateDownloadURL }
  if IniFile.ValueExists('PATH', 'UpdateDownloadURL') then
    FUpdateDownloadURL := IniFile.ReadString('PATH', 'UpdateDownloadURL', '')
  else
    FUpdateDownloadURL := '';
end;


// ��������� ������������ ���� ����������
procedure TResource.LoadFormSettings;
var
  cr: TCursor;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    FormSettings := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuery, 'appform_permit_get', ['0','',Resource.sessionInfo.token_id]);
   //FormSettings := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuery, 'appform_get', ['0','','~NULL::bgl.appforms']);

   // ������������ ���������� ���������
    InitCommonDbData;
  finally
    Screen.Cursor := cr;
  end;
end;

procedure TResource.EmbedFormInPanel(TheForm : TForm; ThePanel : TWinControl; ShowForm: Boolean);
begin
  with TheForm do
  begin
    //ParentFont := True;
    Parent := ThePanel;
    Align := alClient;
    //Color := ThePanel.Color;
    BorderIcons := [];
    BorderStyle := bsNone;
    if ShowForm then
    begin
      Show;
    end;
  end;
end;

//��������� ����� �������
procedure TResource.CloseEmbeddedForms(ThePanel : TcxTabSheet);
var
  Index : Integer;
begin
  for Index := 0 to ThePanel.ControlCount - 1 do
  begin
    if ThePanel.Controls[Index] is TForm then
    begin
      TForm(ThePanel.Controls[Index]).Close;
      TForm(ThePanel.Controls[Index]).Release;
    end;
  end;
end;

procedure TResource.cxDatePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  DateEdit: TcxDateEdit;
  Value: TDateTime;
begin
  Assert(Sender is TcxDateEdit);
  if not (Sender is TcxDateEdit)
   then Exit;

  DateEdit := TcxDateEdit(Sender);
  Value := StrToDateDef(DisplayValue, DateEdit.Properties.MinDate);

  if not InRange(Value, DateEdit.Properties.MinDate, DateEdit.Properties.MaxDate) then
  begin
    DisplayValue := EnsureRange(Value, DateEdit.Properties.MinDate, DateEdit.Properties.MaxDate);
    DateEdit.EditValue := DisplayValue;
  end;

  Error := False;
  ErrorText := '';
end;

{ ��������� ��������� � INI-����� }

procedure TResource.SaveEnvironmentInfo;
begin
  IniFile.WriteString('COMMON', 'TempDir', ModuleInfo.TempDir);
  IniFile.WriteInteger('COMMON', 'FontSize', FontSize);
  { ����������� ����� �������� ������ ��� �����, �.�. ��� �������� �
    ini-����� ���� �������� � ������� �������� � ������ � ����� ������ �,
    ���� ������������ �������� ������, �� ��� �� ������ }
  IniFile.WriteInteger('COMMON', 'ThousandSeparator', Ord(ModuleInfo.ThousandSeparator));
  IniFile.UpdateFile;
end;

{ ------------------ }
{ --- Properties --- }
{ ------------------ }

{ BeaconInterval }

function TResource.GetRequestAutoRefresh: Integer;
begin
  Result := FRequestAutoRefresh;
end;

//������� ��� �������� ������������� DbData � ������ TCommonDbData (����� �����������)
function TResource.CheckCommonDbData(pArrDbData: array of String): boolean;
var
   FContext: TRttiContext;
   FType   : TRttiType;
   FProp   : TRttiProperty ;
   Index, i   : Integer;
   f: TForm;
begin
   Result := True;
   SetLength(gArrDbData,Length(pArrDbData));
   for i := 0 to Length(pArrDbData) - 1 do
   begin
     gArrDbData[i]:= pArrDbData[i];
   end;
    try
      FContext := TRttiContext.Create;
      FType := FContext.GetType(Resource.CommonDbData.ClassType);
      CntArrDbData := Length(pArrDbData);
      for FProp in FType.GetProperties do
      begin
        if Length(pArrDbData) > 0 then
        begin
          for Index := 0 to Length(pArrDbData) - 1 do
            if pArrDbData[Index] = copy(FProp.Name,2,Length(FProp.Name)-1) then
              if FProp.GetValue(Resource.CommonDbData).IsEmpty then
              begin
                f := CreateForm('TfrmProgressBar', 'frmProgressBar', nil, False, False, 0, Tform(TfrmProgressBar));
                f.ShowModal;
              end;
        end
        else
          if FProp.GetValue(Resource.CommonDbData).IsEmpty then
          begin
            frmProgressBar.ShowModal;
          end;
      end;
    finally
      FContext.free;
    end;
end;

//������� ��� �������� ������������� DbData � ������ TCommonDbData (����� �����������)
function TResource.CheckCommonDbData(pArrDbData: array of TDBData): boolean;
var
  Index   : Integer;
begin
   Result := True;
   if Length(pArrDbData) = 0 then
     Result := CheckCommonDbData(StringArray)
   else
   for Index := 0 to Length(pArrDbData) - 1 do
    if not Assigned(pArrDbData[Index]) then
    begin
      Result := False;
      Exit;
    end;
end;

//������� ��� ��������� � ������ Handle-�� � ������
function TResource.GetArrHandleDBData(Index: integer): THandle;
begin
 if (Index >= Length(ArrHandles))then
   Setlength(ArrHandles, Index + 1);
  Result := ArrHandles[Index];
end;

procedure TResource.SetArrHandleDBData(Index: integer; const Value: THandle);
begin
  ArrHandles[Index]:= Value;
end;

procedure TResource.SetArrHandleDBData(const Value: THandle);
begin
  Setlength(ArrHandles, Length(ArrHandles)+1);
  ArrHandles[Length(ArrHandles)-1]:= Value;
end;

// ������������� ���������� ���������
procedure TResource.InitCommonDbData;
begin
{  if not Assigned(CommonDbData) then
    CommonDbData := TCommonDbData.Create;    }

//  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbStorageEmployees, Resource.sessionInfo,
//                                               TDBHTTP.TypeRequest,
//                                               TDBHTTP.TypeQuery,
//                                               'storage_employees_user_org_get',
//                                               [Resource.sessionInfo.token_id, '~NULL', '~NULL', '~NULL', '~NULL', '~NULL']).Handle);
//
 { SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbStoragesLeave, Resource.sessionInfo,
                                               TDBHTTP.TypeRequest,
                                               TDBHTTP.TypeQuery,
                                               'cmb_storages_get',
                                               [Resource.sessionInfo.token_id, '', '', '']).Handle);

  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbStoragesCounterparty, Resource.sessionInfo,
                                               TDBHTTP.TypeRequest,
                                               TDBHTTP.TypeQuery,
                                               'cmb_storages_counterparty_get',
                                               [Resource.sessionInfo.token_id]).Handle);   }

//  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbDocStorageTypeActivity, Resource.sessionInfo,
//                                               TDBHTTP.TypeRequest,
//                                               TDBHTTP.TypeQuery,
//                                               'cmb_doc_storage_type_activitys_get',
//                                               [Resource.sessionInfo.token_id, '', '', '']).Handle);
 {
 SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbDocStorageTypeActivity, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
   'SELECT ' +
   'dsta.doc_storage_type_activity_id, ' +
   'dsta.full_name, ' +
   'dsta.short_name ' +
   ' FROM ' +
   'bgl.doc_storage_type_activity AS dsta; ', []).Handle);
                                                             }
//  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbActivityKinds, Resource.sessionInfo,
//                                               TDBHTTP.TypeRequest,
//                                               TDBHTTP.TypeQuery,
//                                               'cmb_activity_kinds_get',
//                                               [Resource.sessionInfo.token_id, '', '', '']).Handle);

{ SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbActivityKinds, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
   'SELECT ' +
   'ak.activity_kind_id, ' +
   'ak.full_name, ' +
   'ak.short_name ' +
   ' FROM ' +
   'bgl.activity_kinds AS ak; ', []).Handle);   }
   {
   SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbStatus, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
   'SELECT ' +
   's.id, ' +
   's.name ' +
   ' FROM ' +
   'v_status AS s; ', []).Handle);
                           }
//  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbWoodDocTypes, Resource.sessionInfo,
//                                               TDBHTTP.TypeRequest,
//                                               TDBHTTP.TypeQuery,
//                                               'cmb_wooddoc_types_get',
//                                               [Resource.sessionInfo.token_id, '', '', '']).Handle);
{SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbWoodDocTypes, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
   'SELECT ' +
   'wt.wooddoc_type_id, ' +
   'wt.full_name, ' +
   'wt.short_name ' +
   ' FROM ' +
   'bgl.wooddoc_types AS wt; ', []).Handle);    }



//  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbOrgUse, Resource.sessionInfo,
//                                               TDBHTTP.TypeRequest,
//                                               TDBHTTP.TypeQuery,
//                                               'organizations_get',
//                                               [Resource.sessionInfo.token_id, 'A.is_deleted~A.is_blocked', 'false~false', '=~=', '~FALSE', '~NULL']).Handle);

 { SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbOrganization, Resource.sessionInfo,
                                                TDBHTTP.TypeRequest,
                                                TDBHTTP.TypeQuery,
                                          'cmb_organizations_get',
                                          [Resource.sessionInfo.token_id,'A.is_deleted~A.is_blocked','false~false','=~=', 'False', 'True', '~NULL']).Handle);

                                                                          }
//  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbWooddocTypePermitUse, Resource.sessionInfo,
//                                               TDBHTTP.TypeRequest,
//                                               TDBHTTP.TypeQuery,
//                                               'sprav_get',
//                                               ['bgl.wooddoc_types_permit', Resource.sessionInfo.token_id, '~NULL::bgl.wooddoc_types_permit']).Handle);
          {

SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbWooddocTypePermitUse, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
          'SELECT ' +
           'wooddoc_type_permit_id, ' +
           'full_name, ' +
           'short_name ' +
          'FROM ' +
           'wooddoc_types_permit AS wtp;', []).Handle);   }

//  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbFellingTypes, Resource.sessionInfo,
//                                               TDBHTTP.TypeRequest,
//                                               TDBHTTP.TypeQuery,
//                                               'felling_types_get',
//                                               [Resource.sessionInfo.token_id, '(A.date_off is NULL) or A.date_off~parent_id', 'current_date~NULL', '>~is not', '~False', '0']).Handle);
//
   {
SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbFellingTypes, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
      'SELECT ' +
        'ft.felling_type_id, ' +
        ' ft.parent_id, ' +
        ' ft.full_name, ' +
        ' ft.short_name ' +
      'FROM ' +
       'bgl.felling_types AS ft;', []).Handle);
                                                   }



//  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbCuttingTypes, Resource.sessionInfo,
//                                               TDBHTTP.TypeRequest,
//                                               TDBHTTP.TypeQuery,
//                                               'felling_types_get',
//                                               [Resource.sessionInfo.token_id, '(A.date_off is NULL) or A.date_off', 'current_date', '>', '~False', '0']).Handle);
   {
SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbCuttingTypes, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
          'SELECT ' +
           'ft.felling_type_id, ' +
           'ft.parent_id, ' +
           'ft.full_name, ' +
           'ft.short_name ' +
          'FROM ' +
           'bgl.felling_types AS ft;', []).Handle);    }
       {
  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbDepartments, Resource.sessionInfo,
                                               TDBHTTP.TypeRequest,
                                               TDBHTTP.TypeQuery,
                                               'cmb_departments_get',
                                               [Resource.sessionInfo.token_id,
                                                'A.is_work',
                                                'true',
                                                '=',
                                                'True',
                                                '~NULL'
                                                ]).Handle);

  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbCuttingAreas, Resource.sessionInfo,
                                               TDBHTTP.TypeRequest,
                                               TDBHTTP.TypeQuery,
                                               'cmb_cutting_areas_get',
                                               [Resource.sessionInfo.token_id,
                                                'A.cutting_areas_status_id',
                                                '3',
                                                '<',
                                                '~False',
                                                '']).Handle);

  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbHigherDepartments, Resource.sessionInfo,
                                               TDBHTTP.TypeRequest,
                                               TDBHTTP.TypeQuery,
                                               'cmb_higher_departments_get',
                                               [Resource.sessionInfo.token_id,
                                                'A.is_work',
                                                'true',
                                                '=']).Handle);

  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbFirstDepartments, Resource.sessionInfo,
                                               TDBHTTP.TypeRequest,
                                               TDBHTTP.TypeQuery,
                                               'cmb_first_level_departments_get',
                                               [Resource.sessionInfo.token_id,
                                                'A.is_work',
                                                'true',
                                                '=']).Handle);

  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbSecondDepartments, Resource.sessionInfo,
                                               TDBHTTP.TypeRequest,
                                               TDBHTTP.TypeQuery,
                                               'cmb_second_level_departments_get',
                                               [Resource.sessionInfo.token_id,
                                                'A.is_work',
                                                'true',
                                                '=']).Handle);
                                                }
//  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbSortiment, Resource.sessionInfo,
//                                             TDBHTTP.TypeRequest,
//                                             TDBHTTP.TypeQuery,
//                                             'sprav_get',
//                                             ['bgl.v_wood_classes',Resource.sessionInfo.token_id,'~NULL::bgl.v_wood_classes']).Handle);

                   {
SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbSortiment, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
 'SELECT ' +
   'wc.wood_class_id, '+
   'wc.full_name, ' +
   'wc.short_name, ' +
   'wc.lenght_min, ' +
   'wc.lenght_max, ' +
   'wc.sort_onoff, ' +
   'wc.industr_fire, ' +
   'dvm.determining_volume_metod_id, ' +
   'dvm.short_name AS dvm_short_name ' +
  'FROM wood_classes wc ' +
  'LEFT JOIN determining_volume_metods dvm ON dvm.determining_volume_metod_id = wc.determining_volume_metod_id;', []).Handle);
                       }
//  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbPoroda, Resource.sessionInfo,
//                                          TDBHTTP.TypeRequest,
//                                          TDBHTTP.TypeQuery,
//                                          'wood_group_types_get',
//                                          [Resource.sessionInfo.token_id,'','','']).Handle);
               {
SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbPoroda, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
              'SELECT ' +
               'wgt.wood_group_type_id, ' +
               'wgt.parent_id, ' +
               'wgt.full_name, ' +
               'wgt.short_name ' +
              'FROM bgl.wood_group_types AS wgt;', []).Handle);
                       }
//   SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbPost, Resource.sessionInfo,
//                                        TDBHTTP.TypeRequest,
//                                        TDBHTTP.TypeQuery,
//                                        'posts_get',
//                                        [Resource.sessionInfo.token_id, 'A.date_block', '~NULL', 'is', '~NULL']).Handle);
              {
SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbPost, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
              'SELECT ' +
               'p.post_id, ' +
               'p.parent_id, ' +
               'p.full_name, ' +
               'p.short_name ' +
              'FROM bgl.posts AS p;', []).Handle);
                                                      }
  ////
////   SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbNomenclature, Resource.sessionInfo,
////                                                TDBHTTP.TypeRequest,
////                                                TDBHTTP.TypeQuery,
////                                                'nomenclature_get',
////                                                [Resource.sessionInfo.token_id,'~NULL','~NULL','~NULL','~NULL','~NULL','~NULL','~NULL','~NULL','~NULL']).Handle);

//   SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbWoodProdCat, Resource.sessionInfo,
//                                               TDBHTTP.TypeRequest,
//                                               TDBHTTP.TypeQuery,
//                                               'sprav_get',
//                                               ['bgl.v_wood_product_categories',
//                                                Resource.sessionInfo.token_id,
//                                                '~NULL::bgl.v_wood_product_categories']).Handle);
                 {
SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbWoodProdCat, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
      'SELECT ' +
        'wpc.wood_product_category_id, ' +
        'wpc.full_name, ' +
        'wpc.short_name ' +
      'FROM ' +
       'wood_product_categories AS wpc;', []).Handle);
                    }



//   SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbWoodDiamGroups, Resource.sessionInfo,
//                                        TDBHTTP.TypeRequest,
//                                        TDBHTTP.TypeQuery,
//                                        'sprav_get',
//                                        ['bgl.v_wooddiam_groups',
//                                         Resource.sessionInfo.token_id,
//                                        '~NULL::bgl.v_wooddiam_groups']).Handle);
                  {
  SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbWoodDiamGroups, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
      'SELECT ' +
       'wg.wooddiam_group_id, ' +
       'wg.full_name, ' +
       'wg.wood_diam_min, ' +
       'wg.wood_diam_max ' +
      'FROM ' +
       'wooddiam_groups AS wg;', []).Handle);
                   }


//
//   SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbWoodDiams, Resource.sessionInfo,
//                                        TDBHTTP.TypeRequest,
//                                        TDBHTTP.TypeQuery,
//                                        'sprav_get',
//                                        ['bgl.v_wood_diams',
//                                         Resource.sessionInfo.token_id,
//                                        '~NULL::bgl.v_wood_diams']).Handle);

                {
  SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbWoodDiams, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
      'SELECT ' +
       'wd.wood_diam_id, ' +
       'wd.full_name, ' +
       'wd.short_name, ' +
       'wd.value_diam ' +
      'FROM ' +
       'wood_diams AS wd;', []).Handle);
                           }

//   SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbDocStorageTypes, Resource.sessionInfo,
//                                           TDBHTTP.TypeRequest,
//                                           TDBHTTP.TypeQuery,
//                                           'sprav_get',
//                                           ['bgl.doc_storage_types',
//                                           Resource.sessionInfo.token_id,
//                                          '~NULL::bgl.doc_storage_types']).Handle);
                       {
 SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbDocStorageTypes, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
    'SELECT ' +
         'dst.doc_storage_type_id, ' +
         'dst.full_name, ' +
         'dst.short_name, ' +
         'dst.code_doc_storage ' +
      'FROM ' +
         'doc_storage_types dst;', []).Handle);
                              }



//
//   SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbWoodLength, Resource.sessionInfo,
//                                            TDBHTTP.TypeRequest,
//                                            TDBHTTP.TypeQuery,
//                                            'sprav_get',
//                                            ['bgl.v_lengths',
//                                             Resource.sessionInfo.token_id,
//                                            '~NULL::bgl.v_lengths']).Handle);
                       {
   SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbWoodLength, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
      'SELECT ' +
       'l.length_id, ' +
       'l.short_name ' +
      'FROM ' +
       'lengths AS l;', []).Handle);
                                    }


//  SetArrHandleDBData(TDBDataThread.Create(CommonDbData.dbBasisDocumentTypes, Resource.sessionInfo,
//                                          TDBHTTP.TypeRequest,
//                                          TDBHTTP.TypeQuery,
//                                          'sprav_get',
//                                          ['bgl.basis_document_types',
//                                          Resource.sessionInfo.token_id,
//                                          '~NULL::bgl.basis_document_types']).Handle);

                                   {
   SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbBasisDocumentTypes, Resource.sessionInfo,
                                              TDBHTTP.TypeRequest,
                                              TDBHTTP.TypeQuerySQL,
      'SELECT ' +
       'bdt.basis_document_type_id, ' +
       'bdt.short_name, '+
       'bdt.full_name ' +
      'FROM '+
      'basis_document_types AS bdt;', []).Handle);



  SetArrHandleDBData(TDBDataThread.Create( CommonDbData.dbDocStorageStatus, Resource.sessionInfo,
                                                   TDBHTTP.TypeRequest,
                                                   TDBHTTP.TypeQuerySQL,
                                                   'SELECT doc_storage_status_id, doc_storage_status_name FROM v_doc_storage_status;', []).Handle);
                                                 }
//  application.MessageBox(PChar('CommonDbData.dbDepartments: ' + IntToStr(CommonDbData.dbDepartments.DataSet.RecordCount)),'RC',MB_ICONINFORMATION + MB_OK);
end;

procedure TResource.SetRequestAutoRefresh(const pRequestAutoRefresh: Integer);
begin
  FRequestAutoRefresh := pRequestAutoRefresh;
end;

procedure TResource.ZConnBeforeConnect(Sender: TObject);
begin
  {sharaif Assigned(fmMain) then
    MessageInfo('�����... ��������������� ���������� � ��');  }
  inherited;
end;

{ FontSize }
function TResource.GetFontSize: Integer;
begin
  Result := FFontSize;
end;

function TResource.GetFormSettings(pIdForm: integer): string;
begin
  if ( FormSettings.DataSet.Locate('appform_id', pIdForm, [loCaseInsensitive])) then
    result := FormSettings.DataSet.FieldByName('form_xml').AsString;
end;

 // ��������� ������ �����
function TResource.GetFormClass(pNameForm: string): string;
begin
  FormSettings.DataSet.DisableControls;
  if ( FormSettings.DataSet.Locate('form_name', pNameForm, [loCaseInsensitive])) then
    result := FormSettings.DataSet.FieldByName('form_class').AsString;
  FormSettings.DataSet.EnableControls;
end;

function TResource.GetFormSettings(pNameForm: string): string;
begin
  if ( FormSettings.DataSet.Locate('form_name', pNameForm, [loCaseInsensitive])) then
    result := FormSettings.DataSet.FieldByName('form_xml').AsString;
end;

function TResource.SetFormSettingsXML(pNameForm: string; pXML: string): boolean;
begin
 Result:= False;
  if ( FormSettings.DataSet.Locate('form_name', pNameForm, [loCaseInsensitive])) then
  begin
    FormSettings.DataSet.Edit;
    FormSettings.DataSet.FieldByName('form_xml').AsString := pXML;
    FormSettings.DataSet.Post;
    Result := True;
  end;
end;

procedure TResource.SetFontSize(const pFontSize: Integer);
var
  Index: Integer;
begin
  if pFontSize < MIN_FONT_SIZE then
    FFontSize := MIN_FONT_SIZE
  else if pFontSize > MAX_FONT_SIZE then
    FFontSize := MAX_FONT_SIZE
  else
    FFontSize := pFontSize;
  for Index := 0 to cxStyleRepository.Count - 1 do
    TcxStyle(cxStyleRepository.Items[Index]).Font.Size := pFontSize;
end;

//�������� ������ ���������
function TResource.GetBuildInfo(FileName: string; var V1, V2, V3, V4: word): boolean;
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  if VerInfoSize > 0 then
  begin
      GetMem(VerInfo, VerInfoSize);
      try
        if GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, VerInfo) then
        begin
          VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
          with VerValue^ do
          begin
            V1 := dwFileVersionMS shr 16;
            V2 := dwFileVersionMS and $FFFF;
            V3 := dwFileVersionLS shr 16;
            V4 := dwFileVersionLS and $FFFF;
          end;
        end;
      finally
        FreeMem(VerInfo, VerInfoSize);
      end;
      Result := True;
  end
  else
    Result := False;
end;

//���������� ������ ��������� ����������� � ������
function TResource.GetBuildInfoAsString(FileName: string): string;
var
  V1, V2, V3, V4: word;
begin
  if GetBuildInfo(FileName, V1, V2, V3, V4) then
  begin
    Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' + IntToStr(V3) + '.' + IntToStr(V4);
  end
  else
    Result:='------';
end;


//�������� �������� ������ �����
function TResource.GetFileVersion(FileName: string; var VerInfo : TVSFixedFileInfo): boolean;
var
  VerInfoSize, puLen: DWORD;
  Pt, InfoPtr: Pointer;
begin
  VerInfoSize := GetFileVersionInfoSize( PChar(FileName), puLen );
  FillChar(VerInfo, SizeOf(TVSFixedFileInfo), 0);
  if VerInfoSize > 0 then
  begin
    GetMem(Pt, VerInfoSize);
    GetFileVersionInfo( PChar(FileName), 0, VerInfoSize, Pt);
    VerQueryValue(Pt,'\',InfoPtr,puLen);
    Move(InfoPtr^, VerInfo, sizeof(TVSFixedFileInfo) );
    FreeMem(Pt);
    Result := True;
  end
  else
    Result := False;
end;

//���������� ������ ��������� ����������� � ������
function TResource.GetFileVersionAsString(FileName:string): string;
var
  VerInfo : TVSFixedFileInfo;
begin
  if GetFileVersion(FileName, VerInfo) then
    Result:=Format('%u.%u.%u.%u',[HiWord(VerInfo.dwProductVersionMS), LoWord(VerInfo.dwProductVersionMS),
      HiWord(VerInfo.dwProductVersionLS), LoWord(VerInfo.dwProductVersionLS)])
  else
    Result:='------';
end;


procedure TResource.SetTimerAdd(f: TFilterProcAdd; Interval: Integer = 1050);
begin
  GFilterProcAdd := f;
  if Tc = 0 then old_interval := TimerFilter.Interval;
  Tc := GetTickCount;
  new_interval := Interval;
  if TimerFilter.Interval <> new_interval then
    TimerFilter.Interval := new_interval;
  if not TimerFilter.Enabled then TimerFilter.Enabled := true;

end;


procedure TResource.TimerFilterTimer(Sender: TObject);
begin
  inherited;
  Tc2 := GetTickCount;

  if Tc > 0 then
  begin
    if (Tc2 - Tc) >= TimerFilter.Interval then
    begin
      Tc := 0;
      TimerFilter.Interval := old_interval;
      GFilterProcAdd;
    end;
  end;

  if Assigned(GFilterProc) then begin
    TimerFilter.Enabled := False;
    GFilterProc;
    GFilterProc := nil;
  end;
end;


procedure TResource.LPropertiesInitPopup(Sender: TObject);

    procedure AutoSizeColLocap(BoxProperties: TcxLookupComboBoxProperties);
    var
      i, j, W, WMax: integer;
      f_w: integer;
      key_field: integer;
      Canvas: TCanvas;
      len: integer;
    begin
      if BoxProperties.Grid.DataSource.DataSet=nil then exit;
      if not BoxProperties.Grid.DataSource.DataSet.Active then exit;
      if not BoxProperties.Grid.DataSource.DataSet.RecordCount = 0 then exit;
      if BoxProperties.Grid.Columns.Count = 0 then exit;

      Canvas:=TCanvas.Create;
      f_w := 0;
      try
        Canvas.handle:=GetDC(0);
        key_field := BoxProperties.Grid.DataSource.DataSet.RecNo;

        for i := 0 to (BoxProperties.Grid.Columns.Count - 1) do
        begin
          WMax := 0;
          len:=150;
          BoxProperties.Grid.DataSource.DataSet.DisableControls;
          BoxProperties.Grid.DataSource.DataSet.First;
          for j := 0 to BoxProperties.Grid.DataSource.DataSet.RecordCount - 1 do
          begin
            if BoxProperties.Grid.DataSource.DataSet.FindField(BoxProperties.Grid.Columns[i].FieldName)<>nil then
            begin
                W := Canvas.TextWidth(BoxProperties.Grid.DataSource.DataSet.FieldByName
                  (BoxProperties.Grid.Columns[i].FieldName).asString);
                if W > WMax then
                  WMax := W;
            end;
            BoxProperties.Grid.DataSource.DataSet.Next;
          end;
          BoxProperties.Grid.DataSource.DataSet.RecNo := key_field;
          BoxProperties.Grid.DataSource.DataSet.EnableControls;
          if len<WMax + 20 then
          begin
            BoxProperties.Grid.Columns[i].MinWidth := WMax + 20;
            f_w := f_w + WMax + 20;
          end else
          begin
            f_w := f_w + Len;
          end;
          //f_w := f_w + BoxProperties.Grid.Columns[i].Width;
        end;
      finally
        BoxProperties.DropDownWidth := f_w;
        Canvas.Free;
      end;
    end;

var
  BoxProperties: TcxLookupComboBoxProperties;
begin
  BoxProperties := TcxLookupComboBox(Sender).ActiveProperties;
  AutoSizeColLocap(BoxProperties);
end;



end.










