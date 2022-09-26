{
© Bright REST
TDBData - Компонент взаимодействия с веб-сервисами позволяющий добавлять информацию в результирующий набор данных.
Является потомком TDBHTTP.
Протокол передачи данных: HTTP\HTTPS
Формат сообщений: JSON
Результирующий набор данных: TDataSet.
}
unit uExchDBData;

interface

uses
   System.SysUtils, System.Variants, System.Classes,
  Vcl.Forms, System.Json, Data.DB,
  Datasnap.DBClient, IdIOHandler, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL,
  TypInfo, RTTI, uExchDB, uBaseResource, uArrayV;

type
  { - DBCore - }
  TCoreActionType = (catNone, catInsert, catUpdate, catDelete);
  TCoreActionTypes = set of TCoreActionType;

  TDynStringArray = array of array of String;

  TCoreAction = record
    uid: Integer;
    id: Variant;
    oper: TCoreActionType;
    commited: boolean;
  end;
  PCoreAction = ^TCoreAction;

  TDBData = class(TDBHTTP)

  private
    { - DBCore - }
    FCoreActionList: TStringList;
    Request        : TStringStream;
    ObjSessionInfo : TSessionInfo;
    { - DBCore - }
    // Добавление действия
    procedure CoreAddAction(pUid: Integer; pId: Variant; pOper: TCoreActionType);
    // Изменеение действия
    procedure CoreUpdateAction(pUid: Integer; pId: Variant; pOper: TCoreActionType);
    // Удаление действия
    procedure CoreDeleteAction(pUid: Integer);
    // Обработка занесенеия в список действия в зависимости от его типа
    procedure CoreManageAction(pUid: Integer; pId: Variant; pOper: TCoreActionType);
    function GetCoreAction(index: integer): TCoreAction;
    function GetCoreActionCount: integer;
    function GetErrorCount: boolean;
  protected
    FGetDataSet: TDataSet;
    FErrorRows : TDBHTTP.TArrayError;
    FMaxUid    : Integer;
  public
    constructor Create(pSessionInfo : TSessionInfo; pType_mes: String; pType_Query: String;
                       pName_Func: String; Params: array of String; FielsArray: IIntArray  = nil); overload;

    constructor Create(pSessionInfo : TSessionInfo; pType_mes: String; pType_Query: String;
                       pName_Func: String; Params: array of String; pDataParam: TDynStringArray); overload;

    destructor Destroy; override;
    property   DataSet: TDataSet read FGetDataSet;
    property   Errors : TDBHTTP.TArrayError read  FErrorRows;
    property   IsError: boolean read GetErrorCount;
    function   DataSetReQuery: boolean;
    function   GetNextUid: Integer;

    { - DBCore - }

    property CoreAction[index:integer]: TCoreAction read GetCoreAction;
    property CoreActionCount: integer read GetCoreActionCount;

    // Добавление новой записи в DataSet и действе в список
    procedure CoreInsertRecord();
    // Обновление записи в DataSet и действе в список
    procedure CoreUpdateRecord(pUid: Integer; pId: Variant);
    // Удаление записи в DataSet и действе в список
    procedure CoreDeleteRecord(pUid: Integer; pId: Variant);
    // Очищает список действий
    procedure CoreClearActions();
    // получение списка действий по DataSet
    property CoreActionList: TStringList read FCoreActionList;
    // завершает указанное действие после его commit-а в базу (удаляет на тек. момент)
    procedure CoreCommitAction(pUid: Integer);
    // возвращает имя действия по типу
    class function GetStrAction(pCoreActionType: TCoreActionType): string; virtual;
    { - DBCore/ - }

    // Создание нового DataSet c копированием в него содержимого текущего Dataset
    function CreateDatasetBySelf(): TDataset;
  end;
implementation

constructor TDBData.Create(pSessionInfo : TSessionInfo; pType_mes: String; pType_Query: String;
                           pName_Func: String; Params: array of String; FielsArray: IIntArray = nil);
