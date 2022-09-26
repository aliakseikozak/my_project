unit utilSpravXML;
// утилиты для обработки настроек
interface
 uses RxMemDS, XMLDoc, XMLIntf, Classes, DB, Variants, SysUtils,
      Generics.Defaults, System.Generics.Collections,
      cxCustomData;

 // разбирает xml для описания справоников и сохраняет данные в  tbFields
 procedure ParseXml(var tbFields : TRxMemoryData;var aparams : TStringList; xmlText : String; xmlNode : String = '');overload;
 procedure ParseXml(var tbFields : TRxMemoryData; xmlText : String; xmlNode : String = '');overload;

 // по данным таблицы формирует xml для описания справоников
 function CrtXml(tbFields : TRxMemoryData; const aparams : array of variant) : String;overload;
 function CrtXml(tbFields : TRxMemoryData) : String;overload; // оставлена для совместимости
 function CrtXml(aFormClass, aFormID: string) : String;overload;

 function ExtractSpravClassID(aXML: string): integer;

 function CreateXMLDoc(aXML: string): IXMLDocument;

 // возвращает значение TFieldType по строковому значению
 function ParseFieldType(_fieldType: String): TFieldType;
 // возвращает значение TcxSummaryKind (тип подвала колонки грила) по строковому значению
 function ParseGridFooterType(_footerType: String): TcxSummaryKind;
implementation

  function CreateXMLDoc(aXML: string): IXMLDocument;
  begin
    result := TXMLDocument.Create(nil);
    result.Active := True;
    result.Options := result.Options + [doNodeAutoIndent];
    result.Encoding := 'WINDOWS-1251';
    result.loadFromXml(aXML);
  end;

  function ExtractSpravClassID(aXML: string): integer;
  var
   xmlDoc:IXMLDocument;
   xmlIt: IXMLNode;
  begin
    xmlDoc := CreateXMLDoc(aXML);
    xmlIt:=xmlDoc.DocumentElement;
    xmlIt :=xmlDoc.DocumentElement.ChildNodes.FindNode('FormData');
    result := xmlIt.ChildNodes[0].Attributes['FormID'];
  end;


 procedure ParseXml(var tbFields : TRxMemoryData; xmlText : String; xmlNode : String = '');
 var
   aparams : TStringList;
 begin
   aparams:=TStringList.create;
   try
    parseXml(tbFields,aparams,xmlText);
   finally
     aparams.Free;
   end;
 end;

 procedure ParseXml(var tbFields : TRxMemoryData; var aparams:TStringList; xmlText : String; xmlNode : String = '');
 var
   xmlIt : IXMLNode;
   xmlDoc:IXMLDocument;
   i, j:Integer;

 begin
  if Length(xmlText)=0 then exit;
  xmlDoc := TXMLDocument.Create(nil);
  xmlDoc.Active:=True;
  xmlDoc.Options:=xmlDoc.Options+[doNodeAutoIndent];
  xmlDoc.Encoding:='WINDOWS-1251';

  try
   xmlDoc.loadFromXml(xmlText);

   if (xmlNode = '') then
     xmlIt:=xmlDoc.DocumentElement
   else
     xmlIt:=xmlDoc.DocumentElement;

   for j:=0 to xmlDoc.DocumentElement.ChildNodes.Count-1 do begin
     if xmlDoc.DocumentElement.ChildNodes[j].NodeName='fields-list' then begin
        xmlIt :=xmlDoc.DocumentElement.ChildNodes[j];
