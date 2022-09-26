unit uMessageExp;

interface

uses
  uMessage, Menus, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMemo, ExtCtrls, StdCtrls, cxButtons, Controls, Classes,
  cxGraphics, cxLookAndFeels;

type
  TfmMessageExp = class(TfmMessage)
    memMessageExp: TcxMemo;
    btSave: TcxButton;
    procedure btSaveClick(Sender: TObject);
  private
    TypeEvent: string;
    ObjectId: string;
    ObjectType: string;
  private
    function MessageShowInternal(const pMessage, pCaption, pMessageExp,
      pTypeEvent, pObjectId, pObjectType: string;
      const pFlags, pIdImg: Integer): Integer; overload;
  public
    class function MessageShowExp(const pMessage, pCaption, pMessageExp,
      pTypeEvent, pObjectId, pObjectType: string;
      const pFlags, pIdImg: Integer): Integer;
  end;

implementation

{$R *.dfm}

uses
  SysUtils;

{ -------------- }
{ --- Events --- }
{ -------------- }

{ btSave }

procedure TfmMessageExp.btSaveClick(Sender: TObject);
begin
  inherited;
end;

{ --------------- }
{ --- Methods --- }
{ --------------- }

{ Инициализирует и отображает окно }

function TfmMessageExp.MessageShowInternal(const pMessage, pCaption,
  pMessageExp, pTypeEvent, pObjectId, pObjectType: string; const pFlags,
  pIdImg: Integer): Integer;
begin
  memMessageExp.Text := pMessageExp;
  TypeEvent := pTypeEvent;
  ObjectId := pObjectId;
  ObjectType := pObjectType;
  { кнопка соранить активна если тип сообщения указан }
  btSave.Visible := Length(TypeEvent) > 0;

  Result := inherited MessageShowInternal(pMessage, pCaption, pFlags, pIdImg);
end;

{ ---------------- }
{ --- External --- }
{ ---------------- }

class function TfmMessageExp.MessageShowExp(const pMessage, pCaption,
  pMessageExp, pTypeEvent, pObjectId, pObjectType: string; const pFlags,
  pIdImg: Integer): Integer;
var
  fmMessageExp: TfmMessageExp;
begin
  fmMessageExp := TfmMessageExp.Create(nil);
  try
    Result := fmMessageExp.MessageShowInternal(pMessage, pCaption, pMessageExp,
      pTypeEvent, pObjectId, pObjectType, pFlags, pIdImg);
  finally
    FreeAndNil(fmMessageExp);
  end;
end;

end.
