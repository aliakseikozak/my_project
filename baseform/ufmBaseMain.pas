unit ufmBaseMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, SyncObjs, Graphics, Controls, Forms,
  Dialogs, ufmBaseForm, ActnList, dxBar, cxClasses, ufmBase,
  cxLookAndFeels, DB, Menus, System.Diagnostics,
  cxStyles, System.Actions, cxEdit, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeelPainters, cxContainer, cxProgressBar,
  dxStatusBar, Vcl.ToolWin, Vcl.ComCtrls,
  cxCustomData, cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL,
  RxSplit, cxSplitter, dxBarBuiltInMenu, cxPC, dxScreenTip, dxCustomHint, cxHint,
  cxLocalization, RTTI, dxtree, dxdbtree, ShellAPI, System.ZIP, cxLabel,
  cxDBLabel, cxTextEdit, ZAbstractRODataset, ZAbstractDataset, ZDataset, uExchDB, uExchDBData;

type
  TfmBaseMain = class(TfmBaseForm)
    btHelp: TdxBarButton;
    btWindows: TdxBarListItem;
    btArrange: TdxBarButton;
    btNext: TdxBarButton;
    btPrevious: TdxBarButton;
    actHelp: TAction;
    Statbar: TdxStatusBar;
    StatbarCont: TdxStatusBarContainerControl;
    ProgressBar: TcxProgressBar;
    cxSplitterMain: TcxSplitter;
    pnTreeDB: TPanel;
    cxPageControlForms: TcxPageControl;
    BalloonHint: TBalloonHint;
    cxHintStyleController: TcxHintStyleController;
    DBTreetMainMenu: TdxDBTreeView;
    Action1: TAction;
    dxBarButton1: TdxBarButton;
    ActUpdateSprav: TAction;
    btUpdateNSI: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarSeparator1: TdxBarSeparator;
    dxBarSeparator2: TdxBarSeparator;
    btCheckUpdPr: TdxBarButton;
    actCheckUpdatePr: TAction;
    dxBarButton2: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    StatusBar1: TStatusBar;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    Action9: TAction;
    dxBarButton12: TdxBarButton;
    aSqlLog: TAction;
    dxBarButton13: TdxBarButton;
    cxSearch: TcxTextEdit;
    dxbrbtn1: TdxBarButton;
    dsNotific: TDataSource;
    actNotif: TAction;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btWindowsGetData(Sender: TObject);
    procedure btWindowsClick(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure cxPageControlFormsCanClose(Sender: TObject; var ACanClose: Boolean);
    procedure DBTreetMainMenuDblClick(Sender: TObject);
    procedure cxPageControlFormsChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ActUpdateSpravExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure actCheckUpdatePrExecute(Sender: TObject);
    procedure DBTreetMainMenuGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure Action9Execute(Sender: TObject);
    procedure aSqlLogExecute(Sender: TObject);
    procedure cxSearchEnter(Sender: TObject);
    procedure cxSearchPropertiesChange(Sender: TObject);
    procedure Filtered();
    procedure cxSearchExit(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dxbrbtn1Click(Sender: TObject);
  private
    fIsAutoUpdate: Boolean;
    dbNotific: TDBData;
    procedure CloseAllForm;
    // �������� ���� �������
    function CloseAllDataThread: Boolean;
    procedure CreateParams(VAR Params: TCreateParams); override;
    // �������� ��� ���� ���� OnResize
    procedure OnResizeAllForms;
    // �������� ������  TabSheet  PageControlForms (����)
    procedure ResizePageControlForms();
    function GetMainProgressBar: TcxProgressBar;
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure InitFormNotif;
  public
    function Init: Boolean; virtual;
    function Connect(pUser, pPassword, pServer: String): Boolean;
    function GetMdiForm(AClass: TClass): TfmBaseForm;
    // ��������� ����� ������������� �� ������ � ��������. ����� �� ��������� ����
    procedure MainMenuTest; virtual;
    // ��������� ����� � ������ ���� �� ������� �=���� ����������
    procedure ListFormsADD(Form: TForm);
    // �������  ����� �� ������ ���� �� ������� �=���� ����������
    procedure ListFormsDel(Form: TForm);
    // �������� ��� ����� �� ������� OnResize
    procedure ResizeForm(ThePanel: TcxTabSheet);
    // �������� �� ����� WM_ACTIVATE
    procedure SendFormActivate(ThePanel: TcxTabSheet);
    function OpenForm(ClassName: string; FormClass: string; NameForm: string; FormCaption: string): Boolean;
    function LoadDBTreeListMainMenu: Boolean;
    // ��������� ���������� ���������
    procedure UpdateAppEXE(FileNamePath: string);
    procedure CloseMainApp;
    procedure HandleEvents(Milliseconds: Integer);
    // ������ �� ProgressBar
    property MainProgressBar: TcxProgressBar read GetMainProgressBar;
  end;

   var
      fmBaseMain : TfmBaseMain;
      gCaptionName: string;
      gServerName: string;

implementation

{$R *.dfm}

uses
  ExceptLibPg, uLogin, uBaseResource, uResourceForms, uCheckPass,
  uResource,
  uHttpFtpUpDownload, uExchDBDataThread, uNotifications;


procedure TfmBaseMain.HandleEvents(Milliseconds: Integer);
var
  DoneTime, TimeLeft: LongWord;
  sw: TStopwatch;
begin

  DoneTime := TThread.GetTickCount + LongWord(Milliseconds);

  TimeLeft := 100;
  sw := TStopwatch.StartNew; // timing entire process
  try
    While (TimeLeft > 0) do
    begin
      TimeLeft := DoneTime - TThread.GetTickCount;

      // continuously check application processes every 3 ms.
      if (TimeLeft mod 3 = 0) or (TThread.GetTickCount > DoneTime) then
      begin
        Application.ProcessMessages(); // clear all Vcl messages  // part of Vcl.Forms
        // CheckSynchronize(CloseMainApp); // check all threaded events
      end;

      if (TThread.GetTickCount > DoneTime) then
        break;
    end;
  finally // ensure stop is executed, whether or not close exceptions occur.
    sw.Stop;
    sw.ElapsedMilliseconds; // captures full run time for debug
  end;

end;

function TfmBaseMain.Connect(pUser, pPassword, pServer: String): Boolean;

var
  SessOld, SessNew: TSessionInfo;
  jssTmp: TFormatSettings;
  i: Integer;
  vPassNew: string;
  vPassNotShifr: string;
  vPassShifr: string;
  fmLogin: TfmLogin;
  Port: string;

  procedure SaveConn;
  var
    sessTmp: TSessionInfo;
  begin
    sessTmp.ConName := Resource.sessionInfo.ConName;
    Resource.SaveSessionInfo(sessTmp, jssTmp);
  end;

begin
  Result := False;
  if length(pUser) > 0 then
  begin
    // ���� ��������� ������� - ������� � ���� �������������
    SessNew.UserName := pUser;
    SessNew.Password := pPassword;
    if Result then
    begin
      Exit;
    end;
  end;

  SessNew := SessOld;

  i := 0;
  fmLogin := TfmLogin.Create(nil);


end;

function TfmBaseMain.GetMdiForm(AClass: TClass): TfmBaseForm;
var
  i: Integer;
begin
  Result := nil;
  if FormStyle <> fsMDIForm then
    Exit;
  for i := 0 to self.MDIChildCount - 1 do
    if self.MDIChildren[i].InheritsFrom(AClass) then
    begin
      Result := MDIChildren[i] as TfmBaseForm;
      break;
    end;
end;

function TfmBaseMain.GetMainProgressBar: TcxProgressBar;
begin
  Result := ProgressBar;
end;

function TfmBaseMain.Init: Boolean;
var
  vUser, vPassword, vServer: String;
begin

  if ParamCount > 0 then
  begin
    vUser := ParamStr(1);
    vPassword := ParamStr(2);
    vServer := ParamStr(3);
  end;
  Result := Connect(vUser, vPassword, vServer);
  if Result then
    MainMenuTest;
end;

procedure TfmBaseMain.CreateParams(VAR Params: TCreateParams);
begin
  Inherited CreateParams(Params);
  Params.WndParent := GetDesktopWindow;
end;

function TfmBaseMain.OpenForm(ClassName: string; FormClass: string; NameForm: string; FormCaption: string): Boolean;
var
  fm: TForm;
  TabSheet: TcxTabSheet;
  CRef: TPersistentClass;
  oCont: TRttiContext;
  oType: TRttiType;
begin

  oCont := TRttiContext.Create;
  oType := oCont.FindType(ClassName + '.' + FormClass);

  CRef := FindClass(FormClass);
  if Assigned(CRef) then
  begin
    fm := FindForm(TBaseFormRef(TControlClass(CRef)), FormClass, NameForm);
    if not Assigned(fm) then
    begin
      TabSheet := TcxTabSheet.Create(cxPageControlForms);
      TabSheet.PageControl := cxPageControlForms;
      TabSheet.Visible := True;

      cxPageControlForms.ActivePage := TabSheet;
      fm := CreateForm(FormClass, NameForm, TabSheet, False);
      gCaptionName := VarToStr(Resource.FormSettings.DataSet.FieldByName('form_comment').Value);
      TabSheet.Caption := FormCaption;
      ResizePageControlForms;
      Resource.EmbedFormInPanel(fm, TabSheet, True);
    end
    else
    begin
      cxPageControlForms.ActivePage := TcxTabSheet(fm.Owner);
    end;
    Result := True;
  end
  else
    Result := False;
end;

// �������� ������  TabSheet  PageControlForms (����)
procedure TfmBaseMain.ResizePageControlForms();
var
  i: Integer;
begin
  with cxPageControlForms do
  begin
    for i := 0 to PageCount - 1 do
    begin
      if (trunc(Canvas.TextWidth(Pages[i].Caption) * 1.4)) > TabWidth then
        TabWidth := trunc(Canvas.TextWidth(Pages[i].Caption) * 1.4);
      if (Canvas.TextHeight(Pages[i].Caption) * 1.4) > TabHeight then
        TabHeight := trunc(Canvas.TextHeight(Pages[i].Caption) * 1.4);
    end;
  end;
end;

procedure TfmBaseMain.DBTreetMainMenuDblClick(Sender: TObject);
begin
  if dsBase.DataSet.FieldByName('is_null').AsBoolean = False then
    if not OpenForm(dsBase.DataSet.FieldByName('form_unit').AsString, dsBase.DataSet.FieldByName('form_class').AsString, dsBase.DataSet.FieldByName('form_name').AsString,
      dsBase.DataSet.FieldByName('form_comment').AsString) then
      DialogStop('�� ������ ����� �����: ' + dsBase.DataSet.FieldByName('form_comment').AsString);
end;

procedure TfmBaseMain.DBTreetMainMenuGetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  DBTreetMainMenu.SelectedIndex := Node.ImageIndex;
end;

procedure TfmBaseMain.dxbrbtn1Click(Sender: TObject);
var
  fm: TfmNotifications;
begin

  fm := TfmNotifications(CreateForm('TfmNotifications', 'fmNotifications', Self, false));
  try
   // fm.SetData(dbBase, 1, 1);
    if ( fm.ShowModal() = mrOk ) then
    begin
   //   dbBase.DataSetReQuery;
    end;
  finally
  //  dbBase := DataSetQuery('role_permissions_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
  //  dsBase.DataSet := dbBase.DataSet;
    fm.Free;
  end;

end;

procedure TfmBaseMain.cxPageControlFormsCanClose(Sender: TObject; var ACanClose: Boolean);
begin
  inherited;
  Resource.CloseEmbeddedForms(cxPageControlForms.ActivePage);
end;

procedure TfmBaseMain.cxPageControlFormsChange(Sender: TObject);
begin
  inherited;
  if (cxPageControlForms.ActivePage <> nil) then
    SendFormActivate(cxPageControlForms.ActivePage);
  gCaptionName := cxPageControlForms.ActivePage.Caption;
end;

procedure TfmBaseMain.cxSearchEnter(Sender: TObject);
begin
  inherited;
  if cxSearch.Text='����� ��� ������...' then
    cxSearch.Text:='';
end;

procedure TfmBaseMain.cxSearchExit(Sender: TObject);
begin
  inherited;
  if cxSearch.Text<>'����� ��� ������...' then cxSearch.Text:='����� ��� ������...';
end;

procedure TfmBaseMain.Filtered();
begin
  if (length(cxSearch.Text)>2) and (cxSearch.Text<>'����� ��� ������...') then
   begin
     try
       dsBase.DataSet.DisableControls;
       dsBase.DataSet.First;
    if dsBase.DataSet.Locate('form_comment', cxSearch.Text, [loCaseInsensitive, loPartialKey]) then
      DBTreetMainMenu.SetFocus;
     finally
       dsBase.DataSet.EnableControls;
     end;
   end;
end;


procedure TfmBaseMain.cxSearchPropertiesChange(Sender: TObject);
begin
  inherited;
   Resource.SetTimerAdd(Filtered);
end;

procedure TfmBaseMain.FormCreate(Sender: TObject);
begin
  inherited;
  // ������ ��������� �����
  if FileExists(ChangeFileExt(Application.ExeName, '.bak')) then
    DeleteFile(ChangeFileExt(Application.ExeName, '.bak'));

  self.Caption := Application.Title + ' ������ ' + gServerName + ' Build ' + Resource.GetBuildInfoAsString(ParamStr(0)) + '. ������������: ' +
    Resource.sessionInfo.UserName;
  if not LoadDBTreeListMainMenu then
    DialogStop('�� ������� ��������� ���� ����������');

  fIsAutoUpdate := True;
  Application.OnIdle := ApplicationEventsIdle;
end;

procedure TfmBaseMain.FormResize(Sender: TObject);
begin
  // ��������� ������� ��� ���� ����������� ����
  OnResizeAllForms;
end;

procedure TfmBaseMain.InitFormNotif;
var
  i : Integer;
begin
  dbNotific := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuerySQL,
   ' select count(n.id) as id from mvd_personal_inf_notification n '+
   ' inner join members_user mu on mu.id = n.user_id'+
   ' where n.has_seen_user = false '+
   ' and mu.username =  ''' + VarToStr(gUser) + '''' , []);
  dsNotific.DataSet := dbNotific.DataSet;

  i := dbNotific.DataSet.FieldByName('id').Value;
  if i > 0 then
  begin
    dxbrbtn1.Style := Resource.cxStyleBlocked;
    dxbrbtn1.Caption := '�����������: ' + IntToStr(i);
  end
  else
  begin
    dxbrbtn1.Style := Resource.cxStyleEdit;
  end;
end;

procedure TfmBaseMain.FormShow(Sender: TObject);
var
  down: TFTPHTTP;
  Version: TDBData;

begin
  inherited;

  if ParamStr(1) = '/a' then
  begin
    self.WindowState := wsMaximized;
  end;

  InitFormNotif;

//  actCheckUpdatePr.Execute;

end;

function TfmBaseMain.LoadDBTreeListMainMenu: Boolean;
begin
  Result := False;
  dsBase.DataSet := DataSetQuery(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuery, 'appform_user_get', [Resource.sessionInfo.token_id]).DataSet;
  dsBase.DataSet.Filter := 'is_tree = true';
  dsBase.DataSet.Filtered := True;
  if not dsBase.DataSet.IsEmpty then
  begin
    Result := True;
    dsBase.Enabled := True;
  end;
end;

procedure TfmBaseMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Handle: THandle;
begin
{  Handle := TDBDataThread.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuery, 'user_audit_set',
    [Resource.sessionInfo.token_id, 'last_activity_date', FormatDateTime('yyyy-mm-dd hh:m:ss.zzz', NOW())]).Handle;
  WaitForSingleObject(Handle, INFINITE); }

  // ��������� ��� �����
  CloseAllForm;
  //��������� ��� ������
 { if CloseAllDataThread then
  begin
    Action := caFree;
  end
  else
    Action := caNone;  }
    Action := caFree;
  inherited;
end;

procedure TfmBaseMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if DialogQuest('��������� ������ � �������?', '���������� ������') then
  begin
    CanClose := True;
    inherited;
  end
  else
  begin
    CanClose := False;
  end;
end;

// ��������� ������� ��� ���� ����������� ����
procedure TfmBaseMain.OnResizeAllForms;
var
  Index: Integer;
begin
  index := 0;
  while (Index < cxPageControlForms.TabCount) do
  begin
    ResizeForm(cxPageControlForms.Pages[Index]);
    inc(Index);
  end;
end;

// �������� ��� ����� �� ������� OnResize
procedure TfmBaseMain.ResizeForm(ThePanel: TcxTabSheet);
var
  Index: Integer;
begin
  for Index := 0 to ThePanel.ControlCount - 1 do
  begin
    if ThePanel.Controls[Index] is TForm then
    begin
      if Assigned(TForm(ThePanel.Controls[Index]).OnResize) then
        TForm(ThePanel.Controls[Index]).OnResize(nil);
    end;
  end;
end;

// �������� ���� ���� ����������
procedure TfmBaseMain.CloseAllForm;
var
  Index: Integer;
begin
  index := 0;
  while (Index < cxPageControlForms.TabCount) do
  begin
    Resource.CloseEmbeddedForms(cxPageControlForms.Pages[Index]);
    inc(Index);
  end;

  { while (Index < Screen.FormCount) do
    begin
    if Screen.Forms[Index] <> Self then
    Screen.Forms[Index].Free;
    Inc(Index);
    end; }
  // While self.MDIChildCount>0 do
  // self.MDIChildren[0].Free;
end;

// �������� ���� �������
function TfmBaseMain.CloseAllDataThread: Boolean;
var
  i: Integer;
  hwait: DWORD;
  hCount, LasthCount: Integer; // ���������� handle
  Flags: DWORD; // dummy variable used in a call to find out if a thread handle is valid

  // ������ Handle �� ������
  procedure RemoveHandle(Index: Integer);
  begin
    if Index <> hCount then
      Resource.ArrHandles[Index] := Resource.ArrHandles[hCount];
    Dec(hCount);
    inc(LasthCount);
    ProgressShow(ProgressBar, LasthCount);
  end;

begin
  hCount := length(Resource.ArrHandles);
  LasthCount := 0;

  ProgressBar.Properties.Text := '���������� ������';
  ProgressBar.Properties.ShowText := True;
  ProgressShow(ProgressBar, LasthCount, True, 0, hCount);

  try
    // ��� ���������� �������
    repeat
      hwait := WaitForMultipleObjects(hCount, @Resource.ArrHandles, False, INFINITE);

      case hwait of
        // at least one handle has become invalid outside the wait call,
        // or more than one thread finished during the previous wait,
        // find and remove them
        WAIT_FAILED:
          begin
            if GetLastError = ERROR_INVALID_HANDLE then
            begin
              for i := hCount downto 1 do
                if not GetHandleInformation(Resource.ArrHandles[i], Flags) then // is handle valid?
                begin
                  RemoveHandle(i);
                end
                else
                begin
                  CloseHandle(Resource.ArrHandles[i]);
                  TerminateThread(Resource.ArrHandles[i], 0);
                  RemoveHandle(i);
                end;
            end
            else
              // the wait failed because of something other than an invalid handle
              RaiseLastOSError;
          end;
        WAIT_TIMEOUT:
          Application.ProcessMessages;
      else
        // one of the threads satisfied the wait, remove its handle
        // WAIT_OBJECT_0..WAIT_OBJECT_0 + nThreads - 1: RemoveHandle(hWait + 1);
        if (hwait >= WAIT_OBJECT_0) and ((WAIT_OBJECT_0 + length(Resource.ArrHandles) - 1) < hwait) then
        begin
          RemoveHandle(hwait + 1);
        end;
      end;
    until hCount = 0;
    Result := True;
  except
    Result := False;
  end;

end;

procedure TfmBaseMain.MainMenuTest;
var
  Index: Integer;
  Visible, Enabled: Boolean;
begin
  for Index := 0 to BarManager.Categories.Count - 1 do
  begin
    Visible := (BarManager.CategoryItemsVisible[Index] = ivAlways);
    BarManager.CategoryVisible[Index] := Visible;
    if Visible then
      BarManager.CategoryItemsVisible[Index] := ivAlways
    else
      BarManager.CategoryItemsVisible[Index] := ivNever;
    BarManager.CategoryVisible[Index] := True;
    BarManager.CategoryItemsVisible[Index] := ivAlways;
  end;
  for Index := 0 to BarManager.ItemCount - 1 do
  begin
    { BarManager.Items[Index].Visible :=
      BarManager.CategoryItemsVisible[BarManager.Items[Index].Category]; }
    BarManager.Items[Index].Visible := ivAlways;
    BarManager.Items[Index].Enabled := True;
  end;
end;

procedure TfmBaseMain.btWindowsGetData(Sender: TObject);
begin
  inherited;
  btWindows.ItemIndex := btWindows.Items.IndexOfObject(ActiveMDIChild);
end;

procedure TfmBaseMain.btWindowsClick(Sender: TObject);
begin
  inherited;
  TCustomForm(btWindows.Items.Objects[btWindows.ItemIndex]).Show;
end;

procedure TfmBaseMain.Action1Execute(Sender: TObject);
var
  fm: TForm;
  // down: TFTPHTTP;
  FContext: TRttiContext;
  FType: TRttiType;
  FPro: TRttiProperty;
  FProp: TRttiProperty;
  FField: TRttiField;
  s: string;
  f: Boolean;
  ff: TDBData;
  tt: TValue;
begin

  f := Resource.CheckCommonDbData(StringArray);
  f := Resource.CheckCommonDbData([Resource.CommonDbData.dbDepartments]);

  try
    FContext := TRttiContext.Create;
    FType := FContext.GetType(Resource.CommonDbData.ClassType);
    for FProp in FType.GetProperties do
    begin
      s := FProp.Name;
      if FProp.GetValue(Resource.CommonDbData).IsEmpty then
        showMessage(s + ': �����')
      else
      begin
        ff := TDBData(FProp.GetValue(Resource.CommonDbData).GetReferenceToRawData^);

        ff.DataSetReQuery;
      end;
    end;
  finally
    FContext.free;
  end;

end;

procedure TfmBaseMain.Action9Execute(Sender: TObject);
var
  dbReport: TDBData;
  down: TFTPHTTP;
begin
end;

// ���������� ����� ������������
procedure TfmBaseMain.ActUpdateSpravExecute(Sender: TObject);
var
  cr: TCursor;
  AWorkCountMax: Int64; // ���������� ����� ��������-����
  LastWorkCount: Int64; // ������� ��� ��������-����
  tempTDBData: TDBData; // ��������� ���������� ��� TDBData
  FContext: TRttiContext;
  FType: TRttiType;
  FProp: TRttiProperty;
  FField: TRttiField;
  function Plus(var Value: Int64): Int64;
  begin
    Result := Value;
    inc(Value);
  end;

begin
  LastWorkCount := 0;

  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    try
      FContext := TRttiContext.Create;
      FType := FContext.GetType(Resource.CommonDbData.ClassType);
      AWorkCountMax := length(FType.GetProperties);
      ProgressShow(ProgressBar, Plus(LastWorkCount), True, LastWorkCount, AWorkCountMax);
      for FProp in FType.GetProperties do
      begin
        if not FProp.GetValue(Resource.CommonDbData).IsEmpty then
        begin
          tempTDBData := TDBData(FProp.GetValue(Resource.CommonDbData).GetReferenceToRawData^);
          tempTDBData.DataSetReQuery;
          ProgressShow(ProgressBar, Plus(LastWorkCount));
        end;
      end;
    finally
      FContext.free;
    end;
  finally
    ProgressShow(ProgressBar, 0, False);
    Screen.Cursor := cr;
  end;
end;

procedure TfmBaseMain.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin
  Application.OnIdle := nil;

{  if (Resource.CheckUpdates) then
    actCheckUpdatePr.Execute;

  fIsAutoUpdate := False;    }
end;

procedure TfmBaseMain.aSqlLogExecute(Sender: TObject);
begin
  inherited;
  OpenForm('uSQLLog', 'TfrmSQLQueryLog', 'frmSQLQueryLog', '��� ��������');

end;

procedure TfmBaseMain.ListFormsADD(Form: TForm);
begin
  if Form.FormStyle = fsMDIChild then
    btWindows.Items.AddObject(Form.Caption, Form);
end;

procedure TfmBaseMain.ListFormsDel(Form: TForm);
begin
  if Form.FormStyle = fsMDIChild then
    btWindows.Items.Delete(btWindows.Items.IndexOfObject(Form));
end;

// ��������� ���������� ���������
procedure TfmBaseMain.UpdateAppEXE(FileNamePath: string);
var
  FileName: String;
  FileNameBak: String;
  LDate, RDate: TDateTime;
  ZIP: TZipFile;
  ZipedFileName: string;
  AMutex: THandle;
  s: String;
  i: Integer;
begin
  FileName := Application.ExeName;
  FileNameBak := ChangeFileExt(FileName, '.bak');

  if FileExists(FileNameBak) then
    DeleteFile(FileNameBak);

  if not FileExists(FileNamePath) then
    Exit;

  LDate := FileDateToDateTime(FileAge(FileName));
  RDate := FileDateToDateTime(FileAge(FileNamePath));

  if LDate >= RDate then
    Exit;

  // ���������� ���������� ������
  Screen.Cursor := crHourGlass;
  ZIP := TZipFile.Create;
  try
    if FileExists(FileNameBak) then
      DeleteFile(FileNameBak);

    ZIP.Open(FileNamePath, zmRead);
    ZipedFileName := ZIP.FileNames[0]; // ����� ������ �� ������ �.�. � ������ � ��� 1 - exe! ����

    // ������ ���� �� ����� ����� ����������� ���� �� ��� ����
    if FileExists(ExtractFilePath(Application.ExeName) + 'Temp\' + ZipedFileName) then
      DeleteFile(ExtractFilePath(Application.ExeName) + 'Temp\' + ZipedFileName);

    ZIP.Extract(ZIP.FileNames[0], ExtractFilePath(Application.ExeName) + 'Temp\', False);

    // ��������� ������ ����� �� ������
    for i := 1 to High(ZIP.FileNames) do
    begin
      if FileExists(ExtractFilePath(Application.ExeName) + ZIP.FileNames[i]) then
        DeleteFile(ExtractFilePath(Application.ExeName) + ZIP.FileNames[i]);

      ZIP.Extract(ZIP.FileNames[i], ExtractFilePath(Application.ExeName));
    end;

  finally
    ZIP.Close;
    ZIP.free;
    Screen.Cursor := crDefault;
  end;

  // �������� ������� �������������� �����
  if not FileExists(ExtractFilePath(Application.ExeName) + 'Temp\' + ZipedFileName) then
    Exit;

  // ������� ������������� FileName � FileName.bak
  if not RenameFile(FileName, FileNameBak) then
    Exit;
  // �������� ��������� ����
  if not CopyFile(PChar(ExtractFilePath(Application.ExeName) + 'Temp\' + ZipedFileName), PChar(FileName), False) then
    Exit;

  // ������ ��������� �����
  if FileExists(ExtractFilePath(Application.ExeName) + 'Temp\' + ZipedFileName) then
    DeleteFile(ExtractFilePath(Application.ExeName) + 'Temp\' + ZipedFileName);

  if FileExists(FileNamePath) then
    DeleteFile(FileNamePath);

  // AMutex := OpenMutex(MUTEX_ALL_ACCESS, True, PChar(PAnsiChar(copy(Application.Title, pos(' ', Application.Title) + 1, Length(Application.Title) - pos(' ', Application.Title)))));
  AMutex := OpenMutex(MUTEX_ALL_ACCESS, True, PChar(ExtractFileName(Application.ExeName)));

  if AMutex <> 0 then
    ReleaseMutex(AMutex);

  ShellExecute(Handle, 'open', PChar(FileName), nil, nil, SW_SHOWNORMAL);
  CloseMainApp;
end;

procedure TfmBaseMain.CloseMainApp;
var
  ProcessHandle: THandle;
  WinHwnd: HWND;
  ProcessID, ExitCode: Integer;
begin
  ProcessID := 0;
  ExitCode := 0;

  // WinHwnd := FindWindow(nil,  PChar(Application.Title));
  // WinHwnd := FindWindow('TfmBaseMain', nil);
  WinHwnd := FindWindow(PChar(Application.MainForm.ClassName), nil);

  if not(IsWindow(WinHwnd)) then
    Exit;

  GetWindowThreadProcessID(WinHwnd, @ProcessID);

  ProcessHandle := OpenProcess(PROCESS_CREATE_THREAD or PROCESS_VM_OPERATION or PROCESS_VM_WRITE or PROCESS_VM_READ or PROCESS_TERMINATE, False, ProcessID);

  if (ProcessHandle > 0) then
  begin
    GetExitCodeProcess(ProcessHandle, DWORD(ExitCode));
    // EventManager.SetEvent;
    TerminateProcess(ProcessHandle, ExitCode);
    CloseHandle(ProcessHandle);
  end;
end;

procedure TfmBaseMain.actCheckUpdatePrExecute(Sender: TObject);
var
  down: TFTPHTTP;
  Version: TDBData;
begin
  try
    Version := TDBData.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuery, 'application_versions_get',
      ['0', Resource.sessionInfo.token_id, '0', '1', '~NULL::bgl.application_versions']);
    if (Resource.GetFileVersionAsString(ParamStr(0)) <> VarToStr(Version.DataSet.FieldByName('number_version').Value)) or
      (Resource.GetBuildInfoAsString(ParamStr(0)) <> VarToStr(Version.DataSet.FieldByName('number_build').Value)) then
    begin
      {$IFDEF DEBUG}
       if DialogQuest('�������� ����� ������ ���������. ��������?') then
         begin
          if (not Version.DataSet.IsEmpty) then
           begin
            down := TFTPHTTP.Create(TFTPHTTP.TypeDownload, ProgressBar, VarToStr(Version.DataSet.FieldByName('url_file').Value),
              { VarToStr(Version.DataSet.FieldByName('file_name').Value) } 'update.zip', '', UpdateAppEXE);
            down.Resume;
           end;
         end;
      {$ELSE}
        if (not Version.DataSet.IsEmpty) then
         begin
          down := TFTPHTTP.Create(TFTPHTTP.TypeDownload, ProgressBar, VarToStr(Version.DataSet.FieldByName('url_file').Value),
            { VarToStr(Version.DataSet.FieldByName('file_name').Value) } 'update.zip', '', UpdateAppEXE);
          down.Resume;
         end;
      {$ENDIF}
    end
    else
    begin
      if (not fIsAutoUpdate) then
        DialogInfo('���������� ���������� �� ���������.');
    end;
  finally
    FreeAndNil(Version);
  end;

end;

procedure TfmBaseMain.actExitExecute(Sender: TObject);
var
  fmBase: TForm;
  Handle: THandle;
begin
  Handle := TDBDataThread.Create(Resource.sessionInfo, TDBHTTP.TypeRequest, TDBHTTP.TypeQuery, 'user_audit_set',
    [Resource.sessionInfo.token_id, 'last_activity_date', FormatDateTime('yyyy-mm-dd hh:m:ss.zzz', NOW())]).Handle;
  WaitForSingleObject(Handle, INFINITE);

  fmBase := CreateForm('TfmBase', 'fmBase', nil, False, False, 0, Tform(TfmBase));

  try
    SetAsMainForm(fmBase);
    if CloseAllDataThread then
    begin
      Self.Free;
      Application.CreateForm(TResource, Resource);
    end;
  finally
    fmBase.Close;
  end;

end;

procedure TfmBaseMain.actHelpExecute(Sender: TObject);
begin
  inherited;
  HelpShow;
end;

// �������� �� ����� WM_ACTIVATE
procedure TfmBaseMain.SendFormActivate(ThePanel: TcxTabSheet);
var
  i: Integer;
begin
  for i := 0 to ThePanel.ControlCount - 1 do
  begin
    if ThePanel.Controls[i] is TForm then
    begin
      if Assigned(TForm(ThePanel.Controls[i]).OnActivate) then
        TForm(ThePanel.Controls[i]).OnActivate(nil);
      // TForm(ThePanel.Controls[i]).Perform(WM_ACTIVATE, 0, 0);
      // SendMessage(TForm(ThePanel.Controls[i]).Handle, WM_ACTIVATE, WM_ACTIVATE,0);
    end;
  end;
end;

procedure TfmBaseMain.Timer1Timer(Sender: TObject);
begin
  inherited;
  InitFormNotif;
end;

end.
