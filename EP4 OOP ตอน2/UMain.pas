unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls ,UPhone,UPhone2;

type
  TFrmMain = class(TForm)
    pnlPhone1: TPanel;
    btnPhoneIn: TButton;
    btnPhoneOut: TButton;
    btnPhoneCancel: TButton;
    mmStatus: TMemo;
    Label1: TLabel;
    btnPowerOn: TButton;
    pnlPhone2: TPanel;
    Label2: TLabel;
    btnPhoneIn2: TButton;
    btnPhoneOut2: TButton;
    btnPhoneCancel2: TButton;
    mmStatus2: TMemo;
    btnPowerOn2: TButton;
    procedure btnPhoneOutClick(Sender: TObject);
    procedure btnPhoneInClick(Sender: TObject);
    procedure btnPhoneCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPowerOnClick(Sender: TObject);
    procedure btnPowerOn2Click(Sender: TObject);
    procedure btnPhoneOut2Click(Sender: TObject);
    procedure btnPhoneIn2Click(Sender: TObject);
    procedure btnPhoneCancel2Click(Sender: TObject);
  private
    { Private declarations }
    Phone1 : TPhone;
    Phone2 : TPhone2;
    procedure DoOnPhoneStateChange(Sender: TObject; State: TPhoneState);
    procedure DoOnPhonePowerOn(Sender: TObject);
    procedure DoOnPhoneIn(Sender: TObject);
    procedure DoOnPhoneOut(Sender: TObject);

    procedure DoOnPhonePowerOn2(Sender: TObject);
    procedure DoOnPhoneStateChange2(Sender: TObject; State: TPhoneState);
    procedure DoOnAfterPhoneOut(Sender: TObject);
    procedure DoOnBeforePhoneOut(Sender: TObject);
    procedure DoOnPhoneIn2(Sender: TObject);
    procedure DoOnPhoneOut2(Sender: TObject);

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}


procedure TFrmMain.btnPhoneCancel2Click(Sender: TObject);
begin
    Phone2.PhoneCancel;
    mmStatus2.Lines.Add(Phone2.Status);
end;

procedure TFrmMain.btnPhoneCancelClick(Sender: TObject);
begin
    Phone1.PhoneCancel;
    mmStatus.Lines.Add(Phone1.Status);
end;

procedure TFrmMain.btnPhoneIn2Click(Sender: TObject);
begin
    Phone2.PhoneIn;
end;

procedure TFrmMain.btnPhoneInClick(Sender: TObject);
begin
    Phone1.PhoneIn;
end;

procedure TFrmMain.btnPhoneOut2Click(Sender: TObject);
begin
    Phone2.PhoneOut;
end;

procedure TFrmMain.btnPhoneOutClick(Sender: TObject);
begin
    Phone1.PhoneOut;
end;

procedure TFrmMain.btnPowerOn2Click(Sender: TObject);
begin
    Phone2.PowerOn;
end;

procedure TFrmMain.btnPowerOnClick(Sender: TObject);
begin
    Phone1.PowerOn;
end;

procedure TFrmMain.DoOnPhonePowerOn(Sender: TObject);
begin
	btnPowerOn.Enabled := False;
    pnlPhone1.Color    := clLime;

    case Phone1.Battery of
       btBIG : mmStatus.Lines.Add('Battery ขนาดใหญ่');
       btMiddle : mmStatus.Lines.Add('Battery ขนาดกลาง');
       btSmall : mmStatus.Lines.Add('Battery ขนาดเล็ก');
    end;
end;

procedure TFrmMain.DoOnPhoneIn(Sender: TObject);
begin
    mmStatus.Lines.Add(Phone1.Status);
end;

procedure TFrmMain.DoOnPhoneIn2(Sender: TObject);
begin
    mmStatus2.Lines.Add(Phone2.Status);
end;

procedure TFrmMain.DoOnPhoneOut(Sender: TObject);
begin
    mmStatus.Lines.Add(Phone1.Status);
end;

procedure TFrmMain.DoOnPhoneOut2(Sender: TObject);
begin
    mmStatus2.Lines.Add(Phone2.Status);
end;

procedure TFrmMain.DoOnPhoneStateChange(Sender: TObject;State : TPhoneState);
var bFree : Boolean;
begin
    bFree := (State = psFree);

    btnPhoneOut.Enabled := bFree;
    btnPhoneIn.Enabled  := bFree;
    btnPhoneCancel.Enabled := NOT bFree;
end;

procedure TFrmMain.DoOnPhonePowerOn2(Sender: TObject);
begin
	btnPowerOn2.Enabled := False;
    pnlPhone2.Color := clLime;

    case Phone2.Battery of
       btBIG : mmStatus2.Lines.Add('Battery ขนาดใหญ่');
       btMiddle : mmStatus2.Lines.Add('Battery ขนาดกลาง');
       btSmall : mmStatus2.Lines.Add('Battery ขนาดเล็ก');
    end;
end;

procedure TFrmMain.DoOnPhoneStateChange2(Sender: TObject;State : TPhoneState);
var bFree : Boolean;
begin
    bFree := (State = psFree);

    btnPhoneOut2.Enabled := bFree;
    btnPhoneIn2.Enabled  := bFree;
    btnPhoneCancel2.Enabled := NOT bFree;
end;

procedure TFrmMain.DoOnAfterPhoneOut(Sender: TObject);
begin
    mmStatus2.Lines.Add(Phone2.Status);
end;

procedure TFrmMain.DoOnBeforePhoneOut(Sender: TObject);
begin
    mmStatus2.Lines.Add(Phone2.Status);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
	Phone1 := TPhone.Create;
    Phone1.OnPowerOn     := DoOnPhonePowerOn;
    Phone1.OnPhoneIn     := DoOnPhoneIn;
    Phone1.OnPhoneOut    := DoOnPhoneOut;
    Phone1.OnStateChange := DoOnPhoneStateChange;

	Phone2 := TPhone2.Create;
    Phone2.OnPowerOn     := DoOnPhonePowerOn2;
    Phone2.OnPhoneIn     := DoOnPhoneIn2;
    Phone2.OnPhoneOut    := DoOnPhoneOut2;
    Phone2.OnStateChange := DoOnPhoneStateChange2;

    Phone2.OnBeforePhoneOut := DoOnBeforePhoneOut;
    Phone2.OnAfterPhoneOut  := DoOnAfterPhoneOut;
end;

end.
