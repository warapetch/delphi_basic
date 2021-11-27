unit UFormMDIChild;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmMDIChild = class(TForm)
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMDIChild: TFrmMDIChild;

implementation

{$R *.dfm}

procedure TFrmMDIChild.BitBtn1Click(Sender: TObject);
begin
    Close;
end;

procedure TFrmMDIChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
    Release;
    FrmMDIChild := nil;
end;

procedure TFrmMDIChild.FormDestroy(Sender: TObject);
begin
    //FrmMDIChild := NIL;
end;

end.
