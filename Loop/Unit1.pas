unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.StdCtrls,Vcl.Forms,
  Vcl.Controls, Vcl.Buttons;

type

  TForm1 = class(TForm)
    btnTest: TBitBtn;
    mmLog: TMemo;
    procedure btnTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TFoo<T> = class
     FData: T;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnTestClick(Sender: TObject);
var
  Fint : TFoo<Integer>;
  Fstr : TFoo<String>;

begin
  Fint := TFoo<Integer>.Create;
  Fint.Fdata := 123;

  Fstr := TFoo<String>.Create;
  Fstr.FData := 'Hello world';


  mmLog.Lines.Add('Fint = '+ IntToStr(Fint.FData));
  mmLog.Lines.Add('Fstr = '+ Fstr.FData);
end;

end.
