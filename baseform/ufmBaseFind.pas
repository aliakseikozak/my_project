unit ufmBaseFind;

interface

uses
  Forms, ufmBaseGrid, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, Menus,
  Classes, ActnList, dxBar, cxClasses,
  cxGridLevel, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGroupBox, cxContainer, cxLabel, Controls, ExtCtrls,
  cxExtEditRepositoryItems, cxLookAndFeels, 
  System.Actions, cxNavigator, dxLayoutControlAdapters, cxSplitter,
  dxLayoutContainer, Vcl.StdCtrls, dxLayoutControl;

type
  TfmBaseFind = class(TfmBaseGrid)
    actOK: TAction;
    btOK: TdxBarButton;
    procedure FormShow(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure grBaseDBTableViewDblClick(Sender: TObject);
    procedure grBaseDBTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure grBaseDBTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  public
    Res: Boolean;
    function Find(const Params: array of Variant;
      MultiSelect: Boolean = TRUE): Boolean; virtual;
    procedure SaveRes; virtual;
    procedure SaveRec(Index: Integer); virtual; abstract;
  end;

implementation

{$R *.dfm}

function TfmBaseFind.Find(const Params: array of Variant;
  MultiSelect: Boolean = TRUE): Boolean;
begin
  grBaseDBTableView.OptionsSelection.MultiSelect := MultiSelect;
  Self.ShowModal;
  Result := Res;
end;

procedure TfmBaseFind.SaveRes;
var
  Index: Integer;
  Controller: TcxGridTableController;
begin
  Controller := grBaseDBTableView.Controller;
  try
    for Index := 0 to Controller.SelectedRowCount - 1 do
      if Assigned(Controller.SelectedRows[Index]) then
        SaveRec(Index);
  finally

  end;
end;

procedure TfmBaseFind.actOKExecute(Sender: TObject);
begin
  inherited;
  Res := TRUE;
  Self.Close;
end;

procedure TfmBaseFind.FormShow(Sender: TObject);
begin
  inherited;
  Res := FALSE;
end;

procedure TfmBaseFind.grBaseDBTableViewDblClick(Sender: TObject);
begin
  inherited;
  actOK.Execute;
end;

procedure TfmBaseFind.grBaseDBTableViewKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    actOK.Execute;
  end;
end;

procedure TfmBaseFind.grBaseDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  actOK.Execute;
end;

end.
