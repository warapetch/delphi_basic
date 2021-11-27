unit UDlg_Search_Student;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , UMas_Template, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmDlg_Search_Student = class(TFrmMas_Template)
    btnSearchOK: TBitBtn;
    btnSearchCancel: TBitBtn;
    pnlSearch: TPanel;
    edtSearch: TEdit;
    btnSearch: TBitBtn;
    rbtCode: TRadioButton;
    rbtName: TRadioButton;
    lblSearch: TLabel;
    dbgMas_Student: TDBGrid;
    dsqryMas_Student: TDataSource;
    qryMas_Student: TFDQuery;
    procedure btnSearchClick(Sender: TObject);
    procedure btnTPCloseClick(Sender: TObject);
    procedure btnSearchCancelClick(Sender: TObject);
    procedure rbtCodeClick(Sender: TObject);
    procedure edtSearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    select_code : String;
  end;

var
  FrmDlg_Search_Student: TFrmDlg_Search_Student;

implementation

{$R *.dfm}

procedure TFrmDlg_Search_Student.btnSearchCancelClick(Sender: TObject);
begin
    Close;
    ModalResult := mrCancel;
end;

procedure TFrmDlg_Search_Student.btnSearchClick(Sender: TObject);
var sSearchBy : String;
begin
    sSearchBy := '';
    if rbtCode.Checked then
       sSearchBy := 'st_code'
    else
//    if rbtName.Checked then
       sSearchBy := 'st_name';

    if edtSearch.Text = '' then
       begin
         ShowMessage('กำหนดข้อความที่ต้องการค้นหาก่อน !!');
         edtSearch.SetFocus;
         Exit;
       end;

    qryMas_Student.Close;
    //qryMas_Student.ParamByName('st_code').AsString := edtSearch.Text;
    //                        ' where st_code like "64%" ';
    //                        ' where st_name like "สม%" ';
    qryMas_Student.SQL[10] := ' where '+ sSearchBy+' like '+QuotedStr(edtSearch.Text+'%');
    qryMas_Student.Open;

end;

procedure TFrmDlg_Search_Student.btnTPCloseClick(Sender: TObject);
begin
    if qryMas_Student.FieldByName('st_code').AsString <> '' then
       begin
          select_code := qryMas_Student.FieldByName('st_code').AsString;
          Close;
          ModalResult := mrOK;
       end
    else
    ShowMessage('ไม่พบรหัส นักเรียน !!');
end;

procedure TFrmDlg_Search_Student.edtSearchKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = #13) and (edtSearch.Text <> '') then // #13 == Enter
      begin
         btnSearchClick(Self);
      end;
end;

procedure TFrmDlg_Search_Student.rbtCodeClick(Sender: TObject);
begin
    edtSearch.Text := '';
end;

end.
