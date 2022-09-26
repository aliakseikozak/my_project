unit uProgressBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Data.DB;

type
  TfrmProgressBar = class(TForm)
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Label1: TLabel;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgressBar: TfrmProgressBar;

implementation

uses
  uResource, RTTI;

{$R *.dfm}


procedure TfrmProgressBar.Timer1Timer(Sender: TObject);
var
  FContext: TRttiContext;
  FType   : TRttiType;
  FProp   : TRttiProperty ;
  Index   : Integer;

begin
  ProgressBar1.Max := CntArrDbData;
  FContext := TRttiContext.Create;
  FType := FContext.GetType(Resource.CommonDbData.ClassType);
  CntArrDbData := Length(gArrDbData);
  for FProp in FType.GetProperties do
  begin
    if Length(gArrDbData) > 0 then
    begin
      for Index := 0 to Length(gArrDbData) - 1 do
      begin
        if gArrDbData[Index] = copy(FProp.Name,2,Length(FProp.Name)-1) then
        begin
          if FProp.GetValue(Resource.CommonDbData).IsEmpty then
          begin
            while FProp.GetValue(Resource.CommonDbData).IsEmpty do
            begin
              Application.ProcessMessages;
              Sleep(3000);
            end;
            Application.ProcessMessages;
            ProgressBar1.Position := ProgressBar1.Position + 1;
          end
          else
          begin
            Application.ProcessMessages;
            ProgressBar1.Position := ProgressBar1.Position + 1;
          end;
        end;
      end;
    end;
  end;
  if ProgressBar1.Position = CntArrDbData  then
  begin
    Timer1.Enabled := false;
    Application.ProcessMessages;
    Close;
  end;
end;

end.
