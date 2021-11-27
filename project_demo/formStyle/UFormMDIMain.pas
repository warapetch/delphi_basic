unit UFormMDIMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmMDIForm = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMDIForm: TFrmMDIForm;

implementation

{$R *.dfm}

uses UFormMDIChild;

procedure TFrmMDIForm.BitBtn1Click(Sender: TObject);
begin
    FrmMDIChild := TFrmMDIChild.Create(Self);
    FrmMDIChild.Show;
end;

end.
