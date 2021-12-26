unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, OleCtrls, ZKFPEngXControl_TLB, ComCtrls, variants,
  ExtDlgs;

type
  TForm1 = class(TForm)
    pnlCommand: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnInit: TButton;
    EDSensorNum: TEdit;
    EDSensorIndex: TEdit;
    EDSensorSN: TEdit;
    RGFormat: TRadioGroup;
    btnSaveImage: TButton;
    btnReg: TButton;
    btnVerify: TButton;
    btnIdentify: TButton;
    StatusBar: TStatusBar;
    btnDisconnect: TButton;
    btnRegByIdentify: TButton;
    btnRegByImage: TButton;
    btnBeep: TButton;
    btnGreen: TButton;
    ZKFPEngX1: TZKFPEngX;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    btnRed: TButton;
    chkFakeFunOn: TCheckBox;
    rbtZKFinger9: TRadioButton;
    rbtZKFinger10: TRadioButton;
    OpenPictureDialog2: TOpenPictureDialog;
    procedure btnInitClick(Sender: TObject);
    procedure ZKFPEngX1Capture(Sender: TObject; ActionResult: WordBool;
      ATemplate: OleVariant);
    procedure btnSaveImageClick(Sender: TObject);
    procedure btnRegClick(Sender: TObject);
    procedure ZKFPEngX1FeatureInfo(Sender: TObject; AQuality: Integer);
    procedure btnVerifyClick(Sender: TObject);
    procedure btnIdentifyClick(Sender: TObject);
    procedure ZKFPEngX1Enroll(Sender: TObject; ActionResult: WordBool;
      ATemplate: OleVariant);
    procedure ZKFPEngX1ImageReceived(Sender: TObject;
      var AImageValid: WordBool);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnRegByIdentifyClick(Sender: TObject);
    procedure btnRegByImageClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnBeepClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnGreenClick(Sender: TObject);
    procedure btnRedClick(Sender: TObject);
  private
    { Private declarations }
    FRegTemplate: oleVariant;
    FMatchType: Integer;
    sRegTemplate,sRegTemplate10: WideString;
    FPID: Integer;
    FFingerName: TStringList;
    fpcHandle: Integer;
    iOld: DWORD;

    procedure EnabledButton(bEnab: Bool);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnInitClick(Sender: TObject);
var iError : Integer;
begin
//  if chkFakeFunOn.Checked then
//    ZKFPEngX1.FakeFunOn := 1
//  else
//    ZKFPEngX1.FakeFunOn := 0;
	iError := ZKFPEngX1.InitEngine; // 1 Can not Connect , 2 not found HardWare
  if iError = 0 then
  begin
    EnabledButton(false);
    if (rbtZKFinger9.Checked) then
			ZKFPEngX1.FPEngineVersion := '9'
		else
			ZKFPEngX1.FPEngineVersion := '10';
    fpcHandle := ZKFPEngX1.CreateFPCacheDBEx();

    StatusBar.Panels.Items[0].Text := 'Sensor connected';
    EDSensorNum.Text := IntToStr(ZKFPEngX1.SensorCount);
    EDSensorIndex.Text := IntToStr(ZKFPEngX1.SensorIndex);

    EDSensorSN.Text := ZKFPEngX1.SensorSN;
    MessageDlg('Initial success!', mtInformation, [mbOK], 0);
  end
  else begin
    ZKFPEngX1.EndEngine();
    MessageDlg('Initial Failed!', mtError, [mbOK], 0);
  end;

  FMatchType := 2;
end;

procedure TForm1.ZKFPEngX1Capture(Sender: TObject; ActionResult: WordBool;
  ATemplate: OleVariant);
var
  ID, I: Integer;
  Score, ProcessNum: Integer;
  RegChange: wordBool;
  sTemp: string;
  sVerTemplate:WideString;
