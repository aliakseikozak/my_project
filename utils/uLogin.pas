unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels, IniFiles, ShellAPI,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, uExchDBData, ufmBaseForm;

type
  TfmLogin = class(TForm)
    pnUser: TPanel;
    Label1: TLabel;
    edUser: TLabeledEdit;
    edPass: TLabeledEdit;
    cbServer: TComboBox;
    pnChangePass: TPanel;
    edPassNew1: TLabeledEdit;
    edPassNew2: TLabeledEdit;
    pnButton: TPanel;
    btChangePass: TcxButton;
    btAdvance: TcxButton;
    btOk: TcxButton;
    btCancel: TcxButton;
    pnAdvance: TPanel;
    cbSaveBD: TCheckBox;
    edHost: TLabeledEdit;
    procedure btOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btAdvanceClick(Sender: TObject);
    procedure btChangePassClick(Sender: TObject);
  private
    { Private declarations }
    FAdvVisible: Boolean;
    resConn : Boolean;
    h: Integer;
    dbIU: TDBData;
    procedure SetHeight;
    procedure SetAdvVisible(const Value: Boolean);
    property  AdvVisible: Boolean read FAdvVisible write SetAdvVisible;  // �������������� ������ - ������� ��� ���
    function MoveDir(fromDir, toDir: String): Boolean;
  public
    procedure LoadListConfig(IniFile: TIniFile);
     function UserPasswordChange(pNewPassword: String): boolean;
    { Public declarations }
  end;

var
  Shema : string;
  gUser : string;

implementation

{$R *.dfm}

uses
  uResource, uResourceForms, uExchDB, uKartUtils, uExchDBDataThread, ufmBaseMain;
const
 USER_TEST_PASS = '98765';

function TfmLogin.UserPasswordChange(pNewPassword: String): boolean;
var
 tmpDB : TDBData;
begin
  if (pNewPassword = '') then
  begin
     DialogStop('������ �� ����� ���� ������!')
  end
  else
  begin
    try
      tmpDB := TDBData.Create(Resource.sessionInfo,
                         TDBHTTP.TypeRequest,
                         TDBHTTP.TypeQuery,
                         'users_password_set',
                         [Resource.sessionInfo.token_id, GenerateSHA1(pNewPassword)]);
      if tmpDB.DataSet.FieldByName('r_errCode').Value <> '0' then
        Result := False
      else
        Result := True;
    finally
       FreeAndNil(tmpDB);
    end;
  end;
end;

function TfmLogin.MoveDir(fromDir, toDir: String): Boolean;
var
  fos: TSHFileOpStruct;
  toDir2: string;
  sDir, sNewDir: string;
