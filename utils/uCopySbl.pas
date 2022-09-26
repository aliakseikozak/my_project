unit uCopySbl;

interface

uses
  Forms, ufmBase, StdCtrls, Controls, Mask, Classes;

type
  TfmCopySbl = class(TfmBase)
    cbImgCopy: TCheckBox;
    Label1: TLabel;
    btOk: TButton;
    btCancel: TButton;
    lbObjName: TLabel;
  private
    FObjTypeName: string;
    FObjType: Integer;
    procedure RunCopy;
  public
    function CopySbl(pIdObject: Integer; pObjType: Integer; pObjName, pObjTypeName: string): Boolean;
  end;

implementation

{$R *.dfm}

uses
  uResource, Variants, SysUtils;

function TfmCopySbl.CopySbl(pIdObject, pObjType: Integer; pObjName, pObjTypeName: string): Boolean;
begin
  Result := FALSE;
  lbObjName.Caption := pObjName + #13#10 + pObjTypeName;
  lbObjName.Tag := pIdObject;
  fObjTypeName := pObjTypeName;
  fObjType := pObjType;
  ShowModal;
  if ModalResult = mrOk then
  begin
    RunCopy;
    Result := TRUE;
  end;
end;

procedure TfmCopySbl.RunCopy;
begin

end;

end.
