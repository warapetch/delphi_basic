object Form1: TForm1
  Left = 699
  Top = 98
  BorderStyle = bsDialog
  Caption = 'Demo'
  ClientHeight = 372
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object pnlCommand: TPanel
    Left = 338
    Top = 0
    Width = 326
    Height = 353
    Align = alRight
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 72
      Height = 12
      Caption = 'Sensor Count'
    end
    object Label2: TLabel
      Left = 178
      Top = 8
      Width = 42
      Height = 12
      Caption = 'Current'
    end
    object Label3: TLabel
      Left = 8
      Top = 44
      Width = 78
      Height = 12
      Caption = 'Serial Number'
    end
    object btnInit: TButton
      Left = 8
      Top = 116
      Width = 118
      Height = 24
      Caption = 'Connect Sensor'
      TabOrder = 0
      OnClick = btnInitClick
    end
    object EDSensorNum: TEdit
      Left = 96
      Top = 4
      Width = 61
      Height = 20
      Color = clBtnFace
      Enabled = False
      TabOrder = 1
    end
    object EDSensorIndex: TEdit
      Left = 234
      Top = 3
      Width = 61
      Height = 20
      Color = clBtnFace
      Enabled = False
      TabOrder = 2
    end
    object EDSensorSN: TEdit
      Left = 96
      Top = 40
      Width = 199
      Height = 20
      Color = clBtnFace
      Enabled = False
      TabOrder = 3
    end
    object RGFormat: TRadioGroup
      Left = 178
      Top = 152
      Width = 119
      Height = 39
      Caption = 'Image Type'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'BMP'
        'JPG')
      TabOrder = 4
    end
    object btnSaveImage: TButton
      Left = 8
      Top = 156
      Width = 118
      Height = 24
      Caption = 'Save Image'
      TabOrder = 5
      OnClick = btnSaveImageClick
    end
    object btnReg: TButton
      Left = 8
      Top = 196
      Width = 118
      Height = 24
      Caption = 'Register'
      TabOrder = 6
      OnClick = btnRegClick
    end
    object btnVerify: TButton
      Left = 8
      Top = 236
      Width = 118
      Height = 24
      Caption = 'Verify 1 : 1'
      TabOrder = 7
      OnClick = btnVerifyClick
    end
    object btnIdentify: TButton
      Left = 178
      Top = 236
      Width = 118
      Height = 24
      Caption = 'Identify 1 : N'
      TabOrder = 8
      OnClick = btnIdentifyClick
    end
    object btnDisconnect: TButton
      Left = 178
      Top = 116
      Width = 118
      Height = 24
      Caption = 'Disonnect Sensor'
      TabOrder = 9
      OnClick = btnDisconnectClick
    end
    object btnRegByIdentify: TButton
      Left = 178
      Top = 276
      Width = 118
      Height = 24
      Caption = 'Identify by image'
      TabOrder = 10
      OnClick = btnRegByIdentifyClick
    end
    object btnRegByImage: TButton
      Left = 8
      Top = 276
      Width = 118
      Height = 24
      Caption = 'Register by image'
      TabOrder = 11
      OnClick = btnRegByImageClick
    end
    object btnBeep: TButton
      Left = 224
      Top = 316
      Width = 72
      Height = 25
      Caption = 'Beep'
      TabOrder = 12
      OnClick = btnBeepClick
    end
    object btnRed: TButton
      Left = 8
      Top = 316
      Width = 72
      Height = 25
      Caption = 'Red'
      TabOrder = 13
      OnClick = btnRedClick
    end
    object chkFakeFunOn: TCheckBox
      Left = 186
      Top = 202
      Width = 97
      Height = 17
      Caption = 'FakeFunOn'
      Checked = True
      State = cbChecked
      TabOrder = 14
    end
    object rbtZKFinger9: TRadioButton
      Left = 8
      Top = 80
      Width = 113
      Height = 17
      Caption = 'ZKFinger 9.0'
      TabOrder = 15
    end
    object rbtZKFinger10: TRadioButton
      Left = 176
      Top = 80
      Width = 113
      Height = 17
      Caption = 'ZKFinger 10.0'
      Checked = True
      TabOrder = 16
      TabStop = True
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 353
    Width = 664
    Height = 19
    Panels = <
      item
        Width = 300
      end>
  end
  object btnGreen: TButton
    Left = 456
    Top = 316
    Width = 72
    Height = 25
    Caption = 'Green'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnGreenClick
  end
  object ZKFPEngX1: TZKFPEngX
    Left = 96
    Top = 88
    Width = 0
    Height = 0
    OnFeatureInfo = ZKFPEngX1FeatureInfo
    OnImageReceived = ZKFPEngX1ImageReceived
    OnEnroll = ZKFPEngX1Enroll
    OnCapture = ZKFPEngX1Capture
    ControlData = {
      5450463008545A4B4650456E6700044C656674020003546F7002000557696474
      6802180648656967687402180B456E726F6C6C436F756E7402010B53656E736F
      72496E6465780200095468726573686F6C64020A114F6E65546F4F6E65546872
      6573686F6C64020A10466F7263655365636F6E644D61746368090C4175746F49
      64656E74696679080D4973496D6167654368616E6765080000}
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 40
    Top = 176
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 40
    Top = 208
  end
  object OpenPictureDialog2: TOpenPictureDialog
    Filter = 'All (*.jpg;*.jpeg;*.bmp)|*.jpg;*.jpeg;*.bmp'
    Left = 40
    Top = 272
  end
end
