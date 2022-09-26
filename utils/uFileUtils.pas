unit uFileUtils;

{ Модуль для работы с файловой системой }

interface

uses
  Classes;

{ Запускает указанный исполняемый файл и ждет его завершения
  pExeFileDir    - директория, где находится исполняемый файл
  pExeFileName   - имя исполняемого файла
  pExeFileParams - параметры, с которыми запускать файл
  pWorkingDir    - рабочий каталог файла
  Возвращает код ошибки процесса }
function ShellExecuteAndWait(const pExeFileDir, pExeFileName,
  pExeFileParams, pWorkingDir: string): LongWord;

{ Запускает указанный исполняемый файл и продолжает выполение
  pExeFileDir    - директория, где находится исполняемый файл
  pExeFileName   - имя исполняемого файла
  pExeFileParams - параметры, с которыми запускать файл
  pWorkingDir    - рабочий каталог файла
  Возвращает TRUE если запустить удалось и FALSE, если нет }
function ShellExecuteAndContinue(const pExeFileDir, pExeFileName,
  pExeFileParams, pWorkingDir: string): Boolean;

{ Выполняет поиск файлов в указанном каталоге и добавляет их в pStrings
  pPath      - каталог
  pRecursive - искать (=TRUE) или нет (=FALSE) файлы в подкаталогах
  pStrings   - куда добавлять строки с найденными файлами }
procedure FindFiles(const pPath: string; const pRecursive: Boolean;
  const pStrings: TStrings);

{ Проверяет, существует ли каталог. Если нет - создает
  pPath - каталог
  Возвращает TRUE если каталог существует либо создан, иначе - FALSE }
function CreateDirIfNotExists(const pDirectory: string): Boolean;

{ Открывает заданный файл, который не обязательно исполняемый
  pFileName - путь и имя файла
  Возвращает TRUE если открыть удалось и FALSE, если нет }
function ShellOpenFile(pFileName: string): Boolean;

implementation

uses
  SysUtils, Windows, ShellAPI;

function ShellExecuteAndWait(const pExeFileDir, pExeFileName,
  pExeFileParams, pWorkingDir: string): LongWord;
var
  CommandLine: string;
  CurrentDirectory: PChar;
  StartupInfo: TStartupInfo;
  ProcessInformation: TProcessInformation;
begin
  Result := 0;

  CommandLine := '"' + IncludeTrailingPathDelimiter(pExeFileDir) +
    pExeFileName + '"';
  if Length(pExeFileParams) <> 0 then
    CommandLine := CommandLine + #$20 + pExeFileParams;
  if Length(pWorkingDir) <> 0 then
    CurrentDirectory := PChar(pWorkingDir)
  else
    CurrentDirectory := nil;
  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(StartupInfo);

  if not CreateProcess(nil, PChar(CommandLine), nil, nil, FALSE,
    0, nil, CurrentDirectory, StartupInfo, ProcessInformation) then
    Exit;

  try
    if WaitForSingleObject(ProcessInformation.hProcess, INFINITE) =
      WAIT_OBJECT_0 then
      GetExitCodeProcess(ProcessInformation.hProcess, Result);
  finally
    CloseHandle(ProcessInformation.hProcess);
    CloseHandle(ProcessInformation.hThread);
  end;
end;

procedure FindFiles(const pPath: string; const pRecursive: Boolean;
  const pStrings: TStrings);
var
  SearchRec: TSearchRec;
  Path: string;
begin
  Path := IncludeTrailingPathDelimiter(pPath);
  if SysUtils.FindFirst(Path + '*.*', faAnyFile, SearchRec) = 0 then
    try
      repeat
        if (SearchRec.Attr and faDirectory) = 0 then
          pStrings.Add(Path + SearchRec.Name)
        else if pRecursive and (SearchRec.Name <> '.')
          and (SearchRec.Name <> '..') then
          FindFiles(Path + SearchRec.Name, pRecursive, pStrings);
      until SysUtils.FindNext(SearchRec) <> 0;
    finally
      SysUtils.FindClose(SearchRec);
    end;
end;

function CreateDirIfNotExists(const pDirectory: string): Boolean;
begin
  Result := DirectoryExists(pDirectory) or CreateDir(pDirectory);
end;

function ShellOpenFile(pFileName: string): Boolean;
begin
  Result := ShellExecute(0, 'open', PChar(pFileName), nil, nil, SW_SHOW) > 32;
end;

function ShellExecuteAndContinue(const pExeFileDir, pExeFileName,
  pExeFileParams, pWorkingDir: string): Boolean;
var
  CommandLine: string;
  CurrentDirectory: PChar;
  StartupInfo: TStartupInfo;
  ProcessInformation: TProcessInformation;
begin
  CommandLine := '"' + IncludeTrailingPathDelimiter(pExeFileDir) +
    pExeFileName + '"';
  if Length(pExeFileParams) <> 0 then
    CommandLine := CommandLine + #$20 + pExeFileParams;
  if Length(pWorkingDir) <> 0 then
    CurrentDirectory := PChar(pWorkingDir)
  else
    CurrentDirectory := nil;

  FillChar(StartupInfo, SizeOf(StartupInfo), 0);
  StartupInfo.cb := SizeOf(TStartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
  StartupInfo.wShowWindow := SW_SHOWNA;

  Result := CreateProcess(nil, PChar(CommandLine), nil, nil, FALSE,
    CREATE_NEW_CONSOLE, nil, CurrentDirectory,
    StartupInfo, ProcessInformation);
end;

end.
