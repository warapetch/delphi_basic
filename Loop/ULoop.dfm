object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Loop'
  ClientHeight = 353
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = THAI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 18
  object lblCapData: TLabel
    Left = 32
    Top = 24
    Width = 31
    Height = 18
    Caption = 'Data'
  end
  object Label1: TLabel
    Left = 32
    Top = 56
    Width = 35
    Height = 18
    Caption = #3588#3657#3609#3627#3634
  end
  object btnLoopFor1: TBitBtn
    Left = 32
    Top = 101
    Width = 75
    Height = 44
    Caption = 'For .. Do ++'
    TabOrder = 0
    WordWrap = True
    OnClick = btnLoopFor1Click
  end
  object mmLog: TMemo
    Left = 26
    Top = 151
    Width = 506
    Height = 170
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object btnFor2: TBitBtn
    Left = 120
    Top = 101
    Width = 75
    Height = 44
    Caption = 'For .. Do --'
    TabOrder = 2
    WordWrap = True
    OnClick = btnFor2Click
  end
  object btnForNested: TBitBtn
    Left = 208
    Top = 101
    Width = 75
    Height = 44
    Caption = 'For Nested'
    TabOrder = 3
    WordWrap = True
    OnClick = btnForNestedClick
  end
  object btnForIn: TBitBtn
    Left = 296
    Top = 101
    Width = 75
    Height = 44
    Caption = 'FOR-IN'
    TabOrder = 4
    WordWrap = True
    OnClick = btnForInClick
  end
  object btnLoopwhile: TBitBtn
    Left = 376
    Top = 101
    Width = 75
    Height = 44
    Caption = 'While'
    TabOrder = 5
    WordWrap = True
    OnClick = btnLoopwhileClick
  end
  object btnLoopRepeat: TBitBtn
    Left = 457
    Top = 101
    Width = 75
    Height = 44
    Caption = 'Repeat'
    TabOrder = 6
    WordWrap = True
    OnClick = btnLoopRepeatClick
  end
  object edData: TEdit
    Left = 77
    Top = 21
    Width = 294
    Height = 26
    TabOrder = 7
    Text = 'Welcome to Thailand , I Love You'
  end
  object edAEIOU: TEdit
    Left = 77
    Top = 53
    Width = 294
    Height = 26
    TabOrder = 8
    Text = 'a,e,i,o,u'
  end
end
