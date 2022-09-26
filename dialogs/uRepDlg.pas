unit uRepDlg;

interface

uses
  Forms, ufmBase, StdCtrls, Mask, Controls, Classes, ExtCtrls;

type
  TfmRepDlg = class(TfmBase)
    OKBtn: TButton;
    CancelBtn: TButton;
    Bevel1: TBevel;
    rbAllObjects: TRadioButton;
    rbSelObject: TRadioButton;
    cbSave: TCheckBox;
  public
    function Init(var Reg: Integer; var SaveDir: string): Boolean;
  end;

implementation

{$R *.dfm}

uses
  SysUtils;

function TfmRepDlg.Init(var Reg: Integer; var SaveDir: string): Boolean;
begin
  Result := FALSE;
  rbSelObject.Checked := Reg = 1;
  rbAllObjects.Checked := Reg = 2;

  Self.ShowModal;

  if Self.ModalResult = mrOk then
  begin
    Result := TRUE;
    if rbSelObject.Checked then
      Reg := 1
    else
      Reg := 2;
    if cbSave.Checked then
       SaveDir := ExcludeTrailingPathDelimiter('')
    else
       SaveDir := ''; 
  end;
end;

end.
