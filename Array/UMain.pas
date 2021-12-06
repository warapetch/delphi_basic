unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids;

type
  TFrmMain = class(TForm)
    mmLog: TMemo;
    btnStatic: TBitBtn;
    StringGrid1: TStringGrid;
    btnDynamic: TBitBtn;
    btnStatic2: TBitBtn;
    procedure btnStaticClick(Sender: TObject);
    procedure btnDynamicClick(Sender: TObject);
    procedure btnStatic2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  Fruit1 : Array [1..5] of String = ('แอปเปิ้ล','มะละกอ','กล้วย','ส้ม','');
implementation

{$R *.dfm}

procedure TFrmMain.btnStatic2Click(Sender: TObject);
var
    // Colume , Row
    Fruit2 : Array [0..4,0..1] of String; // Static = Fixed
    I,iCol,iRow : Integer;
begin
    Fruit2[0,0] := 'แอปเปิ้ล';
    Fruit2[1,0] := 'มะละกอ';
    Fruit2[2,0] := 'กล้วย';
    Fruit2[3,0] := 'ส้ม';
    Fruit2[4,0] := '-';

    Fruit2[0,1] := 'Apple';
    Fruit2[1,1] := 'Papaya';
    Fruit2[2,1] := 'Banana';
    Fruit2[3,1] := 'Orange';
    Fruit2[4,1] := '-';


	StringGrid1.ColCount := 6;
	StringGrid1.RowCount := Length(Fruit1)+Length(Fruit2)+2; // + Line space

    // Set Title Grid
    iRow := 0;
	StringGrid1.Cells[0,iRow] := '0';
	StringGrid1.Cells[1,iRow] := '1';
	StringGrid1.Cells[2,iRow] := '2';
	StringGrid1.Cells[3,iRow] := '3';
	StringGrid1.Cells[4,iRow] := '4';
	StringGrid1.Cells[5,iRow] := '5';

    // Memo
    mmLog.Clear;
    mmLog.Lines.Add('Array type "Static #2D"');

    iRow := 1;

    mmLog.Lines.Add('-----------------');
    mmLog.Lines.Add('Fruit2 = '+ IntToStr( Length(Fruit2) ) );
    for I := 0 to Length(Fruit2)-1 do
        begin
           mmLog.Lines.Add('Fruit2['+IntTostr(I)+'] ='+Fruit2[I,0]);
           mmLog.Lines.Add('Fruit2['+IntTostr(I)+'] ='+Fruit2[I,1]);

           iCol := I;
	   	   StringGrid1.Cells[iCol,1] := Fruit2[I,0];
	   	   StringGrid1.Cells[iCol,2] := Fruit2[I,1];
        end;


end;

procedure TFrmMain.btnDynamicClick(Sender: TObject);
var
    Fruit1 : Array of String; // Dynamic Index Start 0
    Fruit2 : Array of String; // Dynamic Index Start 0
    I,iCol,iRow : Integer;
