unit UDMMain;

interface

uses
  System.SysUtils, System.Classes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TDMMain = class(TDataModule)
    FDConn: TFDConnection;
    procedure FDConnBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetConfigValue(Field, DefaultValue: String): String;
    function WorkPath: String;

  end;

var
  DMMain: TDMMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses System.IniFiles , Vcl.Dialogs;

function TDMMain.WorkPath : String;
var sPath : String;
begin
    // ParamStr(0) >> sPath 'D:\project1\output\StudentRec.exe'
    sPath := ParamStr(0);
    // Cut FileName >> 'D:\project1\output'
    sPath := ExtractFileDir(sPath);

    // Result WorkPath (Current Exe)
    // + PathDelim >> '\' or '/' Follow by OS
    Result := sPath+PathDelim;  //'D:\project1\output\'
end;

function TDMMain.GetConfigValue(Field , DefaultValue : String) : String;
var iniFile : TIniFile;
    sFileName , sSection ,
    sValue : String;
begin
    // Assign ini FileName
    sFileName := WorkPath+'dbconfig.ini';
    sSection  := 'student';

    // if File Exists
    if FileExists(sFileName) then
       begin
          // Create iniFile
          iniFile := TIniFile.Create(sFileName);
          sValue := iniFile.ReadString(sSection,Field,DefaultValue);
          Result := sValue;
          FreeAndNil(iniFile);
       end
    else
    showmessage('File Config Not Found !!');

end;

procedure TDMMain.DataModuleCreate(Sender: TObject);
begin
    FDConn.Connected := True;
end;

procedure TDMMain.FDConnBeforeConnect(Sender: TObject);
var dfDatabase : String;
begin
    // SQLite  default == '..\data\dbstudent.db'
    dfDatabase := '..\data'+PathDelim+'dbstudent.db';
    FDConn.Params.DriverID := '';
    FDConn.Params.Database := '';

    // Load Config
    FDConn.Params.DriverID := GetConfigValue('driverid','SQLite');
    FDConn.Params.Database := GetConfigValue('database',dfDatabase);

end;

end.
