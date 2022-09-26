{****************************************************************************
  ����������:
    ���������� ����� � �������� ����������� ������������ �������.
  �����:
    �������� �.�.

  Copyright (c) 2021 Bright Solutions
*****************************************************************************}

unit uGPSIntegration;

interface
  uses
   idHTTP, IdSSLOpenSSL, System.Classes, System.SysUtils;

 type
  /// <summary>
  ///  ������� ���������� �� ������� �����������
  /// <param name="sdpDefault">
  /// �� ���������
  /// </param>
  /// <param name="sdpNotRegistered">
  ///  �� ���������������
  /// </param>
  /// <param name="sdpNotActive">
  ///  �� �������
  /// </param>
  /// <param name="sdpUsed">
  ///  �������� � ������ (��)
  /// </param>
  /// <param name="sdpUsedTwo">
  ///  �������� ������������ � 2 ������� (!)
  /// </param>
  /// <param name="sdpUsedThree">
  ///  �������� ������������ � 3 ������� (!)
  /// </param>
  /// </summary>
  TStatusDeviceOnPortal = (sdpDefault = -5, sdpNotRegistered = -1, sdpNotActive = 0, sdpUsed = 1, sdpUsedTwo = 2, sdpUsedThree = 3);
  /// <summary>
  ///  ������� ���������� � �������
  /// <param name="tdsCreated">
  /// ������
  /// </param>
  /// <param name="tdsNotRegistered">
  ///  �� ���������������
  /// </param>
  /// <param name="tdsNotActive">
  ///  �� �������
  /// </param>
  /// <param name="tdsAvailable">
  ///  ��������
  /// </param>
  /// <param name="tdsFixed">
  ///  ���������
  /// </param>
  /// <param name="tdsLocked">
  ///  ������������
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
     /// ����������� ������� ���������� �� ������� � �������
     /// ������� �� ��
     ///</summary>
     function ConvertToDBStatus(const AStatus: TStatusDeviceOnPortal): TStatusTrackerDevice;
    public
     /// <summary>
     /// ��������� ������� GPS ����������
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
///  ��� �����������
/// </summary>
  HTTP_AUTHORIZATION_KEY = 'ApiKey';
/// <summary>
///  ���� �����������
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
//35 ���
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
        DialogInfo('��������� ����� �������� ������ �� �������.' + #13#10 +
         '���������� ��������� ������ �����.');
      end
      else
      begin
        DialogInfo(E.ClassName+' ������� ������, � ���������� : ' + E.Message);
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
