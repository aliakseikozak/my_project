unit uSQLFunctions;
{ Оболочки SQL-функций ПП "Подомовой учет" }

interface

uses
  uArrays, uBaseResource, uResource, uResourceForms;

{ --------------------- }
{ --- Общесистемные --- }
{ --------------------- }

{ Возвращает значение системного параметра }
function GetParamValue(const pParam: string; const pPeriod: string = ''): Variant;
{ Возвращает имя временной схемы для пользователя }
function GetTempNamespace: string;
{ Возвращает привелегии текущего пользователя на указанную хранимую процедуру
  pFunctionName в формате <schema>.<name>
  Возвращает: TRUE - если пользователь может запустить процедуру, FALSE - если нет }
function GetFunctionPrivil(const pFunctionName: string): Boolean;
{ Возвращает привилегии текущего пользователя на указанную таблицу
  pTableName в формате <schema>.<name>
  Возвращает строку вида DUIS, где каждый символ может быть 0 (запрещено) или 1 (разрешено):
  D - delete, U - update, I - insert, S - select }
function GetTablePrivil(const pTableName: string): string;
{ Проверяет лицензионный ключ }
function LicenseKeyCheck(const pKeyValue: Variant): Integer;
{ Выдает текст сообщения о неоплате техподдержки и интервалы }
procedure TechsupportKeyCheck(const pKeyValue: Variant;
  var pTechsupportMessage: string;
  var pVisibleInterval, pInvisibleInterval: Integer);
{ Сохраняет событие в лог }
procedure SaveEvent(const pTypeEvent, pObjectId, pTypeObject, pMessage: string);
{ Проверяет привилегии пользователя на работу с модулем }
function TestUserModule(const pModuleName: string): Boolean;

{ ------------------- }
{ --- Справочники --- }
{ ------------------- }

{ Возвращает запрос для получения выпадающего списка в стандартном справочнике }
function SpravLookupSQL(const pKeyField, pListField, pListSource: string): string;

{ --------------- }
{ --- Периоды --- }
{ --------------- }

type
  TPeriodInfo = record
    Period, Name: string;
    DateBeg, DateEnd: TDateTime;
    WorkDays: Integer;
  end;

{ Получает информацию о периоде }
procedure GetPeriodInfo(const pPeriod: string; var pPeriodInfo: TPeriodInfo);
{ Получает активный период по подразделению }
function GetPeriodTer(const pTer, pIDTer: Integer): string;
{ Обновляет состояние по подразделению:
  pTer       - уровень подразделения: 3 - ЖРЭО, 2 - ЖЭС
  pIDTer     - ID подразделения
  pFact      - 0 - поановый, 1 - фактический период
  pDirection - -1 - на один месяц назад, 1 - на один месяц вперед }
procedure StateTerUpdate(const pTer, pKod, pFact, pDirection: Integer);
{ Готовит сводную таблицу для формирования данных для квитанций
  pPeriod    - период
  pTer       - уровень подразделения: 3 - ЖРЭО, 2 - ЖЭС, 1 - дом
  pIDTer     - ID подразделения / дома
  }

procedure PeriodAdd(const pYear: Boolean);

{ ------------------ }
{ --- Сотрудники --- }
{ ------------------ }

type
  TKadrInfo = record
    IDKadr: Integer;
    FIO, DolgnName: string;
  end;

{ Получает информацию о руководителе подразделения }
function GetChiefInfo(const pTer, pIDTer: Integer; var pKadrInfo: TKadrInfo): Boolean;
{ Получает информацию о бригадире участка/бригады на определенную дату }
function GetBrigadirInfo(const pIDSite: Integer; const pDate: TDateTime; var pKadrInfo: TKadrInfo): Boolean;
{ Очистка даты увольнения сотрудника }
procedure BKadrUnfire(const pIDKadr: Integer);

{ --------------------- }
{ --- Подразделения --- }
{ --------------------- }

type
  TTerInfo = record
    Ter, IDTer, JREO, JES, Site, IDCompany: Integer;
    JREOName, JESName, SiteName, TerName, CompanyName, ChiefFIO, ChiefDolgn: string;
  end;

