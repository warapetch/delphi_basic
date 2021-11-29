unit UQryMas_Student;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , UTemplate_Base, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet;

type
  TFrmQryMas_Student = class(TFrmTemplate_Base)
    pnlToolBar: TPanel;
    dbgData: TDBGrid;
    cbbClass: TComboBox;
    btnSearch: TBitBtn;
    dsqryData: TDataSource;
    qryData: TFDQuery;
    lblCapClass: TLabel;
    btnReport: TBitBtn;
    qryDatast_code: TStringField;
    qryDatast_name: TStringField;
    qryDatast_surname: TStringField;
    qryDatagender_desc: TWideStringField;
    frxReport: TfrxReport;
    fdbData: TfrxDBDataset;
    qryDatast_gender: TStringField;
    qryDatast_class: TStringField;
    procedure btnSearchClick(Sender: TObject);
    procedure cbbClassCloseUp(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmQryMas_Student: TFrmQryMas_Student;

implementation

{$R *.dfm}

uses UDMMain;

procedure TFrmQryMas_Student.btnReportClick(Sender: TObject);
begin
	if qryData.RecordCount = 0 then
       begin
          ShowMessage('ไม่มีข้อมูล !!');
          Exit;
       end;

	frxReport.ShowReport();
end;

procedure TFrmQryMas_Student.btnSearchClick(Sender: TObject);
begin
	if cbbClass.itemIndex = -1 then
       begin
          ShowMessage('เลือกชั้นเรียนก่อน !!');
          Exit;
       end;

    qryData.close;
    qryData.ParamByName('st_class').AsString := cbbClass.Text;
	qryData.Open;
end;

procedure TFrmQryMas_Student.cbbClassCloseUp(Sender: TObject);
begin
	btnSearchClick(Self);
end;

end.
