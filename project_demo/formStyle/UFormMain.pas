unit UFormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmMain = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses UFormNormal, UFormStayOnTop, UFormMDIMain;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
    FrmNormal := TFrmNormal.Create(NIL);
    FrmNormal.Show;
   // FreeAndNil(FrmNormal);
end;

procedure TFrmMain.BitBtn4Click(Sender: TObject);
begin
    FrmStayOnTop := TFrmStayOnTop.Create(NIL);
    FrmStayOnTop.Show;
end;

end.
