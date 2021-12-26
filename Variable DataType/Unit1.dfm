object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Var  DataType'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object mmLog: TMemo
    Left = 48
    Top = 120
    Width = 305
    Height = 217
    TabOrder = 0
  end
  object btnRun: TBitBtn
    Left = 48
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 1
    OnClick = btnRunClick
  end
end
