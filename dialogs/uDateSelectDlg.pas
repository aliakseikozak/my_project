unit uDateSelectDlg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseDlg, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxControls, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, System.DateUtils;

type
  TfmDateSelectDlg = class(TfmBaseDlg)
    deDate: TcxDateEdit;
    lbText: TcxLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SelectDate(pCaption, pText: string; var pTargetDate: TDate; pDateMin: TDate = 0; pDateMax: TDate = 0): boolean;

implementation

{$R *.dfm}

function SelectDate(pCaption, pText: string; var pTargetDate: TDate; pDateMin: TDate = 0; pDateMax: TDate = 0): boolean;
var DS: TfmDateSelectDlg;
begin
  DS:= TfmDateSelectDlg.Create(Application);
  try
    DS.Caption:= pCaption;
    DS.lbText.Caption:= pText;
    DS.deDate.Date:= Today;
    if pDateMin <> 0 then DS.deDate.Properties.MinDate:= pDateMin;
    if pDateMax <> 0 then DS.deDate.Properties.MaxDate:= pDateMax;
    Result:= DS.ShowDialog;
    if Result then pTargetDate:= DS.deDate.Date;
  finally
    DS.Free;
  end;
end;

end.
