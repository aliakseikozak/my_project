unit uMessage;

interface

uses
  ufmBase, Menus, ExtCtrls, StdCtrls, cxButtons,
  Controls, Classes, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TfmMessage = class(TfmBase)
    pnButton: TPanel;
    lbMessage: TLabel;
    pnImage: TPanel;
    Image: TImage;
    btOk: TcxButton;
    btCancel: TcxButton;
    btYes: TcxButton;
    btNo: TcxButton;
    procedure btOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Res: Integer;
  protected
    function MessageShowInternal(const pMessage, pCaption: string;
      const pFlags, pIDImg: Integer): Integer;
  public
    class function MessageShow(const pMessage, pCaption: string;
      const pFlags, pIDImg: Integer): Integer;
  end;

implementation

{$R *.dfm}

uses
  uResource, Windows, SysUtils;

{ -------------- }
{ --- Events --- }
{ -------------- }

{ Self }

procedure TfmMessage.FormCreate(Sender: TObject);
begin
  inherited;
  Res := -1;
end;

{ btOK }

procedure TfmMessage.btOkClick(Sender: TObject);
begin
  inherited;
  if Sender = btOK then
    Res := ID_OK
  else if Sender = btCancel then
    Res := ID_CANCEL
  else if Sender = btYes then
    Res := ID_YES
  else if Sender = btNo then
    Res := ID_NO
  else
    Res := 0;
  Self.Close;
end;

{ --------------- }
{ --- Methods --- }
{ --------------- }

{ Инициализирует и отображает окно }

function TfmMessage.MessageShowInternal(const pMessage, pCaption: string;
  const pFlags, pIDImg: Integer): Integer;
var
  LeftOffset: Integer;
  ButtonOffset: Integer;
begin
  lbMessage.Caption := pMessage;
  Self.Caption := pCaption;

  btOk.Visible := pFlags = MB_OK;
  btCancel.Visible := pFlags = MB_YESNOCANCEL;
  btYes.Visible := (pFlags = MB_YESNO) or (pFlags = MB_YESNOCANCEL);
  btNo.Visible := (pFlags = MB_YESNO) or (pFlags = MB_YESNOCANCEL);

  Image.Visible := pIDImg <> -1;
  Image.Picture.Assign(nil);
  if pIDImg <> -1 then
    Resource.ImageListDlg.GetBitMap(pIDImg, Image.Picture.Bitmap);

  ButtonOffset := btYes.Width div 2;
  case pFlags of
    MB_OK:
    begin
      btOk.Left := (pnButton.Width - btOk.Width) div 2;
    end;
    MB_YESNO:
    begin
      LeftOffset := pnButton.Width div 4;
      btYes.Left := LeftOffset - ButtonOffset;
      btNo.Left := LeftOffset * 3 - ButtonOffset;
    end;
    MB_YESNOCANCEL:
    begin
      LeftOffset := pnButton.Width div 6;
      btYes.Left := LeftOffset - ButtonOffset;
      btNo.Left := LeftOffset * 3 - ButtonOffset;
      btCancel.Left := LeftOffset * 5 - ButtonOffset;
    end;
  end;

  Self.ShowModal;
  Result := Res;
end;

{ ---------------- }
{ --- External --- }
{ ---------------- }

class function TfmMessage.MessageShow(const pMessage, pCaption: string;
  const pFlags, pIDImg: Integer): Integer;
var
  fmMessage: TfmMessage;
begin
  fmMessage := TfmMessage.Create(nil);
  try
    Result := fmMessage.MessageShowInternal(pMessage, pCaption, pFlags, pIDImg);
  finally
    FreeAndNil(fmMessage);
  end;
end;

end.
