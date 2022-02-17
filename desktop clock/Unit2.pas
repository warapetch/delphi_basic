unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Menus,
  Vcl.ComCtrls;

type
  TFrmMainSmall = class(TForm)
    Timer1: TTimer;
    pnlDate: TPanel;
    lblDayName: TLabel;
    TrayIcon1: TTrayIcon;
    ColorDialog1: TColorDialog;
    PopupMenu2: TPopupMenu;
    MenuItem_CBackground: TMenuItem;
    MenuItem_CDate: TMenuItem;
    MenuItem_CTime: TMenuItem;
    N1: TMenuItem;
    MenuItem_SaveConfig: TMenuItem;
    N2: TMenuItem;
    MenuItem_Close2: TMenuItem;
    MenuItem_Alpha: TMenuItem;
    TrackBar1: TTrackBar;
    lblTime: TLabel;
    lblDate: TLabel;
    ChangeColorBackgroundTime1: TMenuItem;
    ChangeColorDayName1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblDateMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure MenuItem_CBackgroundClick(Sender: TObject);
    procedure MenuItem_CDateClick(Sender: TObject);
    procedure MenuItem_CTimeClick(Sender: TObject);
    procedure MenuItem_SaveConfigClick(Sender: TObject);
    procedure MenuItem_Close2Click(Sender: TObject);
    procedure MenuItem_AlphaClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure ChangeColorBackgroundTime1Click(Sender: TObject);
    procedure ChangeColorDayName1Click(Sender: TObject);
  private
    { Private declarations }
     procedure WMNCHitTest(var Msg: TWMNCHitTest) ; message WM_NCHitTest;
    function SetThaiDate: String;
    procedure SetThaiDayName;
    function InvertColor(const Color: TColor): TColor;
    procedure SaveConfig;
    procedure LoadConfig;
  public
    { Public declarations }
  end;

var
  FrmMainSmall: TFrmMainSmall;

implementation

{$R *.dfm}
uses System.IniFiles;

function TFrmMainSmall.InvertColor(const Color: TColor): TColor;
begin
    result := TColor(RGB(255 - GetRValue(Color),
                         255 - GetGValue(Color),
                         255 - GetBValue(Color)));
end;

procedure TFrmMainSmall.MenuItem_AlphaClick(Sender: TObject);
begin
    TrackBar1.Visible := NOT TrackBar1.Visible;
end;

procedure TFrmMainSmall.MenuItem_CBackgroundClick(Sender: TObject);
begin
    if ColorDialog1.Execute() then
       begin
          Self.Color := ColorDialog1.Color;

          lblTime.Color      := ColorDialog1.Color;
          lblTime.Font.Color := InvertColor(ColorDialog1.Color);
       end;
end;

procedure TFrmMainSmall.MenuItem_CDateClick(Sender: TObject);
begin
    if ColorDialog1.Execute() then
       begin
          lblDate.Font.Color := ColorDialog1.Color;
       end;
end;

procedure TFrmMainSmall.MenuItem_Close2Click(Sender: TObject);
begin
    Close;
end;

procedure TFrmMainSmall.MenuItem_CTimeClick(Sender: TObject);
begin
    if ColorDialog1.Execute() then
       begin
          lblTime.Font.Color := ColorDialog1.Color;
       end;
end;

procedure TFrmMainSmall.MenuItem_SaveConfigClick(Sender: TObject);
begin
    TrackBar1.Visible := False;

    SaveConfig;
end;

procedure TFrmMainSmall.LoadConfig;
var mConfig : TMemIniFile;   // System.IniFiles
begin
    mConfig := TMemIniFile.Create('desktop_clock.ini');
    lblDate.Font.Color := StringToColor(mConfig.ReadString('colors','date','clBlack'));
    lblTime.Font.Color := StringToColor(mConfig.ReadString('colors','time','$00804000'));
    lblDayName.Font.Color:= StringToColor(mConfig.ReadString('colors','dayname','clBlack'));
    Self.Color         := StringToColor(mConfig.ReadString('colors','background','clWhite'));
    lblDate.Color      := StringToColor(mConfig.ReadString('colors','background_date','clyellow'));
    lblTime.Color      := StringToColor(mConfig.ReadString('colors','background_time','clWhite'));
    TrackBar1.Position  := StrToInt(mConfig.ReadString('colors','alpha','190'));
    // Position
    mConfig.Free;

    self.AlphaBlendValue := TrackBar1.Position;
