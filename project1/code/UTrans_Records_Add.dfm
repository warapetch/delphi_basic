inherited FrmTrans_Records_Add: TFrmTrans_Records_Add
  Caption = #3612#3621#3585#3634#3619#3648#3619#3637#3618#3609
  ClientHeight = 368
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 17
  object lblPoint: TLabel [0]
    Left = 61
    Top = 249
    Width = 54
    Height = 17
    Caption = #3588#3632#3649#3609#3609#3626#3629#3610
  end
  object lblGrade: TLabel [1]
    Left = 284
    Top = 249
    Width = 23
    Height = 17
    Caption = #3648#3585#3619#3604
  end
  object lblPass: TLabel [2]
    Left = 55
    Top = 280
    Width = 61
    Height = 17
    Caption = #3612#3656#3634#3609'/'#3652#3617#3656#3612#3656#3634#3609
  end
  inherited pnlTPBottom: TPanel
    Top = 320
    Height = 48
    ExplicitTop = 320
    ExplicitHeight = 48
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
  inherited pnlTPBGStudent: TPanel
    ExplicitWidth = 624
  end
  object dbePoint: TDBEdit [6]
    Left = 122
    Top = 246
    Width = 121
    Height = 25
    DataField = 'st_point'
    DataSource = dsData
    TabOrder = 3
  end
  object dbeGrade: TDBEdit [7]
    Left = 314
    Top = 246
    Width = 121
    Height = 25
    DataField = 'st_grade'
    DataSource = dsData
    TabOrder = 4
  end
  object dbePass: TDBEdit [8]
    Left = 122
    Top = 277
    Width = 121
    Height = 25
    DataField = 'st_result'
    DataSource = dsData
    TabOrder = 5
  end
  object pnlWorkTerm: TPanel [9]
    Left = 0
    Top = 201
    Width = 624
    Height = 39
    Align = alTop
    Color = 16774636
    ParentBackground = False
    TabOrder = 6
    object lblClass: TLabel
      Left = 74
      Top = 11
      Width = 40
      Height = 17
      Caption = #3594#3633#3657#3609#3648#3619#3637#3618#3609
    end
    object lblTerm: TLabel
      Left = 283
      Top = 11
      Width = 25
      Height = 17
      Caption = #3648#3607#3629#3617
    end
    object dbeClass: TDBEdit
      Left = 122
      Top = 6
      Width = 121
      Height = 25
      DataField = 'st_class'
      DataSource = dsData
      TabOrder = 0
    end
    object dbeTermNo: TDBEdit
      Left = 314
      Top = 6
      Width = 121
      Height = 25
      DataField = 'st_termno'
      DataSource = dsData
      TabOrder = 1
    end
  end
  object dsData: TDataSource
    Left = 496
    Top = 224
  end
end
