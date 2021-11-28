unit UMas_Student;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , UMas_Template, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, UTemplate_Base;

type
  TFrmMas_Student = class(TFrmTemplate_Base)
    pnlToolbar: TPanel;
    btnData_Add: TBitBtn;
    btnData_Edit: TBitBtn;
    btnData_Delete: TBitBtn;
    dbgMas_Student: TDBGrid;
    dsqryMas_Student: TDataSource;
    qryMas_Student: TFDQuery;
    procedure btnData_AddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnData_EditClick(Sender: TObject);
    procedure btnData_DeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMas_Student: TFrmMas_Student;

implementation

{$R *.dfm}

uses UMas_Student_Add, UDMMain;

procedure TFrmMas_Student.btnData_DeleteClick(Sender: TObject);
begin
    if qryMas_Student.RecordCount = 0 then Exit;

    if MessageDlg('ยืนยันการลบข้อมูลนักเรียน ?'#13#10+
        qryMas_Student.FieldByName('st_name').AsString+' '+
        qryMas_Student.FieldByName('st_surname').AsString+#13#10+
        '[Yes] = ลบข้อมูล '#13#10+
        '[No] = ไม่ลบ ',
        TMsgDlgType.mtConfirmation,[mbYes,mbNo],0) = mrYES then
        qryMas_Student.Delete;
end;

procedure TFrmMas_Student.btnData_EditClick(Sender: TObject);
begin
    if qryMas_Student.RecordCount = 0 then Exit;

    qryMas_Student.Edit;

    FrmMas_Student_Add := TFrmMas_Student_Add.Create(NIL);
    //date 6411-28 off
//    FrmMas_Student_Add.DataState := 'แก้ไขข้อมูล';
    FrmMas_Student_Add.dsData.DataSet := qryMas_Student;
    if FrmMas_Student_Add.Showmodal = mrOK then
       qryMas_Student.Refresh;
    FreeAndNil(FrmMas_Student_Add);

end;

procedure TFrmMas_Student.btnData_AddClick(Sender: TObject);
begin
    qryMas_Student.Append;
    // qryMas_Student.State > dsInsert

    FrmMas_Student_Add := TFrmMas_Student_Add.Create(NIL);
    //date 6411-28 off
    //FrmMas_Student_Add.DataState := 'เพิ่มข้อมูล';
    FrmMas_Student_Add.dsData.DataSet := qryMas_Student;
    if FrmMas_Student_Add.Showmodal = mrOK then
       qryMas_Student.Refresh;
    FreeAndNil(FrmMas_Student_Add);

end;

procedure TFrmMas_Student.FormShow(Sender: TObject);
begin
  inherited;

    // Open Dataset
    qryMas_Student.Open;
end;

end.
