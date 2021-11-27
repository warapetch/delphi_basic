unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.Comp.Client, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.VCLUI.Wait, FireDAC.Phys.SQLiteWrapper.Stat, Data.DB, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Comp.UI, FireDAC.Comp.DataSet, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    tbMas_Student: TFDTable;
    qryTrans_Records: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    dsMas_Student: TDataSource;
    dsQryTrans_Records: TDataSource;
    DBGrid1: TDBGrid;
    dbgStudent: TDBGrid;
    tbMas_Studentst_code: TStringField;
    tbMas_Studentst_gender: TStringField;
    tbMas_Studentst_image: TBlobField;
    tbMas_Studentst_fullname: TStringField;
    tbMas_Studentst_name: TStringField;
    tbMas_Studentst_surname: TStringField;
    DBNavigator1: TDBNavigator;
    mmLog: TMemo;
    edtFilter: TEdit;
    btnFilter: TButton;
    edtLocate: TEdit;
    btnLocate: TButton;
    btnBM_Get: TButton;
    btnBM_Goto: TButton;
    btnBM_Free: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Button1: TButton;
    tbMas_Studentst_money1: TFloatField;
    tbMas_Studentst_money2: TFloatField;
    tbMas_Studentst_sum_money: TAggregateField;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    tbMas_Studentst_sum_money2: TAggregateField;
    Button2: TButton;
    procedure tbMas_StudentCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure dsMas_StudentStateChange(Sender: TObject);
    procedure dsMas_StudentDataChange(Sender: TObject; Field: TField);
    procedure btnFilterClick(Sender: TObject);
    procedure btnLocateClick(Sender: TObject);
    procedure tbMas_StudentFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure btnBM_GetClick(Sender: TObject);
    procedure btnBM_GotoClick(Sender: TObject);
    procedure btnBM_FreeClick(Sender: TObject);
    procedure dsMas_StudentUpdateData(Sender: TObject);
    procedure tbMas_StudentNewRecord(DataSet: TDataSet);
    procedure tbMas_StudentBeforePost(DataSet: TDataSet);
    procedure tbMas_StudentBeforeInsert(DataSet: TDataSet);
    procedure tbMas_StudentAfterScroll(DataSet: TDataSet);
    procedure tbMas_StudentBeforeScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure tbMas_StudentAfterEdit(DataSet: TDataSet);
    procedure tbMas_StudentAfterInsert(DataSet: TDataSet);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    bmTemp : TBookmark;
    bmArr : Array of TBookmark;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnBM_GetClick(Sender: TObject);
var I : Integer;
begin
    mmLog.Lines.Add('BM-Count = '+IntToStr(dbgStudent.SelectedRows.Count));

    bmTemp := dbgStudent.Datasource.Dataset.GetBookmark;;
end;

procedure TForm1.btnFilterClick(Sender: TObject);
begin
    tbMas_Student.Filtered := False;
    tbMas_Student.Filter   := edtFilter.Text;
    tbMas_Student.Filtered := True;
end;

procedure TForm1.btnLocateClick(Sender: TObject);
begin
    // KeyFields , Values , Option
    if tbMas_Student.Locate('st_code',edtLocate.Text,[loCaseInsensitive,loPartialKey]) then
       begin
           mmLog.Lines.Add('Found');
       end
    else
    mmLog.Lines.Add('Not Found !!');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
    tbMas_Student.DisableControls;
    tbMas_Student.First;
    tbMas_Student.Found;
    While Not tbMas_Student.Eof do
        begin


           tbMas_Student.Next;
        end;

    tbMas_Student.EnableControls;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    tbMas_Student.FindNext;

end;

procedure TForm1.btnBM_GotoClick(Sender: TObject);
var i : Integer;
begin
//  1 BookMark
  tbMas_Student.GotoBookmark(bmTemp);

// Multi-BookMark

//    mmLog.Lines.Add('BM-Count = '+IntToStr(dbgStudent.SelectedRows.Count));
//    if dbgStudent.SelectedRows.Count = 1  then
//      tbMas_Student.GoToBookmark( bmTemp )
//    else
//    For i := 0 to dbgStudent.SelectedRows.Count -1 do
//        begin
//           //tbMas_Student.Bookmark := TBookmark( dbgStudent.SelectedRows[i] );
//           //bmTemp := tbMas_Student.GetBookmark;
//           tbMas_Student.GoToBookmark( TBookmark( dbgStudent.SelectedRows[i] ) ) ;
//        end;
end;

