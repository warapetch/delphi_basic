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

unit employee;

interface

uses
  Horse, System.JSON, sysutils ,System.Classes;

procedure Get_Employees(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Get_Employee(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Get_Employee_LikeName(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Create_Employee(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Delete_Employee(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Update_Employee(Req: THorseRequest; Res: THorseResponse; Next: TProc);

function GetDataToJsonStr(Res: THorseResponse;sql : String) : String;
function ExecSQL(Res: THorseResponse;action,sql : String) : String;
procedure empUpload(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses DataSetConverter4D,
  DataSetConverter4D.Impl ,
  Udatamodule ;

function GetDataToJsonStr(Res: THorseResponse;sql : String) : String;
var jsArr : TJSONArray;
	JsString : String;
begin
  try

    DMMain.FDConn.Connected := true; //Option
	// DMMain.qryTemp.Close;
    DMMain.qryTemp.SQL.Text := SQL;
    DMMain.qryTemp.Open;

    // DMMain.qryTemp.First;
    // While NOT DMMain.qryTemp.EOF Do
    // begin
    //
    //      DMMain.qryTemp.Next;
    // end;

    jsArr := TJSONArray.Create;
    jsArr.Add('{''recordcount'',0}');
    if DMMain.qryTemp.recordCount > 0 then
        /// TConverter >> uses DataSetConverter4D
    	jsArr := TConverter.New.DataSet(DMMain.qryTemp).AsJSONArray;

    // Remove Escape
	// JsString := jsArr.ToJSON; //<< Dont ToJson it Unicode Encode
	JsString := jsArr.ToString.Replace('\/', '/');

    // set ContentType
    Res.ContentType('application/json; charset=utf-8');
    Res.RawWebResponse.ContentEncoding := 'utf8';
    Res.RawWebResponse.CustomHeaders.Add('Access-Control-Allow-Origin: *');

    // send String
    Res.Send(JsString);

  finally
    jsArr.Free;
    DMMain.FDConn.Connected := False;  //Option
  end;

end;

function ExecSQL(Res: THorseResponse;action,sql : String) : String;
var jsArr : TJSONArray;
	JsString : String;
    iAffect : Integer;
begin
  try

    DMMain.FDConn.Connected := true; //Option
	// DMMain.qryTemp.Close;
    iAffect := DMMain.qryTemp.ExecSQL(SQL);

    // set ContentType
    Res.ContentType('application/json; charset=utf-8');
    Res.RawWebResponse.ContentEncoding := 'utf8';
    Res.RawWebResponse.CustomHeaders.Add('Access-Control-Allow-Origin: *');

    // send String
    jsArr := TJSONArray.Create;
    jsArr.Add('{'''+action+''',''success''}');
    // Remove Escape
	JsString := jsArr.ToJSON.Replace('\/', '/');

    Res.Send(JsString);

  finally
    jsArr.Free;
    DMMain.FDConn.Connected := False;  //Option
  end;

end;

procedure Get_Employees(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
	GetDataToJsonStr(Res,'select * from employee ');
end;

procedure Get_Employee(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var sId : String;
begin
  sId := Req.Params['id'];
  GetDataToJsonStr(Res,'select * from employee where emp_code = '+sId); // "{sID}"
end;

procedure Get_Employee_LikeName(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var sName : String;
begin
  sName := Req.Params['name'];
  GetDataToJsonStr(Res,'select * from employee where emp_name like ''%'+sName+'%'' ');
end;

procedure Delete_Employee(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var sId : String;
begin
  sId := Req.Params['id'];
  ExecSQL(res,'Delete','delete from employee where emp_code = '+sId);
end;

procedure Create_Employee(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var sId,sName,sPhone,sImage,sql : String;
begin
  // get Value from Form
  // fieldName Ignore case ไม่สนตัวเล็กตัวใหญ่
  sId    := Req.ContentFields.Items['emp_code'];  // Req.form['emp_code']
  sName  := Req.ContentFields.Items['emp_name'];
  sPhone := Req.ContentFields.Items['emp_phone'];
  sImage := Req.ContentFields.Items['emp_image'];

    sql := 'insert into employee (emp_code,emp_name,emp_phone,emp_image) values ('+
            #39+sId+#39+','+
            #39+sName+#39+','+
            #39+sPhone+#39+','+
            #39+sImage+#39+')';

    ExecSQL(Res,'Create',sql);
end;

procedure Update_Employee(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var sId,sName,sPhone,sImage,sql : String;
    iNeedUpdate : smallint;

    function checkNeedUpdate(fieldname,value : String) : string;
    begin
        result := '';
        if Trim(value) <> '' then
           begin
              if iNeedUpdate = 0 then
                result := ' '+fieldname+' = '+#39+value+#39
              else
                result := ' , '+fieldname+' = '+#39+value+#39;

              iNeedUpdate := iNeedUpdate + 1;
           end;
    end;

begin
  sId := Req.Params['id'];
  iNeedUpdate := 0;

  // get Value from Form
  // fieldName Ignore case ไม่สนตัวเล็กตัวใหญ่
  sName  := Req.ContentFields.Items['emp_name'];
  sPhone := Req.ContentFields.Items['emp_phone'];
  sImage := Req.ContentFields.Items['emp_image'];

    sql := 'update employee set  '+
            checkNeedUpdate('emp_name',sName)+
            checkNeedUpdate('emp_phone',sPhone)+
            checkNeedUpdate('emp_image',sImage)+
		    ' where emp_code = '+sId ;

	if iNeedUpdate > 0 then
       ExecSQL(Res,'Update',sql);
end;

// TO DO
// Upload Image
procedure empUpload(Req: THorseRequest; Res: THorseResponse; Next: TProc);
//    var      LUploadConfig: TUploadConfig;
    begin
//      LUploadConfig := TUploadConfig.Create('c:\serverfiles');
//      LUploadConfig.ForceDir := True;
//      LUploadConfig.OverrideFiles := True;
//
//      //Optional: Callback for each file received
//      LUploadConfig.UploadFileCallBack :=
//        procedure(Sender: TObject; AFile: TUploadFileInfo)
//        begin
//          Writeln('');
//          Writeln('Upload file: ' + AFile.filename + ' ' + AFile.size.ToString);
//        end;
//
//      //Optional: Callback on end of all files
//      LUploadConfig.UploadsFishCallBack :=
//        procedure(Sender: TObject; AFiles: TUploadFiles)
//        begin
//          Writeln('');
//          Writeln('Finish ' + AFiles.Count.ToString + ' files.');
//        end;
//
//      Res.Send<TUploadConfig>(LUploadConfig);
//    end);

end;

// Response Image

end.

{
Normal-form

'''
----------------------------047941181184836535734125'#$D#$A
'Content-Disposition: form-data;
name="EMP_NAME"'#$D#$A#$D#$A
'แป้งขาว หอมนวล'
#$D#$A
'----------------------------047941181184836535734125'#$D#$A
'Content-Disposition: form-data;
name="EMP_PHONE"'#$D#$A#$D#$A
'12345678'
#$D#$A
'----------------------------047941181184836535734125'#$D#$A
'Content-Disposition: form-data;
name="EMP_IMAGE"'#$D#$A#$D#$A
'6503-2.jpg'#$D#$A
'----------------------------047941181184836535734125--'#$D#$A
'
'''
}
