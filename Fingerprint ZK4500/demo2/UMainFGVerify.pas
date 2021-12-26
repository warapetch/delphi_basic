unit UMainFGVerify;
interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ZKFPEngXControl_TLB, ExtCtrls, OleCtrls, WideStrings,
  Vcl.Buttons;
type
  TFrmMainFGVerify = class(TForm)
    ZKFPEngX1: TZKFPEngX;
    RzPanel1: TPanel;
    pnBG_TOP: TPanel;
    RzPanel3: TPanel;
    pbBG_DATA: TPanel;
    pnTop1: TPanel;
    pnFG_Status: TPanel;
    btnFG_Connect: TBitBtn;
    btnFG_Disconnect: TBitBtn;
    pnTop2: TPanel;
    lbCapID: TLabel;
    spbFG_1: TSpeedButton;
    spbFG_2: TSpeedButton;
    spbFG_3: TSpeedButton;
    spbFG_4: TSpeedButton;
    spbFG_5: TSpeedButton;
    edID: TEdit;
    libFG_Status: TListBox;
    pbBG_Bottom: TPanel;
    Image1: TImage;
    ListBox1: TListBox;
    btnFG_Register: TBitBtn;
    pbBG_Left: TPaintBox;
    procedure btnFG_ConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFG_RegisterClick(Sender: TObject);
    procedure ZKFPEngX1Enroll(ASender: TObject; ActionResult: WordBool;
      ATemplate: OleVariant);
    procedure ZKFPEngX1Capture(ASender: TObject; ActionResult: WordBool;
      ATemplate: OleVariant);
    procedure ZKFPEngX1FeatureInfo(ASender: TObject; AQuality: Integer);
    procedure ZKFPEngX1ImageReceived(ASender: TObject;
      var AImageValid: WordBool);
    procedure SaveFingerToFile(AID,AFingerPrint : WideString);
    procedure btnFG_DisconnectClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    fpcHandle: Integer;
    sRegTemplate09: WideString;
    sRegTemplate10: WideString;
    iFG_NO : Integer;
    strArray  : Array[1..3000,1..2] of String;
    sFG_Data, sFG_ID: WideString;
    procedure EnableButtons(AConnected: Boolean);
    procedure DisplayStatus(AMessage: String);
    procedure DoOnEnrollFinish(ID, FingerData: WideString);
    procedure DoOnVerifyFound(ID: String);
  public
    { Public declarations }
  end;
var
  FrmMainFGVerify: TFrmMainFGVerify;
  DeviceStatus: Boolean = False;
  const
  EngineVersion: WideString = '10';

implementation
{$R *.dfm}

procedure TFrmMainFGVerify.FormCreate(Sender: TObject);
begin
  	DeviceStatus := False;
  	pnFG_Status.Color := clRed;

    // Create Handle FPCacheDB
  	fpcHandle := ZKFPEngX1.CreateFPCacheDB;

  	iFG_NO := 1;
end;

procedure TFrmMainFGVerify.FormDestroy(Sender: TObject);
begin
    // Free Handle FPCacheDB
    ZKFPEngX1.FreeFPCacheDB(fpcHandle);
    ZKFPEngX1.EndEngine();
end;
procedure TFrmMainFGVerify.FormShow(Sender: TObject);
begin
   btnFG_ConnectClick(Self);
end;

procedure TFrmMainFGVerify.btnFG_ConnectClick(Sender: TObject);
var LTextFile : TextFile;
    sFileName : String;
begin
  if ZKFPEngX1.InitEngine = 0 then
     begin
     ZKFPEngX1.FPEngineVersion := '10';//EngineVersion;

     //----------------------------------------------------------
     sFileName := 'data.txt';
     AssignFile(LTextFile, sFileName);
     Reset(LTextFile);
     While not EOF(LTextFile) do
        begin
           readLn(LTextFile, sFG_Data);
           readLn(LTextFile, sFG_ID);
           strArray[iFG_NO,1] :=  sFG_Data;
           strArray[iFG_NO,2] :=  sFG_ID;

           ZKFPEngX1.AddRegTemplateStrToFPCacheDB(fpcHandle, iFG_NO, sFG_Data);

           Inc(iFG_NO);
        end;

     Flush(LTextFile);
     CloseFile(LTextFile);
     //----------------------------------------------------------

     EnableButtons(TRUE);
     DisplayStatus('ติดต่อเครื่องสแกนนิ้ว...[สำเร็จ]');
  end;
