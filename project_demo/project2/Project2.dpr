program Project2;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {FrmMain},
  Unit2 in 'Unit2.pas' {Form2},
  UTemplateForm in 'UTemplateForm.pas' {FrmTemplate};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFrmTemplate, FrmTemplate);
  Application.Run;
end.
