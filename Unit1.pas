unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufmBaseForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxSplitter, dxLayoutContainer,
  dxLayoutControl, Vcl.StdCtrls, Vcl.ExtCtrls, System.Actions, Vcl.ActnList,
  dxBar, cxClasses, Data.DB;

type
  TfmBaseForm1 = class(TfmBaseForm)
    pnlBottomButton: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBaseForm1: TfmBaseForm1;

implementation

{$R *.dfm}

end.