var
 Response: TStream;
 GetData : TDBHTTP;
 i: integer;
begin
   Request  := TStringStream.Create;
   Response := TMemoryStream.Create;
   GetData  := TDBHTTP.Create;
  try
    FCoreActionList := TStringList.Create;
   ObjSessionInfo  := pSessionInfo;
   //заполнение свойств
   with GetData do
   begin
     Type_mes := pType_mes;
     Request_Id := GetData.GenerateRequest_ID();
     Shema := ObjSessionInfo.Shema;
     Name_Func := pName_Func;

     for I := 0 to Length(Params) - 1 do
      Params_Func[i]^.field_data := Params[i];

     type_query := pType_Query;
     CreateRequest(GetData, Request);
     HttpRequest(ObjSessionInfo.HostName, Request, Response);
     GetErrorArray(Response);
     FErrorRows := FErRows;

     FGetDataSet := GetData.JsonToDataSet(GetData.ToJSONObject(Response), FielsArray);
     FMaxUid := GetMaxtUid;
   end;
 finally
     GetData.Free;
     Response.Free;
  end;
end;

// Создание нового DataSet c копированием в него содержимого текущего Dataset
constructor TDBData.Create(pSessionInfo: TSessionInfo; pType_mes, pType_Query, pName_Func: String;
                           Params: array of String; pDataParam: TDynStringArray);
var
  Response: TStream;
  GetData : TDBHTTP;
  StrArr: IStrArray;
  i, j: integer;
begin
  try
   Request  := TStringStream.Create;
   Response := TMemoryStream.Create;
   GetData  := TDBHTTP.Create;
   FCoreActionList := TStringList.Create;
   ObjSessionInfo  := pSessionInfo;
   //заполнение свойств
   with GetData do
   begin
     Type_mes := pType_mes;
     Request_Id := GetData.GenerateRequest_ID();
     Shema := ObjSessionInfo.Shema;
     Name_Func := pName_Func;

     for i := 0 to Length(Params) - 1 do
      Params_Func[i]^.field_data := Params[i];

     // заполняем структуры параметров даты (для отчетов)
     for i := Low(pDataParam) to High(pDataParam) do
     begin
       StrArr := CreateArray;

       for j := Low(pDataParam[i]) to High(pDataParam[i]) do
         StrArr[j] := pDataParam[i][j];

       Params_FuncR[i].field_dataA := StrArr;
     end;

     type_query := pType_Query;
     CreateRequest(GetData, Request);
     HttpRequest(ObjSessionInfo.HostName, Request, Response);
     GetErrorArray(Response);
     FErrorRows := FErRows;
     FGetDataSet := GetData.JsonToDataSet(GetData.ToJSONObject(Response), nil);
     FMaxUid := GetMaxtUid;
   end;
 finally
     GetData.Free;
     Response.Free;
  end;
end;

function TDBData.CreateDatasetBySelf: TDataset;
var
   uid: VARIANT;
   i: longint;
   Res: TClientDataSet;
begin
  if ( (Assigned(FGetDataSet)) and
       (FGetDataSet.Active)) then
  begin
    Res := TClientDataSet.Create(Application);

    for i := 0 to FGetDataSet.Fields.Count-1 do
      Res.FieldDefs.Assign(FGetDataSet.FieldDefs);

    FGetDataSet.DisableControls;
    uid := FGetDataSet.FieldByName('uid').Value;
    FGetDataSet.First;
    Res.CreateDataSet;
    Res.Open;
    try
      while (not FGetDataSet.Eof) do
      begin
        Res.Append;

        for i := 0 to Res.Fields.Count-1 do
          Res.Fields[i].Value := FGetDataSet.Fields[i].Value;

        Res.Post;

        FGetDataSet.Next;
      end;
    finally
      FGetDataSet.Locate('uid', uid, []);
      FGetDataSet.EnableControls;
    end;
  end;

  Result := TDataset(Res);