{ Получает информацию о подразделении и вышестоящих подразделениях }
procedure GetTerInfo(const pTer, pIDTer: Integer; var pTerInfo: TTerInfo);
{ Удаляет указанное подразделение }
procedure DepartmentDelete(const pTer, pIDTer: Integer);
{ Возвращает строку с именами ЖЭСов через запятую
  pJES - строка с JES, разделенными "," }
procedure GetJESList(const pJES: string; var pJESList: string);

{ ------------------- }
{ --- Организации --- }
{ ------------------- }

type
  TCompanyInfo = record
    IDCompany: Integer;
    Name: string;
    Adres: string;
    Tel: string;
    UNP: string;
  end;

{ Получает информацию об организации }
procedure GetCompanyInfo(const pIDCompany: Integer; var pCompanyInfo: TCompanyInfo);
{ Возвращает строку с именами оргагизаций через запятую
  pIDCompany - строка с IDCompany, разделенными "," }
procedure GetCompanyList(const pIDCompany: string; var pCompanyList: string);

{ ---------------------- }
{ --- Инвентаризация --- }
{ ---------------------- }

type
  TObjectInfo = record
    IDObject: Integer;
    ObjTip: Integer;
    ObjName: string;
    Jreo: Variant;
    JreoName: string;
    Jes: Variant;
    JesName: string;
    TerObj: Variant;
    TerName: string;
    Kodul: Variant;
    UlName: string;
    NDom: Variant;
    Korp: Variant;
    Ind: Variant;
    Adres: string;
  end;

{ Возвращает информацию по объекту }
function GetObjectInfo(const pIDObject: Integer; var pObjectInfo: TObjectInfo): Boolean;
{ Возвращает id головного объекта }
function GetHeadObject(const pIDObject: Integer): Variant;
{ Получает числовое значение атрибута объекта }
{ Возвращает строку с адресами объектов через запятую
  pIDObject - строка с IDObject, разделенными "," }
procedure GetAdresList(const pIDObject: string; var pAdresList: string);

{ -------------- }
{ --- Работы --- }
{ -------------- }

type
  TCatJobInfo = record
    IDCatJob: Integer;
    Name: string;
    IDPoint, IDPointSalary, IDPointMachineSalary, IDPointMachineCost, IDPointMatCost, IDPointTransp: Variant;
    IDPCheckType: Variant;
  end;

  TViddocInfo = record
    IDVidDoc: Integer;
    Name: string;
    Note : String;
    typedoc :integer;
    ter :integer;
    kat :integer;
    shablon : String;
    naradonly : integer;
  end;

  TJobPlanInfo = record
    IDPlan: Integer;
    PlanName: string;
    PeriodBeg, PeriodEnd: string;
    IDCatJob: Integer;
    CatJobName: string;
    JREO: Integer;
    JES: Integer;
    JESName: string;
    IDCompany, IDSite: Variant;
    PerformerName: string;
    SmetFlag: Boolean;
  end;
  TJobPlanListInfo = record
    IDPlan: string;
    CatJobName: string;
    JESName: string;
    SiteName: string;
  end;


{ -------------- }
{ --- Наряды --- }
{ -------------- }

type
  TNaradInfo = record
    IDNarad: Integer;
    IDCatJob: Integer;
    CatJobName: string;
    Period: string;
    PeriodName: string;
    DateBeg: TDateTime;
    DateEnd: TDateTime;
    JREO: Integer;
    JREOName: string;
    JES: Integer;
    JESName: string;
    IDSite: Variant;
    SiteName: string;
    IDKadr: Variant;
    FIO: string;
    JobsZTrud: Double;
    TabelZTrud: Double;
  end;

{ ---------------------------------------------------------------------------- }

implementation

uses
  SysUtils, Variants, RXStrUtils, DB;

procedure GetPeriodInfo(const pPeriod: string; var pPeriodInfo: TPeriodInfo);
const
  SQL_GET_PERIOD_INFO: string =
  'SELECT period, name, datebeg, dateend, workdays ' +
  'FROM ihsb.speriod ' +
  'WHERE period = :PPERIOD';
