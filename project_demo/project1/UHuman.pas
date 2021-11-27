unit UHuman;

interface

  uses
    System.UITypes;

  Type
     TGender = (gdNone,gdMale,gdFeMale);

     THuman = class(TObject)

     private
       FName : String;
       FHeight : Double;
       FSkinColor : TColor;
       FGender : TGender;
       FOccupy : String;
    FMealName: String;
       procedure SetName(const Value: String);
    procedure SetMealName(const Value: String);

     published
       procedure eat; virtual;
       procedure walk;
       procedure work;

     public
       property MealName : String read FMealName write SetMealName;
       property Name : String read FName write SetName;
  end;


implementation

{ THuman }

procedure THuman.eat;
begin
  // eat rice
  FMealName := 'RICE';
end;

procedure THuman.SetMealName(const Value: String);
begin
  FMealName := Value;
end;

procedure THuman.SetName(const Value: String);
begin
  FName := Value;
end;

procedure THuman.walk;
begin

end;

procedure THuman.work;
begin

end;

end.
