unit uDataUtils;

interface

uses
  Variants, SysUtils, Math, Windows, Classes;

type
  TValue = array of Variant;
  TValues = array of TValue;
  TParameters = array of Variant;
  TVariantArray = array of Variant;
  TIntArray = array of Integer;
  TStrArray = array of string;
  TFloatArray = array of Real;
  TDateArray = array of TDateTime;

function StrToBoolean(aValue: string): boolean;
function StrToFloatZ(aValue: string): real;
function BooleanToStr(aValue: boolean): string;
function VarToFloat(aValue: variant): real;
function VarToInt(aValue: variant): integer;
function Nvl(aValue: variant; aDefault: integer = 0): variant;overload;
function Nvl(aValue: variant; aDefault: TDateTime): variant;overload;
function Nvls(aValue: variant; aDefault: string = ''): string;
function StrRound(Value:real): Int64; overload;
function StrRound(Value:extended; RoundToNearest: integer): real; overload;
// работа с массивами
// увеличивает размер массива
procedure IncPower(var aArray: TValues; aPower: integer = 1); overload;
procedure IncPower(var aArray: TStrArray; aPower: integer = 1);overload;
procedure IncPower(var aArray: TIntArray; aPower: integer = 1);overload;
procedure IncPower(var aArray: TVariantArray; aPower: integer = 1);overload;
procedure IncPower(var aArray: TFloatArray; aPower: integer = 1);overload;
// включает элемент в массив
procedure IncludeToArray(var aArray: TIntArray; aValue: integer);overload;
procedure IncludeToArray(var aArray: TStrArray; aValue: string);overload;
procedure IncludeToArray(var aArray: TVariantArray; aValue: variant);overload;
procedure IncludeToArray(var aArray: TFloatArray; aValue: real);overload;
//удаляет элемент из массива
procedure DecludeFromArray(var aArray: TIntArray; aIndex: integer);overload;
procedure DecludeFromArray(var aArray: TValues; aIndex: integer);overload;
// инициализирует массив заданным значением
procedure InitArray(var aArray: TValue; aValue:Variant);
function FloatArrayAsStr(aArray: TFloatArray): string;
// копирует массив
function Clone(aValue: TValue): TValue;  overload;
function Clone(aValue: TValues): TValues; overload;
function Clone(aValue: TIntArray): TIntArray; overload;
function Clone(aValue: TStrArray): TStrArray; overload;
//работа с датами
//прибавляет к дате заданное количество месяцев
procedure IncMonth_test(var aDate: TDateTime; aNumMonth: integer = 1);
//прибавляет к дате заданное количество лет
procedure IncYear(var aDate: TDateTime; aNumYear: integer = 1);
//возвращает последний день месяца
function Last_day (pPeriod : String):TDateTime;
// находит наибольшее среди чисел
function greatest(avalues : array of variant) :variant;

{ Преобразует массив в строку значений, разделенных запятыми }
function IntArrayAsStr(const pIntArray: TIntArray): string;
{ Находит позицию элемента в массиве }
function FindInArray(const pValue: Integer; const pValues: TIntArray): Integer;

implementation

uses
  DateUtils;

//-----------------------------------------------------------------------------
// Округляет переданный параметр Value до целого числа
//-----------------------------------------------------------------------------
function StrRound(Value:real): Int64; overload;
var
   i, Zpt, LenStr : Integer;
   s : String;
begin
  s := FloatToStrF(abs(Value), ffFixed, 20, 3);

  Zpt := 0;
  LenStr := Length(s);
  for i := 1 to LenStr do
    if s[i] in ['.',','] then
    begin
     Zpt := i;
     Break;
    end;

  if s[zpt + 1] > '4' then
    Result := StrToInt64(copy(s, 1, Zpt - 1)) + 1
  else
    Result := StrToInt64(copy(s, 1, Zpt - 1));

  if Value < 0 then
    Result := Result * (-1);
end;

//-----------------------------------------------------------------------------
// Округляет переданный параметр Value до знака переданного в RoundToNearest
//-----------------------------------------------------------------------------
function StrRound(Value:extended; RoundToNearest: integer): real; overload;
var
   Degree, i, Zpt, LenStr : Integer;
   s : String;
