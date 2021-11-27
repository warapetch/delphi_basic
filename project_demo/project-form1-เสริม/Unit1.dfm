object Form1: TForm1
  Left = 0
  Top = 0
  CustomHint = BalloonHint1
  Caption = #3615#3629#3619#3660#3617' 1'
  ClientHeight = 223
  ClientWidth = 324
  Color = clBtnFace
  CustomTitleBar.Control = TitleBarPanel1
  CustomTitleBar.Enabled = True
  CustomTitleBar.Height = 31
  CustomTitleBar.BackgroundColor = clWhite
  CustomTitleBar.ForegroundColor = 65793
  CustomTitleBar.InactiveBackgroundColor = clWhite
  CustomTitleBar.InactiveForegroundColor = 10066329
  CustomTitleBar.ButtonForegroundColor = 65793
  CustomTitleBar.ButtonBackgroundColor = clWhite
  CustomTitleBar.ButtonHoverForegroundColor = 65793
  CustomTitleBar.ButtonHoverBackgroundColor = 16053492
  CustomTitleBar.ButtonPressedForegroundColor = 65793
  CustomTitleBar.ButtonPressedBackgroundColor = 15395562
  CustomTitleBar.ButtonInactiveForegroundColor = 10066329
  CustomTitleBar.ButtonInactiveBackgroundColor = clWhite
  Constraints.MaxHeight = 480
  Constraints.MaxWidth = 340
  Constraints.MinHeight = 220
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Enabled = True
  GlassFrame.Top = 31
  StyleElements = [seFont, seClient]
  PixelsPerInch = 96
  TextHeight = 15
  object BitBtn1: TBitBtn
    Left = 184
    Top = 80
    Width = 75
    Height = 25
    Hint = #3585#3604#3648#3610#3634#3654
    CustomHint = BalloonHint1
    Caption = 'BitBtn1'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 57
    Top = 81
    Width = 121
    Height = 23
    CustomHint = BalloonHint1
    TabOrder = 1
    Text = 'Edit1'
  end
  object Panel1: TPanel
    Left = 0
    Top = 31
    Width = 324
    Height = 41
    CustomHint = BalloonHint1
    Align = alTop
    Caption = 'Panel1'
    Color = 16633762
    ParentBackground = False
    TabOrder = 2
    ExplicitLeft = 288
    ExplicitTop = 72
    ExplicitWidth = 185
  end
  object Panel2: TPanel
    Left = 0
    Top = 182
    Width = 324
    Height = 41
    CustomHint = BalloonHint1
    Align = alBottom
    Caption = 'Panel1'
    Color = 16705229
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 8
    ExplicitWidth = 624
  end
  object TitleBarPanel1: TTitleBarPanel
    Left = 0
    Top = 0
    Width = 324
    Height = 31
    CustomHint = BalloonHint1
    CustomButtons = <>
    ExplicitTop = -15
    object BitBtn2: TBitBtn
      Left = 103
      Top = 3
      Width = 75
      Height = 25
      CustomHint = BalloonHint1
      Caption = 'BitBtn2'
      TabOrder = 0
    end
  end
  object BalloonHint1: TBalloonHint
    Left = 248
    Top = 120
  end
end
