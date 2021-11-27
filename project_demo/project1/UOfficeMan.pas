unit UOfficeMan;

interface

  uses
    UHuman;

  Type
     TOfficeMan = Class(THuman)

     published
        procedure eat;Override;

  end;


implementation

{ TOfficeMan }

procedure TOfficeMan.eat;
begin
  // inherited;
  MealName := 'HAM';

end;

end.