begin
  if Resource.ExecSQLSimple(SQL_GET_PERIOD_INFO, 'PPERIOD', [pPeriod]) <> 1 then
    raise Exception.CreateFmt('Период (%s) не найден', [pPeriod]);
  pPeriodInfo.Period := Resource.qryRun.FieldByName('period').AsString;
  pPeriodInfo.Name := Resource.qryRun.FieldByName('name').AsString;
  pPeriodInfo.DateBeg := Resource.qryRun.FieldByName('datebeg').AsDateTime;
  pPeriodInfo.DateEnd := Resource.qryRun.FieldByName('dateend').AsDateTime;
  pPeriodInfo.WorkDays := Resource.qryRun.FieldByName('workdays').AsInteger;
end;

function GetChiefInfo(const pTer, pIDTer: Integer; var pKadrInfo: TKadrInfo): Boolean;
const
  SQL_GET_JREO_CHIEF: string =
  'SELECT vk.idkadr, vk.fio, vk.dolgnname ' +
  'FROM gf.sjreo AS sj INNER JOIN gf.v_kadr AS vk ON sj.idkadr = vk.idkadr ' +
  'WHERE sj.jreo = :PJREO';
  SQL_GET_JES_CHIEF: string =
  'SELECT vk.idkadr, vk.fio, vk.dolgnname ' +
  'FROM gf.sjes AS sj INNER JOIN gf.v_kadr AS vk ON sj.idkadr = vk.idkadr ' +
  'WHERE sj.jes = :PJES';
  SQL_GET_SITE_CHIEF: string =
  'SELECT vk.idkadr, vk.fio, vk.dolgnname ' +
  'FROM ihsb.ssite AS ss INNER JOIN gf.v_kadr AS vk ON ss.idkadr = vk.idkadr ' +
  'WHERE ss.idsite = :PIDSITE';
begin
  if pTer = 3 then
    Result := Resource.ExecSQLSimple(SQL_GET_JREO_CHIEF, 'PJREO', [pIDTer]) = 1
  else if pTer = 2 then
    Result := Resource.ExecSQLSimple(SQL_GET_JES_CHIEF, 'PJES', [pIDTer]) = 1
  else if pTer = 1 then
    Result := Resource.ExecSQLSimple(SQL_GET_SITE_CHIEF, 'PIDSITE', [pIDTer]) = 1
  else
    Result := FALSE;
  if Result then
  begin
    pKadrInfo.IDKadr := Resource.qryRun.FieldByName('idkadr').AsInteger;
    pKadrInfo.FIO := Resource.qryRun.FieldByName('fio').AsString;
    pKadrInfo.DolgnName := Resource.qryRun.FieldByName('dolgnname').AsString;
  end;
end;

function GetBrigadirInfo(const pIDSite: Integer; const pDate: TDateTime; var pKadrInfo: TKadrInfo): Boolean;
const
  SQL_GET_SITE_BRIGADIR: string =
  'SELECT vk.idkadr, vk.fio, vk.dolgnname ' +
  'FROM ihsb.bdepkadr AS bdk INNER JOIN gf.v_kadr AS vk ON bdk.idkadr = vk.idkadr ' +
  'WHERE (bdk.ter = 1) AND (bdk.idter = :PIDSITE) AND bdk.brigadir AND ' +
  '(bdk.datein <= :PDATE) AND ((bdk.dateout IS NULL) OR (bdk.dateout >= :PDATE)) ' +
  'ORDER BY dateout DESC NULLS FIRST ' +
  'LIMIT 1';
begin
  Result := Resource.ExecSQLSimple(SQL_GET_SITE_BRIGADIR, 'PIDSITE;PDATE', [pIDSite, pDate]) = 1;
  if Result then
  begin
    pKadrInfo.IDKadr := Resource.qryRun.FieldByName('idkadr').AsInteger;
    pKadrInfo.FIO := Resource.qryRun.FieldByName('fio').AsString;
    pKadrInfo.DolgnName := Resource.qryRun.FieldByName('dolgnname').AsString;
  end;
end;

