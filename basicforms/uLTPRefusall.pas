unit uLTPRefusall;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, System.Actions,
  Vcl.ActnList, dxBar, cxClasses, cxSplitter, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutContainer, Vcl.StdCtrls, dxLayoutControl, cxLabel, Vcl.ExtCtrls,
  uResourceForms, uExchDB, uExchDBData;

type
  TfmLTPRefusall = class(TfmBaseGrid)
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    grBaseDBTableViewColumn6: TcxGridDBColumn;
    grBaseDBTableViewColumn7: TcxGridDBColumn;
    procedure actGetDataExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    dbIU: TDBData;
  public
    { Public declarations }
  end;

var
  fmLTPRefusall: TfmLTPRefusall;
  pedit: boolean;

implementation
uses
  uKartUtils, uResource, uLTPRefusallAdd, uOVDAdd, uLogin;

{$R *.dfm}

procedure TfmLTPRefusall.actDelExecute(Sender: TObject);
begin

  if DialogQuest('������� ������? �� �������?', '�������� ������') then
  begin
    dbIU := DataSetQuery('refusal_del', [dbBase.DataSet.FieldByName('id').Value, Resource.sessionInfo.token_id]);
    actGetData.Execute;
  end;

end;

procedure TfmLTPRefusall.actEditExecute(Sender: TObject);
var
  fm: TfmLTPRefusallAdd;
begin
  fm := TfmLTPRefusallAdd(CreateForm('TfmLTPRefusallAdd', 'fmLTPRefusallAdd', Self, false));
  try

    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    actGetData.Execute;
    fm.Free;
  end;
end;

procedure TfmLTPRefusall.actGetDataExecute(Sender: TObject);
var
  Columns: string;
  Params: string;
  Operations: string;
begin
  pnParam.Visible := false;
  cxspltrParam.Visible:= False;

  with Filtered(Self) do
  begin
    Columns := Column;
    Params := Param;
    Operations := Operation;
  end;

  FreeAndNil(dbBase);

  dbBase := DataSetQuery('ltprefusal_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
  dsBase.DataSet := dbBase.DataSet;
end;

procedure TfmLTPRefusall.actNewExecute(Sender: TObject);
var
  fm: TfmLTPRefusallAdd;
begin
  fm := TfmLTPRefusallAdd(CreateForm('TfmLTPRefusallAdd', 'fmLTPRefusallAdd', Self, false));
  try

    fm.SetData(dbBase, 0, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    actGetData.Execute;
    fm.Free;
  end;
end;

procedure TfmLTPRefusall.FormCreate(Sender: TObject);
var
  viewing : Boolean;
  deletion : Boolean;
begin
    dbAccess := DataSetQuery('access_form_get', [gUser, 'LTP_INOUT'], GetFieldsArray(), true);
    viewing := dbAccess.DataSet.FieldByName('on_viewing').AsBoolean;
    pedit := dbAccess.DataSet.FieldByName('on_edit').AsBoolean;
    deletion := dbAccess.DataSet.FieldByName('on_deletion').AsBoolean;
    if deletion = true then
    begin
      actDel.Enabled := True;
    end
    else
    begin
      actDel.Enabled := False;
    end;
    if pedit = true then
    begin
      actNew.Enabled := True;
    end
    else
    begin
      actNew.Enabled := False;
    end;
end;

procedure TfmLTPRefusall.FormShow(Sender: TObject);
begin
  actGetData.Execute;

end;

procedure TfmLTPRefusall.grBaseDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  fm: TfmLTPRefusallAdd;
begin
  fm := TfmLTPRefusallAdd(CreateForm('TfmLTPRefusallAdd', 'fmLTPRefusallAdd', Self, false));
  try

    fm.SetData(dbBase, 1, ginformation, pedit);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    actGetData.Execute;
    fm.Free;
  end;
end;

end.
