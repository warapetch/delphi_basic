program Project1;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FrmMain},
  UStudent in 'UStudent.pas',
  UHuman in 'UHuman.pas',
  UOfficeMan in 'UOfficeMan.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
