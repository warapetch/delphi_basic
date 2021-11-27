object FrmMas_Template: TFrmMas_Template
  Left = 0
  Top = 0
  Caption = '..'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object pnlTPTop: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 49
    Align = alTop
    Color = 16633762
    ParentBackground = False
    TabOrder = 0
    object lblTPHeader: TLabel
      Left = 34
      Top = 13
      Width = 8
      Height = 21
      Caption = '..'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnTPClose: TBitBtn
      Left = 528
      Top = 9
      Width = 75
      Height = 33
      Caption = #3611#3636#3604#3615#3629#3619#3660#3617
      TabOrder = 0
      OnClick = btnTPCloseClick
    end
  end
  object pnlTPBottom: TPanel
    Left = 0
    Top = 400
    Width = 624
    Height = 41
    Align = alBottom
    Color = 16705229
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 112
    ExplicitTop = 120
    ExplicitWidth = 185
  end
end
