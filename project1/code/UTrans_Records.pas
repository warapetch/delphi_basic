unit UTrans_Records;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , UMas_Template, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFrmTrans_Records = class(TFrmMas_Template)
    pnlToolbar: TPanel;
    btnData_Add: TBitBtn;
    btnData_Edit: TBitBtn;
    btnData_Delete: TBitBtn;
    dbgMas_Student: TDBGrid;
    pnlTerm: TPanel;
    cbbClass: TComboBox;
    lblcapTerm: TLabel;
    edTermNo: TEdit;
    btnSetWorkTerm: TBitBtn;
    dsqryTrans_Rec: TDataSource;
    qryTrans_Rec: TFDQuery;
    procedure btnSetWorkTermClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnData_AddClick(Sender: TObject);
    procedure btnData_EditClick(Sender: TObject);
    procedure btnData_DeleteClick(Sender: TObject);
  private
    { Private declarations }
    sClass ,
    sTermNo : String;
  public
    { Public declarations }
  end;

var
  FrmTrans_Records: TFrmTrans_Records;

implementation

{$R *.dfm}

uses UDlg_Search_Student, UTrans_Records_Add;

procedure TFrmTrans_Records.btnData_AddClick(Sender: TObject);
var selectCode : String;
begin
    if (sClass = '') or (sTermNo = '') then
       begin
           ShowMessage('กำหนดชั้นเรียน และ เทอม ก่อน !!');
           Exit;
       end;


    // popup dialog student search

//    if ModalResult = mrOK then
//       next
    selectCode := '';
    FrmDlg_Search_Student := TFrmDlg_Search_Student.Create(NIL);
    if FrmDlg_Search_Student.Showmodal = mrOK then
       begin
          selectCode := FrmDlg_Search_Student.select_code;
       end;
    FreeAndNil(FrmDlg_Search_Student);

    if (selectCode <> '') then
       begin
          qryTrans_Rec.Append;
          qryTrans_Rec['st_code'] := selectCode;
          qryTrans_Rec['st_class'] := sClass;
          qryTrans_Rec['st_termno'] := sTermNo;

          FrmTrans_Records_Add := TFrmTrans_Records_Add.Create(NIL);
          FrmTrans_Records_Add.DataState := 'เพิ่มข้อมูล';
          FrmTrans_Records_Add.stClass  := sClass;
          FrmTrans_Records_Add.stTermNo := sTermNo;
          FrmTrans_Records_Add.stCode   := selectCode;
          FrmTrans_Records_Add.dsData.DataSet := qryTrans_Rec;
          if FrmTrans_Records_Add.Showmodal = mrOK then
             qryTrans_Rec.Refresh;
          FreeAndNil(FrmTrans_Records_Add);
       end;

end;

procedure TFrmTrans_Records.btnData_DeleteClick(Sender: TObject);
begin
    if qryTrans_Rec.RecordCount = 0 then Exit;

    if MessageDlg('ยืนยันการลบข้อมูลผลการเรียน ?'#13#10+
        qryTrans_Rec.FieldByName('st_fullname').AsString+#13#10+
        '[Yes] = ลบข้อมูล '#13#10+
        '[No] = ไม่ลบ ',
        TMsgDlgType.mtConfirmation,[mbYes,mbNo],0) = mrYES then
        qryTrans_Rec.Delete;
end;

procedure TFrmTrans_Records.btnData_EditClick(Sender: TObject);
begin
   if qryTrans_Rec.RecordCount = 0 then Exit;

    qryTrans_Rec.Edit;

    FrmTrans_Records_Add := TFrmTrans_Records_Add.Create(NIL);
    FrmTrans_Records_Add.DataState := 'แก้ไขข้อมูล';
    FrmTrans_Records_Add.dsData.DataSet := qryTrans_Rec;
    FrmTrans_Records_Add.stClass  := sClass;
    FrmTrans_Records_Add.stTermNo := sTermNo;
    FrmTrans_Records_Add.stCode   := qryTrans_Rec.FieldByName('st_code').AsString;
    if FrmTrans_Records_Add.Showmodal = mrOK then
       qryTrans_Rec.Refresh;
    FreeAndNil(FrmTrans_Records_Add);
end;

procedure TFrmTrans_Records.btnSetWorkTermClick(Sender: TObject);
begin
    if cbbClass.ItemIndex = -1 then
       begin
          Showmessage('เลือกชั้นเรียนก่อน !!');
          Exit;
       end;

    if edTermNo.text = '' then
       begin
          Showmessage('กำหนดเทอมก่อน !!');
          Exit;
       end;

    // set Work Term
    sClass  := cbbClass.Text;
    sTermNo := edTermNo.Text;

    // Open Dataset
    if qryTrans_Rec.State = dsBrowse then
       qryTrans_Rec.Close;

    qryTrans_Rec.ParamByName('st_class').AsString := cbbClass.Text;
    qryTrans_Rec.ParamByName('st_termno').AsString := edTermNo.Text;
    qryTrans_Rec.Open;

end;

procedure TFrmTrans_Records.FormCreate(Sender: TObject);
begin
  inherited;
    sClass  := '';
    sTermNo := '';

end;

end.
