unit UDlg_Search_Student;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , UTemplate_Base, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TFrmDlg_Search_Student = class(TFrmTemplate_Base)
    pnlSearch: TPanel;
    lblSearch: TLabel;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
    rbtCode: TRadioButton;
    rbtName: TRadioButton;
    dbgMas_Student: TDBGrid;
    qryMas_Student: TFDQuery;
    dsqryMas_Student: TDataSource;
    btnSearchOK: TBitBtn;
    btnSearchCancel: TBitBtn;
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchOKClick(Sender: TObject);
    procedure btnSearchCancelClick(Sender: TObject);
    procedure edtSearchKeyPress(Sender: TObject; var Key: Char);
    procedure rbtCodeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Select_StudentCode : String;
  end;

var
  FrmDlg_Search_Student: TFrmDlg_Search_Student;

implementation

{$R *.dfm}

procedure TFrmDlg_Search_Student.btnSearchCancelClick(Sender: TObject);
begin
    Select_StudentCode := '';
    Close;
    ModalResult := mrCancel;
end;

procedure TFrmDlg_Search_Student.btnSearchClick(Sender: TObject);
var sSearchBy : String;
begin
    Select_StudentCode := '';
    sSearchBy := '';
    if rbtCode.Checked then
       sSearchBy := 'st_code'
    else
       sSearchBy := 'st_name';

    if Trim(edtSearch.Text) = '' then
       begin
         ShowMessage('กำหนดข้อความที่ต้องการค้นหาก่อน !!');
         edtSearch.SetFocus;
         Exit;
       end;

    qryMas_Student.Close;    // --10
    qryMas_Student.SQL[10] := ' where '+ sSearchBy+' like '+QuotedStr(edtSearch.Text+'%');
    qryMas_Student.Open;

end;

procedure TFrmDlg_Search_Student.btnSearchOKClick(Sender: TObject);
begin
    if qryMas_Student.RecordCount = 0 then Exit;

    Select_StudentCode := qryMas_Student.FieldByName('st_code').AsString;

    Close;
    ModalResult := mrOk;
end;

procedure TFrmDlg_Search_Student.edtSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = #13) and (Trim(edtSearch.Text) <> '') then
        btnSearchClick(edtSearch);
end;

procedure TFrmDlg_Search_Student.rbtCodeClick(Sender: TObject);
begin
    qryMas_Student.Close;

end;

end.
