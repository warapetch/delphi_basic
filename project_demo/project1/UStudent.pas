unit UStudent;

interface

  uses
     System.Classes;

  Type
     //TStudent = Class
     TStudent = Class(TObject)
     // Accesss
     private
       FName : String;
       FAge : Integer;
       FPoint : Double;
       FPass : Boolean;
       FOnLearning: TNotifyEvent;

        procedure SetName(const Value: String);
        procedure SetAge(const Value: Integer);
        procedure SetPass(const Value: Boolean);
        procedure SetPoint(const Value: Double);

     protected

     public

        //constructor Create;
        constructor Create(AName : String;AAge : Integer;APoint : Double;APass : Boolean);

       // Data > field + Method
        function GetPass : String;
        procedure Learning;

     published
       property Name : String read FName write SetName;
       property Age : Integer read FAge write SetAge;
       property Point : Double read FPoint write SetPoint;
       property Pass : Boolean read FPass write SetPass;

       property OnLearning : TNotifyEvent read FOnLearning write FOnLearning;

  end;


implementation

{ TStudent }

constructor TStudent.Create(AName : String;AAge : Integer;APoint : Double;APass : Boolean);
begin
    //
    FName := AName;
    FAge  := AAge;
    FPoint := APoint;
    FPass := APass;
end;

function TStudent.GetPass: String;
begin
   if (FPass = True) then
       result := '"YES"'
    else
       result := '"NO"';
end;

procedure TStudent.Learning;
begin
  // Base //
end;

procedure TStudent.SetAge(const Value: Integer);
begin
  FAge := Value;
end;

procedure TStudent.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TStudent.SetPass(const Value: Boolean);
begin
  FPass := Value;
end;

procedure TStudent.SetPoint(const Value: Double);
begin
  FPoint := Value;
end;

end.
