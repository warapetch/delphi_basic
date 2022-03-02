/// Demo Code
/// https://github.com/checkdigits/horse-API-Demo
/// Blog >> https://blogs.embarcadero.com/how-easy-is-it-to-add-a-rest-api-to-your-own-apps/
/// ------------------------------------------------------------------------------------------
/// DataSetConverter4D
/// https://github.com/ezequieljuliano/DataSetConverter4Delphi
/// ------------------------------------------------------------------------------------------
/// Upload files
/// https://github.com/giorgiobazzo/horse-upload
/// ------------------------------------------------------------------------------------------

unit index;

interface

uses
  Horse, System.JSON,REST.Json ,System.SysUtils;

procedure API_Index(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure API_Index(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LRespObj: TJSONObject;
  jsArr : TJSONArray;
  jsonstring : String;
begin
  LRespObj:= TJSONObject.Create;
  try
    {"response" : true}
    {"message" : "this is an API..."}
    LRespObj.AddPair(TJSONPair.Create('response', TJSONBool.Create(true)));
    LRespObj.AddPair(TJSONPair.Create('message', TJSONString.Create('this is an API index using https://github.com/HashLoad/horse')));

    jsArr := TJSONArray.Create;
    jsArr.Add(LRespObj);
    // [{"response" : true , "message": "this is an API..."}]

    // escape http:// >> http:\/\/  >> http://
	JsonString := StringReplace(jsArr.ToString,'\/', '/',[rfReplaceAll]);

    Res.ContentType('application/json; charset=utf-8');
    Res.Send(JsonString);
  finally
    LRespObj.Free;
  end;
end;

end.