end;

procedure TFrmMainFGVerify.EnableButtons(AConnected : Boolean);
begin
     btnFG_Connect.Enabled    := NOT AConnected;
     btnFG_Disconnect.Enabled := AConnected;
     btnFG_Register.Enabled   := AConnected;
     if AConnected then
        pnFG_Status.Color := clLime
     else
     pnFG_Status.Color := clRed;
end;
procedure TFrmMainFGVerify.btnFG_DisconnectClick(Sender: TObject);
begin
   ZKFPEngX1.EndEngine();
   EnableButtons(False);
end;

procedure TFrmMainFGVerify.btnFG_RegisterClick(Sender: TObject);
begin
  if (edID.Text = '')  then begin
     MessageDlg('ระบุID ก่อน !! ', mtInformation, [mbOK], 0);
     Exit;
  end;

  ZKFPEngX1.CancelEnroll;
  ZKFPEngX1.EnrollCount := 3;
  ZKFPEngX1.BeginEnroll;

  DisplayStatus('เริ่มเก็บลายนิ้วมือ');
end;

procedure TFrmMainFGVerify.ZKFPEngX1Capture(ASender: TObject; ActionResult: WordBool;
ATemplate: OleVariant);
var
  ID: Integer;
  Score, ProcessNum: Integer;
  j: Integer;
  Rect : TRect;
  sTemplate,sFromDatabase : String;
  bRegChange : boolean;
begin
     DisplayStatus('ตรวจสอบลายนิ้วมือ...');
     edID.Text := '';
     ProcessNum := 0;
     Score := 8;
     ID := ZKFPEngX1.IdentificationInFPCacheDB(fpcHandle, ATemplate, Score, ProcessNum);

     sTemplate := ZKFPEngX1.GetTemplateAsString;


//     Dataset.First;
//     while NOT (Dataset.eof) do
//         begin
//
//            sFromDatabase := Dataset.FieldbyName('TEMPLATE').AsString;
//            sFromDatabase := Dataset.FieldbyName('TEMPLATE').AsWideString;
//            if ZKFPEngX1.VerFingerFromStr(sFromDatabase,sTemplate,False,bRegChange) then
//               begin
//
//                  DoOnVerifyFound(Dataset.FieldbyName('ID').AsString);
//
//                  Break;
//               end;
//
//            Dataset.Next;
//         end;


    if ID = -1 then // 0 , -1
       begin
           DisplayStatus('ไม่พบลายนิ้วมือนี้ ในระบบ!! ');
       end
    else
    begin
        for j := 1 to Length(strArray) do
            begin
               if(j = ID) then
                  begin
                    edID.Text := strArray[ID,2];
                    DisplayStatus('พบลายนิ้วมือ...ID = ['+edID.Text+'] ');
                    DoOnVerifyFound(edID.Text);
                    edID.Text := '';
                    //Rect := pbBG_Left.BoundsRect;
                    //pbBG_Left.canvas.fillrect(pbBG_Left.BoundsRect);

                    Exit;
                  end;
            end;
    end;
end;

procedure TFrmMainFGVerify.DisplayStatus(AMessage : String);
begin
   if libFG_Status.Items.Count >= 4 then
      libFG_Status.Items.Clear;
   libFG_Status.Items.Add( TimeToStr(TIME)+':'+ AMessage);
   libFG_Status.ItemIndex := libFG_Status.Items.Count - 1;
end;

procedure TFrmMainFGVerify.ZKFPEngX1Enroll(ASender: TObject; ActionResult: WordBool;
ATemplate: OleVariant);
var ID: Integer;
    Score, ProcessNum: Integer;