end;

//обновление FGetDataSet объекта
function TDBData.DataSetReQuery: boolean;
var
  GetData : TDBHTTP;
  Response: TStream;
  DataPos: Variant;
begin
  Result := False;
  DataPos := NULL;
  if Assigned(Request) then
  begin
    GetData  := TDBHTTP.Create;
    Response := TMemoryStream.Create;
    try
    with GetData do
    begin
      HttpRequest(ObjSessionInfo.HostName, Request, Response);
      GetErrorArray(Response);
      FErrorRows := FErRows;
      CoreClearActions();

      if Assigned (FGetDataSet) then
      begin
       if FGetDataSet.FindField('uid') <> nil then
        if FGetDataSet.FieldByName('uid') <> nil then
          DataPos := FGetDataSet.FieldByName('uid').Value
        else
         DataPos := 0;

        FGetDataSet.DisableControls;
        try
          FGetDataSet := GetData.JsonToDataSet(GetData.ToJSONObject(Response), nil, FGetDataSet);
        finally
          FGetDataSet.EnableControls;
        end;
        //FGetDataSet.Free;
      end
      else
        FGetDataSet := GetData.JsonToDataSet(GetData.ToJSONObject(Response), nil);



      if ( FGetDataSet.FieldDefs.Count > 0 ) then
        FGetDataSet.Open;

      if ( (not VarIsNull(DataPos)) and (FGetDataSet.Active = true) ) then
        FGetDataSet.Locate('uid', DataPos, [loCaseInsensitive, loPartialKey]);

      FMaxUid := GetMaxtUid;
      Result  := True;
    end;
    finally
      Response.Free;
      GetData.Free;
    end;
  end;
end;

destructor TDBData.Destroy;
var
  i: integer;
begin
  inherited Destroy;

  if Assigned(FGetDataSet)
   then FGetDataSet.Close;

  if Assigned(FCoreActionList) then
    for i := 0 to FCoreActionList.Count-1 do
      Dispose(PCoreAction(FCoreActionList.Objects[i]));

  if Assigned(Request)then
    Request.Free;
end;

function TDBData.GetCoreAction(index: integer): TCoreAction;
begin
  if ( index >= FCoreActionList.Count ) then begin
    raise Exception.Create(Format('Указанный элемент [%d] в списке действий не найден',[index]));
    exit;
  end
  else
  begin
    Result.uid := PCoreAction(Pointer(FCoreActionList.Objects[index]))^.uid;
    Result.id := PCoreAction(Pointer(FCoreActionList.Objects[index]))^.id;
    Result.oper := PCoreAction(Pointer(FCoreActionList.Objects[index]))^.oper;
    Result.commited := PCoreAction(Pointer(FCoreActionList.Objects[index]))^.commited;
  end;
end;

//Возвращает количесво дейсвий с DataSet-ом
function TDBData.GetCoreActionCount: integer;
begin
  if Assigned(FCoreActionList) then
    result := FCoreActionList.Count
  else
    result := 0;
end;

function TDBData.GetErrorCount: boolean;
begin
  result := (Length(Errors) > 0);
end;

//получение слудующего  Uid в рамках объекта
function TDBData.GetNextUid: Integer;
begin
  Result := FMaxUid;
  Inc(FMaxUid);
end;

{ - Core - }

// возвращает имя действия по типу
class function TDBData.GetStrAction(pCoreActionType: TCoreActionType): string;
begin
  case pCoreActionType of
    catNone:   result := 'None';
    catInsert: result := 'Insert';
    catUpdate: result := 'Update';
    catDelete: result := 'Delete';
  end;
end;

// Добавление действия
procedure TDBData.CoreAddAction(pUid: Integer; pId: Variant; pOper: TCoreActionType);
var
   act: PCoreAction;
