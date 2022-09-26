unit uReferralData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, cxButtons,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.Actions, Vcl.ActnList,
  dxBar, cxClasses, cxSplitter, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxLayoutContainer, Vcl.StdCtrls, dxLayoutControl, cxLabel, Vcl.ExtCtrls, uWarningcitizen,
  uResource, uKartUtils,   uCommissionDecision;

type
  TfmReferralData = class(TfmBaseGrid)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure actGetDataExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmReferralData: TfmReferralData;
  pedit : Boolean;

implementation
uses
uOVDAdd,uCourtdecision, ulogin;

{$R *.dfm}

procedure TfmReferralData.actGetDataExecute(Sender: TObject);
var
  Columns: string;
  Params: string;
  Operations: string;
begin

  with Filtered(Self) do
  begin
    Columns := Column;
    Params := Param;
    Operations := Operation;
  end;

  FreeAndNil(dbBase);
  if ginformation <> 0 then
  begin
    dbBase := DataSetQuery('doctoltp_get', [VarToStr(ginformation)], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;
  end;
end;                        //fmCommissionDecision

procedure TfmReferralData.cxButton1Click(Sender: TObject);
var
  fm: TfmWarningcitizen;
begin
 {
  fm := TfmWarningcitizen(CreateForm('TfmWarningcitizen', 'fmWarningcitizen', Self, false));
  try
    fm.SetData(dbBase, 0, dsBase.DataSet.FieldByName('gropuby').AsString);
    if ( fm.ShowModal() = mrOk ) then
    begin

      dbBase.DataSetReQuery;

    end;
  finally
    fm.Free;
  end;}
end;

procedure TfmReferralData.cxButton2Click(Sender: TObject);
var
  fm: TfmCommissionDecision;
begin

  fm := TfmCommissionDecision(CreateForm('TfmCommissionDecision', 'fmCommissionDecision', Self, false));
  try
    fm.SetData(dbBase, 1, dbBase.DataSet.FieldByName('gropuby').Value);
    if ( fm.ShowModal() = mrOk ) then
    begin


    end;
  finally
    actGetData.Execute;
    fm.Free;
  end;


end;

procedure TfmReferralData.cxButton3Click(Sender: TObject);
var
  fm: TfmCourtdecision;
begin

  fm := TfmCourtdecision(CreateForm('TfmCourtdecision', 'fmCourtdecision', Self, false));
  try
    fm.SetData(dbBase, 1, dbBase.DataSet.FieldByName('gropuby').Value);
    if ( fm.ShowModal() = mrOk ) then
    begin

     // dbBase.DataSetReQuery;

    end;
    {fm.SetData(dbBase, 0, ginformation);
    if ( fm.ShowModal() = mrOk ) then begin

      dbBase.DataSetReQuery;

    end;  }
  finally
    actGetData.Execute;
    fm.Free;
  end;


end;

procedure TfmReferralData.FormCreate(Sender: TObject);
var
  viewing : Boolean;
  deletion : Boolean;
begin
    dbAccess := DataSetQuery('access_form_get', [gUser, 'OVD_OSN'], GetFieldsArray(), true);
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

procedure TfmReferralData.FormShow(Sender: TObject);
begin
  actGetData.Execute;
end;

end.
