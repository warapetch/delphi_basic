program StudentRec;

uses
  Vcl.Forms,
  UMainMenu in 'UMainMenu.pas' {FrmMainMenu},
  UDMMain in 'UDMMain.pas' {DMMain: TDataModule},
  UMas_Student in 'UMas_Student.pas' {FrmMas_Student},
  UMas_Template in 'UMas_Template.pas' {FrmMas_Template},
  UMas_Student_Add in 'UMas_Student_Add.pas' {FrmMas_Student_Add},
  UMas_Template2 in 'UMas_Template2.pas' {FrmMas_Template2},
  UTrans_Records in 'UTrans_Records.pas' {FrmTrans_Records},
  UTrans_Records_Add in 'UTrans_Records_Add.pas' {FrmTrans_Records_Add},
  UDlg_Search_Student in 'UDlg_Search_Student.pas' {FrmDlg_Search_Student},
  UDirectXWebcam in 'webcam\webcam\UDirectXWebcam.pas' {FrmDirectXWebcam};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TFrmMainMenu, FrmMainMenu);
  Application.Run;
end.
