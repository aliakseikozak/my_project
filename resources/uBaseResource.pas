
unit uBaseResource;

interface

uses
  System.SysUtils, Vcl.Forms, Vcl.Controls, IniFiles,
  Vcl.ExtCtrls, System.Classes,
  Data.DB, System.ImageList, Vcl.ImgList, ZSqlMonitor, ZAbstractConnection,
  ZConnection, ZAbstractRODataset, ZAbstractDataset, ZDataset;
const
  WM_AFTER_SHOW = 300; // ���������� ��� �������� �������� ����� ������������

type
  TModuleInfo = record
    Name: string;            // �������� ������
    FIO: string;             // ��� ������������
    ThousandSeparator: Char; // ����������� ����� ��������
    SuperUser: string;       // ��� ����������
    AppDir: string;          // ������� ���������
    TempDir: string;         // ��������� �������
  end;

  TSessionInfo = record
    UserName: string;
    IsSuperUser: Boolean;
    token_id: string;
    Database: string;
    HostName: string;
    Shema   : string;
    Password: String;
    Catalog: String;
    ConName: string;
    Temp_NameSpace: string;
    Client_name : String; // ������������ �������  ��������� �������
  end;

  TBaseResource = class(TDataModule)
 {   ZConn: TZConnection;
    ZSQLMonitor: TZSQLMonitor;
    qryRun: TZQuery;  }
    ImageList: TImageList;
    ImageListDlg: TImageList;
    ImageListStatus: TImageList;
    ZConn: TZConnection;
    ZSQLMonitor: TZSQLMonitor;
    qryRun: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure AppException(Sender: TObject; E: Exception);
  protected
    FTechsupportMessage: string;
    FVisibleInterval: Integer;
    FInvisibleInterval: Integer;
  public
    ModuleInfo: TModuleInfo;
    sessionInfo : TSessionInfo;
    JsonFormatSettings: TFormatSettings;
    IniFile: TiniFile;
    DS, DS2: TStringList; // ��� ����� ���� �������
    procedure AfterConnect;
    procedure SetSessionInfo; // ������������� ��������� ������
    procedure SetClient_id; // ������������� ����������� ���������� �� ������� �� ������� Zconn
    property TechsupportMessage: string read FTechsupportMessage; // ��������� � �������� ������������
    property VisibleInterval: Integer read FVisibleInterval; // ��������, � ������� �������� ������������ ��������� � �������� ������������ (� ��������). 0 - �� ������������
    property InvisibleInterval: Integer read FInvisibleInterval; // �������� ����� �������� ��������� � �������� ������������ (� ��������). 0 - ������������ ������ ��� ������� ���������
  end;

const
  DEFAULT_HOST:               string  = 'localhost';
  DEFAULT_THOUSAND_SEPARATOR: Char    = ' ';
  DEFAULT_DECIMAL_SEPARATOR:  Char    = '.';

  DEFAULT_FONT_SIZE:          Integer = 8;
  MIN_FONT_SIZE:              Integer = 8;
  MAX_FONT_SIZE:              Integer = 12;

  cWeekDaysShort: array[1..7] of string = ('��', '��', '��', '��', '��', '��', '��');

// ������ ������ �� ����
procedure SetCursorWait(pwait: Boolean = false);

implementation

{$R *.dfm}

uses
  uResourceForms, ExceptLibPg;

{ ������ ������ �� ���� }
procedure SetCursorWait(pwait : Boolean =false);
begin
 if pWait then
   Screen.Cursor:= crHourGlass
 else
   Screen.cursor:= crDefault;
 Application.ProcessMessages;
end;

{TBaseResource}

// ������������� ����������� ���������� �� ������� �� ������� Zconn
procedure TBaseResource.SetClient_id;
begin

end;

procedure TBaseResource.AfterConnect;
begin
  setSessionInfo;
end;

{ ���������� ����������� ��������� }
procedure TBaseResource.AppException(Sender: TObject; E: Exception);
begin
  DialogStop(ExceptMessage(E));
end;

procedure TBaseResource.DataModuleCreate(Sender: TObject);
begin
  inherited;
  FormatSettings.ShortDateFormat := 'dd.mm.yyyy';
  FormatSettings.LongDateFormat := 'dd.mm.yyyy';
  FormatSettings.CurrencyString := '';
  FormatSettings.DecimalSeparator := DEFAULT_DECIMAL_SEPARATOR;
  Application.OnException := AppException;
  ModuleInfo.AppDir := ExtractFilePath(Application.ExeName);
end;


procedure TBaseResource.setSessionInfo;

  function GetVersion: string;
  begin
      Result := '1.0';
  end;

begin
  SessionInfo.IsSuperUser:=(ModuleInfo.superuser = SessionInfo.UserName);
  // ��������� ���������� ���������� �� �������
  SetClient_id;
end;



end.
