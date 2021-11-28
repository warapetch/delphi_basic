inherited FrmTemplate_Student: TFrmTemplate_Student
  PixelsPerInch = 96
  TextHeight = 17
  object pnlTPBGStudent: TPanel
    Left = 0
    Top = 49
    Width = 624
    Height = 152
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 351
    object lblTPcapCode: TLabel
      Left = 168
      Top = 21
      Width = 60
      Height = 17
      Caption = #3619#3627#3633#3626#3609#3633#3585#3648#3619#3637#3618#3609
    end
    object lblTPcapName: TLabel
      Left = 168
      Top = 52
      Width = 15
      Height = 17
      Caption = #3594#3639#3656#3629
    end
    object lblTPcapSurName: TLabel
      Left = 168
      Top = 83
      Width = 42
      Height = 17
      Caption = #3609#3634#3617#3626#3585#3640#3621
    end
    object lblTPcapGender: TLabel
      Left = 168
      Top = 114
      Width = 19
      Height = 17
      Caption = #3648#3614#3624
    end
    object dbiStudent: TDBImage
      Left = 22
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
      Top = 18
      Width = 121
      Height = 25
      DataField = 'st_code'
      DataSource = dsStudent
      Enabled = False
      TabOrder = 1
    end
    object dbeName: TDBEdit
      Left = 234
      Top = 49
      Width = 121
      Height = 25
      DataField = 'st_name'
      DataSource = dsStudent
      Enabled = False
      TabOrder = 2
    end
    object dbeSurName: TDBEdit
      Left = 234
      Top = 80
      Width = 121
      Height = 25
      DataField = 'st_surname'
      DataSource = dsStudent
      Enabled = False
      TabOrder = 3
    end
    object dbcGender: TDBComboBox
      Left = 234
      Top = 111
      Width = 121
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
  object dsStudent: TDataSource
    DataSet = qryMas_Student
    Left = 488
    Top = 80
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
      ''
      'from mas_student'
      ''
      'where st_code = :st_code '
      ''
      'order by st_code')
    Left = 488
    Top = 129
    ParamData = <
      item
        Name = 'ST_CODE'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
  end
end
