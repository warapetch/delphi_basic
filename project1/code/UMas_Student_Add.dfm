inherited FrmMas_Student_Add: TFrmMas_Student_Add
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #3607#3632#3648#3610#3637#3618#3609#3609#3633#3585#3648#3619#3637#3618#3609
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel [0]
    Left = 120
    Top = 104
    Width = 60
    Height = 17
    Caption = #3619#3627#3633#3626#3609#3633#3585#3648#3619#3637#3618#3609
  end
  object Label2: TLabel [1]
    Left = 120
    Top = 135
    Width = 15
    Height = 17
    Caption = #3594#3639#3656#3629
  end
  object Label3: TLabel [2]
    Left = 120
    Top = 166
    Width = 42
    Height = 17
    Caption = #3609#3634#3617#3626#3585#3640#3621
  end
  object Label4: TLabel [3]
    Left = 120
    Top = 197
    Width = 19
    Height = 17
    Caption = #3648#3614#3624
  end
  inherited pnlTPTop: TPanel
    inherited btnTPClose: TBitBtn
      Visible = False
    end
  end
  inherited pnlTPBottom: TPanel
    Top = 392
    Height = 49
    ExplicitLeft = 0
    ExplicitTop = 392
    ExplicitWidth = 624
    ExplicitHeight = 49
    object btnData_Post: TBitBtn
      Left = 208
      Top = 8
      Width = 75
      Height = 33
      Caption = #3610#3633#3609#3607#3638#3585
      TabOrder = 0
      OnClick = btnData_PostClick
    end
    object btnData_Cancel: TBitBtn
      Left = 304
      Top = 8
      Width = 75
      Height = 33
      Caption = #3618#3585#3648#3621#3636#3585
      TabOrder = 1
      OnClick = btnData_CancelClick
    end
  end
  object dbeCode: TDBEdit
    Left = 186
    Top = 101
    Width = 121
    Height = 25
    DataField = 'st_code'
    DataSource = dsData
    TabOrder = 2
  end
  object dbeName: TDBEdit
    Left = 186
    Top = 132
    Width = 121
    Height = 25
    DataField = 'st_name'
    DataSource = dsData
    TabOrder = 3
  end
  object dbeSurName: TDBEdit
    Left = 186
    Top = 163
    Width = 121
    Height = 25
    DataField = 'st_surname'
    DataSource = dsData
    TabOrder = 4
  end
  object dbcGender: TDBComboBox
    Left = 186
    Top = 194
    Width = 145
    Height = 25
    DataField = 'st_gender'
    DataSource = dsData
    Items.Strings = (
      'N'
      'M'
      'F')
    TabOrder = 5
  end
  object dbiStudent: TDBImage
    Left = 184
    Top = 232
    Width = 105
    Height = 105
    DataField = 'st_image'
    DataSource = dsData
    Proportional = True
    Stretch = True
    TabOrder = 6
  end
  object btnCapture: TBitBtn
    Left = 304
    Top = 232
    Width = 75
    Height = 33
    Caption = #3606#3656#3634#3618#3619#3641#3611
    TabOrder = 7
    OnClick = btnCaptureClick
  end
  object btnImageLoad: TBitBtn
    Left = 304
    Top = 271
    Width = 75
    Height = 33
    Caption = #3650#3627#3621#3604#3652#3615#3621#3660
    TabOrder = 8
    OnClick = btnImageLoadClick
  end
  object dsData: TDataSource
    Left = 480
    Top = 8
  end
  object OpenPictureDialog1: TOpenPictureDialog
    DefaultExt = 'bmp'
    Title = #3648#3621#3639#3629#3585#3619#3641#3611#3616#3634#3614
    Left = 456
    Top = 240
  end
end