begin
    SetLength(Fruit1,5);
    Fruit1[0] := 'แอปเปิ้ล';
    Fruit1[1] := 'มะละกอ';
    Fruit1[2] := 'กล้วย';
    Fruit1[3] := 'ส้ม';
    Fruit1[4] := '-';

    SetLength(Fruit2,5);
    Fruit2[0] := 'แอปเปิ้ล';
    Fruit2[1] := 'มะละกอ';
    Fruit2[2] := 'กล้วย';
    Fruit2[3] := 'ส้ม';
    Fruit2[4] := '-';


	StringGrid1.ColCount := 6;
	StringGrid1.RowCount := Length(Fruit1)+Length(Fruit2)+2; // + Line space

    // Set Title Grid
    iRow := 0;
	StringGrid1.Cells[0,iRow] := '0';
	StringGrid1.Cells[1,iRow] := '1';
	StringGrid1.Cells[2,iRow] := '2';
	StringGrid1.Cells[3,iRow] := '3';
	StringGrid1.Cells[4,iRow] := '4';
	StringGrid1.Cells[5,iRow] := '5';

	StringGrid1.Cells[5,1] := '';

    // Memo
    mmLog.Clear;
    mmLog.Lines.Add('Array type "Dynamic"');
    mmLog.Lines.Add('Fruit1 = '+ IntToStr( Length(Fruit1) ) );

    iRow := 1;
    for I := 0 to Length(Fruit1)-1 do
        begin
           mmLog.Lines.Add('Fruit1['+IntTostr(I)+'] ='+Fruit1[I]);

           // Cells [Column , Row] := Value;
           iCol := I;
           // Set Value in Cell
           StringGrid1.Cells[iCol,iRow] := Fruit1[I];
        end;

    iRow := 2;

    mmLog.Lines.Add('-----------------');
    mmLog.Lines.Add('Fruit2 = '+ IntToStr( Length(Fruit2) ) );
    for I := 0 to Length(Fruit2)-1 do
        begin
           mmLog.Lines.Add('Fruit2['+IntTostr(I)+'] ='+Fruit2[I]);
           iCol := I;
	   	   StringGrid1.Cells[iCol,iRow] := Fruit2[I];
        end;


end;

procedure TFrmMain.btnStaticClick(Sender: TObject);
var
//    Fruit1 : Array [1..5] of String; // Static = Fixed

    //Fruit1 : Array [1..5] of String = ('แอปเปิ้ล','มะละกอ','กล้วย','ส้ม','');
    Fruit2 : Array [0..4] of String; // Static = Fixed

    I,iCol,iRow : Integer;
begin
	// Error !! ทำแบบนี้ไม่ได้
    //Fruit1 := ['แอปเปิ้ล','มะละกอ','กล้วย','ส้ม',''];
    // Fruit1[0] := Error !!
    Fruit1[1] := 'แอปเปิ้ล';
    Fruit1[2] := 'มะละกอ';
    Fruit1[3] := 'กล้วย';
    Fruit1[4] := 'ส้ม';
    Fruit1[5] := '-';

    Fruit2[0] := 'แอปเปิ้ล';
    Fruit2[1] := 'มะละกอ';
    Fruit2[2] := 'กล้วย';
    Fruit2[3] := 'ส้ม';
    Fruit2[4] := '-';


	StringGrid1.ColCount := 6;
	StringGrid1.RowCount := Length(Fruit1)+Length(Fruit2)+2; // + Line space

    // Set Title Grid
    iRow := 0;
	StringGrid1.Cells[0,iRow] := '0';
	StringGrid1.Cells[1,iRow] := '1';
	StringGrid1.Cells[2,iRow] := '2';
	StringGrid1.Cells[3,iRow] := '3';
	StringGrid1.Cells[4,iRow] := '4';
	StringGrid1.Cells[5,iRow] := '5';

    // Memo
    mmLog.Clear;
    mmLog.Lines.Add('Array type "Static"');
    mmLog.Lines.Add('Fruit1 = '+ IntToStr( Length(Fruit1) ) );

    iRow := 1;
    for I := 1 to Length(Fruit1) do
        begin
           mmLog.Lines.Add('Fruit1['+IntTostr(I)+'] ='+Fruit1[I]);

           // Cells [Column , Row] := Value;
           iCol := I;
           // Set Value in Cell
           StringGrid1.Cells[iCol,iRow] := Fruit1[I];
        end;


    iRow := 2;

    mmLog.Lines.Add('-----------------');
    mmLog.Lines.Add('Fruit2 = '+ IntToStr( Length(Fruit2) ) );
    for I := 0 to Length(Fruit2)-1 do
        begin
           mmLog.Lines.Add('Fruit2['+IntTostr(I)+'] ='+Fruit2[I]);
           iCol := I;
	   	   StringGrid1.Cells[iCol,iRow] := Fruit2[I];
        end;

end;

end.
