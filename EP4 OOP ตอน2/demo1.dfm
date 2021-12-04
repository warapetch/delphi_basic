object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object Memo1: TMemo
    Left = 176
    Top = 23
    Width = 313
    Height = 195
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object pnlPhone1: TPanel
    Left = 24
    Top = 22
    Width = 146
    Height = 196
    Color = 8454016
    ParentBackground = False
    TabOrder = 1
    object btnPhoneIn: TButton
      Left = 79
      Top = 132
      Width = 58
      Height = 25
      Caption = #3619#3633#3610#3626#3634#3618
      TabOrder = 0
    end
    object btnPhoneOut: TButton
      Left = 8
      Top = 132
      Width = 65
      Height = 25
      Caption = #3650#3607#3619#3629#3629#3585
      TabOrder = 1
    end
    object btnCancel: TButton
      Left = 8
      Top = 163
      Width = 129
      Height = 25
      Caption = #3623#3634#3591#3626#3634#3618
      TabOrder = 2
    end
    object mmStatus: TMemo
      Left = 1
      Top = 1
      Width = 144
      Height = 80
      Align = alTop
      TabOrder = 3
    end
  end
end
