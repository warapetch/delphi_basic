unit UMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmMainMenu = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    btnMasStudent: TBitBtn;
    btnTransRecords: TBitBtn;
    btnInquiry: TBitBtn;
    btnClose: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnMasStudentClick(Sender: TObject);
    procedure btnTransRecordsClick(Sender: TObject);
    procedure btnInquiryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMainMenu: TFrmMainMenu;

implementation

{$R *.dfm}

uses UMas_Student, UTrans_Records, UDlg_Search_Student;

procedure TFrmMainMenu.btnCloseClick(Sender: TObject);
begin
    if MessageDlg('ยืนยันการปิดโปรแกรม ?'#13#10+
        '[Yes] = ปิดโปรแกรม '#13#10+
        '[No] = ทำงานต่อไป' ,
        TMsgDlgType.mtConfirmation,
        [mbYes,mbNo],0) = mrYES then
        Close;
end;

procedure TFrmMainMenu.btnInquiryClick(Sender: TObject);
begin
    FrmDlg_Search_Student := TFrmDlg_Search_Student.Create(NIL);
    FrmDlg_Search_Student.Showmodal;
    FreeAndNil(FrmDlg_Search_Student);
end;

procedure TFrmMainMenu.btnMasStudentClick(Sender: TObject);
begin
    FrmMas_Student := TFrmMas_Student.Create(NIL);
//    FrmMas_Student.Caption := 'ถูกเรียกจากเมนเมนู';
    FrmMas_Student.Showmodal;
    FreeAndNil(FrmMas_Student);
end;

procedure TFrmMainMenu.btnTransRecordsClick(Sender: TObject);
begin
    FrmTrans_Records := TFrmTrans_Records.Create(NIL);
    FrmTrans_Records.Showmodal;
    FreeAndNil(FrmTrans_Records);
end;

end.