procedure GetTerInfo(const pTer, pIDTer: Integer; var pTerInfo: TTerInfo);
const
  SQL_GET_TER_INFO: string =
  'SELECT vt.jreo, sjr.name AS jreoname, ' +
  'vt.jes, sjs.name AS jesname, ' +
  'vt.site, ss.name AS sitename, ' +
  'vt.factidcompany AS idcompany, bc.name AS companyname, ' +
  'vk.fam||'' ''||substr(vk.name,1,1)||''.''||substr(vk.mname,1,1)||''.'' as chiefFIO, vk.dolgnname as chiefDolgn ' +
  'FROM gf.v_terobj AS vt ' +
  'INNER JOIN gf.sjreo AS sjr ON vt.jreo = sjr.jreo ' +
  'INNER JOIN gf.bcompany AS bc ON vt.factidcompany = bc.idcompany ' +
  'LEFT OUTER JOIN gf.sjes AS sjs ON vt.jes = sjs.jes ' +
  'LEFT OUTER JOIN ihsb.ssite AS ss ON vt.site = ss.idsite ' +
  'LEFT OUTER JOIN gf.v_kadr vk on (vt.idkadr = vk.idkadr) '+
  'WHERE (vt.ter = :PTER) AND (vt.kod = :PIDTER) ';
begin
  if Resource.ExecSQLSimple(SQL_GET_TER_INFO, 'PTER;PIDTER', [pTer, pIDTer]) <> 1 then
    raise Exception.CreateFmt('Подразделение (%d, %d) не найдено', [pTer, pIDTer]);
  pTerInfo.JREO := Resource.qryRun.FieldByName('jreo').AsInteger;
  pTerInfo.JREOName := Resource.qryRun.FieldByName('jreoname').AsString;
  pTerInfo.JES := Resource.qryRun.FieldByName('jes').AsInteger;
  pTerInfo.JESName := Resource.qryRun.FieldByName('jesname').AsString;
  pTerInfo.Site := Resource.qryRun.FieldByName('site').AsInteger;
  pTerInfo.SiteName := Resource.qryRun.FieldByName('sitename').AsString;
  pTerInfo.IDCompany := Resource.qryRun.FieldByName('idcompany').AsInteger;
  pTerInfo.CompanyName := Resource.qryRun.FieldByName('companyname').AsString;
  pTerInfo.Ter := pTer;
  pTerInfo.IDTer := pIDTer;
  pTerInfo.ChiefFIO := Resource.qryRun.FieldByName('chiefFIO').AsString;
  pTerInfo.ChiefDolgn := Resource.qryRun.FieldByName('chiefDolgn').AsString;

  case pTer of
    3: pTerInfo.TerName := pTerInfo.JREOName;
    2: pTerInfo.TerName := pTerInfo.JESName;
    1: pTerInfo.TerName := pTerInfo.SiteName;
  end;
end;

function GetParamValue(const pParam: string; const pPeriod: string = ''): Variant;
const
  SQL_GET_PARAM_VALUE: string =
  'SELECT gf.getparamvalue(:PARAM, :PERIOD) AS result';
var
  Period: Variant;
begin
  if pPeriod = '' then
    Period := NULL
  else
    Period := pPeriod;
  if Resource.ExecSQLSimple(SQL_GET_PARAM_VALUE, 'PARAM;PERIOD', [pParam, Period]) = 1 then
    Result := Resource.qryRun.FieldByName('result').AsVariant
  else
    Result := NULL;
end;

function GetHeadObject(const pIDObject: Integer): Variant;
const
  SQL_GET_HEAD_OBJECT: string =
  'SELECT idobject FROM gf.getheadobject(:PIDOBJECT)';
begin
  if Resource.ExecSQLSimple(SQL_GET_HEAD_OBJECT, 'PIDOBJECT', [pIDObject]) = 1 then
    Result := Resource.qryRun.FieldByName('idobject').AsVariant
  else
    Result := NULL;
end;


function LicenseKeyCheck(const pKeyValue: Variant): Integer;
const
  SQL_LICENSE_KEYCHECK: string =
  'SELECT pstate, pmessage, pdatelimit, pdatecurr, parealimit, pareacurr ' +
  'FROM gf.license_keycheck(:PKEYVALUE)';
begin
  Resource.ExecSQLSimple(SQL_LICENSE_KEYCHECK, 'PKEYVALUE', [pKeyValue]);
  Result := Resource.qryRun.FieldByName('pstate').AsInteger;
end;

