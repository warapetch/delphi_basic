unit UPhone;

interface

	uses System.Classes;

  Type
    TPhoneState = (psFree,psPhoneIn,psPhoneOut);
    TBattery = (btBIG,btMiddle,btSmall);
    TPhoneStateChangeEvent = procedure (Sender: TObject; State: TPhoneState) of Object;

    TPhone = Class(TObject)

    private
       FPhoneNumber: Integer;
       FPhoneState : TPhoneState;
       FStatus : String;
       FOnStateChange: TPhoneStateChangeEvent;
       FBattery: TBattery;
       FOnPowerOn: TNotifyEvent;
       FOnPhoneOut: TNotifyEvent;
       FOnPhoneIn: TNotifyEvent;

       procedure SetPhoneNumber(const Value: Integer);
       procedure DoOnStateChange(Sender: TObject; State: TPhoneState);
       procedure SetPhoneState(const Value: TPhoneState);
       procedure SetBattery(const Value: TBattery);
       procedure DoOnPowerOn(Sender: TObject);
       procedure SetStatus(const Value: String);

    public
        Constructor Create; virtual;

        procedure PowerOn;virtual;
        procedure PhoneIn;virtual;
        procedure PhoneOut;virtual;
        procedure PhoneCancel;virtual;

        property Status : String read FStatus write SetStatus;
        property PhoneState  : TPhoneState read FPhoneState  write SetPhoneState;
        property PhoneNumber : Integer     read FPhoneNumber write SetPhoneNumber;
        property Battery : TBattery read FBattery write SetBattery;

    published

        // Event
        property OnPowerOn     : TNotifyEvent read FOnPowerOn  write FOnPowerOn;
		property OnPhoneOut    : TNotifyEvent read FOnPhoneOut write FOnPhoneOut;
		property OnPhoneIn     : TNotifyEvent read FOnPhoneIn  write FOnPhoneIn;
        property OnStateChange : TPhoneStateChangeEvent read FOnStateChange write FOnStateChange;
    end;


implementation

{ TPhone }

Constructor TPhone.Create;
begin
	FStatus := 'สายว่าง';
    FPhoneState := psFree;
    FBattery := btBIG;
end;

procedure TPhone.PowerOn;
begin
    DoOnPowerOn(Self);

	DoOnStateChange(Self,FPhoneState);
end;

procedure TPhone.DoOnPowerOn(Sender : TObject);
begin
    if Assigned(FOnPowerOn) then
       FOnPowerOn(Self);
end;

procedure TPhone.DoOnStateChange(Sender : TObject;State : TPhoneState);
begin
    if Assigned(FOnStateChange) then
       FOnStateChange(Self,State);
end;

procedure TPhone.PhoneCancel;
begin
	FStatus := 'สายว่าง';
    FPhoneState := psFree;
	DoOnStateChange(Self,FPhoneState);
end;

procedure TPhone.PhoneIn;
begin
    if FPhoneState = psFree then
	   begin
          FStatus := 'รับสายโทรเข้า';
	      FPhoneState := psPhoneIn;
	      DoOnStateChange(Self,FPhoneState);
       end
    else
    FStatus := 'กำลังคุยอยู่ โทรรับสายไม่ได้ !!';

    if Assigned(FOnPhoneIn) then
       FOnPhoneIn(Self);
end;

procedure TPhone.PhoneOut;
begin
    if FPhoneState = psFree then
       begin
          FStatus := 'กำลังโทรออก';
          FPhoneState := psPhoneOut;
	      DoOnStateChange(Self,FPhoneState);
       end
    else
    FStatus := 'กำลังคุยอยู่ โทรออกไม่ได้ !!';

    if Assigned(FOnPhoneOut) then
       FOnPhoneOut(Self);

end;

procedure TPhone.SetBattery(const Value: TBattery);
begin
  FBattery := Value;
end;

procedure TPhone.SetPhoneNumber(const Value: Integer);
begin
   FPhoneNumber := Value;
end;

procedure TPhone.SetPhoneState(const Value: TPhoneState);
begin
  FPhoneState := Value;
end;

procedure TPhone.SetStatus(const Value: String);
begin
  FStatus := Value;
end;

end.
