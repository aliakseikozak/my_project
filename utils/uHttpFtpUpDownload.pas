unit uHttpFtpUpDownload;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Json, Vcl.StdCtrls, Data.DB,
  Datasnap.DBClient, SimpleDS, Vcl.Grids, Vcl.DBGrids, IdGlobal, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdMultipartFormData,
  IdHTTP, IdHashSHA, TypInfo, RTTI, utilSpravXML, uArrayV, cxProgressBar;

type
  TNoPresizeFileStream = class(TFileStream)
  protected
    procedure SetSize(const NewSize: Int64); override;
end;

type
  TNoPresizeFormDataStream = class(TIdMultipartFormDataStream)
  protected
    procedure IdSetSize(ASize : Int64); override;
end;

type
    //анонимный метод, который передаётся в качестве параметра
    TSomeFunc = procedure( Fparam : String ) of object;

    TFTPHTTP = class(TThread)

    const
     TypeDownload  = 'Download';
     TypeUpload =  'Upload';

    private
      ProgressBar: TcxProgressBar;
      FSomeFunc : TSomeFunc;
      TypeOperation: String;
      URL: String;
      NameFile: String;
      FilePath : String;
      TotalBytes: Int64;
      LastWorkCount: Int64;
      LastTicks: LongWord;
      FProgressHandle: HWND;
      //Процедура вызова анонимного метода
      procedure ProcRoutine(Procedure_name : TSomeFunc);
    public
      constructor Create(pTypeOperation: String; PrBar: TcxProgressBar; pURL: String; pNameFile: String = ''; pFilePath : String = ''; Procedure_name : TSomeFunc = nil); Overload;
      constructor Create(pTypeOperation: String; pURL: String; pNameFile: String = ''; pFilePath : String = ''); Overload; // Этот конструктор использует по умолчанию
      Destructor Destroy; override;
      procedure Download;
      procedure Upload;
      procedure HttpWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
      procedure HttpWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
      procedure HttpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
      procedure UpdateProgressBar;
    protected
      procedure Execute; Override;
end;
implementation

uses
 uExchDB, uResourceForms, uResource;

procedure TNoPresizeFileStream.SetSize(const NewSize: Int64);
begin

end;

procedure TNoPresizeFormDataStream.IdSetSize(ASize: Int64);
begin

end;


constructor TFTPHTTP.Create(pTypeOperation: String; PrBar: TcxProgressBar; pURL: String; pNameFile: String = ''; pFilePath : String = ''; Procedure_name : TSomeFunc = nil);
begin
  ProgressBar := PrBar;
  FSomeFunc := Procedure_name;
  Create(pTypeOperation, pURL, pNameFile, pFilePath);  // Вызов родительского метода
end;

constructor TFTPHTTP.Create(pTypeOperation: String; pURL: String; pNameFile: String = ''; pFilePath : String = '');
begin
  URL := pURL;
  TypeOperation := pTypeOperation;
  NameFile := pNameFile;
  FilePath := pFilePath;
  FreeOnTerminate := True;

  Inherited Create(False);  // Вызов родительского метода
end;

Destructor TFTPHTTP.Destroy;
begin
  if Assigned(FSomeFunc) then
    ProcRoutine(FSomeFunc);
  inherited Destroy;
end;

procedure TFTPHTTP.Execute;
begin
 if URL <> '' then
 begin
   if TypeOperation = TypeDownload then
     Download
   else if TypeOperation = TypeUpload then
    Upload;
 end
 else
   DialogStop('Не задан путь (URL)', 'Ошибка');
end;

procedure TFTPHTTP.ProcRoutine(Procedure_name : TSomeFunc);
begin
 Procedure_name(FilePath+NameFile);
end;

procedure TFTPHTTP.UpdateProgressBar;
begin
  if Assigned(ProgressBar) then
  begin
   ProgressShow(ProgressBar, LastWorkCount);
   //Application.ProcessMessages();
  end;
end;

//функция загружает файл по указанному адресу и создает файл
procedure TFTPHTTP.Download();
var
  Buffer: TNoPresizeFileStream;
  HttpClient: TIdHttp;
  DBHTTP: TDBHTTP;
