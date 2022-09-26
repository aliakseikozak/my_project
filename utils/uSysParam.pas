unit uSysParam;

interface

uses
  Forms, uBaseDlg, Menus, cxLookAndFeelPainters, ComCtrls, ShlObj,
  cxShellCommon, cxDropDownEdit, cxShellComboBox, Controls, StdCtrls,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxSpinEdit, cxControls, cxContainer,
  cxEdit, cxLabel, cxButtons, Classes, ExtCtrls, cxGraphics, cxLookAndFeels,
  uBaseResource, uResource, uResourceForms, uReportExcelBase;

type
  TfmSysParam = class(TfmBaseDlg)
    lbFontSize: TcxLabel;
    edFontSize: TcxSpinEdit;
    lbTempDir: TcxLabel;
    edTempDir: TcxShellComboBox;
    lbThousandSeparator: TcxLabel;
    edBeaconInterval: TcxSpinEdit;
    chbBeaconInterval: TcxCheckBox;
    cbThousandSeparator: TcxComboBox;
    chbRequestAutoRefresh: TcxCheckBox;
    edRequestAutoRefresh: TcxSpinEdit;
    cbOffice: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure chbBeaconIntervalPropertiesEditValueChanged(Sender: TObject);
    procedure chbRequestAutoRefreshPropertiesEditValueChanged(Sender: TObject);
  private { methods }
    function ShowDialog: Boolean; override;
  private
    { properties }
    FOffice: TOffice;
    { FontSize }
    function GetFontSize: Integer;
    procedure SetFontSize(const pFontSize: Integer);
    procedure SetOffice(const Value: TOffice);
    property FontSize: Integer read GetFontSize write SetFontSize;
    { ThousandSeparator }
    function GetThousandSeparator: Char;
    procedure SetThousandSeparator(const pThousandSeparator: Char);
    property ThousandSeparator: Char read GetThousandSeparator write SetThousandSeparator;
    { RequestAutoRefresh }
    function GetRequestAutoRefresh: Integer;
    procedure SetRequestAutoRefresh(const pRequestAutoRefresh: Integer);
    property RequestAutoRefresh: Integer read GetRequestAutoRefresh write SetRequestAutoRefresh;

    { BeaconInterval }
    function GetBeaconInterval: Integer;
    procedure SetBeaconInterval(const pBeaconInterval: Integer);
    property BeaconInterval: Integer read GetBeaconInterval write SetBeaconInterval;
    { TempDir }
    function GetTempDir: string;
    procedure SetTempDir(const pTempDir: string);
    property TempDir: string read GetTempDir write SetTempDir;
    property Office: TOffice read FOffice write SetOffice;
  public
    class procedure SysParam;
  end;

implementation

{$R *.dfm}

uses
  Variants, SysUtils, uFileUtils, uConversion;

{ -------------- }
{ --- Events --- }
{ -------------- }

{ Self }

procedure TfmSysParam.chbRequestAutoRefreshPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if chbRequestAutoRefresh.EditModified then
  begin
    edRequestAutoRefresh.Enabled := chbRequestAutoRefresh.Checked;
    edRequestAutoRefresh.Value := 1;
  end;
end;

procedure TfmSysParam.FormCreate(Sender: TObject);
begin
  inherited;
  edFontSize.Properties.MinValue := MIN_FONT_SIZE;
  edFontSize.Properties.MaxValue := MAX_FONT_SIZE;
  edBeaconInterval.Properties.MinValue := MIN_BEACON_INTERVAL;
  edBeaconInterval.Properties.MaxValue := MAX_BEACON_INTERVAL;
  { Загружаем параметры системы }
  FontSize := Resource.FontSize;
  ThousandSeparator := Resource.ModuleInfo.ThousandSeparator;
  TempDir := Resource.ModuleInfo.TempDir;
  BeaconInterval := Resource.BeaconInterval;
  RequestAutoRefresh := Resource.RequestAutoRefresh;
  Office:= Resource.Office;
end;

{ chbBeaconInterval }

procedure TfmSysParam.chbBeaconIntervalPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if chbBeaconInterval.EditModified then
  begin
    edBeaconInterval.Enabled := chbBeaconInterval.Checked;
    edBeaconInterval.Value := MAX_BEACON_INTERVAL;
  end;
end;

{ --------------- }
{ --- Methods --- }
{ --------------- }

