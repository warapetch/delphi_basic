unit UTemplateForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmTemplate = class(TForm)
    pnlTop: TPanel;
    btnClose: TBitBtn;
    lblHeader: TLabel;
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTemplate: TFrmTemplate;

implementation

{$R *.dfm}

procedure TFrmTemplate.btnCloseClick(Sender: TObject);
begin
    Close;
end;

end.
