unit uFindSql;

interface

uses
  Forms, ufmBaseFind, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, Menus,
  Classes, ActnList, dxBar, cxClasses,
  cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGroupBox, cxContainer, cxLabel, Controls, ExtCtrls,
  cxExtEditRepositoryItems, cxLookAndFeels, cxNavigator,
  System.Actions;

type
  TfmFindSql = class(TfmBaseFind)
  private
    resarray : array of array of Variant;
    procedure SetTableFormat;

  public
    function Find(const pSQL, pCaption, pParamNames: string; const pParamValues:
      array of Variant; const Multiselect: Boolean = TRUE): Boolean; overload;
    procedure SaveRec(Index: Integer); override;
    function GetResultCount: Integer;
    function GetResult(row, col :Integer):Variant;
    procedure ClearRes;
    procedure activeFilter(field : TcxGridDBColumn);
    class procedure setFilter(pstrFilter : String;pindexField : Integer);

  end;

var
  fmFindSql: TfmFindSql;

implementation
{$R *.dfm}

uses
  uResource,uResourceForms, uArrays, SysUtils, Variants, ufmBaseGrid;
var
  isFilter : Boolean;
  strFilter : String;
  indexField : Integer;

procedure TfmFindSql.ClearRes;
begin
  SetLength(resarray,0,0);
end;

function TfmFindSql.Find(const pSQL, pCaption, pParamNames: string; const
  pParamValues: array of Variant; const Multiselect: Boolean = TRUE): Boolean;
var
  ParamNames: TStringArray;
  ParamName: string;
  Param: TParam;
  ParamIndex, ParamCount: Integer;
begin
  grBaseDBTableView.OptionsSelection.MultiSelect := Multiselect;
  Self.Caption := pCaption;
  { pParamNames содержит наименования параметров запроса через ";". Извлекаем
    наименования в строковый массив и сравнивает количество значений параметров
    с количеством значений параметров }
  ParamNames := StringToArray(uppercase(pParamNames), ';');
  ParamCount := Length(ParamNames);
  if Length(pParamValues) <> ParamCount then
    raise Exception.CreateFmt('FindSQL: количество параметров (%d) не соответствует количеству значений параметров (%d)', [ParamCount, Length(pParamValues)]);
  { Проверяем, присутствует ли в запросе параметр с заданным именем. Если
    присутствует - задаем ему значение, если нет - вызываем исключение }

  for ParamIndex := 0 to ParamCount - 1 do
  begin
    ParamName := ParamNames[ParamIndex];
    if not Assigned(Param) then
      raise Exception.CreateFmt('FindSQL: параметр (%s) не найден в запросе', [ParamName]);
    Param.Value := pParamValues[ParamIndex];
  end;

  Result := FALSE;
  Res := FALSE;
  SetLength(ResArray, 0, 0);

end;

procedure TfmFindSql.SaveRec(Index: Integer);
var
  j:integer;
begin
  inherited;
  if Length(ResArray) <= Index then
    SetLength(ResArray, Index + 1, grBaseDBTableView.ColumnCount);
  for j:=0 to length(resarray[index])-1 do
    resarray[index,j] := grBaseDBTableView.Controller.SelectedRows[index].Values[j];
end;

function TfmFindSql.GetResultCount: Integer;
begin
  Result := Length(ResArray);
end;

function TfmFindSql.GetResult(row, col: Integer): Variant;
begin
  try
   result:=resarray[row,col];
  except
   result:=null;
  end;
end;

procedure TfmFindSql.SetTableFormat;
var
  Index: Integer;
  Column: TcxGridDBColumn;
begin
  grBaseDBTableView.ClearItems;
end;
procedure TfmFindSql.activeFilter(field : TcxGridDBColumn);
begin
    //actFilter.Execute;
   grBaseDBTableView.DataController.Filter.BeginUpdate;
 try
   grBaseDBTableView.DataController.Filter.Root.Clear;
   grBaseDBTableView.DataController.Filter.Root.AddItem(field, foLike, '%'+strFilter+'%', strFilter);
 finally
   grBaseDBTableView.DataController.Filter.EndUpdate;
   grBaseDBTableView.DataController.Filter.Active := true;
 end;
      //AddItem(field, foLike, '%'+strFilter+'%', 'фильтр по значению: ''' + strFilter+''' ');

end;

class procedure TfmFindSql.setFilter(pstrFilter : String;pindexField : Integer);
begin
  isFilter := True;
  strFilter := pstrFilter;
  indexField := pindexField;
end;
end.
