unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdIntercept, IdAuthentication ,System.DateUtils, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.ValEdit;

type
  TFrmMain = class(TForm)
    btnSend: TBitBtn;
    IdConnectionIntercept1: TIdConnectionIntercept;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    IdHTTP1: TIdHTTP;
    pnlStatus: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pnlStatus_NSecure: TPanel;
    pnlStatus_Secure: TPanel;
    stgData: TStringGrid;
    Label3: TLabel;
    vleTicker: TValueListEditor;
    procedure FormShow(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
  private
    function Cnv_UnixToDateTime(AUnixDateTime: String): String;
    function GetData(AEndPoint: String): String;
    procedure GetAPIStatus;
    procedure GetSymbols;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses IdURI ,System.JSON;

procedure TFrmMain.btnSendClick(Sender: TObject);
var sSymBol,sResponse : String;
	iRow : Integer;

	JsObj : TJSonObject;
    JsValue : TJSonValue;
    sValue : String;

begin
    if stgData.Selection.Top = -1 then Exit; // Not Select then Exit

    iRow := stgData.Selection.Top;
	sSymbol := stgData.Cells[1,iRow];

    //sResponse := GetData('/api/market/ticker'); // All
    sResponse := GetData('/api/market/ticker?sym='+sSymbol); // Only Selected

(*
{
	"THB_BTC":
    {"id":1,
    "last":1241187.53,
    "lowestAsk":1242409.79,
    "highestBid":1241187.59,
    "percentChange":-0.31,
    "baseVolume":219.48783706,
    "quoteVolume":272160400.41,
    "isFrozen":0,
    "high24hr":1270000,
    "low24hr":1210000,
    "change":-3912.47,
    "prevClose":1241187.53,
    "prevOpen":1245100
    }
}
*)
    JsObj := TJSonObject.ParseJSONValue(sResponse) as TJsonObject;
    JsValue := JsObj.getValue(sSymbol);
    var sId := JsValue.GetValue<string>('id');
    var last := JsValue.GetValue<double>('last');
    var lowestAsk := JsValue.GetValue<double>('lowestAsk');
    var highestBid := JsValue.GetValue<double>('highestBid');
    var percentChange := JsValue.GetValue<double>('percentChange');
    var baseVolume := JsValue.GetValue<double>('baseVolume');
    var quoteVolume := JsValue.GetValue<double>('quoteVolume');
    var isFrozen := JsValue.GetValue<integer>('isFrozen');
    var high24hr := JsValue.GetValue<double>('high24hr');
    var low24hr := JsValue.GetValue<double>('low24hr');
    var change := JsValue.GetValue<double>('change');
    var prevClose := JsValue.GetValue<double>('prevClose');
    var prevOpen := JsValue.GetValue<double>('prevOpen');

    vleTicker.Strings.Clear;
    vleTicker.Strings.Add('Id='+sId);
    vleTicker.Strings.Add('last='+FormatFloat('#,0.00',last));
    vleTicker.Strings.Add('lowestAsk='+FormatFloat('#,0.00',lowestAsk));
    vleTicker.Strings.Add('highestBid='+FormatFloat('#,0.00',highestBid));
    vleTicker.Strings.Add('percentChange='+FormatFloat('#,0.00',percentChange));
    vleTicker.Strings.Add('baseVolume='+FormatFloat('#,0.00',baseVolume));
    vleTicker.Strings.Add('quoteVolume='+FormatFloat('#,0.00',quoteVolume));
    vleTicker.Strings.Add('isFrozen='+ IntToStr(isFrozen));
    vleTicker.Strings.Add('high24hr='+FormatFloat('#,0.00',high24hr));
    vleTicker.Strings.Add('low24hr='+FormatFloat('#,0.00',low24hr));
    vleTicker.Strings.Add('change='+FormatFloat('#,0.00',change));
    vleTicker.Strings.Add('prevClose='+FormatFloat('#,0.00',prevClose));
    vleTicker.Strings.Add('prevOpen='+FormatFloat('#,0.00',prevOpen));


end;

function TFrmMain.Cnv_UnixToDateTime(AUnixDateTime : String) : String;
var dDateTime : TDateTime;
begin
	// System.DateUtils
    // function UnixToDateTime(const AValue: Int64; AReturnUTC: Boolean): TDateTime;

	dDateTime := UnixToDateTime(StrToInt(AUnixDateTime),false); // AReturnUTC == False
    result := FormatDateTime('dd/mm/yyyy hh:nn:ss',dDateTime);
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
	GetAPIStatus;

    GetSymbols;

end;

procedure TFrmMain.GetAPIStatus;
var
	JsArr : TJSONArray;
    JsValue : TJSONValue;

	sResponse,
    sName ,
    sValue : String;

    item : TJSonValue;

begin

    sResponse := GetData('/api/status');
(*
	Response:
	[
	  {
    	"name": "Non-secure endpoints",
    	"status": "ok",
    	"message": ""
      },

      {
    	"name": "Secure endpoints",
    	"status": "ok",
    	"message": ""
      }
	]
*)

    JsValue := TJSonObject.ParseJSONValue(sResponse);
	JsArr := JsValue as TJSONArray;

    for item in JsArr do
       begin
          sName  := item.GetValue<string>('name');
          sValue := item.GetValue<string>('status');

          if (LowerCase(sName) = 'non-secure endpoints') then
             begin
                if svalue = 'ok' then
                   pnlStatus_NSecure.Color := clLime
                else
                pnlStatus_NSecure.Color := clRed;
             end
          else
         // if (LowerCase(sName) = 'secure endpoints') then
             begin
                if svalue = 'ok' then
                   pnlStatus_Secure.Color := clLime
                else
                pnlStatus_Secure.Color := clRed;
             end;
       end;

	pnlStatus_NSecure.Update;
	pnlStatus_Secure.Update;
end;

procedure TFrmMain.GetSymbols;
var
    JsObj : TJSonObject;
	JsArr : TJSONArray;
    JsValue : TJSONValue;

	sResponse, sName ,
    sId,sSymbol,sInfo,
    sValue : String;


    item : TJSonValue;
    iError : Integer;

begin

    sResponse := GetData('/api/market/symbols');

(*
    Response:
    {
      "error": 0,
      "result": [
        {
          "id": 1,
          "symbol": "THB_BTC",
          "info": "Thai Baht to Bitcoin"
        },
        {
          "id": 2,
          "symbol": "THB_ETH",
          "info": "Thai Baht to Ethereum"
        }
        , ... N

      ]
	}
*)

    JsObj := TJSonObject.ParseJSONValue(sResponse) as TJsonObject;
    iError := JsObj.getValue<integer>('error');

    if iError = 0 then
       begin
		  JsArr := JsObj.getValue('result') as TJSONArray;
          stgData.RowCount := 0; // Clear;

          stgData.RowCount := JsArr.Count + 1; // +Caption
          stgData.ColCount := 3;
          stgData.FixedRows := 1;
          stgData.Cells[0,0] := 'ID';
          stgData.Cells[1,0] := 'Symbol';
          stgData.Cells[2,0] := 'Info';

          var iRow : Integer;
          iRow := 1;

          for item in JsArr do
       	      begin
          	     sId     := item.GetValue<string>('id');
          		 sSymbol := item.GetValue<string>('symbol');
                 sInfo   := item.GetValue<string>('info');

                  stgData.Cells[0,iRow] := sId;
                  stgData.Cells[1,iRow] := sSymbol;
                  stgData.Cells[2,iRow] := sInfo;

                  Inc(iRow); // iRow := iRow + 1;
              end;
       end;
end;

function TFrmMain.GetData(AEndPoint : String) : String;
var sBaseURL ,
    sResponseText ,
    sFullURL : String;

begin
    sBaseURL := 'https://api.bitkub.com';
    sFullURL := sBaseURL + AEndPoint;

    IdHTTP1.Request.Host   := sBaseURL;
    IdHTTP1.Request.Accept := 'application/json';
    IdHTTP1.Request.Method := 'GET';

    IdHTTP1.AllowCookies    := True;
    IdHTTP1.HandleRedirects := False;
    IdHTTP1.HTTPOptions     := [hoForceEncodeParams];

    sResponseText := Trim(IdHTTP1.Get( TIdURI.URLEncode(sFullURL) , []));

    if AEndPoint = '/api/servertime' then
       sResponseText := Cnv_UnixToDateTime(sResponseText);

//    // Response Text  >> '[ { } ]'
//    // Remove [ and ]
//    if sResponseText[1] = '[' then
//       sResponseText := Copy(sResponseText,2,Length(sResponseText)-2);

    Result := sResponseText;
end;

end.
