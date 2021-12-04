program OOP_Demo;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FrmMain},
  UPhone in 'UPhone.pas',
  UPhone2 in 'UPhone2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