end;

procedure TFrmMainSmall.SaveConfig;
var mConfig : TMemIniFile;   // System.IniFiles
begin
    mConfig := TMemIniFile.Create('desktop_clock.ini');
    mConfig.WriteString('colors','date',ColorToString(lblDate.Font.Color));
    mConfig.WriteString('colors','time',ColorToString(lblTime.Font.Color));
    mConfig.WriteString('colors','dayname',ColorToString(lblDayName.Font.Color));
    mConfig.WriteString('colors','background',ColorToString(Self.Color));
    mConfig.WriteString('colors','background_date',ColorToString(lblDate.Color));
    mConfig.WriteString('colors','background_time',ColorToString(lblTime.Color));
    mConfig.WriteString('colors','alpha',IntToStr(TrackBar1.Position));
    // Position
    mConfig.UpdateFile; // Save to File
    mConfig.Free;
end;

procedure TFrmMainSmall.ChangeColorBackgroundTime1Click(Sender: TObject);
begin
    if ColorDialog1.Execute() then
       begin
          //Self.Color := ColorDialog1.Color;

          lblDate.Color := ColorDialog1.Color;
          lblDate.Font.Color := InvertColor(ColorDialog1.Color);
       end;
end;

procedure TFrmMainSmall.ChangeColorDayName1Click(Sender: TObject);
begin
    if ColorDialog1.Execute() then
       begin
          lblDayName.Font.Color := ColorDialog1.Color;
       end;
end;

procedure TFrmMainSmall.FormCreate(Sender: TObject);
begin
    LoadConfig;

    //#1 Color Transparent
    //Self.TransparentColor := True;
   // Self.TransparentColorValue := clWhite;

   // OR
   // #2 Form Transparent
   Self.AlphaBlend := True;
   self.AlphaBlendValue := 190; // 1-255

end;

procedure TFrmMainSmall.FormShow(Sender: TObject);
begin
    // Set Position is Right side
    Left := Screen.Width - (Self.Width + 10);

    // Hide Icon on Taskbar
    ShowWindow(Application.Handle, SW_HIDE);
end;

function TFrmMainSmall.SetThaiDate : String;
var iYear : Integer;
    sDM : String;
begin
    iYear := StrToInt(FormatDateTime('YYYY',DATE))+543;
    sDM := FormatDateTime('DD/MM/',DATE);

    Result := sDM+IntToStr(iYear);
end;

procedure TFrmMainSmall.SetThaiDayName;
var sDayName : String;
    iDayOfWeek : Smallint;
begin
    iDayOfWeek := DayOfWeek(DATE);
    sDayName := FormatDateTime('DDDD',DATE);
    lblDayName.Caption := ' '+sDayName+' ';

    // 1 = Sunday  , Monday , Tuesday , Wednesday , Thursday , Friday ,
    // 7 = Saturday
    case iDayOfWeek of
       1 : pnlDate.Color := clRed;
       2 : pnlDate.Color := clYellow;
       3 : pnlDate.Color := $00C080FF;
       4 : pnlDate.Color := $003CEC00;
       5 : pnlDate.Color := $004080FF;
       6 : pnlDate.Color := $00FEEB01;
       7 : pnlDate.Color := clPurple;
    end;

    pnlDate.Update;

//    lblDayName.Font.Color := InvertColor( pnlDate.Color);
//    lblDayName.Update;
end;

procedure TFrmMainSmall.Timer1Timer(Sender: TObject);
begin
    SetThaiDayName;

    lblDate.Caption := SetThaiDate;

    lblTime.Caption := FormatDateTime('HH:NN:SS',TIME);
end;

procedure TFrmMainSmall.TrackBar1Change(Sender: TObject);
begin
   self.AlphaBlendValue := TrackBar1.Position;
end;

procedure TFrmMainSmall.TrayIcon1DblClick(Sender: TObject);
begin
    Self.Show;
end;

procedure TFrmMainSmall.lblDateMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const sc_DragMove = $F012;
begin
   // send message to Windows , Allow Move this form on Mouse-Drag
   ReleaseCapture;
   Perform( wm_SysCommand, sc_DragMove, 0 );
end;

procedure TFrmMainSmall.WMNCHitTest(var Msg: TWMNCHitTest);
begin
    // Mouse-Drag at lblTime and form can Move
    // Drag me it say drag form.caption
    inherited;

    if Msg.Result = htClient then
        Msg.Result := htCaption;
end;

end.