//   if xmlIt<>nil then begin
       for i:=0 to  xmlIt.ChildNodes.Count-1  do   begin
         if not tbFields.Locate('fieldname',xmlIt.ChildNodes[i].Attributes['name'],[]) then begin
          tbFields.Append;
          tbFields.FieldByName('FieldName').AsString:=xmlIt.ChildNodes[i].Attributes['name'];
          tbFields.FieldByName('OrderId').AsInteger:=i;
          tbFields.FieldByName('Size').AsInteger:=50;
          tbFields.FieldByName('Visible').AsBoolean:=true;
          tbFields.FieldByName('ReadOnly').AsBoolean:=False;
          tbFields.FieldByName('Group').AsBoolean:=False;
         end
         else
          if tbFields.State=dsBrowse then
            tbFields.Edit;
         if Length(VarToStr(xmlIt.ChildNodes[i].Attributes['orderid']))>0 then
                tbFields.FieldByName('OrderId').AsString:=varToStr(xmlIt.ChildNodes[i].Attributes['orderid']);
         if Length(VarToStr(xmlIt.ChildNodes[i].Attributes['sort']))>0 then
             tbFields.FieldByName('Sort').AsString:=varToStr(xmlIt.ChildNodes[i].Attributes['sort']);
         if Length(VarToStr(xmlIt.ChildNodes[i].Attributes['size']))>0 then
             tbFields.FieldByName('Size').AsString:=VarToStr(xmlIt.ChildNodes[i].Attributes['size']);
         if Length(VarToStr(xmlIt.ChildNodes[i].Attributes['width']))>0 then
             tbFields.FieldByName('width').AsString:=VarToStr(xmlIt.ChildNodes[i].Attributes['width']);
         tbFields.FieldByName('Title').AsString:=VarToStr(xmlIt.ChildNodes[i].Attributes['title']);
         tbFields.FieldByName('ReadOnly').AsBoolean:=(VarToStr(xmlIt.ChildNodes[i].Attributes['readonly'])='True');
         tbFields.FieldByName('Visible').AsBoolean:=(VarToStr(xmlIt.ChildNodes[i].Attributes['visible'])='True');
         tbFields.FieldByName('Group').AsBoolean:=(VarToStr(xmlIt.ChildNodes[i].Attributes['group'])='True');
         tbFields.FieldByName('ListSource').AsString:=VarToStr(xmlIt.ChildNodes[i].Attributes['listsource']);
         tbFields.FieldByName('ListKey').AsString:=VarToStr(xmlIt.ChildNodes[i].Attributes['listkey']);
         tbFields.FieldByName('ListField').AsString:=VarToStr(xmlIt.ChildNodes[i].Attributes['listfield']);
         tbFields.FieldByName('PropertyEdit').AsString:=VarToStr(xmlIt.ChildNodes[i].Attributes['propertyedit']);
         tbFields.FieldByName('DataType').AsString:=VarToStr(xmlIt.ChildNodes[i].Attributes['datatype']);
         tbFields.Post;
       end; // for
       if tbFields.Active then
        tbFields.SortOnFields('orderid');


        tbFields.RecordCount;
     end
     else
     // остальные параметры возвращает в виде наименование=значение
       if ( xmlDoc.DocumentElement.ChildNodes[j].IsTextElement ) then
         aparams.Add(xmlDoc.DocumentElement.ChildNodes[j].NodeName+'='+xmlDoc.DocumentElement.ChildNodes[j].Text);
   end; // for j nodes
 finally
    xmlDoc := nil;
 end;
end;

  function CrtXml(aFormClass, aFormID: string): string;overload;
  var
    xmlIt : IXMLNode;
    xmlDoc:IXMLDocument;
  begin
    xmlDoc := TXMLDocument.Create(nil);
    try
      xmlDoc.Active:=True;
      xmlDoc.Options:=xmlDoc.Options+[doNodeAutoIndent];
      xmlDoc.Encoding:='WINDOWS-1251';
      xmlIt:=xmlDoc.AddChild('sprav');
      xmlIt:=xmlDoc.DocumentElement.AddChild('FormData');
      With xmlIt.AddChild('Form') do
      begin
        Attributes['FormClass'] := aFormClass;
        Attributes['FormID'] := aFormID;
      end;
      result:=xmlDoc.XML.Text;
    finally
      xmlDoc:=nil;
    end;
  end;

 function CrtXml(tbFields : TRxMemoryData) : String;
 begin
   result:= CrtXml(tbFields,[]);
 end;

 function CrtXml(tbFields : TRxMemoryData; const aparams : array of variant) : String;
 var
  xmlIt : IXMLNode;
  xmlDoc:IXMLDocument;
  i:Integer;
 begin
  if tbFields.State=dsInActive then exit;

  xmlDoc := TXMLDocument.Create(nil);
  xmlDoc.Active:=True;
  xmlDoc.Options:=xmlDoc.Options+[doNodeAutoIndent];
  xmlDoc.Encoding:='WINDOWS-1251';
  try
   xmlIt:=xmlDoc.AddChild('sprav');

   i:=0;
   if Length(aparams)>0 then
    while i<High(aparams) do begin
     if VarToStr(aparams[i+1])<>'' then begin
     // есть доп описания по параметрам
      With xmlDoc.DocumentElement.AddChild(aparams[i]) do
        NodeValue:= aparams[i+1];
     end; // if
     i:=i+2;
    end; // while

   xmlIt:=xmlDoc.DocumentElement.AddChild('fields-list');
   tbFields.First;
   While not tbFields.Eof do begin
     With xmlIt.AddChild('field') do begin
       Attributes['orderid']:=tbFields.FieldByName('OrderId').AsString;
       Attributes['name']:=tbFields.FieldByName('FieldName').AsString;
       Attributes['sort']:=tbFields.FieldByName('Sort').AsString;
       Attributes['title']:=tbFields.FieldByName('Title').AsString;
       Attributes['size']:=tbFields.FieldByName('Size').AsString;
       Attributes['width']:=tbFields.FieldByName('width').AsString;
       Attributes['readonly']:=tbFields.FieldByName('ReadOnly').AsString;
       Attributes['visible']:=tbFields.FieldByName('Visible').AsString;
       Attributes['group']:=tbFields.FieldByName('group').AsString;
       if (length(tbFields.FieldByName('ListSource').AsString)>0)
         and (length(tbFields.FieldByName('listkey').AsString)>0)
         and (length(tbFields.FieldByName('listfield').AsString)>0) then begin
        Attributes['listsource']:=tbFields.FieldByName('ListSource').AsString;
        Attributes['listkey']:=tbFields.FieldByName('listkey').AsString;
        Attributes['listfield']:=tbFields.FieldByName('listfield').AsString;
       end;
       Attributes['propertyedit']:=tbFields.FieldByName('PropertyEdit').AsString;
     end;
     tbFields.Next;
   end;
   result:=xmlDoc.XML.Text;
  finally
     xmlDoc:=nil;
  end;
