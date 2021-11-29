unit UTrans_Records;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , UTemplate_Base, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFrmTrans_Records = class(TFrmTemplate_Base)
    pnlTerm: TPanel;
    lblcapTerm: TLabel;
    cbbClass: TComboBox;
    edtTermNo: TEdit;
    btnSetWorkTerm: TBitBtn;
    pnlToolbar: TPanel;
    btnData_Add: TBitBtn;
    btnData_Edit: TBitBtn;
    btnData_Delete: TBitBtn;
    dbgMas_Student: TDBGrid;
    qryTrans_Records: TFDQuery;
    dsqryTrans_Records: TDataSource;
    procedure btnSetWorkTermClick(Sender: TObject);
    procedure btnData_AddClick(Sender: TObject);
    procedure btnData_EditClick(Sender: TObject);
    procedure btnData_DeleteClick(Sender: TObject);
    procedure edtTermNoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTrans_Records: TFrmTrans_Records;

implementation

{$R *.dfm}

uses UDlg_Search_Student, UTrans_Records_Add;

procedure TFrmTrans_Records.btnData_AddClick(Sender: TObject);
var sStudentCode : String;
begin

    if (cbbClass.Text = '') or (Trim(edtTermNo.Text) = '') then
       begin
           ShowMessage('กำหนดชั้นเรียน และ เทอม ก่อน !!');
           Exit;
       end;

    // 1 Show Search Student > Found (ST_CODE)
    //---------------------------------------
    sStudentCode := '';
    FrmDlg_Search_Student := TFrmDlg_Search_Student.Create(NIL);
    FrmDlg_Search_Student.StudentClass := cbbClass.Text;
    if FrmDlg_Search_Student.Showmodal = mrOK then
       begin
          //sStudentCode := FrmDlg_Search_Student.Select_StudentCode;
       end;
    FreeAndNil(FrmDlg_Search_Student);
    //---------------------------------------


    if (sStudentCode <> '') then
       begin
          // Check have Student Code ?
          if qryTrans_Records.Locate('st_code',sStudentCode,[]) then
             begin
                qryTrans_Records.Edit;
             end
          else
          begin
              // 2 Append Dataset
              qryTrans_Records.Append;
              qryTrans_Records['st_code']   := sStudentCode;
              qryTrans_Records['st_class']  := cbbClass.Text;
              qryTrans_Records['st_termno'] := edtTermNo.Text;
          end;

          // 3 Show Trans_Records_Add
          FrmTrans_Records_Add := TFrmTrans_Records_Add.Create(NIL);
          FrmTrans_Records_Add.StudentCode    := sStudentCode;
          FrmTrans_Records_Add.dsData.DataSet := qryTrans_Records;
          if FrmTrans_Records_Add.Showmodal = mrOK then
             qryTrans_Records.Refresh;
          FreeAndNil(FrmTrans_Records_Add);
       end;
end;

procedure TFrmTrans_Records.btnData_DeleteClick(Sender: TObject);
begin
    if qryTrans_Records.RecordCount = 0 then Exit;

    if MessageDlg('ยืนยันการลบข้อมูลผลการเรียน ?'#13#10+
        qryTrans_Records.FieldByName('st_fullname').AsString+#13#10+
        '[Yes] = ลบข้อมูล '#13#10+
        '[No] = ไม่ลบ ',
        TMsgDlgType.mtConfirmation,[mbYes,mbNo],0) = mrYES then
        qryTrans_Records.Delete;
end;

procedure TFrmTrans_Records.btnData_EditClick(Sender: TObject);
begin
    if qryTrans_Records.RecordCount = 0 then Exit;

    qryTrans_Records.Edit;

    FrmTrans_Records_Add := TFrmTrans_Records_Add.Create(NIL);
    FrmTrans_Records_Add.StudentCode    := qryTrans_Records.FieldByName('st_code').AsString;
    FrmTrans_Records_Add.dsData.DataSet := qryTrans_Records;
    if FrmTrans_Records_Add.Showmodal = mrOK then
       qryTrans_Records.Refresh;
    FreeAndNil(FrmTrans_Records_Add);
end;

procedure TFrmTrans_Records.btnSetWorkTermClick(Sender: TObject);
begin
//  inherited;  comment or delete this word

    if (cbbClass.itemindex = -1) then
        begin
            ShowMessage('เลือกชั้นเรียนก่อน !!');
            Exit;
        end;

    if (Trim(edtTermNo.text) = '') then
        begin
            ShowMessage('กำหนดเทอมก่อน !!');
            Exit;
        end;

    qryTrans_Records.Close;
    qryTrans_Records.ParamByName('st_class').AsString  := cbbClass.Text;
    qryTrans_Records.ParamByName('st_termno').AsString := edtTermNo.Text;
    qryTrans_Records.Open;
end;

procedure TFrmTrans_Records.edtTermNoKeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #13) and (Trim(edtTermNo.Text) <> '') then
        btnSetWorkTermClick(edtTermNo);
end;

end.
