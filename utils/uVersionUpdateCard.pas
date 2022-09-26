unit uVersionUpdateCard;

interface

uses
  Forms, ufmBase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,Data.DB,
  cxDataStorage, cxEdit, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, Classes, ActnList, cxEditRepositoryItems, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, Controls, cxContainer, cxTextEdit, cxMemo,
  uFtpDownload, cxLookAndFeels, cxNavigator, System.Actions,cxDBData;

type
  TfmVersionUpdateCard = class(TfmBase)
    memLog: TcxMemo;
    spBase: TSplitter;
    lvBase: TcxGridLevel;
    grBase: TcxGrid;
    tvBase: TcxGridTableView;
    tvBaseCHECKED: TcxGridColumn;
    tvBaseFILENAME: TcxGridColumn;
    tvBaseNOTE: TcxGridColumn;
    cxEditRepository: TcxEditRepository;
    MemoEditREADONLY: TcxEditRepositoryMemoItem;
    CheckBoxTRUEFALSE: TcxEditRepositoryCheckBoxItem;
    TextEditSTANDART: TcxEditRepositoryTextItem;
    MemoEditSTANDART: TcxEditRepositoryMemoItem;
    ActionList: TActionList;
    actExit: TAction;
    Panel1: TPanel;
    btExitPn: TcxButton;
    tvBaseURL: TcxGridColumn;
    tvBaseJREO: TcxGridColumn;
    tvBaseID: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private { fields }
    Res: Boolean;
    FUpdateDir: string;
    FAppDir: string;
    DataController: TcxDataController;
  private { methods }
    procedure InitFilesList(var pIDVersion: Integer; dtctrl: TcxDBDataController );
    procedure RunUpdate;
    procedure UpdateFile(const pFileName, url: string; const pjreo: Variant;pID: Integer);
    procedure WriteLog(const pMessage: string);
    procedure DownloadToFile(const pFileName, pLocalFileName: string; const pjreo:Variant;pID: Integer);
    procedure FtpDownloadToFile(url, FileName: string);
    procedure ExtractArchive(const pLocalFileName: string);
  public
    class function VersionUpdateCard(var pIDVersion: Integer; dtctrl:  TcxDBDataController ): Boolean;
  end;

implementation

{$R *.dfm}

uses
  uResource, uFileUtils,RxFileUtil, SysUtils, Dialogs, Variants;

const
  SQL_SELECT_VERSIONFILES: string =
  'SELECT f.filename, f.note, v.idversion, f.URL, f.jreo ' +
  'FROM ver.versionfiles AS f ' +
  'INNER JOIN ver.version AS v ON f.idversion = v.idversion ' +
  'WHERE (v.idversion > :PIDVERSION) AND v.opened ' +
  'AND ((f.jreo is NULL) OR (f.jreo=gf.get_client_id())) ' +
  'ORDER BY f.filename, f.jreo';
  SQL_SELECT_FILE: string =
  'SELECT file FROM ver.versionfiles WHERE id =:PID';
 //shara 'SELECT file FROM ver.versionfiles WHERE filename = :PFILENAME AND ((jreo=:PJREO)OR(jreo is NULL)) ;';

{ --------------- }
{ --- Methods --- }
{ --------------- }

{ ��������� ���� �� ���� }

procedure TfmVersionUpdateCard.FtpDownloadToFile(url, FileName: string);
begin
  TfmFtpDownload.FtpDownload(url,filename);
end;

procedure TfmVersionUpdateCard.DownloadToFile(const pFileName, pLocalFileName: string; const pjreo:Variant;pID: Integer);
var ppjreo : Variant;
begin
  if(pjreo='')then ppjreo:=Null else ppjreo:=pjreo;
  WriteLog(Format('�������� ���� "%s" � "%s"', [pFileName, pLocalFileName]));
 //shara if Resource.ExecSQLSimple(SQL_SELECT_FILE, 'PFILENAME;PJREO', [pFileName,ppjreo]) = 1 then
   if Resource.ExecSQLSimple(SQL_SELECT_FILE, 'PID', [pID]) = 1 then
    TBlobField(Resource.qryRun.FieldByName('file')).SaveToFile(pLocalFileName);
end;

{ ��������� ����� �� ������ }

procedure TfmVersionUpdateCard.ExtractArchive(const pLocalFileName: string);
var
  Result: Integer;
