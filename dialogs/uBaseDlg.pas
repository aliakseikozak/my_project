unit uBaseDlg;

interface

uses
  Forms, ufmBase, Menus, cxLookAndFeelPainters, Controls, StdCtrls,
  cxButtons, Classes, ExtCtrls, cxGraphics, cxLookAndFeels;

type
  TfmBaseDlg = class(TfmBase)
    Bevel: TBevel;
    btOk: TcxButton;
    btCancel: TcxButton;
    procedure btOKClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    ResDlg: Boolean;
  public
    function ShowDialog: Boolean; virtual;
  end;


implementation

{$R *.dfm}

function TfmBaseDlg.ShowDialog: Boolean;
begin
  ResDlg := FALSE;
  Self.ShowModal;
  Result := ResDlg;
end;

procedure TfmBaseDlg.btOKClick(Sender: TObject);
begin
  ResDlg := TRUE;
  Self.Close;
end;

procedure TfmBaseDlg.btCancelClick(Sender: TObject);
begin
  Self.Close;
end;

end.
