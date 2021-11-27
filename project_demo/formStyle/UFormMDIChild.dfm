object FrmMDIChild: TFrmMDIChild
  Left = 0
  Top = 0
  Caption = 'MDI Child'
  ClientHeight = 182
  ClientWidth = 402
  Color = 8454016
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object BitBtn1: TBitBtn
    Left = 144
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
end