procedure TechsupportKeyCheck(const pKeyValue: Variant;
  var pTechsupportMessage: string;
  var pVisibleInterval, pInvisibleInterval: Integer);
const
  SQL_TECHSUPPORT_KEYCHECK: string =
  'SELECT pmessage, pvisibletime, pinvisibletime ' +
  'FROM gf.techsupport_keycheck(:PKEYVALUE)';
begin
  Resource.ExecSQLSimple(SQL_TECHSUPPORT_KEYCHECK, 'PKEYVALUE', [pKeyValue]);
  pTechsupportMessage := Resource.qryRun.FieldByName('pmessage').AsString;
  pVisibleInterval := Resource.qryRun.FieldByName('pvisibletime').AsInteger;
  pInvisibleInterval := Resource.qryRun.FieldByName('pinvisibletime').AsInteger;
end;


function GetPeriodTer(const pTer, pIDTer: Integer): string;
const
  SQL_GET_PERIOD_TER: string =
  'SELECT ihsb.getperiodter(:PTER, :PIDTER) AS result';
begin
  Resource.ExecSQLSimple(SQL_GET_PERIOD_TER, 'PTER;PIDTER', [pTer, pIDTer]);
  Result := Resource.qryRun.FieldByName('result').AsString;
end;

procedure StateTerUpdate(const pTer, pKod, pFact, pDirection: Integer);
const
  SQL_STATETER_UPDATE: string =
  'SELECT ihsb.stateter_update(:PTER, :PKOD, :PFACT, :PDIRECTION)';
var
  Svod: Boolean;
begin
  Svod := (pFact = 1) and (pDirection = 1);

  if Svod then
  begin
    MessageInfo('Ждите... выполняется подготовка сводных данных');
    SetCursorWait(TRUE);
  end;
  try
    Resource.ExecSQLSimple(SQL_STATETER_UPDATE, 'PTER;PKOD;PFACT;PDIRECTION', [pTer, pKod, pFact, pDirection]);
  finally
    if Svod then
    begin
      MessageInfo;
      SetCursorWait;
    end;
  end;
end;


procedure DepartmentDelete(const pTer, pIDTer: Integer);
const
  SQL_SDEPARTMENT_DELETE: string =
  'SELECT ihsb.sdepartment_delete(:PTER, :PIDTER)';
begin
  Resource.ExecSQLSimple(SQL_SDEPARTMENT_DELETE, 'PTER;PIDTER', [pTer, pIDTer]);
end;

function GetTempNamespace: string;
const
  SQL_GET_TEMPNAMESPACE: string =
  'SELECT gf.get_tempnamespace() AS result';
begin
  Resource.ExecSQLSimple(SQL_GET_TEMPNAMESPACE, '', []);
  Result := Resource.qryRun.FieldByName('result').AsString;
end;

procedure PeriodAdd(const pYear: Boolean);
const
  SQL_SPERIOD_ADD: string =
  'SELECT ihsb.speriod_add(:PYEAR)';
begin
  Resource.ExecSQLSimple(SQL_SPERIOD_ADD, 'PYEAR', [pYear]);
end;


function GetObjectInfo(const pIDObject: Integer; var pObjectInfo: TObjectInfo): Boolean;
const
  SQL_GET_OBJECT_INFO: string =
  'SELECT va.idobject, ' +
  'va.objtip, sot.objname, ' +
  'va.jreo, vjr.name AS jreoname, ' +
  'va.jes, vjs.name AS jesname, ' +
  'va.terobj, va.tername, ' +
  'va.kodul, va.ulname, ' +
  'va.ndom, va.korp, va.ind, va.adres ' +
  'FROM gf.v_adres AS va ' +
  'INNER JOIN gf.sobjtip AS sot ON va.objtip = sot.objtip ' +
  'LEFT OUTER JOIN gf.v_jreo AS vjr ON va.jreo = vjr.jreo ' +
  'LEFT OUTER JOIN gf.v_jes AS vjs ON va.jes = vjs.jes ' +
  'WHERE va.idobject = :PIDOBJECT';
