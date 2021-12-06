object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Array'
  ClientHeight = 441
  ClientWidth = 756
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
    Top = 79
    Width = 193
    Height = 298
    TabOrder = 0
  end
  object btnStatic: TBitBtn
    Left = 48
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Static'
    TabOrder = 1
    OnClick = btnStaticClick
  end
  object StringGrid1: TStringGrid
    Left = 264
    Top = 79
    Width = 417
    Height = 298
    ColCount = 6
    FixedCols = 0
    RowCount = 11
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goFixedRowDefAlign]
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object btnDynamic: TBitBtn
    Left = 166
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Dynamic'
    TabOrder = 3
    OnClick = btnDynamicClick
  end
  object btnStatic2: TBitBtn
    Left = 264
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Static 2'
    TabOrder = 4
    OnClick = btnStatic2Click
  end
end
