unit UMainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TFrmMainMenu = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    PCMainMenu: TPageControl;
    TabMainMenu: TTabSheet;
    TabMenuQry: TTabSheet;
    btnMasStudent: TBitBtn;
    btnTransRecords: TBitBtn;
    btnInquiry: TBitBtn;
    btnClose: TBitBtn;
    btnQryStudent_Class: TBitBtn;
    btnQryResult_Top10: TBitBtn;
    btnQryResult_Grade: TBitBtn;
    btnBack: TBitBtn;
    lblHeader: TLabel;
    lblFooter: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnMasStudentClick(Sender: TObject);
    procedure btnTransRecordsClick(Sender: TObject);
    procedure btnInquiryClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnQryStudent_ClassClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnQryResult_GradeClick(Sender: TObject);
    procedure btnQryResult_Top10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMainMenu: TFrmMainMenu;

implementation

{$R *.dfm}

uses UMas_Student, UTrans_Records, UDlg_Search_Student, UQryMas_Student,
  UQryTrans_Result, UQryTrans_Result_Top10;

procedure TFrmMainMenu.btnBackClick(Sender: TObject);
begin
	PCMainMenu.ActivePage := TabMainMenu;
end;

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
	//PCMainMenu.ActivePageIndex := 1; // 0 = TabMainMenu , 1 = TabMenuQry
	PCMainMenu.ActivePage := TabMenuQry;
end;

procedure TFrmMainMenu.btnMasStudentClick(Sender: TObject);
begin
    FrmMas_Student := TFrmMas_Student.Create(NIL);
//    FrmMas_Student.Caption := 'ถูกเรียกจากเมนเมนู';
    FrmMas_Student.Showmodal;
    FreeAndNil(FrmMas_Student);
end;

procedure TFrmMainMenu.btnQryResult_GradeClick(Sender: TObject);
begin
    FrmQryTrans_Result := TFrmQryTrans_Result.Create(NIL);
    FrmQryTrans_Result.Showmodal;
    FreeAndNil(FrmQryTrans_Result);
end;

procedure TFrmMainMenu.btnQryResult_Top10Click(Sender: TObject);
begin
    FrmQryTrans_Result_Top10 := TFrmQryTrans_Result_Top10.Create(NIL);
    FrmQryTrans_Result_Top10.Showmodal;
    FreeAndNil(FrmQryTrans_Result_Top10);

end;

procedure TFrmMainMenu.btnQryStudent_ClassClick(Sender: TObject);
begin
    FrmQryMas_Student := TFrmQryMas_Student.Create(NIL);
    FrmQryMas_Student.Showmodal;
    FreeAndNil(FrmQryMas_Student);
end;

procedure TFrmMainMenu.btnTransRecordsClick(Sender: TObject);
begin
    FrmTrans_Records := TFrmTrans_Records.Create(NIL);
    FrmTrans_Records.Showmodal;
    FreeAndNil(FrmTrans_Records);
end;

procedure TFrmMainMenu.FormCreate(Sender: TObject);
begin
    TabMainMenu.TabVisible := False;
    TabMenuQry.TabVisible  := False;

    PCMainMenu.ActivePageIndex := 0;
end;

end.
