unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ValEdit, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, System.ImageList, Vcl.ImgList,
  Vcl.CheckLst, Vcl.ButtonGroup;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    MaskEdit1: TMaskEdit;
    LabeledEdit1: TLabeledEdit;
    ButtonedEdit1: TButtonedEdit;
    ValueListEditor1: TValueListEditor;
    ImageList1: TImageList;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonedEdit1LeftButtonClick(Sender: TObject);
    procedure ButtonedEdit1RightButtonClick(Sender: TObject);
    procedure ValueListEditor1GetEditMask(Sender: TObject; ACol, ARow: Integer;
      var Value: string);
    procedure ValueListEditor1GetPickList(Sender: TObject;
      const KeyName: string; Values: TStrings);
    procedure ValueListEditor1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ValueListEditor1EditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.ButtonedEdit1LeftButtonClick(Sender: TObject);
begin
        ShowMessage('Left Click');
end;

procedure TForm2.ButtonedEdit1RightButtonClick(Sender: TObject);
begin
        ShowMessage('Right Click');
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
                     // ModalResult == mrYES
    //if MessageDlg() = mrYES then

end;

procedure TForm2.ValueListEditor1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
    if (ARow = 2) and (gdFocused in State) then
       begin
         //   TEditStyle =  (esSimple, esEllipsis, esPickList);
         ValueListEditor1.ItemProps['ชื่อ'].EditStyle := TEditStyle.esEllipsis;
       end;
end;

procedure TForm2.ValueListEditor1EditButtonClick(Sender: TObject);
begin
    ShowMessage('Show ไดอะลอก อะไรดี ?')
end;

procedure TForm2.ValueListEditor1GetEditMask(Sender: TObject; ACol,
  ARow: Integer; var Value: string);
begin
    if ARow = 3 then
       Value := '99'
    else
    if ARow = 5 then
       Value := '99/99/9999';

end;

procedure TForm2.ValueListEditor1GetPickList(Sender: TObject;
  const KeyName: string; Values: TStrings);
begin
    if KeyName = 'เพศ' then
       begin
          Values.Clear;
          Values.Add('ไม่ระบุ');
          Values.Add('ชาย');
          Values.Add('หญิง');
       end;

end;

end.



เพิ่มเติมความรู้
https://titanwolf.org/Network/Articles/Article?AID=008c54d6-6b36-4b1a-a787-d992c6591d58

https://stackoverflow.com/questions/18856438/run-time-manipulation-of-valuelisteditor-rows-and-values-in-delphi
procedure TfrmDoSomething.FormCreate(Sender: TObject);
var
  I: integer;
  FirstItemProp, SecondItemProp, ThirdItemProp: TItemProp;
begin
  //add first row
  ValueListEditor1.InsertRow('Do something?', '', True);
  FirstItemProp := TItemProp.Create(ValueListEditor1);
  FirstItemProp.PickList.Add('Yes');
  FirstItemProp.PickList.Add('No');
  ValueListEditor1.ItemProps[0] := FirstItemProp;


//now add the subsequent two rows only if the value for Row#1 is Yes
  if (ValueListEditor1.ItemProps[0] = FirstItemProp.PickList[0]) then
    begin
      ValueListEditor1.InsertRow('Number of times', '', True);
      SecondItemProp := TItemProp.Create(ValueListEditor1);
      SecondItemProp.PickList.Add('100');
      SecondItemProp.PickList.Add('500');
      SecondItemProp.PickList.Add('1000');
      ValueListEditor1.ItemProps[1] := SecondItemProp;

      ValueListEditor1.InsertRow('Summary?', '', True);
      ThirdItemProp := TItemProp.Create(ValueListEditor1);
      ThirdItemProp.PickList.Add('Yes');
      ThirdItemProp.PickList.Add('No');
      ValueListEditor1.ItemProps[2] := ThirdItemProp;
    end;

end;

procedure TfrmCBDoSomething.FormCreate(Sender: TObject);
var
  Label1: TLabel;
begin
  Label1 := TLabel.Create(Self);
  Label1.Align := alLeft;
  CB1 := TComboBox.Create(Self);
  CB1.Parent := Self;
  CB1.Align := alRight;

  Label1.Caption := 'Do Something?';
  Label1.Parent := Self;
  CB1.AddItem('Yes', nil);
  CB1.AddItem('No', nil);
end;


procedure TfrmCBTry.CB1OnChange(Sender: TObject);

begin
  if (CB1.Text = 'Yes') then ShowMessage('Got it!!');
  if (CB1.ItemIndex = 0) then ShowMessage('Got it!!');
  if (Cb1.Items.IndexOf('Yes') = 0) then ShowMessage('Got it!!')
end;
