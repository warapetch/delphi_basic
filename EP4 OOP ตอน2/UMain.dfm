object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'FrmMain'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object pnlPhone1: TPanel
    Left = 24
    Top = 22
    Width = 146
    Height = 196
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 90
      Width = 57
      Height = 15
      Caption = 'Halo Moto'
    end
    object btnPhoneIn: TButton
      Left = 79
      Top = 132
      Width = 58
      Height = 25
      Caption = #3619#3633#3610#3626#3634#3618
      Enabled = False
      TabOrder = 0
      OnClick = btnPhoneInClick
    end
    object btnPhoneOut: TButton
      Left = 8
      Top = 132
      Width = 65
      Height = 25
      Caption = #3650#3607#3619#3629#3629#3585
      Enabled = False
      TabOrder = 1
      OnClick = btnPhoneOutClick
    end
    object btnPhoneCancel: TButton
      Left = 8
      Top = 163
      Width = 129
      Height = 25
      Caption = #3623#3634#3591#3626#3634#3618
      Enabled = False
      TabOrder = 2
      OnClick = btnPhoneCancelClick
    end
    object mmStatus: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 138
      Height = 80
      Align = alTop
      TabOrder = 3
      ExplicitLeft = 1
      ExplicitTop = 1
      ExplicitWidth = 144
    end
    object btnPowerOn: TButton
      Left = 88
      Top = 86
      Width = 51
      Height = 25
      Caption = 'ON'
      TabOrder = 4
      OnClick = btnPowerOnClick
    end
  end
  object pnlPhone2: TPanel
    Left = 216
    Top = 22
    Width = 146
    Height = 196
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 90
      Width = 45
      Height = 15
      Caption = 'Moto V2'
    end
    object btnPhoneIn2: TButton
      Left = 79
      Top = 132
      Width = 58
      Height = 25
      Caption = #3619#3633#3610#3626#3634#3618
      Enabled = False
      TabOrder = 0
      OnClick = btnPhoneIn2Click
    end
    object btnPhoneOut2: TButton
      Left = 8
      Top = 132
      Width = 65
      Height = 25
      Caption = #3650#3607#3619#3629#3629#3585
      Enabled = False
      TabOrder = 1
      OnClick = btnPhoneOut2Click
    end
    object btnPhoneCancel2: TButton
      Left = 8
      Top = 163
      Width = 129
      Height = 25
      Caption = #3623#3634#3591#3626#3634#3618
      Enabled = False
      TabOrder = 2
      OnClick = btnPhoneCancel2Click
    end
    object mmStatus2: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 138
      Height = 80
      Align = alTop
      TabOrder = 3
    end
    object btnPowerOn2: TButton
      Left = 88
      Top = 86
      Width = 51
      Height = 25
      Caption = 'ON'
      TabOrder = 4
      OnClick = btnPowerOn2Click
    end
  end
end
