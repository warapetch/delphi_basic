unit UMas_Student_Add;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , UMas_Template, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtDlgs,
  UTemplate_Base;

type
  TFrmMas_Student_Add = class(TFrmTemplate_Base)
    btnData_Post: TBitBtn;
    btnData_Cancel: TBitBtn;
    dsData: TDataSource;
    dbeCode: TDBEdit;
    Label1: TLabel;
    dbeName: TDBEdit;
    Label2: TLabel;
    dbeSurName: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbcGender: TDBComboBox;
    dbiStudent: TDBImage;
    btnCapture: TBitBtn;
    btnImageLoad: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormShow(Sender: TObject);
    procedure btnTPCloseClick(Sender: TObject);
    procedure btnData_CancelClick(Sender: TObject);
    procedure btnCaptureClick(Sender: TObject);
    procedure btnImageLoadClick(Sender: TObject);
    procedure btnData_PostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    //date 6411-28 off
    //DataState : String;
  end;

var
  FrmMas_Student_Add: TFrmMas_Student_Add;

implementation

{$R *.dfm}

uses UDirectXWebcam;

procedure TFrmMas_Student_Add.btnImageLoadClick(Sender: TObject);
begin
    //
    if OpenPictureDialog1.Execute then
       begin
          // Assign Bitmap to TPicture > Dataset ['st_image']
          dbiStudent.Picture.LoadFromFile(OpenPictureDialog1.FileName);
          //dsData.DataSet.FieldByName('st_image').Assign(dbiStudent.Picture);

       end;
end;

procedure TFrmMas_Student_Add.btnCaptureClick(Sender: TObject);
begin
    // call webcam DirectX
    FrmDirectXWebcam := TFrmDirectXWebcam.Create(Application);
    if FrmDirectXWebcam.Showmodal = mrOK then
       dbiStudent.Picture.LoadFromFile(FrmDirectXWebcam.SaveToFileName);
    FreeAndNil(FrmDirectXWebcam);

end;

procedure TFrmMas_Student_Add.btnData_CancelClick(Sender: TObject);
begin
    if dsData.DataSet.State in [dsInsert ,dsEdit] then
       dsData.DataSet.Cancel;

    //Close;
    ModalResult := mrCancel;
end;

procedure TFrmMas_Student_Add.btnData_PostClick(Sender: TObject);
begin
    if dsData.DataSet.State in [dsInsert ,dsEdit] then
       dsData.DataSet.Post;

    //Close;
    ModalResult := mrOk; // Close;
end;

procedure TFrmMas_Student_Add.btnTPCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TFrmMas_Student_Add.FormShow(Sender: TObject);
var sDataState : String;
begin
    //date 6411-28 add
    if dsData.DataSet.State = dsInsert then
       sDataState := 'เพิ่มข้อมูล'
    else
       sDataState := 'แก้ไขข้อมูล';

    Caption := Caption + ' ['+sDataState+']';

  inherited;

end;

end.