begin
  try
    if (pId = 0) then
      pId := NULL;
  except
    on E: EVariantTypeCastError do begin
      pId := NULL;
    end
    else
      raise;
  end;

  New(act);

  act^.uid := pUid;
  act^.id  := pId;
  act^.oper := pOper;
  act^.commited := false;

  CoreActionList.AddObject(IntToStr(pUid), TObject(act));
end;

// Изменение действия
procedure TDBData.CoreUpdateAction(pUid: Integer; pId: Variant; pOper: TCoreActionType);
var
  index: integer;
begin
  index := CoreActionList.IndexOf(IntToStr(pUid));


  if ( index >= 0 ) then begin
    PCoreAction(CoreActionList.Objects[index])^.oper := pOper;
  end;
end;

// Очищает список действий
procedure TDBData.CoreClearActions();
var
  i: integer;
begin
  if Assigned(FCoreActionList) then
    for i := 0 to FCoreActionList.Count-1 do
      Dispose(PCoreAction(FCoreActionList.Objects[i]));

  FCoreActionList.Clear;
end;

procedure TDBData.CoreCommitAction(pUid: Integer);
var
  index: integer;
begin
  index := FCoreActionList.IndexOf(IntToStr(pUid));

  if ( Index >= 0 ) then
    PCoreAction(FCoreActionList.Objects[Index])^.commited := True;
end;

procedure TDBData.CoreDeleteAction(pUid: Integer);
var
  index: integer;
begin
  index := CoreActionList.IndexOf(IntToStr(pUid));

  if ( index >= 0 ) then begin
    Dispose(PCoreAction(FCoreActionList.Objects[index]));
    FCoreActionList.Delete(index);
  end;
end;

// Обработка занесенеия в список действия в зависимости от его типа
procedure TDBData.CoreManageAction(pUid: Integer; pId: Variant; pOper: TCoreActionType);
var
  index: integer;
begin
  index := FCoreActionList.IndexOf(IntToStr(pUid));

  case pOper of
    catInsert:
      begin
        if ( index < 0 ) then
          CoreAddAction(pUid, pId, catInsert);
      end;

    catUpdate:
      begin
        if ( index < 0 ) then
          CoreAddAction(pUid, pId, catUpdate);
      end;

    catDelete:
      begin
        if ( index < 0 ) then
          CoreAddAction(pUid, pId, catDelete)
        else
          if ( VarIsNull(PCoreAction(CoreActionList.Objects[index])^.id) ) then
            CoreDeleteAction(pUid)
          else
            CoreUpdateAction(pUid, pId, catDelete);
      end;
  end;
end;

// Добавление новой записи в DataSet и действе в список
procedure TDBData.CoreInsertRecord();
var
   Uid: integer;
begin
  FGetDataSet.Append;
  Uid := GetNextUid();
  FGetDataSet.FieldByName('uid').AsInteger := Uid;

  CoreManageAction(FGetDataSet.FieldByName('uid').AsInteger, NULL, catInsert);
  FGetDataSet.Post;
  FGetDataSet.Locate('uid', Uid, [loCaseInsensitive, loPartialKey])
end;

// Удаление записи в DataSet и действе в список
procedure TDBData.CoreDeleteRecord(pUid: Integer; pId: Variant);
begin
  if (FGetDataSet.Locate('uid', pUid, [loCaseInsensitive, loPartialKey])) then begin
    CoreManageAction(FGetDataSet.FieldByName('uid').AsInteger, pId, catDelete);

    FGetDataSet.Delete;
  end;
end;

// Обновление записи в DataSet и действе в список
procedure TDBData.CoreUpdateRecord(pUid: Integer; pId: Variant);
begin
  if (FGetDataSet.Locate('uid', pUid, [loCaseInsensitive, loPartialKey])) then begin

    CoreManageAction(FGetDataSet.FieldByName('uid').AsInteger, pId, catUpdate);

  end;
end;

end.
