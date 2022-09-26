unit ExceptLibPg;

interface

uses
  SysUtils;

type
  TExceptType = (etOther, etInvalidValue, etInsuffPrivil, etServerBeginConnect, etServerCloseConnect, etConstraint);
  { ������������ ��������� �� ������ }
  function ExceptMessage(E:Exception): string;

var
  ExceptType : TExceptType;

implementation

uses
  StrUtils;

Function ExceptMessage(E:Exception) : String;
var
  S: string;
  I: integer;
  L: integer;
begin
  ExceptType:= etOther;

  Result := E.Message;
  if (Pos('SQL', Result) <> 0) then
  begin
    I := Pos('<', Result);
    L := LastDelimiter('>', Result);
    if (I <> 0) and (L <> 0) and (L - I - 1 > 0) then
    begin
      S := Copy(Result, I + 1, L - I - 1);
      Result := S;
    end;
  end;

  if POS('Invalid input value',Result)<>0
  then  begin
     Result:='������! ������� �������� �������� ';
     ExceptType:= etInvalidValue;
  end;

  if (POS('Key violation',Result)<>0) or (POS('duplicate key value violates',Result)<>0)
  then begin
     Result:='������! ������ � ����� ������ ��� �������.';
     ExceptType:=etConstraint;
  end;

  if POS('Translate Error',Result)<>0 then
     Result:='������! �� �������� ��������������� ���������';

  if (POS('must a have value',Result)<>0) or (POS('is required',Result)<>0)
  then begin
     Result:='���� ������ ���� ���������';
     ExceptType:= etInvalidValue;
  end;

  if POS('is not a valid date',Result)<>0
  then begin
     Result:='������! ������������ ����';
     ExceptType:= etInvalidValue;
  end;

  if POS('is not a valid floating point value',Result)<>0
  then begin
     Result:='������! ������� �������� �������� ��� ����� � ��������� ������';
     ExceptType:= etInvalidValue;
  end;

  if (POS('password authentication failed',Result)<>0) // PostGresql
     or (POS('no password supplied',Result)<>0)  // PostGresql
     or (POS('Login failed',Result)<>0)  //  Mssql
  then begin
     Result:='�������� ��� ������������ ��� ������.'
       +#10+'������ ��������.';
     ExceptType:= etServerBeginConnect;
  end;

  if (POS('insufficient privileges',Result)<>0) OR
     (POS('permission denied',Result)<>0)  // PostGresql
  then begin
     Result:='�� ���������� ����. ����������� � ��������������';
     ExceptType:= etInsuffPrivil;
  end;


  if (POS('UPDATE FAILED',UpperCase(Result))<>0)
  then begin
     Result:='����������� ����� �� ������������� ����������.'
       +#10+'����������� � ��������������';
     ExceptType:= etInsuffPrivil;
  end;

  if (POS('UPDATE ABORT',UpperCase(Result))<>0)
  then
     Result:='��������� �� ������.';

  if (POS('not translate host name',Result)<>0) //postgresql
  then  begin
     Result:='���������� �� �����������. �� ����� ������ ����� �������.';
     ExceptType:= etServerBeginConnect;
  end;

  if (POS('could not connect to server',Result)<>0) //postgresql
  then begin
     Result:='���������� �� �����������. �� ����� ������ ����� ������� ���� ����.';
     ExceptType:= etServerBeginConnect;
  end;

  if (POS('database',Result)<>0) and (POS('does not exist',Result)<>0) //postgresql
  then begin
     Result:='���������� �� �����������. �� ����� ������� ������������ ����.';
     ExceptType:= etServerBeginConnect;
  end;

    if (POS('server closed the connection',Result)<>0) //postgresql
    then
    begin
      Result:='�������� ���������� � ��������. �������� ���������.';
      ExceptType:= etServerCloseConnect;
    end;

  end;

end.
