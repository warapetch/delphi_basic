inherited FrmTrans_Records: TFrmTrans_Records
  Caption = #3612#3621#3585#3634#3619#3648#3619#3637#3618#3609
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object pnlToolbar: TPanel
    Left = 0
    Top = 90
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 120
    ExplicitTop = 64
    ExplicitWidth = 185
    object btnData_Add: TBitBtn
      Left = 88
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
      Left = 169
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
      Left = 250
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
    Top = 131
    Width = 624
    Height = 269
    Align = alClient
    DataSource = dsqryTrans_Rec
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
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_fullname'
        Title.Caption = #3594#3639#3656#3629' '#3609#3634#3617#3626#3585#3640#3621
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_class'
        Title.Caption = #3594#3633#3657#3609#3648#3619#3637#3618#3609
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_termno'
        Title.Caption = #3648#3607#3629#3617
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_point'
        Title.Caption = #3588#3632#3649#3609#3609#3626#3629#3610
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_grade'
        Title.Caption = #3648#3585#3619#3604
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'st_result'
        Title.Caption = #3612#3656#3634#3609'/'#3652#3617#3656#3612#3656#3634#3609
        Visible = True
      end>
  end
  object pnlTerm: TPanel
    Left = 0
    Top = 49
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 4
    ExplicitTop = 34
    object lblcapTerm: TLabel
      Left = 32
      Top = 12
      Width = 51
      Height = 17
      Caption = #3591#3623#3604#3607#3635#3591#3634#3609
    end
    object cbbClass: TComboBox
      Left = 88
      Top = 9
      Width = 89
      Height = 22
      Style = csOwnerDrawVariable
      TabOrder = 0
      Items.Strings = (
        #3611'1'
        #3611'2'
        #3611'3'
        #3611'4'
        #3611'5'
        #3611'6')
    end
    object edTermNo: TEdit
      Left = 183
      Top = 10
      Width = 121
      Height = 25
      TabOrder = 1
    end
    object btnSetWorkTerm: TBitBtn
      Left = 310
      Top = 10
      Width = 75
      Height = 25
      Caption = #3585#3635#3627#3609#3604
      TabOrder = 2
      OnClick = btnSetWorkTermClick
    end
  end
  object dsqryTrans_Rec: TDataSource
    AutoEdit = False
    DataSet = qryTrans_Rec
    Left = 328
    Top = 216
  end
  object qryTrans_Rec: TFDQuery
    Connection = DMMain.FDConn
    SQL.Strings = (
      'select tr.*,ms.* ,'
      'ms.st_name||'#39' '#39'||ms.st_surname as "st_fullname"'
      'from trans_records tr'
      '  left outer join mas_student ms'
      '       on ms.st_code = tr.st_code  '
      ' '
      'where st_class = :st_class '
      'and st_termno = :st_termno'
      ''
      'order by st_class ,st_termno')
    Left = 328
    Top = 152
    ParamData = <
      item
        Name = 'ST_CLASS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ST_TERMNO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
