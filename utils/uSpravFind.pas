unit uSpravFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSpravEdit, dxSkinsCore, dxSkinsDefaultPainters,
  cxLookAndFeelPainters, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  dxSkinsdxBarPainter, RxMemDS, Menus, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, cxLookAndFeels, ActnList, dxBar, cxClasses,
  cxGridLevel, cxGridCardView, cxGridDBCardView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxGroupBox, cxContainer, cxLabel, Buttons,
  ExtCtrls, dxSkinsForm, cxCheckBox;

type
  TfmSpravFind = class(TfmSpravEdit)
    actGet: TAction;
    btGet: TdxBarButton;
    procedure actGetExecute(Sender: TObject);
    procedure grBaseDBTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    res : Boolean;
  public
    { Public declarations }
   function Find(pidSprav : Integer; pReadOnly: Boolean;
         const ListFields : array of string;
         var Values : array of Variant): boolean; overload;

   function Find(TableName : String; pReadOnly: Boolean;
         const ListFields : array of string;
         var Values : array of Variant): boolean; overload;
  end;

var
 fmSpravFind : TfmSpravFind;


implementation

{$R *.dfm}

uses uResource;



{ TfmSpravFind }


function TfmSpravFind.Find(TableName : String; pReadOnly: Boolean;
  const ListFields: array of string;
  var Values: array of Variant): boolean;
begin
 if Resource.execSQL('select gf.getspravid(:sprav);',[TableName])<1 then
    result:=false
  else
   result:=Find(Resource.qryrun.Fields[0].AsInteger,pReadOnly,ListFields,Values);
end;


function TfmSpravFind.Find(pidSprav: Integer; pReadOnly: Boolean;
         const ListFields : array of string;
         var Values : array of Variant): boolean;
var
 i : Integer;
begin
  idSprav:= pIdSprav;
  SetEditForm;
  // если переданы значения полей - ищем
  for i:=0 to length(values)-1 do
    if not varisnull(values[i]) then
      qryBase.Locate(ListFields[i], values[i],[]);

  res:=False;
  actNew.Visible:=not pReadOnly;
  actEdit.Visible:=not pReadOnly;
  actDel.Visible:=not pReadOnly;
  actLoadFile.Visible:=not pReadOnly;
  actSave.Visible:=not pReadOnly;
  actCancel.Visible:=not pReadOnly;
  grBaseDBTableView.OptionsData.Editing:=not pReadOnly;

  ShowModal;
  result:=res;
  if res then begin
    if length(ListFields)=0 then begin // поля не переданы -- используем обозначения из регистрации справочника
       values[0]:=qryBase.FieldByName(fkeyfield).value;
       if Length(values)>1 then // хотят еще и описание -т огда ищем
         if Resource.execSQL('select '+flistfield+' from '+fTableName+' where '+fKeyField+'='+
           qryBase.FieldByName(fkeyfield).AsString,[])>0 then begin
           values[1]:=Resource.qryRun.fields[0].Value;
         end;
    end
    else
    for i:=0 to length(ListFields)-1 do
      try
        values[i]:=qryBase.FieldByName(ListFields[i]).Value;
      except
      end;
  end;
  qryBase.Close;
end;

procedure TfmSpravFind.actGetExecute(Sender: TObject);
begin
  inherited;
  if qryBase.Modified then
    qryBase.Post;
  Res:=True;
  Close;
end;

procedure TfmSpravFind.grBaseDBTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then begin
    key:=#0;
    actGetExecute(Sender);
  end;
end;

procedure TfmSpravFind.FormShow(Sender: TObject);
begin
  inherited;
  grBaseDBTableView.DataController.Groups.FullExpand;
end;


end.
