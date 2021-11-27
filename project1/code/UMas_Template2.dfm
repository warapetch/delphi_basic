inherited FrmMas_Template2: TFrmMas_Template2
  PixelsPerInch = 96
  TextHeight = 17
  object Label5: TLabel [0]
    Left = 76
    Top = 227
    Width = 40
    Height = 17
    Caption = #3594#3633#3657#3609#3648#3619#3637#3618#3609
  end
  object Label6: TLabel [1]
    Left = 268
    Top = 227
    Width = 25
    Height = 17
    Caption = #3648#3607#3629#3617
  end
  object Label7: TLabel [2]
    Left = 61
    Top = 258
    Width = 54
    Height = 17
    Caption = #3588#3632#3649#3609#3609#3626#3629#3610
  end
  object Label8: TLabel [3]
    Left = 268
    Top = 258
    Width = 23
    Height = 17
    Caption = #3648#3585#3619#3604
  end
  object Label9: TLabel [4]
    Left = 55
    Top = 289
    Width = 61
    Height = 17
    Caption = #3612#3656#3634#3609'/'#3652#3617#3656#3612#3656#3634#3609
  end
  inherited pnlTPBottom: TPanel
    object btnData_Post: TBitBtn
      Left = 207
      Top = 5
      Width = 75
      Height = 33
      Caption = #3610#3633#3609#3607#3638#3585
      TabOrder = 0
      OnClick = btnData_PostClick
    end
    object btnData_Cancel: TBitBtn
      Left = 304
      Top = 5
      Width = 75
      Height = 33
      Caption = #3618#3585#3648#3621#3636#3585
      TabOrder = 1
      OnClick = btnData_CancelClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 49
    Width = 624
    Height = 152
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 168
      Top = 27
      Width = 60
      Height = 17
      Caption = #3619#3627#3633#3626#3609#3633#3585#3648#3619#3637#3618#3609
    end
    object Label2: TLabel
      Left = 168
      Top = 58
      Width = 15
      Height = 17
      Caption = #3594#3639#3656#3629
    end
    object Label3: TLabel
      Left = 168
      Top = 89
      Width = 42
      Height = 17
      Caption = #3609#3634#3617#3626#3585#3640#3621
    end
    object Label4: TLabel
      Left = 168
      Top = 120
      Width = 19
      Height = 17
      Caption = #3648#3614#3624
    end
    object dbiStudent: TDBImage
      Left = 34
      Top = 24
      Width = 105
      Height = 105
      DataField = 'st_image'
      DataSource = dsStudent
      Proportional = True
      Stretch = True
      TabOrder = 0
    end
    object dbeCode: TDBEdit
      Left = 234
      Top = 24
      Width = 121
      Height = 25
      DataField = 'st_code'
      DataSource = dsStudent
      Enabled = False
      TabOrder = 1
    end
    object dbeName: TDBEdit
      Left = 234
      Top = 55
      Width = 121
      Height = 25
      DataField = 'st_name'
      DataSource = dsStudent
      Enabled = False
      TabOrder = 2
    end
    object dbeSurName: TDBEdit
      Left = 234
      Top = 86
      Width = 121
      Height = 25
      DataField = 'st_surname'
      DataSource = dsStudent
      Enabled = False
      TabOrder = 3
    end
    object dbcGender: TDBComboBox
      Left = 234
      Top = 117
      Width = 145
      Height = 25
      DataField = 'st_gender'
      DataSource = dsStudent
      Enabled = False
      Items.Strings = (
        'N'
        'M'
        'F')
      TabOrder = 4
    end
  end
  object dbcClass: TDBEdit
    Left = 122
    Top = 224
    Width = 121
    Height = 25
    DataField = 'st_class'
    DataSource = dsData
    TabOrder = 3
  end
  object dbeTermNo: TDBEdit
    Left = 314
    Top = 224
    Width = 121
    Height = 25
    DataField = 'st_termno'
    DataSource = dsData
    TabOrder = 4
  end
  object dbePoint: TDBEdit
    Left = 122
    Top = 255
    Width = 121
    Height = 25
    DataField = 'st_point'
    DataSource = dsData
    TabOrder = 5
  end
  object dbeGrade: TDBEdit
    Left = 314
    Top = 255
    Width = 121
    Height = 25
    DataField = 'st_grade'
    DataSource = dsData
    TabOrder = 6
  end
  object dbePass: TDBEdit
    Left = 122
    Top = 286
    Width = 121
    Height = 25
    DataField = 'st_result'
    DataSource = dsData
    TabOrder = 7
  end
  object dsStudent: TDataSource
    DataSet = qryMas_Student
    Left = 480
    Top = 88
  end
  object dsData: TDataSource
    Left = 480
    Top = 232
  end
  object qryMas_Student: TFDQuery
    Connection = DMMain.FDConn
    SQL.Strings = (
      'select * ,'
      'case '
      '  when st_gender = '#39#39' then '#39#39
      '  when st_gender = '#39'M'#39' then '#39#3594#3634#3618#39
      '  when st_gender = '#39'F'#39' then '#39#3627#3597#3636#3591#39
      '  else'
      '  '#39#3652#3617#3656#3619#3632#3610#3640#39' '
      'end as "gender_desc"'
      'from mas_student'
      'where st_code = :st_code'
      ''
      'order by st_code')
    Left = 480
    Top = 137
    ParamData = <
      item
        Name = 'ST_CODE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
