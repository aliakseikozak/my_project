unit uConversion;

{ �������������� ������ ��������� ����� �/� ����� }

interface

{ �������������� �������� � string }
function ValueToString(const pValue: Double): string; {overload;}
{ �������������� �������� � Double }
function ValueToDouble(const pValue: Variant): Double; {overload;}
{ �������������� �������� � Integer }
function ValueToInteger(const pValue: Variant): Integer; {overload;}

implementation

uses
  SysUtils, Variants;

var
  FormatSettings: TFormatSettings;

{ ������������� FloatToStr �� SysUtils �� �������������, �.�. ���������� ��� ��
  ����� ������ ���������, ������� ����� ��� �� �������������, �� �����������
  �����, ����� ������� ������ ��������� ����������� ����� � ������� ������
  �������� �������� �� ",", �������� �� ��, ��� �� ��� ���� ���������� � "."
  �� � ������������ Resource. �� ���� �������� ������ ��� ����� ����������
  ���������� �����, �.�. ��� ���������� ������������ �� �� ������� FloatToStr,
  �� ����� ���� �� ����� _VarCast ������ Variants }

function ValueToString(const pValue: Double): string;
begin
  Result := FloatToStr(pValue, FormatSettings);
end;

function ValueToDouble(const pValue: Variant): Double;
begin
  if VarIsNumeric(pValue) then
    Result := pValue
  else
    Result := 0;
end;

function ValueToInteger(const pValue: Variant): Integer;
begin
  if VarIsNumeric(pValue) then
    Result := pValue
  else
    Result := 0;
end;

initialization
  FormatSettings.DecimalSeparator := '.';
  FormatSettings.ThousandSeparator := ' ';
end.
