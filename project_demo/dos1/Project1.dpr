program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const
  a = 1;

var
  sName : String; // เก็บตัวอักษร
  iAge : Integer; // เก็บตัวเลข
  iPoint : Double; // ทศนิยม
  bPass : Boolean; // True / False , Yes / No
  // False = 0 , True = -1
  sPass : String;

begin

  try

    sName := 'delphi';
    iAge := 10;
    iPoint := 60.50;
    bPass  := True;  // set

    // Name : delphi
    Writeln('Name : '+sName); // "-" , '-'
    // 1+1 = 2
    Writeln('Age : '+IntToStr(iAge)); // Convert Integer to String

    //Writeln('Point : '+FloatToStr(iPoint)); // Convert Double/float to String
    Writeln('Point : '+FormatFloat('#,0.00',iPoint));

    // Writeln('Pass : '+ BoolToStr(bPass)); // Convert Boolean to String
    {0000}
    (*...*)

    if (bPass = True) then // If .. then , If .. then .. else ..
        sPass := 'YES'
    else
       sPass := 'NO';

    Writeln('Pass : '+sPass);


    ReadLn;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);

  end;

end.