{ Отображает диалоговое окно }

function TfmSysParam.ShowDialog: Boolean;
begin
  Result := inherited ShowDialog;
  if Result then
  begin
   { Применяем и сохраняем параметры системы }
    Resource.FontSize := FontSize;
    Resource.ModuleInfo.ThousandSeparator := ThousandSeparator;
    Resource.ModuleInfo.TempDir := TempDir;
    Resource.BeaconInterval := BeaconInterval;
    Resource.RequestAutoRefresh := RequestAutoRefresh;
    Resource.Office:= TOffice(cbOffice.ItemIndex);
    Resource.SaveEnvironmentInfo;
    if not CreateDirIfNotExists(TempDir) then
      DialogStop(Format('Невозможно создать каталог "%s"', [TempDir]));
  end;
end;

{ ------------------ }
{ --- Properties --- }
{ ------------------ }

{ FontSize }

function TfmSysParam.GetFontSize: Integer;
begin
  Result := ValueToInteger(edFontSize.Value);
end;

procedure TfmSysParam.SetFontSize(const pFontSize: Integer);
begin
  if pFontSize < edFontSize.Properties.MinValue then
    edFontSize.Value := edFontSize.Properties.MinValue
  else if pFontSize > edFontSize.Properties.MaxValue then
    edFontSize.Value := edFontSize.Properties.MaxValue
  else
    edFontSize.Value := pFontSize;
end;

procedure TfmSysParam.SetOffice(const Value: TOffice);
begin
  FOffice:= Value;
  cbOffice.ItemIndex:= ord(Value);
end;

{ ThousandSeparator }

function TfmSysParam.GetThousandSeparator: Char;
begin
  Result := cbThousandSeparator.Text[1];
end;

procedure TfmSysParam.SetThousandSeparator(const pThousandSeparator: Char);
begin
  if cbThousandSeparator.Properties.Items.IndexOf(pThousandSeparator) <> -1 then
    cbThousandSeparator.Text := pThousandSeparator
  else
    cbThousandSeparator.Text := DEFAULT_THOUSAND_SEPARATOR;
end;

{ BeaconInterval }

function TfmSysParam.GetRequestAutoRefresh: Integer;
begin
  if chbRequestAutoRefresh.Checked then
    Result := ValueToInteger(edRequestAutoRefresh.Value)
  else
    Result := 0;
end;

procedure TfmSysParam.SetRequestAutoRefresh(const pRequestAutoRefresh: Integer);
var
  Enabled: Boolean;
begin
  Enabled := (pRequestAutoRefresh >= edRequestAutoRefresh.Properties.MinValue) and (pRequestAutoRefresh <= edRequestAutoRefresh.Properties.MaxValue);
  chbRequestAutoRefresh.Checked := Enabled;
  edRequestAutoRefresh.Enabled := Enabled;
  if Enabled then
    edRequestAutoRefresh.Value := pRequestAutoRefresh
  else
    edRequestAutoRefresh.Value := 60;
end;

function TfmSysParam.GetBeaconInterval: Integer;
begin
  if chbBeaconInterval.Checked then
    Result := ValueToInteger(edBeaconInterval.Value)
  else
    Result := 0;
end;

procedure TfmSysParam.SetBeaconInterval(const pBeaconInterval: Integer);
var
  Enabled: Boolean;
begin
  Enabled := (pBeaconInterval >= edBeaconInterval.Properties.MinValue) and (pBeaconInterval <= edBeaconInterval.Properties.MaxValue);
  chbBeaconInterval.Checked := Enabled;
  edBeaconInterval.Enabled := Enabled;
  if Enabled then
    edBeaconInterval.Value := pBeaconInterval
  else
    edBeaconInterval.Value := MAX_BEACON_INTERVAL;
end;

{ TempDir }

function TfmSysParam.GetTempDir: string;
begin
  Result := VarToStr(edTempDir.EditValue);
end;

procedure TfmSysParam.SetTempDir(const pTempDir: string);
begin
  edTempDir.EditValue := pTempDir;
end;

{ ---------------- }
{ --- External --- }
{ ---------------- }

class procedure TfmSysParam.SysParam;
var
  fmSysParam: TfmSysParam;
begin
  fmSysParam := TfmSysParam.Create(nil);
  try
    fmSysParam.ShowDialog;
  finally
    FreeAndNil(fmSysParam);
  end;
end;

end.
