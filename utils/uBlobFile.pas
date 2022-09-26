unit uBlobFile;

interface

uses
  DB;

{ Загружает файл в параметр запроса BLOB, возвращает путь и имя загруженного файла }
function LoadFile(Param: TParam): string; overload;

{ Загружает файл в поле BLOB, возвращает путь и имя загруженного файла }
function LoadFile(Field: TField): string; overload;

{ Загружает файл в переменную string, возвращает путь и имя загруженного файла }
function LoadFile(var Str: string): string; overload;

{ Сохраняет файл из поля BLOB }
function SaveFile(Field: TField; pFileName: string; pTempDir: string = ''): string;

{ Просматривает файл }
procedure ViewBlob(Field: TField; pFileName: string; pTempDir: string = '');

implementation

uses
  Classes, Forms, Windows, Dialogs, SysUtils, uFileUtils;

const
  S_FILTER: string =
  'Все файлы|*.*|' +
  'Документ Word 97-2003(*.doc)|*.doc|' +
  'Документ Word(*.docx)|*.docx|' +
  'Шаблон Word (*.dot)|*.dot|' +
  'Документ Excel 97-2003(*.xls)|*.xls|' +
  'Документ Excel(*.xlsx)|*.xlsx|' +
  'Шаблон Excel (*.xlt)|*.xlt' +
  'Тексовый документ(*.txt)|*.txt|';
  S_DEFAULT_EXT: string = '*';

{ Загружает файл в параметр запроса BLOB }
function LoadFile(Param: TParam): string;
var
  OpenDialog: TOpenDialog;
begin
  Result := '';

  if
  ((Param = nil) or (not (Param.DataType in [ftUnknown, ftBlob])))
  or
  ((not Param.IsNull) and (Application.MessageBox('В текущем параметре уже имеются загруженные данные. Заменить?', 'Загрузка файла', MB_YESNO) = ID_NO))
  then
    Exit;

  OpenDialog := nil;
  try
    OpenDialog := TOpenDialog.Create(nil);
    OpenDialog.DefaultExt := S_DEFAULT_EXT;
    OpenDialog.Filter := S_FILTER;
    if OpenDialog.Execute then
    begin
      Param.Clear;
      Param.LoadFromFile(OpenDialog.FileName, ftBlob);
      Result := OpenDialog.FileName;
    end;
  finally
    FreeAndNil(OpenDialog);
  end;
end;

{ Загружает файл в поле BLOB }
function LoadFile(Field : TField): string;
var
  Bookmark: TBookmark;
  DataSet: TDataSet;
  OpenDialog: TOpenDialog;
begin
  Result := '';

  if (Field = nil) or (Field.DataType <> ftBlob) then
    Exit;

  DataSet := Field.DataSet;
  if DataSet.State = dsInsert then
  begin
    Bookmark := DataSet.Bookmark;
    DataSet.Post;
    DataSet.Refresh;
    DataSet.Bookmark := Bookmark;
  end;

  if
  (not Field.IsNull)
  and
  (Application.MessageBox('В текущей записи уже имеются загруженные данные. Заменить?', 'Загрузка файла', MB_YESNO) = ID_NO)
  then
    Exit;

  OpenDialog := nil;
  try
    OpenDialog := TOpenDialog.Create(nil);
    OpenDialog.DefaultExt := S_DEFAULT_EXT;
    OpenDialog.Filter := S_FILTER;
    if OpenDialog.Execute then
    begin
      DataSet.Edit;
      Field.Clear;
      TBlobField(Field).LoadFromFile(OpenDialog.FileName);
      DataSet.Post;
      Result := OpenDialog.Filename;
    end;
  finally
    FreeAndNil(OpenDialog);
  end;
end;

{ Загружает файл в переменную string }
function LoadFile(var Str: string): string;
var
  FileStream: TFileStream;
  OpenDialog: TOpenDialog;
begin
  Result := '';

  FileStream := nil;
  OpenDialog := nil;
  try
    OpenDialog := TOpenDialog.Create(nil);
    OpenDialog.DefaultExt := S_DEFAULT_EXT;
    OpenDialog.Filter := S_FILTER;
    if OpenDialog.Execute then
    begin
      FileStream := TFileStream.Create(OpenDialog.FileName, fmOpenRead);
      SetLength(Str, FileStream.Size);
      FileStream.Read(Str[1], FileStream.Size);
      Result := OpenDialog.FileName;
    end;
  finally
    FreeAndNil(FileStream);
    FreeAndNil(OpenDialog);
  end;
end;

{ Сохраняет файл из поля BLOB }
function SaveFile(Field : TField; pFileName: string; pTempDir: string = ''): string;
var
  SaveDialog: TSaveDialog;
  Bookmark: TBookmark;
  DataSet: TDataSet;
begin
  Result := '';
  SaveDialog := nil;

  if (Field = nil) or (Field.DataType <> ftBlob) then
    Exit;

  DataSet := Field.DataSet;
  if DataSet.State = dsInsert then
  begin
    Bookmark := DataSet.Bookmark;
    DataSet.Post;
    DataSet.Refresh;
    DataSet.Bookmark := Bookmark;
  end;

  if Field.IsNull then
    raise Exception.Create('Поле пустое. Выгрузка файла невозможна')
  else
    try
      SaveDialog := TSaveDialog.Create(nil);
      if Length(pTempDir) = 0 then
        SaveDialog.InitialDir := ExtractFilePath(Application.ExeName)
      else
        SaveDialog.InitialDir := pTempDir;
      SaveDialog.DefaultExt := S_DEFAULT_EXT;
      SaveDialog.Filter := S_FILTER;
      SaveDialog.FileName := pFileName;
      if SaveDialog.Execute then
      begin
        TBlobField(Field).SaveToFile(SaveDialog.FileName);
        Result := SaveDialog.FileName;
      end;
    finally
      FreeAndNil(SaveDialog);
    end;
end;

{ Просматривает файл }
procedure ViewBlob(Field: TField; pFileName: string; pTempDir: string);
var
  TempFileName: string;
  Bookmark: TBookmark;
  DataSet: TDataSet;
begin
  if (Field = nil) or (Field.IsNull) or (Field.DataType <> ftBlob) then
    raise Exception.Create('Поле пустое. Выгрузка файла невозможна');
  { Если не задано имя файла - вызываем диалог сохранения }
  if Length(pFileName) = 0 then
    TempFileName := SaveFile(Field, pFileName, pTempDir)
  { Иначе сохраняем во временную директорию }
  else
  begin
    DataSet := Field.DataSet;
    if DataSet.State = dsInsert then
    begin
      Bookmark := DataSet.Bookmark;
      DataSet.Post;
      DataSet.Refresh;
      DataSet.Bookmark := Bookmark;
    end;
    if Length(pTempDir) = 0 then
      TempFileName := ExtractFilePath(Application.ExeName)
    else
      TempFileName := pTempDir;
    TempFileName := IncludeTrailingPathDelimiter(TempFileName) + pFileName;
    TBlobField(Field).SaveToFile(TempFileName);
  end;
  {if Length(TempFileName) > 0 then
    ShellOpenFile(TempFileName);}
end;

end.
