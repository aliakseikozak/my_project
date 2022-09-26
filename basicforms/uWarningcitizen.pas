unit uWarningcitizen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  dxLayoutcxEditAdapters, dxLayoutContainer, cxClasses, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit,
  cxCalendar, dxLayoutControl, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmWarningcitizen = class(TForm)
    Panel2: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    dxLayoutControl1: TdxLayoutControl;
    cxDateEdit1: TcxDateEdit;
    cxLookupComboBox1: TcxLookupComboBox;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem7: TdxLayoutItem;
    dxLayoutItem1: TdxLayoutItem;
    cxLookupComboBox2: TcxLookupComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmWarningcitizen: TfmWarningcitizen;

implementation

{$R *.dfm}

end.