begin
  toDir2 :=toDir;
  sDir := ExtractFilePath(Application.ExeName) + 'Settings\Forms\ltp.ini';
  sNewDir := ExtractFilePath(Application.ExeName) + 'ltp.ini';
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc := FO_MOVE;
//fFlags := FOF_FILESONLY;
    fFlags:= FOF_SIMPLEPROGRESS;
    fflags:= fflags or FOF_NOCONFIRMATION;
    fflags:= fflags or FOF_SILENT;
    pFrom := PChar(fromDir + #0);
   pTo := PChar(toDir2);
  end;
  Result := (0 = ShFileOperation(fos));
  CopyFile(PWideChar(sDir), PWideChar(sNewDir), true);
end;

procedure TfmLogin.btAdvanceClick(Sender: TObject);
begin
  AdvVisible:= not AdvVisible;
end;

procedure TfmLogin.btCancelClick(Sender: TObject);
begin
  Application.Terminate;

end;

procedure TfmLogin.btChangePassClick(Sender: TObject);
begin
  pnChangePass.Visible:= not pnChangePass.Visible;
  SetHeight;
end;

procedure TfmLogin.SetAdvVisible(const Value: Boolean);
begin
  FAdvVisible := Value;
  pnAdvance.Visible:=FAdvVisible;
  SetHeight;
  if FAdvVisible then
    btAdvance.Caption:='<< ������'
  else
    btAdvance.Caption:='������������� >>';
  if Self.Active then
   if FAdvVisible then
     edHost.setFocus
   else
     edPass.SetFocus;
end;

procedure TfmLogin.btOkClick(Sender: TObject);
var
 token_id: string;
 s: string;
 Index: Integer;
 flagRep: Boolean;
 tmpDB : TDBData;
begin
  cbServer.Text := 'http://mvdltp.bs-solutions.by/content';
 // edUser.Text := 'Test';
 // edPass.Text := '98765';

  if ( edPassNew1.Text <> edPassNew2.Text ) and ( (edPassNew1.Text <> '') or (edPassNew2.Text <> '')) then
     DialogStop('��������� ������ ��� ������� �� ���������!')
  else
  begin
    gUser := edUser.Text;
    btOk.Enabled := False;

     //�������� ������
    token_id := Resource.Authorisation(edUser.Text, edPass.Text, Shema, cbServer.Text);
    if token_id <> '' then
    begin

      ResConn :=True;
      //��������� ���������� ����������
      Resource.SetGlobalInfo(token_id, edUser.Text, Shema, cbServer.Text);
      Resource.LoadSessionInfo(Resource.SessionInfo, Resource.JsonFormatSettings);
      Resource.LoadFormSettings();
      //���������� ���������� ����������
      if (cbSaveBD.Checked = True ) and ( edHost.Text <> '' ) then
      begin
        flagRep := True;
        for Index := 0 to cbServer.Items.Count - 1 do
        begin
          if edHost.Text = cbServer.Items[Index] then
            flagRep := False;
        end;
        if flagRep then
          cbServer.Items.Add(edHost.Text);
      end;

      Resource.SaveSessionInfo(Resource.SessionInfo, Resource.JsonFormatSettings, cbServer.Items);

      //����� ������
      if (edPassNew1.Text <> '') or (edPassNew2.Text <> '') then
      begin
        if (UserPasswordChange(edPassNew1.Text)) then
        begin
          DialogInfo('������ ��� �������!')
        end
        else
        begin
          DialogInfo('������ �� �������!');
        end;
      end;
      //������ ���� ����� ������������ � �������
     { TDBDataThread.Create(Resource.sessionInfo,
                                               TDBHTTP.TypeRequest,
                                               TDBHTTP.TypeQuery,
                                               'user_audit_set',
                                               [token_id, 'first_activity_date', FormatDateTime('yyyy-mm-dd hh:m:ss.zzz', NOW())]);
       }
      try


        tmpDB := TDBData.Create(Resource.sessionInfo,
                         TDBHTTP.TypeRequest,
                         TDBHTTP.TypeQuery,
                         'get_datauser',
                         [token_id]);


        if (tmpDB.DataSet.IsEmpty) then
        begin
          DialogStop('������������ ������������!');
          btOk.Enabled := True;
          Exit;
        end;

      finally
        FreeAndNil(tmpDB);
      end;


     // fmform := CreateForm(TfmBaseMain, Application.MainForm, 'fmBaseMain');
      if DirectoryExists('Settings') then
      begin
        if DirectoryExists('Settings\Forms') then
        begin
          MoveDir(ExtractFilePath(Application.ExeName) + '*.ini', ExtractFilePath(Application.ExeName)+ 'Settings\Forms');
        end
        else
        begin
          ForceDirectories(ExtractFilePath(Application.ExeName) + '\Settings' + '\Forms');
          MoveDir(ExtractFilePath(Application.ExeName) + '*.ini', ExtractFilePath(Application.ExeName)+ 'Settings\Forms');
        end;
      end
      else
      begin
        ForceDirectories(ExtractFilePath(Application.ExeName) + '\Settings');
        ForceDirectories(ExtractFilePath(Application.ExeName) + '\Settings' + '\Forms');
        MoveDir(ExtractFilePath(Application.ExeName) + '*.ini', ExtractFilePath(Application.ExeName)+ 'Settings\Forms');
      end;

      gServerName := cbServer.Text;
      delete(gServerName, 1, 8);
      gServerName := Copy(gServerName, 1, Pos('.', gServerName)-1);
      fmform := CreateForm('TfmBaseMain', 'fmBaseMain', Application.MainForm, False);
      //fmBaseMain.ShowModal;
      if Assigned(fmform) then
      begin
        SetAsMainForm(fmform);
        fmform.Show;
        Self.Close;
      end;
    end
    else
    begin
      DialogStop('�������� ����� ��� ������');
      btOk.Enabled := True;
    end;
  end;
end;

procedure TfmLogin.FormActivate(Sender: TObject);
begin
 if Length(edUser.Text)>0 then
  edPass.SetFocus
 else
  edUser.SetFocus;
end;


procedure TfmLogin.SetHeight;
var
  m : integer;
begin
  Self.Height:=h;
  m:=0;
  if pnChangePass.Visible=False then
    m:=pnChangePass.Height;
  if pnAdvance.Visible=false then
    m:=m+pnAdvance.Height;
  Self.Height:=Self.Height-m;
end;

procedure TfmLogin.FormCreate(Sender: TObject);
begin
  h := Self.Height;
  SetHeight;
  LoadListConfig(Resource.IniFile);
end;

procedure TfmLogin.FormShow(Sender: TObject);
begin
  Self.Caption := Application.Title;
end;

{ ��������� ������ ���������� � ���������� �� ����� ������������}
procedure TfmLogin.LoadListConfig(IniFile: TIniFile);
var
  StringList: TStringList;
  Index: Integer;
  Host, Key: string;
begin
  if IniFile.SectionExists('DB') then
  begin
   edUser.Text := IniFile.ReadString('DB', 'UserName','');
   Shema := IniFile.ReadString('DB', 'Shema','');
  end;

  cbServer.Items.Clear;
  if not IniFile.SectionExists('HOST') then
    Exit;
  StringList := TStringList.Create;
  try
    StringList.Sorted := TRUE;
    StringList.CaseSensitive := FALSE;
    StringList.Duplicates := dupAccept;

    IniFile.ReadSectionValues('HOST', StringList);
    for Index := 0 to StringList.Count - 1 do begin
     Host:= Copy(StringList[Index], Pos('=', StringList[Index])+1, Length( StringList[Index]) - Pos('=', StringList[Index]));
     Key:= Copy(StringList[Index], 0, Pos('=', StringList[Index]) - 1);
     if cbServer.Items.IndexOf(Host) = -1
      then cbServer.Items.Add(Host)
      else IniFile.DeleteKey('HOST', Key);
    end;
    IniFile.UpdateFile;

    if cbServer.Items.Count > 0 then
       cbServer.ItemIndex := 0;
  finally
    FreeAndNil(StringList);
  end;
  edPass.Text:='';
 {$IFDEF DEBUG}
  if (edUser.Text='Test') then edPass.Text:= USER_TEST_PASS;
 {$ENDIF}
end;

end.
