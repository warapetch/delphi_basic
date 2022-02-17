object FrmMainSmall: TFrmMainSmall
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'DateTime'
  ClientHeight = 28
  ClientWidth = 350
  Color = clWhite
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  PopupMenu = PopupMenu2
  ScreenSnap = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDate: TPanel
    Left = 0
    Top = 0
    Width = 350
    Height = 28
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 412
    ExplicitHeight = 20
    object lblDayName: TLabel
      Left = 0
      Top = 0
      Width = 18
      Height = 28
      Cursor = crHandPoint
      Align = alLeft
      Alignment = taCenter
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnMouseDown = lblDateMouseDown
      ExplicitHeight = 25
    end
    object lblTime: TLabel
      Left = 173
      Top = 0
      Width = 177
      Height = 28
      Cursor = crHandPoint
      Align = alClient
      Alignment = taCenter
      Caption = 'Load ..'
      Color = 8454143
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      OnMouseDown = lblDateMouseDown
      ExplicitLeft = 176
      ExplicitWidth = 63
      ExplicitHeight = 25
    end
    object lblDate: TLabel
      Left = 18
      Top = 0
      Width = 155
      Height = 28
      Cursor = crHandPoint
      Align = alLeft
      Alignment = taCenter
      AutoSize = False
      Caption = #3650#3627#3621#3604'..'
      Color = 8454016
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      OnMouseDown = lblDateMouseDown
      ExplicitLeft = 78
      ExplicitHeight = 41
    end
    object TrackBar1: TTrackBar
      Left = 0
      Top = 18
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
    Left = 632
    Top = 8
  end
  object TrayIcon1: TTrayIcon
    PopupMenu = PopupMenu2
    Visible = True
    OnDblClick = TrayIcon1DblClick
    Left = 560
    Top = 8
  end
  object ColorDialog1: TColorDialog
    Left = 440
    Top = 16
  end
  object PopupMenu2: TPopupMenu
    Left = 456
    Top = 8
    object MenuItem_CBackground: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Change Color Background Time'
      ShortCut = 16433
      OnClick = MenuItem_CBackgroundClick
    end
    object ChangeColorBackgroundTime1: TMenuItem
      Caption = 'Change Color Background Date'
      ShortCut = 16434
      OnClick = ChangeColorBackgroundTime1Click
    end
    object MenuItem_CDate: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Change Color Date'
      ShortCut = 16435
      OnClick = MenuItem_CDateClick
    end
    object MenuItem_CTime: TMenuItem
      AutoHotkeys = maManual
      Caption = 'Change Color Time'
      ShortCut = 16436
      OnClick = MenuItem_CTimeClick
    end
    object ChangeColorDayName1: TMenuItem
      Caption = 'Change Color DayName'
      ShortCut = 16437
      OnClick = ChangeColorDayName1Click
    end
    object MenuItem_Alpha: TMenuItem
      Caption = 'Alpha Color'
      ShortCut = 16438
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
