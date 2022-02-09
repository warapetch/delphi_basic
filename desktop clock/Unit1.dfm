object FrmMain: TFrmMain
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'DateTime'
  ClientHeight = 101
  ClientWidth = 288
  Color = clWhite
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  PopupMenu = PopupMenu2
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblTime: TLabel
    Left = 0
    Top = 41
    Width = 288
    Height = 60
    Cursor = crDrag
    Align = alClient
    Alignment = taCenter
    Caption = 'Load ..'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    ExplicitWidth = 178
    ExplicitHeight = 64
  end
  object pnlDate: TPanel
    Left = 0
    Top = 0
    Width = 288
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblDayName: TLabel
      Left = 0
      Top = 0
      Width = 8
      Height = 41
      Align = alLeft
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnMouseDown = lblDateMouseDown
      ExplicitHeight = 29
    end
    object lblDate: TLabel
      Left = 8
      Top = 0
      Width = 280
      Height = 41
      Align = alClient
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnMouseDown = lblDateMouseDown
      ExplicitWidth = 10
      ExplicitHeight = 39
    end
    object TrackBar1: TTrackBar
      Left = 0
      Top = 20
      Width = 113
      Height = 20
      Ctl3D = False
      Max = 255
      ParentCtl3D = False
      Frequency = 10
      TabOrder = 0
      Visible = False
      OnChange = TrackBar1Change
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 480
    Top = 16
  end
  object TrayIcon1: TTrayIcon
    PopupMenu = PopupMenu2
    Visible = True
    OnDblClick = TrayIcon1DblClick
    Left = 256
    Top = 8
  end
  object ColorDialog1: TColorDialog
    Left = 128
    Top = 8
  end
  object PopupMenu2: TPopupMenu
    Left = 200
    Top = 8
    object MenuItem_CBackground: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Change Color Background'
      ShortCut = 16433
      OnClick = MenuItem_CBackgroundClick
    end
    object MenuItem_CDate: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Change Color Date'
      ShortCut = 16434
      OnClick = MenuItem_CDateClick
    end
    object MenuItem_CTime: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Change Color Time'
      ShortCut = 16435
      OnClick = MenuItem_CTimeClick
    end
    object MenuItem_Alpha: TMenuItem
      Caption = 'Alpha Color'
      ShortCut = 16436
      OnClick = MenuItem_AlphaClick
    end
    object N1: TMenuItem
      AutoHotkeys = maManual
      Caption = '-'
    end
    object MenuItem_SaveConfig: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Save Config'
      ShortCut = 16467
      OnClick = MenuItem_SaveConfigClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuItem_Close2: TMenuItem
      Caption = 'Close'
      ShortCut = 16465
      OnClick = MenuItem_Close2Click
    end
  end
end
