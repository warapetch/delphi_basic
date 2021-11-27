object FrmTemplate: TFrmTemplate
  Left = 0
  Top = 0
  Caption = 'FrmTemplate'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 20
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 49
    Align = alTop
    TabOrder = 0
    object lblHeader: TLabel
      Left = 24
      Top = 14
      Width = 100
      Height = 20
      Caption = 'Form Template'
    end
    object btnClose: TBitBtn
      Left = 536
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
end
