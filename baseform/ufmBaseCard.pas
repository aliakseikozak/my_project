unit ufmBaseCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmBaseForm, System.Actions, Data.DB,
  cxEdit, Vcl.ActnList, dxBar, cxClasses, uResource,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxLayoutContainer, dxLayoutControl, cxContainer, dxLayoutcxEditAdapters,
  cxTextEdit, cxDBEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmBaseCard = class(TfmBaseForm)
    btSave: TdxBarButton;
    btCancel: TdxBarButton;
    btPrint: TdxBarButton;
    actSave: TAction;
    actPrint: TAction;
    actCancel: TAction;
    ButtonPanel: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
  end;

implementation

{$R *.dfm}

end.