procedure TForm1.btnBM_FreeClick(Sender: TObject);
begin
    tbMas_Student.FreeBookmark(bmTemp);
    bmTemp := NIL;
end;

procedure TForm1.dsMas_StudentDataChange(Sender: TObject; Field: TField);
begin
    mmLog.Lines.Add('RecNo = '+IntToStr(dsMas_Student.DataSet.RecNo));

{    TDatabase
        TDataset
            TField
}

    mmLog.Lines.Add('OnDataChange');
    // Reference to Field > Value
//    mmLog.Lines.Add('Code = '+tbMas_Student.FieldByName('st_code').Value);
//    mmLog.Lines.Add('Code = '+tbMas_Student.FieldByName('st_code').AsString);
//    mmLog.Lines.Add('Code = '+tbMas_Student['st_code']);
//
//    mmLog.Lines.Add('? = '+tbMas_Student.Fields.Fields[0].Value);


end;

procedure TForm1.dsMas_StudentStateChange(Sender: TObject);
var sState : String;
begin
    Case dsMas_Student.State of
        dsInactive : sState := 'เทเบิลปิด';
        dsBrowse : sState := 'เทเบิลเปิดแล้ว';
        dsEdit   : sState := 'กำลังแก้ไข';
        dsInsert : sState := 'กำลังเพิ่ม';
        dsCalcFields : sState := 'คำนวณ';
        dsFilter : sState := 'ฟิลเตอร์';
    End;

    mmLog.Lines.Add('State = '+sState);
end;

procedure TForm1.dsMas_StudentUpdateData(Sender: TObject);
begin
    mmLog.Lines.Add('OnUpdateData');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//    qryMas_Student.Open(); // Method
//    qryMas_Student.Open; // Method
//    qryMas_Student.Active := True; // Property


    tbMas_Student.Open;
    mmLog.Lines.Add( 'RecordCount = '+IntToStr(tbMas_Student.RecordCount) );
//    tbMas_Student.Fields[1]
    Caption := FormatFloat('#,0',tbMas_Studentst_Money1.AsFloat);
end;

procedure TForm1.tbMas_StudentAfterEdit(DataSet: TDataSet);
begin
    if Dataset.Modified then
       mmLog.Lines.Add( 'AfterEdit = Dataset.Modified' );
end;

procedure TForm1.tbMas_StudentAfterInsert(DataSet: TDataSet);
begin
    if Dataset.Modified then
       mmLog.Lines.Add( 'AfterInsert = Dataset.Modified' );

end;

procedure TForm1.tbMas_StudentAfterScroll(DataSet: TDataSet);
begin
    mmLog.Lines.Add( 'AfterScroll' );
end;

procedure TForm1.tbMas_StudentBeforeInsert(DataSet: TDataSet);
begin
    // Master-Detail
end;

procedure TForm1.tbMas_StudentBeforePost(DataSet: TDataSet);
begin
    // DataSet[''] Modify-Date , Modify-By
    // DataSet['MODIFY_DATE'] := NOW;
    // DataSet['MODIFY_BY']   := userLogin.ID;
end;

procedure TForm1.tbMas_StudentBeforeScroll(DataSet: TDataSet);
begin
    mmLog.Lines.Add( 'BeforeScroll' );
end;

procedure TForm1.tbMas_StudentCalcFields(DataSet: TDataSet);
begin
     Dataset['st_fullname'] := Dataset['st_name'] +'  '+ Dataset['st_surname'];
end;

procedure TForm1.tbMas_StudentFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    Accept := (tbMas_Student.FieldByName('st_code').AsInteger > 640002);
//    Accept := (DataSet.FieldByName('st_code').AsInteger > 640002);
end;

procedure TForm1.tbMas_StudentNewRecord(DataSet: TDataSet);
begin
    // Initialize
    DataSet['st_code'] := '6400';

    // DataSet['CREATE_DATE'] := NOW;
    // DataSet['CREATE_BY']   := userLogin.ID;

end;

end.
