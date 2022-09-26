unit uRolesAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxLayoutContainer, Vcl.StdCtrls, Vcl.ExtCtrls,
  cxClasses, dxLayoutControl, uExchDB, uExchDBData, uResource, ufmBaseForm;

type
  TfmRolesAdd = class(TfmBaseForm)
    dxLayoutControl2: TdxLayoutControl;
    Edit1: TEdit;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem8: TdxLayoutItem;
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    Edit2: TEdit;
    dxLayoutItem1: TdxLayoutItem;
    function GenParams(): string;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FMode: integer;
    FDB: TDBData;
    dbIU: TDBData;
    { Private declarations }
  public
    { Public declarations }
    procedure SetData(pDb: TDBData; pMode: integer);
  end;

var
  fmRolesAdd: TfmRolesAdd;

implementation

{$R *.dfm}


procedure TfmRolesAdd.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmRolesAdd.SetData(pDb: TDBData; pMode: integer);
begin
  FDB := pDb;
  FMode := pMode;
end;

procedure TfmRolesAdd.btnOkClick(Sender: TObject);
begin
  if FMode = 0 then
  begin
    dbIU := DataSetQuery('roles_set', ['0', VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end
  else
  begin
    dbIU := DataSetQuery('roles_set', [FDB.DataSet.FieldByName('id').Value, VarToStr(FMode), Resource.sessionInfo.token_id, GenParams()]);
  end;
  Close;
end;

procedure TfmRolesAdd.FormShow(Sender: TObject);
begin
   BarManagerMainBar.Visible := false;
   BarManagerMainMenu.Visible := false;
   if (FMode = 1) and (not FDB.DataSet.IsEmpty) then
   begin
      with FDB.DataSet do
      begin
        Edit1.text := FieldByName('name').Value;
        Edit2.text := FieldByName('code_name').Value;
      end;
   end;
//   EnabledEdData(Self, gNameForm, 'fmWorkAdd',  1);
end;

function TfmRolesAdd.GenParams(): string;
begin
  result := '';


  IF Edit1.Text <> '' then
    result := result + Edit1.Text + '~'
  else
    result := result + 'NULL' + '~';

  IF Edit2.Text <> '' then
    result := result + Edit2.Text + '~'
  else
    result := result + 'NULL' + '~';

end;

end.
