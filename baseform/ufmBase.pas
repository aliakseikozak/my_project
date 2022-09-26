unit ufmBase;

interface

uses
  Forms, Classes, ShellAPI;

type
  TfmBase = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HelpShow;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure SetLocateID(const Value: Variant);
  protected
    //Имя формы
    FFormName: string;
    FMultiSelect : boolean;
    // Идентификатор для позиционирования в DBData при открытии модального окна
    FLocateID: Variant;
  public
    constructor Create(AOwner: TComponent; AFormName: string = ''; FormModal: boolean = False; MultiSel: boolean = False; pLocateID: Integer = 0); overload;
    destructor Destroy; override;
    // Позиционирование в DBData при открытии модального окна по FormInfo.keyField и указанному ID
    property LocateID: Variant read FLocateID write SetLocateID;
    property MultiSelect : boolean read FMultiSelect;
  end;

implementation

{$R *.dfm}

uses
  uResource, uResourceForms, Windows, StdCtrls, Controls, cxEdit, cxMemo, cxStyles, cxGridCustomView;

procedure TfmBase.FormCreate(Sender: TObject);
begin
  if Assigned(Resource) then
     Self.Font.Size := Resource.FontSize;
   Self.Name := FFormName;
end;

procedure TfmBase.FormKeyPress(Sender: TObject; var Key: Char);
var
  WinControl: TWinControl;
begin
  if (Key = #13) then
  begin
    WinControl := Self.ActiveControl;
    if (WinControl.InheritsFrom(TCustomEdit) or WinControl.InheritsFrom(TcxCustomEdit))
    and (not (WinControl.InheritsFrom(TCustomMemo) or WinControl.InheritsFrom(TcxCustomMemo)))
    then
    begin
      Key := #0;
      Self.ActiveControl := Self.FindNextControl(Self.ActiveControl, TRUE, TRUE, FALSE);
    end;
  end;
end;

constructor TfmBase.Create(AOwner: TComponent; AFormName: string = ''; FormModal: boolean = False; MultiSel: boolean = False; pLocateID: Integer = 0);
begin
  Self.FFormName := AFormName;
  Self.FLocateID := pLocateID;
  FMultiSelect := MultiSel;
  inherited Create(AOwner);
  if FormModal then
  begin
    Self.Showmodal;
  end;
end;

destructor TfmBase.Destroy;
begin
  inherited Destroy;
end;


// Позиционирование в DBData при открытии модального окна по FormInfo.keyField и указанному ID
procedure TfmBase.SetLocateID(const Value: Variant);
begin
  FLocateID := Value;
end;

procedure TfmBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // Sleep(500);
end;

procedure TfmBase.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  { IHSB-82 }
  if Key = VK_F1 then
    HelpShow;
end;

procedure TfmBase.HelpShow;
var
  Index: Integer;
  Control: TControl;
  Form: TForm;
begin
  if Length(hlpfile) = 0 then
  begin
    DialogStop('Файл справки ' + hlpfile + ' не найден', 'Вызов справки');
    Exit;
  end;

  Form := Screen.ActiveForm;
  if Assigned(Screen.ActiveForm) then
  begin
    Control := Form.ActiveControl;
    Index := -1;
    while Assigned(Control) and (Index = -1) do
    begin
      if Control.HelpContext <> 0 then
        Index := Control.HelpContext
      else
        Control := Control.Parent;
    end;
    if Index = -1 then
      Index := Self.HelpContext;
  end
  else
    Index := Application.MainForm.HelpContext;

  Index := 1;
  if Index > 0 then
    ShellExecute(Handle, 'open', PChar(hlpfile) ,nil, nil, SW_SHOW)
  else
    HtmlHelp(GetDesktopWindow, PChar(hlpfile), HH_HELP_CONTEXT, Index);
end;

end.
