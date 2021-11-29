unit UQryTrans_Result_Top10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , UTemplate_Base, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet;

type
  TFrmQryTrans_Result_Top10 = class(TFrmTemplate_Base)
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
    qryDatast_termno: TIntegerField;
    qryDatast_point: TFloatField;
    qryDatast_grade: TFloatField;
    qryDatast_result: TStringField;
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
  FrmQryTrans_Result_Top10: TFrmQryTrans_Result_Top10;

implementation

{$R *.dfm}

uses UDMMain;

procedure TFrmQryTrans_Result_Top10.btnReportClick(Sender: TObject);
begin
	if qryData.RecordCount = 0 then
       begin
          ShowMessage('ไม่มีข้อมูล !!');
          Exit;
       end;

	frxReport.ShowReport();
end;

procedure TFrmQryTrans_Result_Top10.btnSearchClick(Sender: TObject);
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

procedure TFrmQryTrans_Result_Top10.cbbClassCloseUp(Sender: TObject);
begin
	btnSearchClick(Self);
end;

end.
