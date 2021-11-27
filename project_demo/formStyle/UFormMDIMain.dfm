object FrmMDIForm: TFrmMDIForm
  Left = 0
  Top = 0
  Caption = 'Main MDI Form'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIForm
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 248
    ExplicitTop = 80
    ExplicitWidth = 185
    object BitBtn1: TBitBtn
      Left = 24
      Top = 9
      Width = 161
      Height = 25
      Caption = 'Show MDI Child'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
end