begin

  if ( NameFile = '' ) then
     NameFile := DBHTTP.GenerateRequest_ID(8) + '.tmp';

  if (FilePath = '') then
     FilePath := Resource.ModuleInfo.TempDir;

  try
    Buffer := TNoPresizeFileStream.Create(FilePath + NameFile, fmCreate or fmShareDenyWrite);
    HttpClient := TIdHttp.Create(nil);
    try
      try
        //узнаём и устанавливаем размер файла
        HttpClient.Head(URL);
        Buffer.SetSize(HttpClient.Response.ContentLength);

        HttpClient.OnWorkBegin := HttpWorkBegin;
        HttpClient.OnWork := HttpWork;
        HttpClient.OnWorkEnd := HttpWorkEnd;
        HttpClient.Get(URL, Buffer); // ждём до завершения
      except
        on E: Exception do
        begin
          DialogStop('Файл не загружен:' + E.Message, 'Ошибка');
        end;
      end;
    finally
      HttpClient.Free;
    end;
  finally
    Buffer.Free;
  end;
end;

//функция загружает на сервер файл
procedure TFTPHTTP.Upload();
 var
  HttpClient: TIdHttp;
  DBHTTP: TDBHTTP;
  Buffer: TNoPresizeFormDataStream;
begin

  try
    Buffer:= TNoPresizeFormDataStream.Create;
    Buffer.AddFile('file', FilePath + NameFile, 'multipart/form-data');
    HttpClient := TIdHttp.Create(nil);
    try
      try
        //узнаём и устанавливаем размер файла
        HttpClient.Request.ContentType:='multipart/form-data';
        HttpClient.OnWorkBegin := HttpWorkBegin;
        HttpClient.OnWork := HttpWork;
        HttpClient.OnWorkEnd := HttpWorkEnd;
        HttpClient.Post(URL, Buffer);  // ждём до завершения
      except
        on E: Exception do
        begin
          DialogStop('Файл не отправлен', 'Ошибка');
        end;
      end;
    finally
      HttpClient.Free;
    end;
  finally
    Buffer.Free;
  end;
end;

procedure TFTPHTTP.HttpWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Int64);
begin
  if (AWorkMode <> wmRead) and (AWorkMode <> wmWrite) then Exit;

  // If TIdHTTP is running in the main thread, update your UI
  // components directly as needed and then call the Form's
  // Update() method to perform a repaint, or Application.ProcessMessages()
  // to process other UI operations, like button presses (for
  // cancelling the download, for instance).
  //
  // If TIdHTTP is running in a worker thread, use the TIdNotify
  // or TIdSync class to update the UI components as needed, and
  // let the OS dispatch repaints and other messages normally...

  TotalBytes := AWorkCountMax;
  LastWorkCount := 0;
  LastTicks := Ticks;

  // Инициализация UI ProgressBar-а
  if Assigned(ProgressBar) then
  begin
    ProgressBar.Properties.Text := '';
    ProgressBar.Properties.ShowText := true;
    ProgressShow(ProgressBar, LastWorkCount, True,  LastWorkCount, AWorkCountMax);
    ProgressBar.Properties.ShowTextStyle := cxtsPercent;
  end;
end;

procedure TFTPHTTP.HttpWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Int64);
var
  PercentDone: Integer;
  ElapsedMS: LongWord;
  BytesTransferred: Int64;
  BytesPerSec: Int64;
begin
  if (AWorkMode <> wmRead) and (AWorkMode <> wmWrite) then Exit;

  ElapsedMS := GetTickDiff(LastTicks, Ticks);
  if ElapsedMS = 0 then ElapsedMS := 1; // обработка деления на нуль

  if TotalBytes > 0 then
    PercentDone := Trunc((AWorkCount / TotalBytes) * 100.0)
  else
    PercentDone := 0;

  BytesTransferred := AWorkCount - LastWorkCount;

  // using just BytesTransferred and ElapsedMS, you can calculate
  // all kinds of speed stats - b/kb/mb/gm per sec/min/hr/day ...
  BytesPerSec := Trunc((BytesTransferred * 1000) / ElapsedMS);

  LastWorkCount := AWorkCount;
  LastTicks := Ticks;
  // Обновляем UI
  Synchronize(UpdateProgressBar);

end;

procedure TFTPHTTP.HttpWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  if (AWorkMode <> wmRead) and (AWorkMode <> wmWrite) then Exit;

  // Обновляем статус UI
  if Assigned(ProgressBar) then
  begin
    ProgressBar.Properties.Text := 'Загрузка завершена';
    ProgressShow(ProgressBar, 0);
  end;
end;

end.
