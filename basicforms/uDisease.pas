unit uDisease;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseGrid, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxLayoutControlAdapters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.Menus, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, System.Actions, Vcl.ActnList, dxBar, cxClasses,
  cxSplitter, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, dxLayoutContainer, Vcl.StdCtrls,
  dxLayoutControl, cxLabel, Vcl.ExtCtrls, uKartUtils, uResource, uOVDAdd;

type
  TfmDisease = class(TfmBaseGrid)
    grBaseDBTableViewColumn1: TcxGridDBColumn;
    grBaseDBTableViewColumn2: TcxGridDBColumn;
    grBaseDBTableViewColumn3: TcxGridDBColumn;
    grBaseDBTableViewColumn4: TcxGridDBColumn;
    grBaseDBTableViewColumn5: TcxGridDBColumn;
    grBaseDBTableViewColumn6: TcxGridDBColumn;
    grBaseDBTableViewColumn7: TcxGridDBColumn;
    grBaseDBTableViewColumn8: TcxGridDBColumn;
    grBaseDBTableViewColumn9: TcxGridDBColumn;
    grBaseDBTableViewColumn10: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDisease: TfmDisease;

implementation

{$R *.dfm}

procedure TfmDisease.FormShow(Sender: TObject);
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
 // if ginformation <> 0 then
 // begin
    dbBase := DataSetQuery('directory_disease_get', [Resource.sessionInfo.token_id, '1', '', '', ''], GetFieldsArray(), true);
    dsBase.DataSet := dbBase.DataSet;

 // end;
end;

end.
