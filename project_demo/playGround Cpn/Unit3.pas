unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
//    if OpenDialog1.Execute then
//       Image1.Picture.LoadFromFile(OpenDialog1.FileName);

    if OpenPictureDialog1.Execute then
//       Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
       Image1.Picture.Bitmap.LoadFromFile(OpenPictureDialog1.FileName)

end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
    Image1.Picture := NIL;
end;

end.
