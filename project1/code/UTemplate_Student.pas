unit UTemplate_Student;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs , UTemplate_Base, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmTemplate_Student = class(TFrmTemplate_Base)
    pnlTPBGStudent: TPanel;
    lblTPcapCode: TLabel;
    lblTPcapName: TLabel;
    lblTPcapSurName: TLabel;
    lblTPcapGender: TLabel;
    dbiStudent: TDBImage;
    dbeCode: TDBEdit;
    dbeName: TDBEdit;
    dbeSurName: TDBEdit;
    dbcGender: TDBComboBox;
    dsStudent: TDataSource;
    qryMas_Student: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function DisplayStudent(st_code : String) : Boolean ;
    procedure ResetDisplay;
  end;

var
  FrmTemplate_Student: TFrmTemplate_Student;

implementation

{$R *.dfm}

uses UDMMain;

{ TFrmTemplate_Student }

function TFrmTemplate_Student.DisplayStudent(st_code: String): Boolean;
begin
    if qryMas_Student.state = dsBrowse then
       qryMas_Student.Close;

    qryMas_Student.ParamByName('st_code').Asstring := st_code;
    qryMas_Student.Open;

    Result := (qryMas_Student.RecordCount > 0);
end;

procedure TFrmTemplate_Student.ResetDisplay;
begin
    qryMas_Student.Close;
    dbiStudent.Picture := NIL;
end;

end.