begin
  if FMatchType = 1 then
  begin //1:1
    sTemp := ZKFPEngX1.GetTemplateAsString;

    if (rbtZKFinger9.Checked) then
      sVerTemplate := sRegTemplate
    else
      sVerTemplate := sRegTemplate10;
    if ZKFPEngX1.VerFingerFromStr(sVerTemplate,sTemp, false, regChange) then
      StatusBar.Panels.Items[0].Text := 'Verify Succeed'
    else
      StatusBar.Panels.Items[0].Text := 'Verify Failed';
  end
  else if FMatchType = 2 then
  begin //1:N
    Score := 8;
    ID := ZKFPEngX1.IdentificationInFPCacheDB(fpcHandle, ATemplate, Score, ProcessNum);
    if ID = -1 then
      StatusBar.Panels.Items[0].Text := 'Identify Failed'
    else
    begin
      StatusBar.Panels.Items[0].Text :=
        Format('Identify Succeed ID = %d Score = %d  Processed Number = %d', [ID, Score, ProcessNum]);
    end;
  end;
end;

procedure TForm1.ZKFPEngX1FeatureInfo(Sender: TObject; AQuality: Integer);
var
  sTemp: string;
  lastq: Integer;
begin
  sTemp := '';
  if ZKFPEngX1.IsRegister then
    sTemp := 'Register status: still press finger ' + IntToStr(ZKFPEngX1.EnrollIndex) + ' times!';

  sTemp := sTemp + ' Fingerprint quality';
  lastq := ZKFPEngX1.LastQuality;
  if AQuality = -1 then
     sTemp := sTemp + ' not good, Suspicious fingerprints, quality=' + IntToStr(lastq)
  else if AQuality <> 0 then
     sTemp := sTemp + ' not good, quality=' + IntToStr(lastq)
  else
     sTemp := sTemp + ' good, quality=' + IntToStr(lastq);
  StatusBar.Panels.Items[0].Text := sTemp;
end;

procedure TForm1.ZKFPEngX1Enroll(Sender: TObject; ActionResult: WordBool;
  ATemplate: OleVariant);
var
  pTemplate: OleVariant;
begin
  if not ActionResult then
    MessageDlg('Register Failed', mtWarning, [mbOK], 0)
  else
  begin
    sRegTemplate := ZKFPEngX1.GetTemplateAsStringEx('9');
		sRegTemplate10 := ZKFPEngX1.GetTemplateAsStringEx('10');

		if(Length(sRegTemplate) > 0) then
		begin
			if(Length(sRegTemplate10) > 0) then
				ZKFPEngX1.AddRegTemplateStrToFPCacheDBEx(fpcHandle, FPID, sRegTemplate, sRegTemplate10)
			else
        MessageDlg('Register 10.0 failed, template length is zero', mtError, [mbOK], 0);

			if (rbtZKFinger9.Checked) then begin
				pTemplate := ZKFPEngX1.DecodeTemplate1(sRegTemplate);
				// Note: 10.0Template can not be compressed (±»Ñ¹Ëõ)
				ZKFPEngX1.SetTemplateLen(pTemplate, 602);
			end
			else
				pTemplate := ZKFPEngX1.DecodeTemplate1(sRegTemplate10);

			ZKFPEngX1.SaveTemplate('fingerprint.tpl', pTemplate);

			Inc(FPID);
      MessageDlg('Register Succeed£¡', mtInformation, [mbOK], 0);
		end
		else
		begin
      MessageDlg('Register Failed, template length is zero', mtError, [mbOK], 0);
		end;
  end;
end;

procedure TForm1.btnSaveImageClick(Sender: TObject);
begin
  if RGFormat.ItemIndex = 0 then
    ZKFPEngX1.SaveBitmap('Fingerprint.bmp')
  else if RGFormat.ItemIndex = 1 then
    ZKFPEngX1.SaveJPG('Fingerprint.jpg');
  MessageDlg('Fingerprint Image saved', mtInformation, [mbOK], 0);
end;

procedure TForm1.btnRegClick(Sender: TObject);
begin
  ZKFPEngX1.CancelEnroll;
  ZKFPENgX1.EnrollCount := 3;
  ZKFPEngX1.BeginEnroll;
  StatusBar.Panels.Items[0].Text := 'start register';
