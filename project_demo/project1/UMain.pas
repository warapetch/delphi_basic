unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Datasnap.Provider,
  Vcl.Buttons;

type
  TFrmMain = class(TForm)
    mmDisplay: TMemo;
    btnShow: TButton;
    Button1: TButton;
    BitBtn1: TBitBtn;
    procedure btnShowClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
//    sName : String;
//    iAge : Integer;
//    iPoint : Double;
//    bPass : Boolean;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses UStudent, UHuman , UOfficeMan;

procedure TFrmMain.btnShowClick(Sender: TObject);
var student1 : TStudent;
begin
   student1 := TStudent.Create('Delphi',26,60.50,True);

//   student1.Name := 'Delphi';
//   student1.Age := 26;
//   student1.Point := 60.50;
//   student1.Pass := True;


  // Show
    mmDisplay.Lines.Clear;
    mmDisplay.Lines.Add('Name : '+student1.Name);
    mmDisplay.Lines.Add('Age : '+ IntToStr(student1.Age));
    mmDisplay.Lines.Add('Point : '+FormatFloat('#,0.00',student1.Point));

    mmDisplay.Lines.Add('Pass : '+student1.GetPass);

end;

procedure TFrmMain.Button1Click(Sender: TObject);
var OfficeMan1 : TOfficeMan;
begin
   OfficeMan1 := TOfficeMan.Create;
   OfficeMan1.name := 'สมชาย';
   OfficeMan1.eat;

  // Show
    mmDisplay.Lines.Clear;
    mmDisplay.Lines.Add('OfficeMan-Name : '+OfficeMan1.Name);
    mmDisplay.Lines.Add('OfficeMan-Eat : '+OfficeMan1.MealName);
end;

end.
