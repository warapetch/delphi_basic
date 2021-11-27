program Demo03;

uses
  Forms,
  VFrames in '..\Common\VFrames.pas',
  VSample in '..\Common\VSample.pas',
  Direct3D9 in '..\Common\DirectX\Direct3D9.pas',
  DirectDraw in '..\Common\DirectX\DirectDraw.pas',
  DirectShow9 in '..\Common\DirectX\DirectShow9.pas',
  DirectSound in '..\Common\DirectX\DirectSound.pas',
  DXTypes in '..\Common\DirectX\DXTypes.pas',
  UDirectXWebcam in 'UDirectXWebcam.pas' {FrmDirectXWebcam};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmDirectXWebcam, FrmDirectXWebcam);
  Application.Run;
end.
