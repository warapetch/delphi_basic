object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'BitKub API'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object Label3: TLabel
    Left = 33
    Top = 233
    Width = 100
    Height = 15
    Caption = ' /api/market/ticker'
  end
  object btnSend: TBitBtn
    Left = 159
    Top = 229
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 0
    OnClick = btnSendClick
  end
  object pnlStatus: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 185
    object Label1: TLabel
      Left = 40
      Top = 13
      Width = 62
      Height = 15
      Caption = 'Non-secure'
    end
    object Label2: TLabel
      Left = 263
      Top = 13
      Width = 35
      Height = 15
      Caption = 'Secure'
    end
    object pnlStatus_NSecure: TPanel
      Left = 128
      Top = 8
      Width = 33
      Height = 26
      Color = 16777088
      ParentBackground = False
      TabOrder = 0
    end
    object pnlStatus_Secure: TPanel
      Left = 320
      Top = 8
      Width = 33
      Height = 26
      Color = 16777088
      ParentBackground = False
      TabOrder = 1
    end
  end
  object stgData: TStringGrid
    Left = 24
    Top = 54
    Width = 449
    Height = 169
    ColCount = 3
    DefaultColWidth = 100
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedRowDefAlign]
    ScrollBars = ssVertical
    TabOrder = 2
    ColWidths = (
      76
      100
      245)
  end
  object vleTicker: TValueListEditor
    Left = 299
    Top = 189
    Width = 306
    Height = 244
    TabOrder = 3
  end
  object IdConnectionIntercept1: TIdConnectionIntercept
    Left = 360
    Top = 136
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    Intercept = IdConnectionIntercept1
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv23
    SSLOptions.SSLVersions = [sslvSSLv2, sslvSSLv3, sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2]
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 544
    Top = 136
  end
  object IdHTTP1: TIdHTTP
    Intercept = IdConnectionIntercept1
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KH' +
      'TML, like Gecko) Chrome/57.0.2987.133 Safari/537.36'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 232
    Top = 136
  end
end
