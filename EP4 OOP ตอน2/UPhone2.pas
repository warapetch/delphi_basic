unit UPhone2;

interface

uses System.Classes , UPhone;

  Type
    TPhone2 = Class(TPhone)
    private
    	FOnAfterPhoneOut: TNotifyEvent;
    	FOnBeforePhoneOut: TNotifyEvent;
        procedure DoOnBeforePhoneOut;
        procedure DoOnAfterPhoneOut;
    public
        Constructor Create; Override;

        procedure PhoneOut; Override;
    published
        property OnBeforePhoneOut : TNotifyEvent read FOnBeforePhoneOut write FOnBeforePhoneOut;
        property OnAfterPhoneOut  : TNotifyEvent read FOnAfterPhoneOut  write FOnAfterPhoneOut;

    end;


implementation

{ TPhone2 }

constructor TPhone2.Create;
begin
    inherited;
	{FStatus := 'สายว่าง';
    FPhoneState := psFree;
    FBattery := btBIG;}

    Battery := btMiddle;
end;

procedure TPhone2.DoOnAfterPhoneOut;
begin
    if PhoneState = psPhoneOut then
       Status := 'After โทรออก [สำเร็จ]'
    else
    Status := 'After โทรออก [ไม่สำเร็จ !!]';

    if Assigned(FOnAfterPhoneOut) then
       FOnAfterPhoneOut(Self);
end;

procedure TPhone2.DoOnBeforePhoneOut;
begin
    Status := 'Before จะโทรออก';

    if Assigned(FOnBeforePhoneOut) then
       FOnBeforePhoneOut(Self);
end;

procedure TPhone2.PhoneOut;
begin
    DoOnBeforePhoneOut;

	inherited;

    DoOnAfterPhoneOut;
end;

end.

