object FrmMainMenu: TFrmMainMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'MainMenu :: '#3607#3632#3648#3610#3637#3618#3609#3609#3633#3585#3648#3619#3637#3618#3609' '
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 30
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    Color = 15790320
    ParentBackground = False
    TabOrder = 0
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 400
    Width = 624
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
  object btnMasStudent: TBitBtn
    Left = 120
    Top = 96
    Width = 169
    Height = 73
    Caption = #3607#3632#3648#3610#3637#3618#3609#3609#3633#3585#3648#3619#3637#3618#3609
    TabOrder = 2
    OnClick = btnMasStudentClick
  end
  object btnTransRecords: TBitBtn
    Left = 336
    Top = 96
    Width = 169
    Height = 73
    Caption = #3612#3621#3585#3634#3619#3648#3619#3637#3618#3609
    TabOrder = 3
    OnClick = btnTransRecordsClick
  end
  object btnInquiry: TBitBtn
    Left = 120
    Top = 200
    Width = 169
    Height = 73
    Caption = #3626#3629#3610#3606#3634#3617#3586#3657#3629#3617#3641#3621
    TabOrder = 4
    OnClick = btnInquiryClick
  end
  object btnClose: TBitBtn
    Left = 336
    Top = 200
    Width = 169
    Height = 73
    Caption = #3611#3636#3604#3650#3611#3619#3649#3585#3619#3617
    TabOrder = 5
    OnClick = btnCloseClick
  end
end
