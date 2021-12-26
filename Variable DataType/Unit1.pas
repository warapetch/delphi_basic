unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    mmLog: TMemo;
    btnRun: TBitBtn;
    procedure btnRunClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var // Global
  Form1: TForm1;
  const hello : String = 'สวัสดี';
  const hello2 = 'สวัสดี';

implementation

{$R *.dfm}

uses System.Rtti ;

procedure TForm1.btnRunClick(Sender: TObject);
var intArr : Array of Integer;
    anyArr : TArray<TValue>; //Array of TValue;
    //I : Integer;
	//const hello = 'สวัสดี'
//    hello = 'ส'+'ว'+'ั'+'ส'+'ด'+'ี';
//    char
//    hello : String; // open
//    hello : String[10]; // Max 10 char
//
//    integer -- shortint,smallint,integer,int64
//    float -- single , double ,extended //real

begin
    // inline
    SetLength(intArr,5);
    SetLength(anyArr,5);

    for var I := Low(intArr) to High(intArr) do
        intArr[I] := I;

    for var I := Low(anyArr) to High(anyArr) do
        anyArr[I] := I;


    for var I := Low(intArr) to High(intArr) do
        begin
            mmLog.Lines.Add('Int ['+ IntToStr(I)+ '] ='+IntToStr(intArr[I]));
            mmLog.Lines.Add('Any ['+ IntToStr(I)+ '] ='+IntToStr(anyArr[I].AsInteger));
        end;

    //const hello : String = 'สวัสดี'; // <String>
    const hello = 'สวัสดี'; // <T>

    anyArr[0] := hello;
    anyArr[1] := 'ประเทศไทย';
    anyArr[2] := 'I Love You';
    anyArr[3] := 'Welcome';
    anyArr[4] := 'Tourist';

    for var I := Low(intArr) to High(intArr) do
        begin
            mmLog.Lines.Add('Any ['+ IntToStr(I)+ '] ='+anyArr[I].AsString);
        end;

    var I : integer := 0;
    for var item in anyArr do  // anyArr[?]
        begin
           mmLog.Lines.Add('item ['+ IntToStr(I)+ '] ='+item.AsString);
           I := I +1 ;
        end;


      //String(hello);
      //Integer(1234);
      if TBitBtn(Self) is TBitBtn then
         mmLog.Lines.Add('Self is TBitBtn');

      TBitBtn(Self).Caption := 'I am BitBtn';
end;

end.