begin
  if (not ActionResult) then
      MessageDlg('เก็บลายนิ้วมือ...[ไม่สำเร็จ !!]', mtError, [mbOK], 0)
  else
  begin
    ProcessNum := 0;
    Score := 8;
    ID := ZKFPEngX1.IdentificationInFPCacheDB(fpcHandle, ATemplate, Score, ProcessNum);
    if(ID > 0) then
       begin
          MessageDlg('ลายนิ้วมือนี้ มีแล้วในระบบ !!'+#13#10+
                    'ID : '+IntToStr(ID), mtError, [mbOK], 0);
          Exit;
       end;

    sRegTemplate09 := ZKFPEngX1.GetTemplateAsStringEx('9');
    sRegTemplate10 := ZKFPEngX1.GetTemplateAsStringEx('10');

    // Version 9
    if(Length(sRegTemplate10) > 0) then
       begin

//
//          Dataset.Insert / Edit;
//			Dataset['TEMPLATE'] := sRegTemplate9 / sRegTemplate10; // WideString
//          Dataset.FieldbyName('TEMPLATE').AsString := sRegTemplate9 / sRegTemplate10; // String
//          Dataset.FieldbyName('TEMPLATE').AsWideString := sRegTemplate9 / sRegTemplate10; // WideString
//          Dataset.Post;


          if(Length(sRegTemplate10) > 0) then
             ZKFPEngX1.AddRegTemplateStrToFPCacheDB(fpcHandle, iFG_NO, sRegTemplate10)
          else
          MessageDlg('ไม่สามารถสร้างเทมเพลต ลายนิ้วมือ Version 10 ได้ !!', mtError, [mbOK], 0);

          SaveFingerToFile(edID.Text,sRegTemplate10);
          strArray[iFG_NO,1] :=  sRegTemplate10;
          strArray[iFG_NO,2] :=  edID.Text;
          Inc(iFG_NO);
          DisplayStatus('เก็บลายนิ้วมือ...[สำเร็จ]');

          DoOnEnrollFinish(edID.Text,sRegTemplate10);

          edID.Text := '';
          pbBG_Left.canvas.fillrect(pbBG_Left.BoundsRect);
        end
    else
    MessageDlg('เก็บลายนิ้วมือ...[ไม่สำเร็จ!!]'+#13#10+
          'Hardware ใช้เทมเพลต ลายนิ้วมือ Version 9 !!'+#13#10+
          '(ต้องใช้ Version 10)', mtError, [mbOK], 0)
  end;
end;

procedure TFrmMainFGVerify.DoOnVerifyFound(ID : String);
begin
   //
end;

procedure TFrmMainFGVerify.DoOnEnrollFinish(ID ,FingerData : WideString);
begin
   //
end;
procedure TFrmMainFGVerify.ZKFPEngX1FeatureInfo(ASender: TObject; AQuality: Integer);
var sMessage: string;
begin
  sMessage := '';
  // Enroll
  if ZKFPEngX1.IsRegister then
     begin
        if ZKFPEngX1.EnrollIndex = 1 then
           sMessage := 'เก็บลายนิ้วมือ ครบ 3 ครั้งแล้ว'
        else
        sMessage := 'เก็บลายนิ้วมือ เหลืออีก ' + IntToStr(ZKFPEngX1.EnrollIndex-1) + ' ครั้ง';
     end
  else
  begin
     // Verify
     sMessage := 'ลายนิ้วมืออยู่ในเกณฑ์';
     if AQuality <> 0 then
        sMessage := sMessage + ' แย่, % ความชัด =' + IntToStr(ZKFPEngX1.LastQuality)
     else
     sMessage := sMessage + ' ดี, % ความชัด =' + IntToStr(ZKFPEngX1.LastQuality);
  end;

  DisplayStatus(sMessage);
end;

procedure TFrmMainFGVerify.ZKFPEngX1ImageReceived(ASender: TObject; var AImageValid: WordBool);
begin
    // Draw At PaintBox
  with ZKFPEngX1 do
    PrintImageAt(pbBG_Left.Canvas.Handle, 4, 8, pbBG_Left.Width-8, pbBG_Left.Height-16);
end;

procedure TFrmMainFGVerify.SaveFingerToFile(AID,AFingerPrint : WideString);
var f:TextFile;
    FileDir:String;
begin
    FileDir:='data.txt';
    AssignFile(f,FileDir);
    if not FileExists(FileDir) then
       begin
          Rewrite(f);
          CloseFile(f);
       end;
    Append(f);
    Writeln(f,AFingerPrint);
    Writeln(f,AID);
    Flush(f);
    CloseFile(f);
end;

end.
