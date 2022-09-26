unit uNumSelectDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseDlg, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxControls, cxContainer, cxEdit, dxLayoutcxEditAdapters, dxLayoutContainer,
  cxTextEdit, cxCurrencyEdit, cxClasses, dxLayoutControl,uDataUtils, cxLabel;

type
  TfmNumSelectDlg = class(TfmBaseDlg)
    edNum: TcxCurrencyEdit;
    lbText: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function selectNumeric(pCaption, pText: string;var enterNum:Variant;defNum:Double = -1):Boolean;

implementation
{$R *.dfm}
function selectNumeric(pCaption, pText: string;var enterNum:Variant;defNum:Double = -1):Boolean;
var
  dlg :  TfmNumSelectDlg;
begin
  dlg:= TfmNumSelectDlg.Create(Application);
  dlg.Caption:= pCaption;
  dlg.lbText.Caption:= pText;
  if defNum<>-1 then
      dlg.edNum.editValue:=defNum;
  try
    Result:= dlg.ShowDialog;
    if Result then
      enterNum:= dlg.edNum.editValue;
  finally
    FreeAndNil(dlg);
  end;
end;
end.
