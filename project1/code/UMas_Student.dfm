inherited FrmMas_Student: TFrmMas_Student
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #3607#3632#3648#3610#3637#3618#3609#3609#3633#3585#3648#3619#3637#3618#3609
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnlTPTop: TPanel
    inherited btnTPClose: TBitBtn
      ParentFont = False
    end
  end
  object pnlToolbar: TPanel
    Left = 0
    Top = 49
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 2
    object btnData_Add: TBitBtn
      Left = 48
      Top = 4
      Width = 75
      Height = 33
      Caption = #3648#3614#3636#3656#3617
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnData_AddClick
    end
    object btnData_Edit: TBitBtn
      Left = 129
      Top = 4
      Width = 75
      Height = 33
      Caption = #3649#3585#3657#3652#3586
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnData_EditClick
    end
    object btnData_Delete: TBitBtn
      Left = 210
      Top = 4
      Width = 75
      Height = 33
      Caption = #3621#3610
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnData_DeleteClick
    end
  end
  object dbgMas_Student: TDBGrid
    Left = 0
    Top = 90
    Width = 624
    Height = 310
    Align = alClient
    DataSource = dsqryMas_Student
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'st_code'
        Title.Caption = #3619#3627#3633#3626#3609#3633#3585#3648#3619#3637#3618#3609
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_name'
        Title.Caption = #3594#3639#3656#3629
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_surname'
        Title.Caption = #3609#3634#3617#3626#3585#3640#3621
        Width = 152
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'gender_desc'
        Title.Caption = #3648#3614#3624
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_class'
        Title.Caption = #3594#3633#3657#3609#3648#3619#3637#3618#3609
        Visible = True
      end>
  end
  object dsqryMas_Student: TDataSource
    DataSet = qryMas_Student
    Left = 216
    Top = 216
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
      'order by st_code')
    Left = 216
    Top = 152
  end
end
