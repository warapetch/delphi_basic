program Fingerprint;
uses
  Forms,
 // HelloForm in 'HelloForm.pas' {Form2},
  UMainFGVerify in 'UMainFGVerify.pas' {FrmMainFGVerify},
  ZKFPEngXControl_TLB in 'ZK4500activeX\ZKFPEngXControl_TLB.pas';

{$R *.res}
begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMainFGVerify, FrmMainFGVerify);
  Application.Run;
end.
