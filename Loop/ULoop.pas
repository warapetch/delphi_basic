unit ULoop;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.StdCtrls,Vcl.Forms,
  Vcl.Controls, Vcl.Buttons;

type

  TForm1 = class(TForm)
    btnLoopFor1: TBitBtn;
    mmLog: TMemo;
    btnFor2: TBitBtn;
    btnForNested: TBitBtn;
    btnForIn: TBitBtn;
    btnLoopwhile: TBitBtn;
    btnLoopRepeat: TBitBtn;
    edData: TEdit;
    lblCapData: TLabel;
    edAEIOU: TEdit;
    Label1: TLabel;
    procedure btnLoopFor1Click(Sender: TObject);
    procedure btnFor2Click(Sender: TObject);
    procedure btnForInClick(Sender: TObject);
    procedure btnLoopwhileClick(Sender: TObject);
    procedure btnLoopRepeatClick(Sender: TObject);
    procedure btnForNestedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.btnLoopwhileClick(Sender: TObject);
var sData : String;
  I,iMaxData: Integer;
  sArr : TArray<String>;
begin
    sData := Trim(edData.Text); // Welcome to Thailand , I Love You
    iMaxData := Length(sData);

    sArr := String(edAEIOU.Text).Split([',']);

    I := 1;
    while I <= iMaxData do
       begin
          // sData[I] 1 ตัวอักษร
          for var J := 0 to Length(sArr)-1 do
             begin
                if sArr[J] = sData[I] then
                   mmLog.Lines.Add(' Found in >> '+IntToStr(I)+' = '+sData[I]);
             end;

          //I := I+1;
          Inc(I);
       end;

end;

procedure TForm1.btnLoopRepeatClick(Sender: TObject);
var sData : String;
  I,iMaxData: Integer;
  sArr : TArray<String>; // Array of String; // Dynamic index=0
begin
    sData := Trim(edData.Text); // Welcome to Thailand , I Love You
    iMaxData := Length(sData);

    sArr := String(edAEIOU.Text).Split([',']);

    I := 1;
    Repeat
          // sData[I] 1 ตัวอักษร
          for var J := 0 to Length(sArr)-1 do
             begin
                if sArr[J] = sData[I] then
                   mmLog.Lines.Add(' Found in >> '+IntToStr(I)+' = '+sData[I]);
             end;

          Inc(I);

    Until (I > iMaxData); // Until Condition is True then Stop !!

end;

procedure TForm1.btnFor2Click(Sender: TObject);
var sData : String;
  I,iMaxData: Integer;
  sArr : TArray<String>; // Array of String; // Dynamic index=0
begin
    sData := Trim(edData.Text); // Welcome to Thailand , I Love You
    iMaxData := Length(sData);

    sArr := String(edAEIOU.Text).Split([',']);

    for I := iMaxData DownTo 1 do
       begin
          // sData[I] 1 ตัวอักษร
          for var J := 0 to Length(sArr)-1 do
             begin
                if sArr[J] = sData[I] then
                   mmLog.Lines.Add(' Found in >> '+IntToStr(I)+' = '+sData[I]);
             end;
       end;
end;

procedure TForm1.btnForInClick(Sender: TObject);
var sData : String;
  I,iMaxData: Integer;
  sArr : TArray<String>;
begin
    sData := Trim(edData.Text); // Welcome to Thailand , I Love You
    iMaxData := Length(sData);

    sArr := String(edAEIOU.Text).Split([',']);

    I := 1;
    for var Char1 in sData do
       begin
          // Char1 == 1 ตัวอักษร
          for var J := 0 to Length(sArr)-1 do
             begin
                if sArr[J] = Char1 then
                   mmLog.Lines.Add(' Found in >> ['+IntToStr(I)+'] = '+Char1);
             end;

          Inc(I); // I := I + 1;
       end;
end;

procedure TForm1.btnForNestedClick(Sender: TObject);
var sData : String;
  I,iMaxData: Integer;
  sArr : TArray<String>; // Array of String; // Dynamic index=0
begin
    sData := Trim(edData.Text); // Welcome to Thailand , I Love You
    iMaxData := Length(sData);

    sArr := String(edAEIOU.Text).Split([',']);

    I := 1;
    var Char1 := '';
    Repeat

        Char1 := Copy(sData,1,1);   // Copy sData 1 Char
                 Delete(sData,1,1); // Delete sData 1 Char

          // sData[I] 1 ตัวอักษร
          for var J := 0 to Length(sArr)-1 do
             begin
                if sArr[J] = Char1 then
                   mmLog.Lines.Add(' Found in >> '+IntToStr(I)+' = '+Char1);
             end;

          Inc(I); // เพิ่มลำดับ

    Until (Length(sData) = 0); // Until Condition is True then Stop !!


end;

procedure TForm1.btnLoopFor1Click(Sender: TObject);
var sData : String;
  I,iMaxData: Integer;

  sArr : TArray<String>; // Array of String; // Dynamic index=0

begin

    sData := Trim(edData.Text); // Welcome to Thailand , I Love You
    iMaxData := Length(sData);

    sArr := String(edAEIOU.Text).Split([',']);

    for I := 1 to iMaxData do
       begin
          //mmLog.Lines.Add( IntToStr(I)+' = '+sData[I]);

          // sData[I] 1 ตัวอักษร
          for var J := 0 to Length(sArr)-1 do
             begin
                if sArr[J] = sData[I] then
                   mmLog.Lines.Add(' Found in >> '+IntToStr(I)+' = '+sData[I]);
             end;


//          if sData[I] in ['a','e','i','o','u']  then
//             begin
//                mmLog.Lines.Add(' Found in >> '+IntToStr(I)+' = '+sData[I]);
//
//                // Exit , Break //
//                //Exit;
//                //Break;
//             end;
//
//          if POS(sData[I], 'a,e,i,o,u') > 0  then
//             begin
//                mmLog.Lines.Add(' Found POS >> '+IntToStr(I)+' = '+sData[I]);
//             end;


       end;


end;

end.