begin
  { ������������� ����� }
  WriteLog(Format('������������ ����� "%s"', [pLocalFileName]));
  Result := ShellExecuteAndWait(FAppDir, 'rar.exe', Format('x "%s" "%s" /y', [pLocalFileName, FUpdateDir]), '');
  if Result <> 0 then
    raise Exception.CreateFmt('������ ���������� %d', [Result]);
  { � ������� ����� ���������� }
  WriteLog(Format('������ ���� "%s"', [pLocalFileName]));
  if not DeleteFile(pLocalFileName) then
    raise Exception.CreateFmt('���������� ������� ���� "%s"', [pLocalFileName]);
end;

{ ��������� ���� ��������� }

procedure TfmVersionUpdateCard.UpdateFile(const pFileName, url: string; const pjreo: Variant; pID: Integer);
var
  SourceFileName, DestinationFileName, BakupFileName: string;
  StringList: TStringList;
  Index, Count: Integer;
  furl : String;
begin
  furl := url;
  SourceFileName := FUpdateDir + pFileName;
  { ������� ������� }
  WriteLog(Format('������ ������� "%s"', [FUpdateDir]));
  if not DeleteFiles(FUpdateDir + '*.*') then
    raise Exception.CreateFmt('���������� �������� ������� "%s"', [FUpdateDir]);
  { ��������� ���� �� ��������� ������� }
  if(furl = '')then
    DownloadToFile(pFileName, SourceFileName, pjreo,pID)
  else
    ftpDownloadToFile(url,SourceFileName);

  { ���� ����� - �������������  }
  if AnsiCompareText(ExtractFileExt(pFileName), '.rar') = 0 then
    ExtractArchive(SourceFileName);

  { ���� ��� ����� � ����� ���������� � ��������� � ����� � ����������.
    (����� ���������� ������ �� ����� ���� ���������) }
  StringList := TStringList.Create;
  try
    StringList.Duplicates := dupIgnore;
    StringList.Sorted := TRUE;
    FindFiles(FUpdateDir, FALSE, StringList);
    Count := StringList.Count;
    for Index := 0 to Count - 1 do
    begin
      SourceFileName := StringList[Index];
      DestinationFileName := FAppDir + ExtractFileName(SourceFileName);
      BakupFileName := ChangeFileExt(DestinationFileName, '.bak');
      { ���� ���� � ����� ��������� ���������� - ��������������� ��� � bak }
      if FileExists(DestinationFileName) then
      begin
        { ������ bak-���� ������� }
        if FileExists(BakupFileName) then
        begin
          WriteLog(Format('������ ���� "%s"', [BakupFileName]));
          if not DeleteFile(BakupFileName) then
            raise Exception.CreateFmt('���������� ������� ���� "%s"', [BakupFileName]);
        end;
        WriteLog(Format('�������� ���� "%s" � "%s"', [DestinationFileName, BakupFileName]));
        if not RenameFile(DestinationFileName, BakupFileName) then
          raise Exception.CreateFmt('���������� ��������� ���� "%s" � "%s"', [DestinationFileName, BakupFileName]);
      end;
      { ��������� ���� �� �������� ��������� � ������� ��������� }
      WriteLog(Format('�������� ���� "%s" � "%s"', [SourceFileName, DestinationFileName]));
      if not RenameFile(SourceFileName, DestinationFileName) then
        raise Exception.CreateFmt('���������� ��������� ���� "%s" � "%s"', [SourceFileName, DestinationFileName]);

      WriteLog(Format('���� "%s" ��������', [DestinationFileName]));
      { ���� ��������� ������� ������, �� ������������� ��������� }
      if AnsiCompareText(ExtractFileName(DestinationFileName), ExtractFileName(Application.ExeName)) = 0 then
      begin
        Application.Tag := 1;
        WriteLog('��������� ����� ������������');
      end;
    end;
  finally
    FreeAndNil(StringList);
  end;
end;

{ ��������� ����� ��������� }

procedure TfmVersionUpdateCard.RunUpdate;
var
  RecordIndex: Integer;
  FileName : String;
begin
  try
    { ������� �������, ���� ��� }
    WriteLog(Format('������ ������� "%s"', [FUpdateDir]));
    if not CreateDirIfNotExists(FUpdateDir) then
      raise Exception.Create('���������� ������� ������� ' + FUpdateDir);
    { ��������� ����� ��������� }
    FileName := '';
    for RecordIndex := 0 to DataController.RecordCount - 1 do
    begin
      if(FileName<>DataController.Values[RecordIndex, tvBaseFILENAME.Index])then
      begin
        UpdateFile(DataController.Values[RecordIndex, tvBaseFILENAME.Index], DataController.Values[RecordIndex, tvBaseURL.Index], DataController.Values[RecordIndex, tvBaseJREO.Index],DataController.Values[RecordIndex, tvBaseID.Index]);
        DataController.Values[RecordIndex, tvBaseCHECKED.Index] := TRUE;
        FileName:=DataController.Values[RecordIndex, tvBaseFILENAME.Index];
      end;
    end;
    Res := TRUE;
    WriteLog('���������� ���������');
    if Application.Tag = 1 then
      WriteLog('��������� ����� ������������');
  except
    on E: Exception do
    begin
      WriteLog(E.Message);
      WriteLog('!!! ���������� �� ��������� !!!');
    end;
  end;
