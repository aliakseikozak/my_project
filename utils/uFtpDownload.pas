unit uFtpDownload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFTP, StdCtrls, IdURI, ExtCtrls, IdAntiFreezeBase,
  IdAntiFreeze, IdExplicitTLSClientServerBase;

type
  TfmFtpDownload = class(TForm)
    ProgressBar1: TProgressBar;
    Button1: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    IdFTP1: TIdFTP;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
  private
    { Private declarations }
  public
    { Public declarations }
    AbortTransfer: Boolean;
    Res: Boolean;
    STime: TDateTime;
    furl, ffilename: String;
    class function FtpDownload(var url, filename: String): Boolean;
  end;

var
  fmFtpDownload: TfmFtpDownload;

implementation

var
 AverageSpeed: Double=0;

{$R *.dfm}
class function TfmFtpDownload.FtpDownload(var url, filename: String): Boolean;
var
  fmFtpDownload: TfmFtpDownload;
begin
  fmFtpDownload := TfmFtpDownload.Create(nil);
  fmFtpDownload.furl := url;
  fmFtpDownload.ffilename := filename;
  try
    fmFtpDownload.ShowModal;
    Result := fmFtpDownload.Res;
  finally
    FreeAndNil(fmFtpDownload);
  end;
end;


procedure TfmFtpDownload.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
 S: string;
 TotalTime: TDateTime;
 // RemainingTime: TDateTime;
 H, M, Sec, MS: Word;
 DLTime: Double;
begin
 TotalTime:=Now-STime;
 DecodeTime(TotalTime, H, M, Sec, MS);
 Sec:=Sec+M*60+H*3600;
 DLTime:=Sec+MS/1000;
 if DLTime>0
 then AverageSpeed:={(AverageSpeed + }(AWorkCount/1024)/DLTime{)/2};
 if AverageSpeed>0
 then
  begin
   Sec:=Trunc(((ProgressBar1.Max-AWorkCount)/1024/AverageSpeed));
   S:=Format('%2d:%2d:%2d', [Sec div 3600, (Sec div 60) mod 60, Sec mod 60]);
   S:='Оставшееся время '+S;
  end
 else S:='';
 //
 S:=FormatFloat('0.00 KB/s', AverageSpeed)+'; '+S;
 case AWorkMode of
  wmRead: Label1.Caption:='Скорость загрузки '+S;
  wmWrite: Label1.Caption:='Uploade speed '+S;
 end;
 if AbortTransfer
 then IdFTP1.Abort;
 ProgressBar1.Position:=AWorkCount;
 AbortTransfer:=false;
 //Self.Repaint;

end;


procedure TfmFtpDownload.IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
begin
  Res := true;
  ModalResult := mrOK;
end;

procedure TfmFtpDownload.Button1Click(Sender: TObject);
begin
 AbortTransfer:=true;
 Res := false;
end;

procedure TfmFtpDownload.FormActivate(Sender: TObject);
var
  Uri: TIdURI;
  Str : string;
begin
{  Uri := TIdURI.Create(FURL);
  IdFTP1.Host := URI.Host;
  IdFTP1.Username:=URI.Username;
  IdFTP1.Password:=URI.Password;
  IdFTP1.Connect;

  Str:=URI.Path;
  Str[1] := ' ';
  Str[Length(URI.Path)] := ' ';
  Str := Trim(Str);
  IdFTP1.ChangeDir(Str);
  ProgressBar1.Max := IdFTP1.Size(uri.Document);
  IdFTP1.Get(uri.Document, ffilename, true, false);    }
end;

procedure TfmFtpDownload.Timer1Timer(Sender: TObject);
var
  Uri: TIdURI;
  Str : string;
  S : Integer;
begin
  Timer1.Enabled := false;
  Uri := TIdURI.Create(FURL);
  IdFTP1.Host := URI.Host;
  IdFTP1.Username:=URI.Username;
  IdFTP1.Password:=URI.Password;
  IdFTP1.Connect;

  Str:=URI.Path;
  Str[1] := ' ';
  Str[Length(URI.Path)] := ' ';
  Str := Trim(Str);
  IdFTP1.ChangeDir(Str);
  try
  ProgressBar1.Max := IdFTP1.Size(uri.Document);
  finally
  end;
  IdFTP1.Get(uri.Document, ffilename, true, false);
end;

end.
