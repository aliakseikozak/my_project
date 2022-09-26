unit uResourceForms;

interface

uses Forms, Windows,ufmBaseForm,uMessage, uMessageExp, cxProgressBar;

const
  IDIMAGE_QUERY:   Integer = 0;
  IDIMAGE_INFO:    Integer = 1;
  IDIMAGE_WARNING: Integer = 2;
  IDIMAGE_STOP:    Integer = 3;

type
  TBaseFormRef = class of TfmBaseForm;


{ ��������� � �������� �� �������� }
function DialogQuest(const pMessage: string; const pCaption: string = '������'): Boolean;

{ �������������� ��������� }
procedure DialogInfo(const pMessage: string; const pCaption: string = '����������');

{ ��������� �� ������ }
procedure DialogStop(const pMessage: string; const pCaption: string = '������');

// ����������/���������, �������� Progressbar �� ������� �����
// ���� ���������� false  - ������ ������� �������
procedure ProgressShow(PrBar: TcxProgressBar; pPos : Int64; pShow :Boolean = True; pMin :Integer =-1; pMax :Integer =-1);

{ ������� ��������� � ������ ��������� ������� ����� }
procedure MessageInfo(const pText: string = '');
//procedure MessageInfoFmt(const pText: string; const pArgs: array of const);
{ ��������� ������� �� ����� ���������� ������ � ��� ������������� ������� �� }
function FindForm(AClass: TBaseFormRef): TForm;


implementation

uses
  ufmBaseMain;

// ����������/���������, �������� Progressbar �� ������� �����
// ����������/���������, �������� Progressbar
procedure ProgressShow(PrBar: TcxProgressBar; pPos : Int64; pShow :Boolean = True; pMin :Integer =-1; pMax :Integer =-1);
begin

  PrBar.Visible := pShow;

  if ( pMin > -1 ) then
    PrBar.Properties.Min := pMin;

  if ( pMax > -1 ) then
    PrBar.Properties.Max := pMax;

  PrBar.Position := pPos;
  PrBar.Update;

end;

{ function ProgressShow(pPos :Integer; pShow :Boolean = True; pMin :Integer =-1; pMax :Integer =-1) : Boolean;
 var ProgressBar: TcxProgressBar;
begin
  result:=True;
  ProgressBar:= (Application.MainForm as TfmBaseMain).ProgressBar;
  ProgressBar.Visible:= pShow;
//  fmMain.ProgressBar.Visible:=pShow;
  if pMin>-1 then
    ProgressBar.Properties.Min:= pMin;
//    fmMain.ProgressBar.Properties.Min:=pMin;
  if pMax>-1 then
    ProgressBar.Properties.Max:= pMax;
//    fmMain.ProgressBar.Properties.Max:=pMax;
  ProgressBar.Position:= pPos;
//  fmMain.ProgressBar.Position:=pPos;
  if pPos=0 then
    ProgressBar.Tag:= 0; // ������ ����������
//    fmMain.ProgressBar.Tag:=0; // ������ ����������
  ProgressBar.Invalidate;
//  fmMain.ProgressBar.Invalidate;
  Application.ProcessMessages;
  if ProgressBar.Tag = 1 then
  begin
    if DialogQuest('�������� ����������', '�������') then
    begin
      Result := FALSE;
      ProgressBar.Tag := 2;
    end
    else
      ProgressBar.Tag := 0;
  end;

 if fmMain.ProgressBar.Tag = 1 then
  begin
    if DialogQuest('�������� ����������', '�������') then
    begin
      Result := FALSE;
      fmMain.ProgressBar.Tag := 2;
    end
    else
      fmMain.ProgressBar.Tag := 0;
  end;
end;    }

{ ������� ��������� � ������ ��������� ������� ����� }

procedure MessageInfo(const pText: string = '');
begin
  if Assigned(Application.MainForm) then
  begin
    (Application.MainForm as TfmBaseMain).StatBar.Panels[1].Text := pText;
  end;
  Application.ProcessMessages;
end;

function DialogQuest(const pMessage: string; const pCaption: string = '������'): Boolean;
begin
  Result := TfmMessage.MessageShow(
    pMessage, pCaption, MB_YESNO, IDIMAGE_QUERY) = ID_YES;
end;

{ �������������� ��������� }

procedure DialogInfo(const pMessage: string; const pCaption: string = '����������');
begin
  TfmMessage.MessageShow(pMessage, pCaption, MB_OK, IDIMAGE_INFO);
end;

{ ��������� �� ������ }

procedure DialogStop(const pMessage: string; const pCaption: string = '������');
begin
  TfmMessage.MessageShow(pMessage, pCaption, MB_OK, IDIMAGE_STOP);
end;

{ ��������� ������� �� ����� ���������� ������ � ��� ������������� ������� �� }
function FindForm(AClass: TBaseFormRef): TForm;
var Index: Integer;
begin
  Result := nil;
  { ���� ����� }
  Index := 0;
  if AClass.ClassName <> 'TfmKart' then  begin
   while (Index < Screen.FormCount) and (not Assigned(Result)) do
   begin
    if Screen.Forms[Index].ClassType = AClass then
      Result := Screen.Forms[Index]
    else
      Inc(Index);
   end;
  end;
  { ���� �� ����� - ��������� �� �����, ���� ���� ����� - ������� }
  if not Assigned(Result) then
  begin
      Result := AClass.Create(Application.MainForm);
//      Application.CreateForm(AClass, Result);
  end;
end;


end.

