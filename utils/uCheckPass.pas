unit uCheckPass;

interface

 function  ShifrPass(vPass :String) : String;

implementation

uses IdHashMessageDigest, idHash, SysUtils;

 function  ShifrPass(vPass :String) : String;
 var
   idmd5 : TIdHashMessageDigest5;
 begin
   result:=vPass;
   idmd5 := TIdHashMessageDigest5.Create;
   try
   result := idmd5.HashStringAsHex(vPass);
   result := Copy(result,2,30);
   finally
    FreeAndNil(idmd5);
   end;
 end;

end.
 