end;

function ParseGridFooterType(_footerType: String): TcxSummaryKind;
const
   FTYPES: array [0..5] of string = ('skNone', 'skSum', 'skMin', 'skMax', 'skCount', 'skAverage');
var
   index: integer;
begin
  result := skNone;

  if _footerType = '' then
    Exit;

  for index := Low(FTYPES) to High(FTYPES) do
    if ( AnsiCompareText(FTYPES[index], _footerType) = 0 ) then
      break;

  case index of
     0: result := skNone;
     1: result := skSum;
     2: result := skMin;
     3: result := skMax;
     4: result := skCount;
     5: result := skAverage;
  end;
end;

function ParseFieldType(_fieldType: String): TFieldType;
const FTYPES: array [0..51] of string = (
                              'ftUnknown',        'ftString',         'ftSmallint',      'ftInteger', 'ftWord',
                              'ftBoolean',         'ftFloat',         'ftCurrency',      'ftBCD',       // 0..3
                              'ftDate',            'ftTime',          'ftDateTime',      'ftBytes',     // 4..7
                              'ftVarBytes',        'ftAutoInc',       'ftBlob',          'ftMemo',
                              'ftGraphic',         'ftFmtMemo',       'ftParadoxOle',    'ftDBaseOle',
                              'ftTypedBinary',     'ftCursor',        'ftFixedChar',     'ftWideString',
                              'ftLargeint',        'ftADT',           'ftArray',         'ftReference',
                              'ftDataSet',         'ftOraBlob',       'ftOraClob',       'ftVariant',
                              'ftInterface',       'ftIDispatch',     'ftGuid',          'ftTimeStamp',
                              'ftFMTBcd',          'ftFixedWideChar', 'ftWideMemo',      'ftOraTimeStamp',
                              'ftOraInterval',     'ftLongWord',      'ftShortint',      'ftByte',
                              'ftExtended',        'ftConnection',    'ftParams',        'ftStream',
                              'ftTimeStampOffset', 'ftObject',        'ftSingle');

var
   index: integer;
begin

  for index := Low(FTYPES) to High(FTYPES) do
    if ( AnsiCompareText(FTYPES[index], _fieldType) = 0 ) then
      break;

  case index of
     0: result := ftUnknown;
     1: result := ftString;
     2: result := ftSmallint;
     3: result := ftInteger;
     4: result := ftWord;
     5: result := ftBoolean;
     6: result := ftFloat;
     7: result := ftCurrency;
     8: result := ftBCD;
     9: result := ftDate;
    10: result := ftTime;
    11: result := ftDateTime;
    12: result := ftBytes;
    13: result := ftVarBytes;
    14: result := ftAutoInc;
    15: result := ftBlob;
    16: result := ftMemo;
    17: result := ftGraphic;
    18: result := ftFmtMemo;
    19: result := ftParadoxOle;
    20: result := ftDBaseOle;
    21: result := ftTypedBinary;
    22: result := ftCursor;
    23: result := ftFixedChar;
    24: result := ftWideString;
    25: result := ftLargeint;
    26: result := ftADT;
    27: result := ftArray;
    28: result := ftReference;
    29: result := ftDataSet;
    30: result := ftOraBlob;
    31: result := ftOraClob;
    32: result := ftVariant;
    33: result := ftInterface;
    34: result := ftIDispatch;
    35: result := ftGuid;
    36: result := ftTimeStamp;
    37: result := ftFMTBcd;
    38: result := ftFixedWideChar;
    39: result := ftWideMemo;
    40: result := ftOraTimeStamp;
    41: result := ftOraInterval;
    42: result := ftLongWord;
    43: result := ftShortint;
    44: result := ftByte;
    45: result := ftExtended;
    46: result := ftConnection;
    47: result := ftParams;
    48: result := ftStream;
    49: result := ftTimeStampOffset;
    50: result := ftObject;
    51: result := ftSingle;
  end;

end;

end.