begin
  Result := Value;
  if RoundToNearest < 0 then
    Exit;
  Degree := 1;
  for i := 1 to RoundToNearest do
    Degree := Degree * 10;
  s := FloatToStrF(abs(Value), ffFixed, 20, 9);
  LenStr := 0;
  for i := length(s) downto 1 do
    if s[i] <> '0' then
    begin
     LenStr := i;
     break;
    end;
  SetLength(s, LenStr);

  Zpt := 0;
  for i := 1 to LenStr do
    if s[i] in ['.',','] then
    begin
     Zpt := i;
     Break;
    end;

  if Zpt > 0 then
    if LenStr > (RoundToNearest + zpt) then
    begin
    if s[RoundToNearest+zpt+1] > '4' then
      Result := (StrToInt64(copy(s, 1, Zpt - 1) + copy(s, Zpt + 1, RoundToNearest)) + 1) / Degree
    else
      Result := (StrToInt64(copy(s, 1, Zpt - 1) + copy(s, Zpt + 1, RoundToNearest))) / Degree;
    if Value < 0 then Result := Result * (-1);
    end
   else
   begin
     Result := StrToFloat(s);
     if Value < 0 then Result := Result * (-1);
   end;
end;

function StrToBoolean(aValue: string): boolean;
begin
  result := UpperCase(aValue) = 'TRUE';
end;

function StrToFloatZ(aValue: string): real;
begin
  if aValue = '' then
    result := 0
  else
    result := StrToFloat(aValue);
end;

function BooleanToStr(aValue: boolean): string;
begin
  if aValue then
    result := 'true'
  else
    result := 'false';
end;


function Nvl(aValue: variant; aDefault: integer = 0): variant;
begin
  if VarIsNull(aValue) then
    result := aDefault
  else
    result := aValue;
end;

function Nvl(aValue: variant; aDefault: TDateTime): variant;
begin
  if VarIsNull(aValue) then
    result := aDefault
  else
    result := aValue;
end;

function Nvls(aValue: variant; aDefault: string = ''): string;
begin
  if VarIsNull(aValue) then
    result := aDefault
  else
    result := aValue;
end;


function VarToFloat(aValue: variant): real;
begin
  result := nvl(aValue);
end;

function VarToInt(aValue: variant): integer;
begin
  result := nvl(aValue);
end;


procedure IncPower(var aArray: TValues; aPower: integer = 1);
begin
  SetLength(aArray, Length(aArray) + aPower);
end;

procedure IncPower(var aArray: TStrArray; aPower: integer = 1);
begin
  SetLength(aArray, Length(aArray) + aPower);
end;

procedure IncPower(var aArray: TIntArray; aPower: integer = 1);overload;
begin
  SetLength(aArray, Length(aArray) + aPower);
end;

procedure IncPower(var aArray: TVariantArray; aPower: integer = 1);overload;
begin
  SetLength(aArray, Length(aArray) + aPower);
end;

procedure IncPower(var aArray: TFloatArray; aPower: integer = 1);overload;
begin
  SetLength(aArray, Length(aArray) + aPower);
end;

procedure IncludeToArray(var aArray: TIntArray; aValue: integer);
begin
  IncPower(aArray);
  aArray[High(aArray)] := aValue;
end;

procedure IncludeToArray(var aArray: TStrArray; aValue: string);
begin
  IncPower(aArray);
  aArray[High(aArray)] := aValue;
end;

procedure IncludeToArray(var aArray: TVariantArray; aValue: variant);overload;
begin
  IncPower(aArray);
  aArray[High(aArray)] := aValue;
end;

procedure IncludeToArray(var aArray: TFloatArray; aValue: real);
begin
  IncPower(aArray);
  aArray[High(aArray)] := aValue;
end;

procedure DecludeFromArray(var aArray: TIntArray; aIndex: integer);
var
  i: integer;
begin
  if Length(aArray) >= aIndex then
    for i := aIndex to Length(aArray) - 2 do
      aArray[i] := aArray[i + 1];
  SetLength(aArray, Length(aArray) - 1);
end;


procedure DecludeFromArray(var aArray: TValues; aIndex: integer);overload;
var
  i: integer;
begin
  if Length(aArray) >= aIndex then
    for i := aIndex to Length(aArray) - 2 do
      aArray[i] := aArray[i + 1];
  SetLength(aArray, Length(aArray) - 1);
