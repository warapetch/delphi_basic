program FormStyle;

uses
  Vcl.Forms,
  UFormMDIMain in 'UFormMDIMain.pas' {FrmMDIForm},
  UFormMDIChild in 'UFormMDIChild.pas' {FrmMDIChild};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMDIForm, FrmMDIForm);
  Application.Run;
end.
