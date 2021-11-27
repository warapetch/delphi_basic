object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 509
  ClientWidth = 814
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 21
  object DBGrid1: TDBGrid
    Left = 16
    Top = 280
    Width = 409
    Height = 129
    DataSource = dsQryTrans_Records
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object dbgStudent: TDBGrid
    Left = 16
    Top = 89
    Width = 587
    Height = 185
    DataSource = dsMas_Student
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'st_code'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_surname'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_fullname'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_gender'
        PickList.Strings = (
          'M '#3594#3634#3618
          'F '#3627#3597#3636#3591
          'N '#3652#3617#3656#3619#3632#3610#3640)
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_image'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_money1'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_money2'
        Width = 65
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 17
    Width = 240
    Height = 25
    DataSource = dsMas_Student
    TabOrder = 2
  end
  object mmLog: TMemo
    Left = 16
    Top = 416
    Width = 409
    Height = 85
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object edtFilter: TEdit
    Left = 328
    Top = 8
    Width = 145
    Height = 29
    TabOrder = 4
    Text = 'st_gender = '#39'F'#39
  end
  object btnFilter: TButton
    Left = 480
    Top = 8
    Width = 75
    Height = 34
    Caption = 'Filter'
    TabOrder = 5
    OnClick = btnFilterClick
  end
  object edtLocate: TEdit
    Left = 19
    Top = 54
    Width = 145
    Height = 29
    TabOrder = 6
  end
  object btnLocate: TButton
    Left = 167
    Top = 52
    Width = 75
    Height = 34
    Caption = 'Locate'
    TabOrder = 7
    OnClick = btnLocateClick
  end
  object btnBM_Get: TButton
    Left = 315
    Top = 48
    Width = 94
    Height = 34
    Caption = 'BM-Get'
    TabOrder = 8
    OnClick = btnBM_GetClick
  end
  object btnBM_Goto: TButton
    Left = 411
    Top = 48
    Width = 94
    Height = 34
    Caption = 'BM-Goto'
    TabOrder = 9
    OnClick = btnBM_GotoClick
  end
  object btnBM_Free: TButton
    Left = 511
    Top = 48
    Width = 94
    Height = 34
    Caption = 'BM-Free'
    TabOrder = 10
    OnClick = btnBM_FreeClick
  end
  object DBEdit1: TDBEdit
    Left = 431
    Top = 280
    Width = 121
    Height = 29
    DataField = 'st_code'
    DataSource = dsMas_Student
    TabOrder = 11
  end
  object DBEdit2: TDBEdit
    Left = 431
    Top = 315
    Width = 172
    Height = 29
    DataField = 'st_name'
    DataSource = dsMas_Student
    TabOrder = 12
  end
  object DBEdit3: TDBEdit
    Left = 431
    Top = 350
    Width = 172
    Height = 29
    DataField = 'st_surname'
    DataSource = dsMas_Student
    TabOrder = 13
  end
  object Button1: TButton
    Left = 446
    Top = 400
    Width = 109
    Height = 25
    Caption = 'Loop'
    TabOrder = 14
    OnClick = Button1Click
  end
  object DBEdit4: TDBEdit
    Left = 431
    Top = 431
    Width = 124
    Height = 29
    DataField = 'st_sum_money1'
    DataSource = dsMas_Student
    TabOrder = 15
  end
  object DBEdit5: TDBEdit
    Left = 431
    Top = 466
    Width = 124
    Height = 29
    DataField = 'st_sum_money2'
    DataSource = dsMas_Student
    TabOrder = 16
  end
  object Button2: TButton
    Left = 234
    Top = 52
    Width = 75
    Height = 34
    Caption = 'Locate'
    TabOrder = 17
    OnClick = Button2Click
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=data\dbstudent.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    FetchOptions.AssignedValues = [evRecordCountMode, evUnidirectional]
    LoginPrompt = False
    Left = 696
    Top = 24
  end
  object tbMas_Student: TFDTable
    BeforeInsert = tbMas_StudentBeforeInsert
    AfterInsert = tbMas_StudentAfterInsert
    AfterEdit = tbMas_StudentAfterEdit
    BeforePost = tbMas_StudentBeforePost
    BeforeScroll = tbMas_StudentBeforeScroll
    AfterScroll = tbMas_StudentAfterScroll
    OnCalcFields = tbMas_StudentCalcFields
    OnNewRecord = tbMas_StudentNewRecord
    FilterOptions = [foNoPartialCompare]
    OnFilterRecord = tbMas_StudentFilterRecord
    IndexFieldNames = 'st_code'
    AggregatesActive = True
    Connection = FDConnection1
    TableName = 'mas_student'
    Left = 408
    Top = 120
    object tbMas_Studentst_code: TStringField
      DisplayLabel = #3619#3627#3633#3626
      DisplayWidth = 10
      FieldName = 'st_code'
      Origin = 'st_code'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
    object tbMas_Studentst_fullname: TStringField
      DisplayLabel = #3594#3639#3656#3629' '#3609#3634#3617#3626#3585#3640#3621
      DisplayWidth = 22
      FieldKind = fkCalculated
      FieldName = 'st_fullname'
      Size = 100
      Calculated = True
    end
    object tbMas_Studentst_gender: TStringField
      DisplayLabel = #3648#3614#3624
      DisplayWidth = 4
      FieldName = 'st_gender'
      Origin = 'st_gender'
      FixedChar = True
      Size = 1
    end
    object tbMas_Studentst_image: TBlobField
      DisplayLabel = #3619#3641#3611
      DisplayWidth = 5
      FieldName = 'st_image'
      Origin = 'st_image'
    end
    object tbMas_Studentst_name: TStringField
      DisplayWidth = 12
      FieldName = 'st_name'
      Origin = 'st_name'
      Required = True
      FixedChar = True
      Size = 30
    end
    object tbMas_Studentst_surname: TStringField
      DisplayWidth = 15
      FieldName = 'st_surname'
      Origin = 'st_surname'
      Required = True
      FixedChar = True
      Size = 60
    end
    object tbMas_Studentst_money1: TFloatField
      FieldName = 'st_money1'
      Origin = 'st_money1'
      DisplayFormat = '#,0'
    end
    object tbMas_Studentst_money2: TFloatField
      FieldName = 'st_money2'
      Origin = 'st_money2'
      DisplayFormat = '#,0'
    end
    object tbMas_Studentst_sum_money: TAggregateField
      DisplayLabel = 'Sum1'
      FieldName = 'st_sum_money1'
      Visible = True
      Active = True
      DisplayName = 'st_sum_money1'
      DisplayFormat = '#,0'
      Expression = 'sum(st_money1)'
    end
    object tbMas_Studentst_sum_money2: TAggregateField
      DisplayLabel = 'Sum2'
      FieldName = 'st_sum_money2'
      Visible = True
      Active = True
      DisplayName = 'st_sum_money2'
      DisplayFormat = '#,0'
      Expression = 'sum(st_money2)'
    end
  end
  object qryTrans_Records: TFDQuery
    MasterSource = dsMas_Student
    MasterFields = 'st_code'
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'select *'
      'from trans_records'
      'where st_code = :st_code ')
    Left = 144
    Top = 424
    ParamData = <
      item
        Name = 'ST_CODE'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 10
        Value = '640001'
      end>
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    ScreenCursor = gcrHourGlass
    Left = 832
    Top = 32
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 832
    Top = 88
  end
  object dsMas_Student: TDataSource
    DataSet = tbMas_Student
    OnStateChange = dsMas_StudentStateChange
    OnDataChange = dsMas_StudentDataChange
    OnUpdateData = dsMas_StudentUpdateData
    Left = 408
    Top = 184
  end
  object dsQryTrans_Records: TDataSource
    DataSet = qryTrans_Records
    Left = 256
    Top = 424
  end
end