begin
  Result := Resource.ExecSQLSimple(SQL_GET_OBJECT_INFO, 'PIDOBJECT', [pIDObject]) = 1;
  if Result then
  begin
    pObjectInfo.IDObject := Resource.qryRun.FieldByName('idobject').AsInteger;
    pObjectInfo.ObjTip   := Resource.qryRun.FieldByName('objtip').AsInteger;
    pObjectInfo.ObjName  := Resource.qryRun.FieldByName('objname').AsString;
    pObjectInfo.Jreo     := Resource.qryRun.FieldByName('jreo').AsVariant;
    pObjectInfo.JreoName := Resource.qryRun.FieldByName('jreoname').AsString;
    pObjectInfo.Jes      := Resource.qryRun.FieldByName('jes').AsVariant;
    pObjectInfo.JesName  := Resource.qryRun.FieldByName('jesname').AsString;
    pObjectInfo.TerObj   := Resource.qryRun.FieldByName('terobj').AsVariant;
    pObjectInfo.TerName  := Resource.qryRun.FieldByName('tername').AsString;
    pObjectInfo.Kodul    := Resource.qryRun.FieldByName('kodul').AsVariant;
    pObjectInfo.UlName   := Resource.qryRun.FieldByName('ulname').AsString;
    pObjectInfo.NDom     := Resource.qryRun.FieldByName('ndom').AsVariant;
    pObjectInfo.Korp     := Resource.qryRun.FieldByName('korp').AsVariant;
    pObjectInfo.Ind      := Resource.qryRun.FieldByName('ind').AsVariant;
    pObjectInfo.Adres    := Resource.qryRun.FieldByName('adres').AsString;
  end;
end;


function GetFunctionPrivil(const pFunctionName: string): Boolean;
const
  SQL_GET_FUNCTION_PRIVILEGES: string =
  'SELECT gf.get_function_privileges(:PSCHEMA, :PFUNC) AS result';
var
  Schema, Func: string;
begin
  Result := FALSE;
  Schema := ExtractWord(1, pFunctionName, ['.']);
  Func := ExtractWord(2, pFunctionName, ['.']);
  if Resource.ExecSQLSimple(SQL_GET_FUNCTION_PRIVILEGES, 'PSCHEMA;PFUNC', [Schema, Func]) > 0 then
    while not (Result or Resource.qryRun.Eof) do
    begin
      if Resource.qryRun.FieldByName('result').AsString = 'EXECUTE' then
        Result := TRUE;
      Resource.qryRun.Next;
    end;
end;

function GetTablePrivil(const pTableName: string): string;
const
  SQL_GET_TABLE_PRIVILEGES: string =
  'SELECT gf.get_table_privileges(:PSCHEMA, :PTABLE) AS result';
var
  Schema, Table: string;
begin
  if Length(pTableName) = 0 then
    Result := '1111'
  else
  begin
    Result := '0000';
    Schema := ExtractWord(1, pTableName, ['.']);
    Table := ExtractWord(2, pTableName, ['.']);
    if Resource.ExecSQLSimple(SQL_GET_TABLE_PRIVILEGES, 'PSCHEMA;PTABLE', [Schema, Table]) > 0 then
      while not Resource.qryRun.eof do
      begin
        if Resource.qryRun.FieldByName('result').AsString = 'DELETE' then
          Result[1] := '1'
        else if Resource.qryRun.FieldByName('result').AsString = 'UPDATE' then
          Result[2] := '1'
        else if Resource.qryRun.FieldByName('result').AsString = 'INSERT' then
          Result[3] := '1'
        else if Resource.qryRun.FieldByName('result').AsString = 'SELECT' then
          Result[4] := '1';
        Resource.qryRun.Next;
      end;
  end;
end;

function SpravLookupSQL(const pKeyField, pListField, pListSource: string): string;
const
  SQL_SPRAV_LOOKUPSQL: string =
  'SELECT gf.sprav_lookupsql(:PKEYFIELD, :PLISTFIELD, :PLISTSOURCE) AS result';
begin
  Resource.ExecSQLSimple(SQL_SPRAV_LOOKUPSQL, 'PKEYFIELD;PLISTFIELD;PLISTSOURCE', [pKeyField, pListField, pListSource]);
  Result := Resource.qryRun.FieldByName('result').AsString;
end;


