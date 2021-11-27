unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Vcl.Menus;

type
  TFrmMain = class(TForm)
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses Unit2;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
var Form2 : TForm2;
begin
    Form2 := TForm2.Create(NIL); //    Application ,Self = FrmMain ,NIL
    //Form2.Show; //
    Form2.ShowModal;
//    Form2 := NIL;
//    Form2.Free;
    FreeAndNil(Form2);
end;

end.
