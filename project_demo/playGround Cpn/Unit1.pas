unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls ,FMX.Text;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    CheckBox1: TCheckBox;
    RadioButton1: TRadioButton;
    ListBox1: TListBox;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    Button2: TButton;
    CheckBox2: TCheckBox;
    RadioButton2: TRadioButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Memo1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var tmpButton : TButton;
begin
    Label1.Caption := 'เดลไฟ';
    Label1.Color   := clAqua;
    Label1.Font.Color := clwhite;


    tmpButton := TButton.Create(Self);
    tmpButton.Caption := 'Tmp';
    tmpButton.SetBounds(200,100,100,30);
    tmpButton.OnClick := Button2Click;
    //tmpButton.Parent := Self;
    Self.InsertControl(tmpButton);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    if TButton(Sender).Tag > 0 then
       Edit1.Text := TButton(Sender).Caption+ ' : Click !!'
    else
    ShowMessage('Accesss Deny');

end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
    if CheckBox1.Checked {= True} then
       Label1.Color := clGreen
    else
       Label1.Color := clRed;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var sValue , sText : String;
begin
    sValue := '-';
    if ComboBox1.ItemIndex > -1  then // Selected
       sValue := ComboBox1.Items[ComboBox1.ItemIndex];
    sText  := ComboBox1.Text;


    Memo1.Lines.Add('Cb.Value = '+sValue);
    Memo1.Lines.Add('Cb.Text = '+sText);
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
begin
    Caption := 'ItemIndex  = '+IntToStr(ComboBox1.ItemIndex);
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var sValue : String;
begin
    Caption := 'ItemIndex  = '+IntToStr(ListBox1.ItemIndex);
    sValue := '';
    if ListBox1.ItemIndex > -1  then // Selected
       sValue := ListBox1.Items[ListBox1.ItemIndex];

    Memo1.Lines.Add('Lb.Value = '+sValue);

end;

procedure TForm1.Memo1Click(Sender: TObject);
begin
    Caption := 'Memo Line = '+IntToStr(Memo1.CaretPos.Y);
end;

procedure TForm1.Memo1DblClick(Sender: TObject);
begin
    Memo1.Clear;
end;

end.
