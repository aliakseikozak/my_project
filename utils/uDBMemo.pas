unit uDBMemo;

interface

uses
  Forms, StdCtrls, Buttons, Controls, ExtCtrls, Classes, DBCtrls, DB;

type
  TfmDBMemo = class(TForm)
    memBase: TDBMemo;
    pnBase: TPanel;
    btCancel: TBitBtn;
    btOK: TBitBtn;
    procedure btClick(Sender: TObject);
  public
    procedure InitModal(const pDataSource: TDataSource; const pFieldName, pCaption: string);
  end;

implementation

{$R *.dfm}

uses
  uResource;

procedure TfmDBMemo.InitModal(const pDataSource: TDataSource; const pFieldName, pCaption: string);
begin
  memBase.DataSource := pDataSource;
  memBase.DataField := pFieldName;
  Self.Caption := pCaption;
  Self.ShowModal;
end;

procedure TfmDBMemo.btClick(Sender: TObject);
begin
  if memBase.DataSource.DataSet.State <> dsBrowse then
  begin
    if Sender = btOK then
      memBase.DataSource.DataSet.Post
    else
      memBase.DataSource.DataSet.Cancel;
  end;
  Self.Close;
end;

end.
