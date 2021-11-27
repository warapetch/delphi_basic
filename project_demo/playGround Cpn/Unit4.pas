unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.AppEvnts;

type
  TForm4 = class(TForm)
    CheckListBox1: TCheckListBox;
    BitBtn1: TBitBtn;
    Memo1: TMemo;
    btnCheckAll: TBitBtn;
    btnUnCheckAll: TBitBtn;
    ApplicationEvents1: TApplicationEvents;
    TrayIcon1: TTrayIcon;
    BalloonHint1: TBalloonHint;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCheckAllClick(Sender: TObject);
    procedure btnUnCheckAllClick(Sender: TObject);
    procedure ApplicationEvents1ActionExecute(Action: TBasicAction;
      var Handled: Boolean);
    procedure ApplicationEvents1ActionUpdate(Action: TBasicAction;
      var Handled: Boolean);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    function ApplicationEvents1Help(Command: Word; Data: NativeInt;
      var CallHelp: Boolean): Boolean;
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure ApplicationEvents1ModalBegin(Sender: TObject);
    procedure ApplicationEvents1ModalEnd(Sender: TObject);
    procedure ApplicationEvents1RemoteSessionChanged(Sender: TObject;
      var InRemoteSession);
    procedure ApplicationEvents1Restore(Sender: TObject);
    procedure ApplicationEvents1SettingChange(Sender: TObject; Flag: Integer;
      const Section: string; var Result: Integer);
    procedure ApplicationEvents1ShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure ApplicationEvents1ShowHint(var HintStr: string;
      var CanShow: Boolean; var HintInfo: THintInfo);
    procedure FormCreate(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure CheckListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.ApplicationEvents1ActionExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
      Memo1.Lines.Add('Action-Excute');
end;

procedure TForm4.ApplicationEvents1ActionUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
      Memo1.Lines.Add('Action-Update');
end;

procedure TForm4.ApplicationEvents1Activate(Sender: TObject);
begin
      Memo1.Lines.Add('Action-Activate');
end;

procedure TForm4.ApplicationEvents1Deactivate(Sender: TObject);
begin
      Memo1.Lines.Add('Action-DeActivate');
end;

procedure TForm4.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
      Memo1.Lines.Add('Action-Exception');
end;

function TForm4.ApplicationEvents1Help(Command: Word; Data: NativeInt;
  var CallHelp: Boolean): Boolean;
begin
      Memo1.Lines.Add('Action-Help');
end;

procedure TForm4.ApplicationEvents1Hint(Sender: TObject);
begin
      Memo1.Lines.Add('Action-Hint');
end;

procedure TForm4.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
   //   Memo1.Lines.Add('Action-Idle');
end;

procedure TForm4.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  //    Memo1.Lines.Add('Action-Message');
end;

procedure TForm4.ApplicationEvents1Minimize(Sender: TObject);
begin
      Memo1.Lines.Add('Action-Minimize');
end;

procedure TForm4.ApplicationEvents1ModalBegin(Sender: TObject);
begin
      Memo1.Lines.Add('Action-ModalBegin');
end;

procedure TForm4.ApplicationEvents1ModalEnd(Sender: TObject);
begin
      Memo1.Lines.Add('Action-ModalEnd');
end;

procedure TForm4.ApplicationEvents1RemoteSessionChanged(Sender: TObject;
  var InRemoteSession);
begin
      Memo1.Lines.Add('Action-RemoteSessionChanged');
end;

procedure TForm4.ApplicationEvents1Restore(Sender: TObject);
begin
      Memo1.Lines.Add('Action-Restore');
end;

procedure TForm4.ApplicationEvents1SettingChange(Sender: TObject; Flag: Integer;
  const Section: string; var Result: Integer);
begin
      Memo1.Lines.Add('Action-SettingChange');
end;

procedure TForm4.ApplicationEvents1ShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
      Memo1.Lines.Add('Action-ShortCut');
end;

procedure TForm4.ApplicationEvents1ShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
      Memo1.Lines.Add('Action-ShowHint');
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var I , iCheckCount: Integer;
    CheckArr : Array[0..4] of String;
begin
    CheckArr[0] := 'N';
    CheckArr[1] := 'N';
    CheckArr[2] := 'N';
    CheckArr[3] := 'N';
    CheckArr[4] := 'N';
    for I := 0 to CheckListBox1.Count-1 do
        begin
            if CheckListBox1.Checked[I] {= True} then
               begin
                  CheckArr[I] := 'Y';
                  Memo1.Lines.Add( CheckListBox1.Items[I] +'=Check');
               end;
        end;

    iCheckCount := 0;
    for I := 0 to 4 do
       begin
          if CheckArr[I] = 'Y' then
             iCheckCount := iCheckCount +1;
       end;

    Memo1.Lines.Add('Check = '+ IntToStr(iCheckCount));

end;

procedure TForm4.btnCheckAllClick(Sender: TObject);
begin
    CheckListBox1.CheckAll(TCheckBoxState.cbChecked)
end;

procedure TForm4.btnUnCheckAllClick(Sender: TObject);
begin
    CheckListBox1.CheckAll(TCheckBoxState.cbUnchecked)
end;

procedure TForm4.CheckListBox1Click(Sender: TObject);
begin
    Memo1.Lines.Add('Click');
end;

procedure TForm4.CheckListBox1ClickCheck(Sender: TObject);
begin
    Memo1.Lines.Add('Click-check ' + TCheckListBox(Sender).Items[TCheckListBox(Sender).ItemIndex]);
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
    CheckListBox1.Header[0] := true;
    TrayIcon1.Visible := True;
    Self.Hide();
    Self.WindowState := TWindowState.wsMinimized;
    TrayIcon1.ShowBalloonHint;
end;

procedure TForm4.TrayIcon1DblClick(Sender: TObject);
begin
    TrayIcon1.Visible := False;
    Self.Show();
    Self.WindowState := TWindowState.wsNormal;
end;

end.
