{****************************************************************************
  Назначение:
    Интеграция ЕГАИС с системой мониторинга транспортных средств.
  Автор:
    Зданович А.А.

  Copyright (c) 2021 Bright Solutions
*****************************************************************************}

unit uGPSIntegration;

interface
  uses
   idHTTP, IdSSLOpenSSL, System.Classes, System.SysUtils;

 type
  /// <summary>
  ///  Статусы устройства на портале мониторинга
  /// <param name="sdpDefault">
  /// По умолчанию
  /// </param>
  /// <param name="sdpNotRegistered">
  ///  Не зарегистрирован
  /// </param>
  /// <param name="sdpNotActive">
  ///  Не активен
  /// </param>
  /// <param name="sdpUsed">
  ///  Привязан к машине (ОК)
  /// </param>
  /// <param name="sdpUsedTwo">
  ///  Привязан одновременно к 2 машинам (!)
  /// </param>
  /// <param name="sdpUsedThree">
  ///  Привязан одновременно к 3 машинам (!)
  /// </param>
  /// </summary>
  TStatusDeviceOnPortal = (sdpDefault = -5, sdpNotRegistered = -1, sdpNotActive = 0, sdpUsed = 1, sdpUsedTwo = 2, sdpUsedThree = 3);
  /// <summary>
  ///  Статусы устройства в системе
  /// <param name="tdsCreated">
  /// Создан
  /// </param>
  /// <param name="tdsNotRegistered">
  ///  Не зарегистрирован
  /// </param>
  /// <param name="tdsNotActive">
  ///  Не активен
  /// </param>
  /// <param name="tdsAvailable">
  ///  Свободен
  /// </param>
  /// <param name="tdsFixed">
  ///  Закреплен
  /// </param>
  /// <param name="tdsLocked">
  ///  Заблокирован
  /// </param>
  /// </summary>
  TStatusTrackerDevice = (tdsCreated = 1, tdsNotRegistered = 2, tdsNotActive = 3,
   tdsAvailable = 4 , tdsFixed = 5, tdsLocked = 6);

 type
   TGPSIntegrator = class(TObject)
    private
     FHTTP: TidHttp;
     FSSLHandler: TIdSSLIOHandlerSocketOpenSSL;

    private
     ///<summary>
     /// Преобразует статусы полученные из портала в статусы
     /// объекта из БД
     ///</summary>
     function ConvertToDBStatus(const AStatus: TStatusDeviceOnPortal): TStatusTrackerDevice;
    public
     /// <summary>
     /// Получение статуса GPS устройства
     /// </summary>
     function GetStatusDevice(const AIMEI: string):TStatusTrackerDevice;

     constructor Create;
     procedure Free;
   end;



implementation
   uses
    System.JSON, uResourceForms;


 CONST
/// <summary>
///  Тип авторизации
/// </summary>
  HTTP_AUTHORIZATION_KEY = 'ApiKey';
/// <summary>
///  Ключ авторизации
/// </summary>
  HTTP_AUTHORIZATION_VALUE = 'XVddv4GqvHtHpXLC7si9PvPQOHVKqglF';

  HTTP_REQUEST_PARAM_IMEI = '{imei}';
  HTTP_REQUEST_GET_STATUS_IMEI = 'https://track.egais.belgosles.by/api/status/imei/' + HTTP_REQUEST_PARAM_IMEI;


{ TGPSIntegrator }

function TGPSIntegrator.ConvertToDBStatus(
  const AStatus: TStatusDeviceOnPortal): TStatusTrackerDevice;
begin
  case AStatus of
   sdpDefault: Result:= tdsCreated;
   sdpNotRegistered: Result:= tdsNotRegistered;
   sdpNotActive: Result:= tdsNotActive;
   sdpUsed, sdpUsedTwo, sdpUsedThree: Result:= tdsAvailable;
   else result:= tdsCreated;
  end;
end;

constructor TGPSIntegrator.Create;
begin
 inherited Create;
 FSSLHandler:= TIdSSLIOHandlerSocketOpenSSL.Create(nil);
 FSSLHandler.SSLOptions.Mode := sslmUnassigned;
 FSSLHandler.SSLOptions.Method := sslvSSLv23; // enable all available versions first
 FSSLHandler.SSLOptions.SSLVersions := FSSLHandler.SSLOptions.SSLVersions - [sslvSSLv2, sslvSSLv3];

 FHTTP := TIdHttp.Create(nil);
 FHTTP.ProxyParams.Clear;
 FHTTP.Request.UserAgent := 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36';
 FHTTP.Request.Accept := 'application/json, text/javascript, */*; q=0.01';
 FHTTP.Request.ContentType := 'application/json; charset=UTF-8';
 FHTTP.Request.CustomHeaders.AddValue(HTTP_AUTHORIZATION_KEY, HTTP_AUTHORIZATION_VALUE);
 FHTTP.Request.CharSet := 'utf-8';
 FHTTP.HandleRedirects := true;
 FHTTP.IOHandler := FSSLHandler;
 FHTTP.HTTPOptions := [hoKeepOrigProtocol,hoForceEncodeParams,hoNoProtocolErrorException,hoWantProtocolErrorContent];
//35 сек
 FHTTP.ReadTimeout:= 35000;
 end;

procedure TGPSIntegrator.Free;
begin
  FreeAndNil(FSSLHandler);
  FreeAndNil(FHTTP);
  inherited Free;
end;

function TGPSIntegrator.GetStatusDevice(const AIMEI: string): TStatusTrackerDevice;
 var
  URL:string;
  Response: TStream;
  ResponseTEXT: TStringStream;
  JSONObject: TJSONObject;
  StatusIndex: Integer;
begin
 Assert(AIMEI <> EmptyStr);
 Response:= TMemoryStream.Create;
 ResponseTEXT:= TStringStream.Create;
 StatusIndex:= Ord(sdpDefault);
 try
  try
   URL:= StringReplace(HTTP_REQUEST_GET_STATUS_IMEI, HTTP_REQUEST_PARAM_IMEI, AIMEI, [rfIgnoreCase]);

   FHTTP.Get(URL, Response);

   if Assigned(Response) then begin
     ResponseTEXT.LoadFromStream(Response);
     JSONObject:= TJSONObject.ParseJSONValue(ResponseTEXT.DataString) as TJSONObject;
     JSONObject.TryGetValue('status', StatusIndex);
     Result:=  ConvertToDBStatus(TStatusDeviceOnPortal(StatusIndex));
   end;
   except
    on E : Exception do begin
      if (E.ClassName = 'EIdReadTimeout') then
      begin
        DialogInfo('Превышено время ожидания ответа от сервера.' + #13#10 +
         'Пожалуйста повторите запрос позже.');
      end
      else
      begin
        DialogInfo(E.ClassName+' поднята ошибка, с сообщением : ' + E.Message);
      end;
      Result:= tdsCreated;
    end;
  end;
 finally
  Response.Free;
  ResponseTEXT.Free;
 end;
 end;

end.
