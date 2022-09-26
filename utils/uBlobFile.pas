unit uBlobFile;

interface

uses
  DB;

{ ��������� ���� � �������� ������� BLOB, ���������� ���� � ��� ������������ ����� }
function LoadFile(Param: TParam): string; overload;

{ ��������� ���� � ���� BLOB, ���������� ���� � ��� ������������ ����� }
function LoadFile(Field: TField): string; overload;

{ ��������� ���� � ���������� string, ���������� ���� � ��� ������������ ����� }
function LoadFile(var Str: string): string; overload;

{ ��������� ���� �� ���� BLOB }
function SaveFile(Field: TField; pFileName: string; pTempDir: string = ''): string;

{ ������������� ���� }
procedure ViewBlob(Field: TField; pFileName: string; pTempDir: string = '');

implementation

uses
  Classes, Forms, Windows, Dialogs, SysUtils, uFileUtils;

const
  S_FILTER: string =
  '��� �����|*.*|' +
  '�������� Word 97-2003(*.doc)|*.doc|' +
  '�������� Word(*.docx)|*.docx|' +
  '������ Word (*.dot)|*.dot|' +
  '�������� Excel 97-2003(*.xls)|*.xls|' +
  '�������� Excel(*.xlsx)|*.xlsx|' +
  '������ Excel (*.xlt)|*.xlt' +
  '�������� ��������(*.txt)|*.txt|';
  S_DEFAULT_EXT: string = '*';

{ ��������� ���� � �������� ������� BLOB }
function LoadFile(Param: TParam): string;
var
  OpenDialog: TOpenDialog;
begin
  Result := '';

  if
  ((Param = nil) or (not (Param.DataType in [ftUnknown, ftBlob])))
  or
  ((not Param.IsNull) and (Application.MessageBox('� ������� ��������� ��� ������� ����������� ������. ��������?', '�������� �����', MB_YESNO) = ID_NO))
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

{ ��������� ���� � ���� BLOB }
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
  (Application.MessageBox('� ������� ������ ��� ������� ����������� ������. ��������?', '�������� �����', MB_YESNO) = ID_NO)
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

{ ��������� ���� � ���������� string }
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

{ ��������� ���� �� ���� BLOB }
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
    raise Exception.Create('���� ������. �������� ����� ����������')
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

{ ������������� ���� }
procedure ViewBlob(Field: TField; pFileName: string; pTempDir: string);
var
  TempFileName: string;
  Bookmark: TBookmark;
  DataSet: TDataSet;
begin
  if (Field = nil) or (Field.IsNull) or (Field.DataType <> ftBlob) then
    raise Exception.Create('���� ������. �������� ����� ����������');
  { ���� �� ������ ��� ����� - �������� ������ ���������� }
  if Length(pFileName) = 0 then
    TempFileName := SaveFile(Field, pFileName, pTempDir)
  { ����� ��������� �� ��������� ���������� }
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
