unit uNotificationsAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, dxBar, cxClasses, Data.DB, uExchDB, uExchDBData, uResource, uOVDAdd;

type
  TfmNotificationsAdd = class(TfmBaseForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    dsBaseGR: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FDB: TDBData;
  public
    { Public declarations }
    dbBaseGR: TDBData;
    procedure SetData(pDb: TDBData);

  end;

var
  fmNotificationsAdd: TfmNotificationsAdd;

implementation

{$R *.dfm}


procedure TfmNotificationsAdd.SetData(pDb: TDBData);
begin
  FDB := pDb;
end;

procedure TfmNotificationsAdd.Button1Click(Sender: TObject);
var
  fm: TfmOVDAdd;
begin
  fm := TfmOVDAdd(CreateForm('TfmOVDAdd', 'fmOVDAdd', Self, false));
  try
    fm.SetData(dbBaseGR, 1, FDB.DataSet.FieldByName('grinforamtion_id').AsString);
    if ( fm.ShowModal() = mrOk ) then begin

     // dsBaseGR.DataSetReQuery;

    end;
  finally
    fm.Free;
   // actGetData.Execute;
  end;

end;

procedure TfmNotificationsAdd.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmNotificationsAdd.FormShow(Sender: TObject);
begin

   if (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        Memo1.Text := FieldByName('message').AsString;
        dbBaseGR := DataSetQuery('grinformation_field_ovd_get', [Resource.sessionInfo.token_id, '1', 'bmf.id', FieldByName('grinforamtion_id').AsString, '='], GetFieldsArray(), true);
        dsBaseGR.DataSet := dbBaseGR.DataSet;
      end;
   end;

end;

end.
