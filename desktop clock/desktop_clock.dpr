program desktop_clock;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := false;
  Application.Title := 'นาฬิกา';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
