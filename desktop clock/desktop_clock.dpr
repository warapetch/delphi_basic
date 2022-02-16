program desktop_clock;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {FrmMainSmall},
  Unit1 in 'Unit1.pas' {FrmMainBig};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := false;
  Application.Title := 'นาฬิกา';
  // Small
  Application.CreateForm(TFrmMainSmall, FrmMainSmall);
  // Big
  //Application.CreateForm(TFrmMainBig, FrmMainBig);
  Application.Run;
end.
