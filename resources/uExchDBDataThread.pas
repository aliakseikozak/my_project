{
© Bright REST
TDBDataThread - Компонент взаимодействия с веб-сервисами в многопоточном режиме.
}
unit uExchDBDataThread;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, Grids, DBGrids, DB, uExchDBData, uBaseResource, uArrayV;

type

  TDBDataThread = class(TThread)
  private
    FDatasource: TDatasource;
    FQueryException: Exception;
    FSessionInfo: TSessionInfo;
    FType_mes : String;
    FType_Query : String;
    FName_Func: String;
    FParams : array of String;
    FFielsArray: IIntArray;
    FDataParam : TDynStringArray;
    FTDBData : ^TDBData;
    IsAssignmentDataSource: boolean;
    procedure AssignmentDataSource;
    procedure ShowQryError;
  protected
    FGetDataSet: TDBData;
    procedure Execute; override;
  public
    constructor Create(var pTDBData: TDBData; pSessionInfo : TSessionInfo; pType_mes: String; pType_Query: String;
                       pName_Func: String; Params: array of String; FielsArray: IIntArray  = nil); overload;

    constructor Create(var pTDBData: TDBData; pSessionInfo : TSessionInfo; pType_mes: String; pType_Query: String;
                       pName_Func: String; Params: array of String; pDataParam: TDynStringArray); overload;

    constructor Create(pSessionInfo : TSessionInfo; pType_mes: String; pType_Query: String;
                       pName_Func: String; Params: array of String; FielsArray: IIntArray  = nil); overload;
    constructor Create(pSessionInfo : TSessionInfo; pType_mes: String; pType_Query: String;
                       pName_Func: String; Params: array of String; pDataParam: TDynStringArray); overload;

    constructor Create(var pTDBData: TDBData; var pDataSource: TDataSource; pSessionInfo : TSessionInfo; pType_mes: String; pType_Query: String;
                           pName_Func: String; Params: array of String; FielsArray: IIntArray = nil); overload;
    Destructor Destroy; override;
    property   DBData: TDBData read FGetDataSet write FGetDataSet;
  end;


implementation


constructor TDBDataThread.Create(var pTDBData: TDBData; pSessionInfo : TSessionInfo; pType_mes: String; pType_Query: String;
                           pName_Func: String; Params: array of String; FielsArray: IIntArray = nil);
begin
   FTDBData := @pTDBData;
   IsAssignmentDataSource := True;
   Create(pSessionInfo, pType_mes, pType_Query, pName_Func, Params);
end;

// Создание нового DataSet c копированием в него содержимого текущего Dataset
constructor TDBDataThread.Create(var pTDBData: TDBData; pSessionInfo: TSessionInfo; pType_mes, pType_Query, pName_Func: String;
                           Params: array of String; pDataParam: TDynStringArray);
begin
   FDataParam := pDataParam;
   Create(pTDBData, pSessionInfo, pType_mes, pType_Query, pName_Func, Params);
end;

constructor TDBDataThread.Create(pSessionInfo : TSessionInfo; pType_mes: String; pType_Query: String;
                       pName_Func: String; Params: array of String; FielsArray: IIntArray  = nil);
var
 Index: Integer;
begin
   FSessionInfo:= pSessionInfo;
   FType_mes := pType_mes;
   FType_Query := pType_Query;
   FName_Func:= pName_Func;
   Setlength(FParams, Length(Params));
   for Index := 0 to Length(Params) - 1 do
      FParams[Index] := Params[Index];
   FFielsArray:= FielsArray;

   // Устанавливаем флаг освобождения потока после его завершения
   FreeOnTerminate := True;

   inherited Create(False);
   //Resume;
end;

constructor TDBDataThread.Create(pSessionInfo : TSessionInfo; pType_mes: String; pType_Query: String;
                       pName_Func: String; Params: array of String; pDataParam: TDynStringArray);
begin
  FDataParam := pDataParam;
  Create(pSessionInfo, pType_mes, pType_Query, pName_Func, Params);
end;

Destructor TDBDataThread.Destroy;
begin
  if not Assigned(FTDBData) then
    if Assigned(DBData) then
      FreeAndNil(FGetDataSet);
  inherited Destroy;
end;


procedure TDBDataThread.Execute;
begin
  try
    { Выполняем запрос и подключаем источник данных к компоненту TQuery,
    вызывая AssignmentDataSource из основного потока
    (для этой цели используем Synchronize)}
    if Assigned(FDataParam) then
      DBData := TDBData.Create(FSessionInfo, FType_mes, FType_Query, FName_Func, FParams, FDataParam)
    else
      DBData := TDBData.Create(FSessionInfo, FType_mes, FType_Query, FName_Func, FParams);
   if IsAssignmentDataSource then
     Synchronize(AssignmentDataSource);
  except
    { Ловим исключение (если оно происходит) и его дескриптор
    в контексте основного потока (для этой цели используем
    Synchronize). }
    FQueryException := ExceptObject as Exception;
    Synchronize(ShowQryError);
  end;
end;

procedure TDBDataThread.AssignmentDataSource;
begin
   FTDBData^ := DBData;
   if Assigned(FDatasource) then
    FDatasource.DataSet := FTDBData.DataSet;
// FTDBData^ := @DBData;
// FSomeFunc(FTDBData^, DBData);
end;

procedure TDBDataThread.ShowQryError;
begin
  Application.ShowException(FQueryException); // Обрабатываем исключение
end;


constructor TDBDataThread.Create(var pTDBData: TDBData;
  var pDataSource: TDataSource; pSessionInfo: TSessionInfo; pType_mes,
  pType_Query, pName_Func: String; Params: array of String;
  FielsArray: IIntArray);
begin
  FDatasource := pDataSource;
  Create(pTDBData, pSessionInfo, pType_mes, pType_Query, pName_Func, Params, FielsArray);
end;

end.

