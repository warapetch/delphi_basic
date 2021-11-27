unit UMas_Template;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmMas_Template = class(TForm)
    pnlTPTop: TPanel;
    pnlTPBottom: TPanel;
    btnTPClose: TBitBtn;
    lblTPHeader: TLabel;
    procedure btnTPCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMas_Template: TFrmMas_Template;

implementation

{$R *.dfm}

procedure TFrmMas_Template.btnTPCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmMas_Template.FormShow(Sender: TObject);
begin
    // Assign Self.Caption To Header.Caption
    lblTPHeader.Caption := Self.Caption;
end;

end.