end;

procedure TForm1.btnVerifyClick(Sender: TObject);
begin
  if ZKFPEngX1.IsRegister then
    ZKFPEngX1.CancelEnroll;
  StatusBar.Panels.Items[0].Text := 'Verify(1:1)';
  FMatchType := 1;
end;

procedure TForm1.btnIdentifyClick(Sender: TObject);
begin
  if ZKFPEngX1.IsRegister then
    ZKFPEngX1.CancelEnroll;
  StatusBar.Panels.Items[0].Text := 'Identify(1:N)';
  FMatchType := 2;
end;

procedure TForm1.ZKFPEngX1ImageReceived(Sender: TObject;
  var AImageValid: WordBool);
begin
  with ZKFPEngX1 do
    PrintImageAt(Self.Canvas.Handle, 0, 0, ImageWidth, ImageHeight);
  iOld := GetTickCount;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPID := 1;
  FFingerName := TStringList.Create;
  fpcHandle := ZKFPEngX1.CreateFPCacheDB;
  FRegTemplate := null;
  EnabledButton(true);
end;

procedure TForm1.btnRegByIdentifyClick(Sender: TObject);
var
  filename: string;
begin
	if (OpenPictureDialog2.Execute) then
	begin
		filename := OpenPictureDialog2.FileName;
		if (ZKFPEngX1.IsRegister) then
			ZKFPEngX1.CancelEnroll;

		ZKFPEngX1.BeginCapture();
		if(not ZKFPEngX1.AddImageFile(filename, 500)) then
		begin
      MessageDlg('Extract failed or not using the standard version of ZKFinger SDK', mtError, [mbOK], 0);
		end;
	end;
end;

procedure TForm1.btnRegByImageClick(Sender: TObject);
var
  filename: string;
begin
	if (OpenPictureDialog2.Execute) then
	begin
		filename := OpenPictureDialog2.FileName;
		if (ZKFPEngX1.IsRegister) then
			ZKFPEngX1.CancelEnroll;
    ZKFPENgX1.EnrollCount := 1;
    ZKFPEngX1.BeginEnroll;

		if(not ZKFPEngX1.AddImageFile(filename, 500)) then
		begin
      MessageDlg('Extract failed or not using the standard version of ZKFinger SDK', mtError, [mbOK], 0);
		end;
	end;
end;

procedure TForm1.btnDisconnectClick(Sender: TObject);
begin
  ZKFPEngX1.EndEngine;
  EnabledButton(True);
end;

procedure TForm1.btnRedClick(Sender: TObject);
begin
  ZKFPEngX1.ControlSensor(12, 1);
  Sleep(100);
	ZKFPEngX1.ControlSensor(12, 0);
end;

procedure TForm1.btnGreenClick(Sender: TObject);
begin
  ZKFPEngX1.ControlSensor(11, 1);
  Sleep(100);
	ZKFPEngX1.ControlSensor(11, 0);
end;

procedure TForm1.btnBeepClick(Sender: TObject);
begin
  ZKFPEngX1.ControlSensor(13, 1);
  Sleep(100);
	ZKFPEngX1.ControlSensor(13, 0);
end;

procedure TForm1.EnabledButton(bEnab: Bool);
begin
  btnInit.Enabled := bEnab;
  btnDisconnect.Enabled := not bEnab;
  btnSaveImage.Enabled := not bEnab;
  btnReg.Enabled := not bEnab;
  btnVerify.Enabled := not bEnab;
  btnIdentify.Enabled := not bEnab;
  btnRegByImage.Enabled := not bEnab;
  btnRegByIdentify.Enabled := not bEnab;
  btnRed.Enabled := not bEnab;
  btnGreen.Enabled := not bEnab;
  btnBeep.Enabled := not bEnab;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FFingerName.Free;
  ZKFPEngX1.FreeFPCacheDB(fpcHandle);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  ZKFPEngX1.CancelCapture;
end;

end.
