unit UTrans_Records_Add;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs ,UTemplate_Student, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrmTrans_Records_Add = class(TFrmTemplate_Student)
    lblPoint: TLabel;
    lblGrade: TLabel;
    lblPass: TLabel;
    dbePoint: TDBEdit;
    dbeGrade: TDBEdit;
    dbePass: TDBEdit;
    dsData: TDataSource;
    pnlWorkTerm: TPanel;
    lblClass: TLabel;
    lblTerm: TLabel;
    dbeClass: TDBEdit;
    dbeTermNo: TDBEdit;
    btnData_Post: TBitBtn;
    btnData_Cancel: TBitBtn;
    procedure btnData_PostClick(Sender: TObject);
    procedure btnData_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    StudentCode : String;
  end;

var
  FrmTrans_Records_Add: TFrmTrans_Records_Add;

implementation

{$R *.dfm}

procedure TFrmTrans_Records_Add.btnData_CancelClick(Sender: TObject);
begin
    if dsData.DataSet.State in [dsInsert ,dsEdit] then
       dsData.DataSet.Cancel;

    //Close;
    ModalResult := mrCancel;
end;

procedure TFrmTrans_Records_Add.btnData_PostClick(Sender: TObject);
begin
    if dsData.DataSet.State in [dsInsert ,dsEdit] then
       dsData.DataSet.Post;

    //Close;
    ModalResult := mrOk; // Close;
end;

procedure TFrmTrans_Records_Add.FormShow(Sender: TObject);
var sDataState : String;
begin
    if dsData.DataSet.State = dsInsert then
       sDataState := 'เพิ่มข้อมูล'
    else
       sDataState := 'แก้ไขข้อมูล';

    Caption := Caption + ' ['+sDataState+']';

  inherited;

    DisplayStudent(StudentCode);
end;

end.
