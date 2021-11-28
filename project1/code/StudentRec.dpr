program StudentRec;

uses
  Vcl.Forms,
  UMainMenu in 'UMainMenu.pas' {FrmMainMenu},
  UDMMain in 'UDMMain.pas' {DMMain: TDataModule},
  UDirectXWebcam in 'webcam\webcam\UDirectXWebcam.pas' {FrmDirectXWebcam},
  UTemplate_Base in 'UTemplate_Base.pas' {FrmTemplate_Base},
  UTemplate_Student in 'UTemplate_Student.pas' {FrmTemplate_Student},
  UMas_Student in 'UMas_Student.pas' {FrmMas_Student},
  UMas_Student_Add in 'UMas_Student_Add.pas' {FrmMas_Student_Add},
  UTrans_Records in 'UTrans_Records.pas' {FrmTrans_Records},
  UTrans_Records_Add in 'UTrans_Records_Add.pas' {FrmTrans_Records_Add},
  UDlg_Search_Student in 'UDlg_Search_Student.pas' {FrmDlg_Search_Student};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMMain, DMMain);
  Application.CreateForm(TFrmMainMenu, FrmMainMenu);

  Application.Run;
end.