end;

function FloatArrayAsStr(aArray: TFloatArray): string;
var
  i: integer;
begin
  result := '';
  for i := 0 to Length(aArray) - 1 do
    result := result + FloatToStr(aArray[i]) + ',';
  Delete(result, Length(result), 1);
end;

// инициализирует массив заданным значением
procedure InitArray(var aArray: TValue; aValue:Variant);
var
 i:Integer;
begin
  for i:=low(aArray) to High(aArray) do
    aArray[i]:=aValue;
end;

function Clone(aValue: TValue): TValue;
var
  i: integer;
begin
  SetLength(result, Length(aValue));
  for i := 0 to Length(aValue) - 1 do
    result[i] := aValue[i];
end;

function Clone(aValue: TValues): TValues;
var
  i, j: integer;
begin
  SetLength(result, Length(aValue));
  for i := 0 to Length(aValue) - 1 do
    for j := 0 to Length(aValue[i]) - 1 do
    begin
      SetLength(result[i], Length(aValue[i]));
      result[i][j] := aValue[i][j];
    end;
end;

function Clone(aValue: TIntArray): TIntArray; overload;
var
  i: integer;
begin
  SetLength(result, Length(aValue));
  for i := 0 to Length(aValue) - 1 do
    result[i] := aValue[i];
end;

function Clone(aValue: TStrArray): TStrArray; overload;
var
  i: integer;
begin
  SetLength(result, Length(aValue));
  for i := 0 to Length(aValue) - 1 do
    result[i] := aValue[i];
end;

procedure IncMonth_test(var aDate: TDateTime; aNumMonth: integer = 1);
var
  aYear, aMonth, aDay: word;
begin
  DecodeDate(aDate, aYear, aMonth, aDay);
  aYear := aYear + (aMonth + aNumMonth) div 12;
  aMonth := aMonth + aNumMonth mod 12;
  if aMonth > 12 then
    aMonth := aMonth mod 12;
  if DaysInAMonth(aYear, aMonth) < aDay then       //если начало грантии 29 февраля,
  begin                                            //а окончание через количество месяцев, кратное 12
    Inc(aMonth);                                   //то оно может попасть на не високосный год,
    aDay := 1;                                     //тогда гарантия кончается 1 марта
  end;
  aDate := EncodeDate(aYear, aMonth, aDay);
end;


procedure IncYear(var aDate: TDateTime; aNumYear: integer = 1);
var
  aYear, aMonth, aDay: word;
begin
  DecodeDate(aDate, aYear, aMonth, aDay);
  Inc(aYear, aNumYear);
  aDate := EncodeDate(aYear, aMonth, aDay);
end;


//возвращает последний день месяца
function Last_day (pPeriod : String):TDateTime;
var
  aYear, aMonth, aDay: word;
begin
  aYear := StrToInt(Copy(pPeriod,1,4));
  aMonth := StrToInt(Copy(pPeriod,5,2));
  aDay:=DaysInAMonth(AYear, AMonth);
  result:=EncodeDate(aYear, aMonth, aDay);
end;


// находит наибольшее среди чисел
function greatest(avalues : array of variant) :variant;
var
 i:Integer;
begin
 result:=avalues[0];
 for i:=low(avalues)+1 to High(avalues) do
   if result<avalues[i] then
     result:=avalues[i];
end;

{ Преобразует массив в строку значений, разделенных запятыми }

function IntArrayAsStr(const pIntArray: TIntArray): string;
var Index, Number: Integer;
begin
  Number := Length(pIntArray);
  if Number <> 0 then
  begin
    Result := IntToStr(pIntArray[0]);
    Index := 1;
    while Index < Number do
    begin
      Result := Result + ',' + IntToStr(pIntArray[Index]);
      Inc(Index);
    end;
  end
  else
    Result := '';
end;

{ Находит позицию элемента в массиве }

function FindInArray(const pValue: Integer; const pValues: TIntArray): Integer;
var Index, Number: Integer;
begin
  Index := 0;
  Number := Length(pValues);
  while (Index < Number) and (pValue <> pValues[Index]) do
    Inc(Index);
  if Index <> Number then
    Result := Index
  else
    Result := -1;
end;

end.
