object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
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
  object Image1: TImage
    Left = 208
    Top = 88
    Width = 105
    Height = 105
    Proportional = True
  end
  object BitBtn1: TBitBtn
    Left = 208
    Top = 199
    Width = 75
    Height = 25
    Caption = #3648#3621#3639#3629#3585
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 312
    Top = 199
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object OpenDialog1: TOpenDialog
    Filter = #3619#3641#3611#3616#3634#3614' (*.BMP)|*.bmp|'#3619#3641#3611#3616#3634#3614' (*.PNG)|*.png|'#3607#3640#3585#3652#3615#3621#3660' (*.*)|*.*'
    FilterIndex = 0
    Title = #3648#3621#3639#3629#3585#3652#3615#3621#3660#3619#3641#3611#3616#3634#3614
    Left = 352
    Top = 104
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Title = #3648#3621#3639#3629#3585#3652#3615#3621#3660#3619#3641#3611#3616#3634#3614
    Left = 448
    Top = 104
  end
end