procedure GetAdresList(const pIDObject: string; var pAdresList: string);
const
  SQL_SELECT_ADRES_LIST: string =
  'SELECT STRING_AGG(mainattr, CHR(44) ORDER BY adresorder) AS result ' +
  'FROM gf.v_adres WHERE idobject = ' +
  'ANY(CAST(STRING_TO_ARRAY(:PIDOBJECT, CHR(44)) AS INTEGER[]))';
begin
  Resource.ExecSQLSimple(SQL_SELECT_ADRES_LIST, 'PIDOBJECT', [pIDObject]);
  pAdresList := Resource.qryRun.FieldByName('result').AsString;
end;

procedure GetJESList(const pJES: string; var pJESList: string);
const
  SQL_SELECT_JES_LIST: string =
  'SELECT STRING_AGG(name, CHR(44) ORDER BY jes) AS result FROM gf.sjes ' +
  'WHERE jes = ANY(CAST(STRING_TO_ARRAY(:PJES, CHR(44)) AS INTEGER[]))';
begin
  Resource.ExecSQLSimple(SQL_SELECT_JES_LIST, 'PJES', [pJES]);
  pJESList := Resource.qryRun.FieldByName('result').AsString;
end;

procedure GetCompanyList(const pIDCompany: string; var pCompanyList: string);
const
  SQL_SELECT_COMPANY_LIST: string =
  'SELECT STRING_AGG(name, CHR(44) ORDER BY name) AS result FROM gf.bcompany ' +
  'WHERE idcompany = ANY(CAST(STRING_TO_ARRAY(:PIDCOMPANY, CHR(44)) AS INTEGER[]))';
begin
  Resource.ExecSQLSimple(SQL_SELECT_COMPANY_LIST, 'PIDCOMPANY', [pIDCompany]);
  pCompanyList := Resource.qryRun.FieldByName('result').AsString;
end;


procedure BKadrUnfire(const pIDKadr: Integer);
const
  SQL_BKADR_UNFIRE: string = 'SELECT ihsb.bkadr_unfire(:PIDKADR)';
begin
  Resource.ExecSQLSimple(SQL_BKADR_UNFIRE, 'PIDKADR', [pIDKadr]);
end;

procedure SaveEvent(const pTypeEvent, pObjectId, pTypeObject, pMessage: string);
const
  SQL_SAVE_EVENT: string =
  'SELECT gf.saveevent(:PTYPEEVENT, :POBJECTID, :PTYPEOBJECT, :PMESSAGE)';
begin
  Resource.ExecSQLSimple(SQL_SAVE_EVENT,
    'PTYPEEVENT;POBJECTID;PTYPEOBJECT;PMESSAGE',
    [pTypeEvent, pObjectId, pTypeObject, pMessage]);
end;

function TestUserModule(const pModuleName: string): Boolean;
const
  SQL_USERTESTMODULE: string =
  'SELECT gf.usertestmodule(:PMODULENAME) AS result';
begin
  Result := (Length(pModuleName) = 0) or
  ((Resource.ExecSQLSimple(SQL_USERTESTMODULE, 'PMODULENAME', [pModuleName]) = 1)
  and Resource.qryRun.FieldByName('result').AsBoolean);
end;

procedure GetCompanyInfo(const pIDCompany: Integer; var pCompanyInfo: TCompanyInfo);
const
  SQL_GET_COMPANY_INFO: string =
  'SELECT idcompany, name, adres, tel, unp FROM gf.bcompany WHERE idcompany = :PIDCOMPANY';
begin
  if Resource.ExecSQLSimple(SQL_GET_COMPANY_INFO, 'PIDCOMPANY', [pIDCompany]) = 0 then
    raise Exception.CreateFmt('Организация (%d) не найдена', [pIDCompany]);
  pCompanyInfo.IDCompany := Resource.qryRun.FieldByName('idcompany').AsInteger;
  pCompanyInfo.Name := Resource.qryRun.FieldByName('name').AsString;
  pCompanyInfo.Adres := Resource.qryRun.FieldByName('adres').AsString;
  pCompanyInfo.Tel := Resource.qryRun.FieldByName('tel').AsString;
  pCompanyInfo.UNP := Resource.qryRun.FieldByName('unp').AsString;
end;


end.
