unit UMas_Template2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , UMas_Template, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.DBCtrls, Vcl.Mask, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmMas_Template2 = class(TFrmMas_Template)
    Panel1: TPanel;
    dsStudent: TDataSource;
    dbiStudent: TDBImage;
    dbeCode: TDBEdit;
    Label1: TLabel;
    dbeName: TDBEdit;
    Label2: TLabel;
    dbeSurName: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbcGender: TDBComboBox;
    dsData: TDataSource;
    dbcClass: TDBEdit;
    Label5: TLabel;
    dbeTermNo: TDBEdit;
    Label6: TLabel;
    dbePoint: TDBEdit;
    Label7: TLabel;
    dbeGrade: TDBEdit;
    Label8: TLabel;
    dbePass: TDBEdit;
    Label9: TLabel;
    btnData_Post: TBitBtn;
    btnData_Cancel: TBitBtn;
    qryMas_Student: TFDQuery;
    procedure btnData_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnData_PostClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    DataState,
    stClass ,
    stTermNo ,
    stCode : String;
  end;

var
  FrmMas_Template2: TFrmMas_Template2;

implementation

{$R *.dfm}

uses UDMMain;

procedure TFrmMas_Template2.btnData_CancelClick(Sender: TObject);
begin
    if dsData.DataSet.State in [dsInsert ,dsEdit] then
       dsData.DataSet.Cancel;

    //Close;
    ModalResult := mrCancel;
end;

procedure TFrmMas_Template2.btnData_PostClick(Sender: TObject);
begin
    if dsData.DataSet.State in [dsInsert ,dsEdit] then
       dsData.DataSet.Post;

    //Close;
    ModalResult := mrOk; // Close;
end;

procedure TFrmMas_Template2.FormShow(Sender: TObject);
begin
  inherited;

  qryMas_Student.ParamByName('st_code').AsString := stCode;
  qryMas_Student.Open;
end;

end.
