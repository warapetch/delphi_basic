program BitKub_API;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FrmMain},
  JsonDataObjects in 'JsonDataObjects\Source\JsonDataObjects.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
