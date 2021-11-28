unit UTemplate_Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmTemplate_Base = class(TForm)
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
  FrmTemplate_Base: TFrmTemplate_Base;

implementation

{$R *.dfm}

procedure TFrmTemplate_Base.btnTPCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmTemplate_Base.FormShow(Sender: TObject);
begin
    // Assign Self.Caption To Header.Caption
    lblTPHeader.Caption := Self.Caption;
end;

end.