end;

{ ��������� ������ ������ ��� ���������� }

{shara procedure TfmVersionUpdateCard.InitFilesList(var pIDVersion: Integer);
 var
  RecordIndex: Integer;
begin
  WriteLog('�������� ������ ������');
if Resource.ExecSQLSimple(SQL_SELECT_VERSIONFILES, 'PIDVERSION', [pIDVersion]) = 0 then
    Exit;
  while not Resource.qryRun.Eof do
  begin
    RecordIndex := DataController.AppendRecord;
    DataController.Values[RecordIndex, tvBaseCHECKED.Index] := FALSE;
    DataController.Values[RecordIndex, tvBaseFILENAME.Index] := Resource.qryRun.FieldByName('filename').AsString;
    DataController.Values[RecordIndex, tvBaseNOTE.Index] := Resource.qryRun.FieldByName('note').AsString;
    DataController.Values[RecordIndex, tvBaseURL.Index] := Resource.qryRun.FieldByName('url').AsString;
    DataController.Values[RecordIndex, tvBaseJREO.Index] := Resource.qryRun.FieldByName('jreo').AsString;
    if pIDVersion < Resource.qryRun.FieldByName('idversion').AsInteger then
      pIDVersion := Resource.qryRun.FieldByName('idversion').AsInteger;
    Resource.qryRun.Next;
  end;
end; shara}

procedure TfmVersionUpdateCard.InitFilesList(var pIDVersion: Integer; dtctrl : TcxDBDataController);
var
recCount,RecordIndex,i: integer;
begin
  WriteLog('�������� ������ ������');
  recCount:=dtctrl.RecordCount;
  for i := 0 to recCount-1 do
  begin
    RecordIndex := DataController.AppendRecord;
    DataController.Values[RecordIndex, tvBaseCHECKED.Index] := FALSE;
    DataController.Values[RecordIndex, tvBaseFILENAME.Index] :=  dtctrl.Values[RecordIndex,6];
    DataController.Values[RecordIndex, tvBaseNOTE.Index] := dtctrl.Values[RecordIndex,3];
    DataController.Values[RecordIndex, tvBaseURL.Index] := dtctrl.Values[RecordIndex,8];
    DataController.Values[RecordIndex, tvBaseID.Index] := dtctrl.Values[RecordIndex,7];
  end;
end;

procedure TfmVersionUpdateCard.WriteLog(const pMessage: string);
begin
  memLog.Lines.Add(pMessage);
  Application.ProcessMessages;
end;

{ -------------- }
{ --- Events --- }
{ -------------- }

{ Self }

procedure TfmVersionUpdateCard.FormCreate(Sender: TObject);
begin
  inherited;
  Res := FALSE;
  DataController := tvBase.DataController;
  FAppDir := IncludeTrailingPathDelimiter(Resource.ModuleInfo.AppDir);
  FUpdateDir := IncludeTrailingPathDelimiter(FAppDir + 'TempUpdate');
end;

procedure TfmVersionUpdateCard.FormActivate(Sender: TObject);
begin
  inherited;
  RunUpdate;
end;

{ --------------- }
{ --- Actions --- }
{ --------------- }

{ actExit }

procedure TfmVersionUpdateCard.actExitExecute(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

{ ---------------- }
{ --- External --- }
{ ---------------- }

class function TfmVersionUpdateCard.VersionUpdateCard(var pIDVersion: Integer; dtctrl :  TcxDBDataController): Boolean;
var
  fmVersionUpdateCard: TfmVersionUpdateCard;
begin
  fmVersionUpdateCard := TfmVersionUpdateCard.Create(nil);
  try
    fmVersionUpdateCard.InitFilesList(pIDVersion,dtctrl);
    fmVersionUpdateCard.ShowModal;
    Result := fmVersionUpdateCard.Res;
  finally
    FreeAndNil(fmVersionUpdateCard);
  end;
end;

end.
