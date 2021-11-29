inherited FrmDlg_Search_Student: TFrmDlg_Search_Student
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #3588#3657#3609#3627#3634#3609#3633#3585#3648#3619#3637#3618#3609
  ClientWidth = 469
  ExplicitWidth = 485
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnlTPTop: TPanel
    Width = 469
    ExplicitWidth = 469
  end
  inherited pnlTPBottom: TPanel
    Width = 469
    ExplicitWidth = 469
    object btnSearchOK: TBitBtn
      Left = 118
      Top = 4
      Width = 75
      Height = 33
      Caption = #3648#3621#3639#3629#3585
      TabOrder = 0
      OnClick = btnSearchOKClick
    end
    object btnSearchCancel: TBitBtn
      Left = 209
      Top = 4
      Width = 75
      Height = 33
      Caption = #3618#3585#3648#3621#3636#3585
      TabOrder = 1
      OnClick = btnSearchCancelClick
    end
  end
  object pnlSearch: TPanel
    Left = 0
    Top = 49
    Width = 469
    Height = 41
    Align = alTop
    TabOrder = 2
    object lblSearch: TLabel
      Left = 16
      Top = 8
      Width = 49
      Height = 17
      Caption = #3588#3657#3609#3627#3634#3592#3634#3585
    end
    object edtSearch: TEdit
      Left = 215
      Top = 6
      Width = 138
      Height = 25
      TabOrder = 2
      OnKeyPress = edtSearchKeyPress
    end
    object btnSearch: TBitBtn
      Left = 359
      Top = 4
      Width = 75
      Height = 33
      Caption = #3588#3657#3609#3627#3634
      TabOrder = 3
      OnClick = btnSearchClick
    end
    object rbtCode: TRadioButton
      Left = 83
      Top = 9
      Width = 57
      Height = 17
      Caption = #3619#3627#3633#3626
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbtCodeClick
    end
    object rbtName: TRadioButton
      Left = 151
      Top = 9
      Width = 58
      Height = 17
      Caption = #3594#3639#3656#3629
      TabOrder = 1
      OnClick = rbtCodeClick
    end
  end
  object dbgMas_Student: TDBGrid
    Left = 0
    Top = 90
    Width = 469
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
      end>
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
      ''
      '--10'
      ''
      'order by st_code')
    Left = 216
    Top = 192
  end
  object dsqryMas_Student: TDataSource
    DataSet = qryMas_Student
    Left = 216
    Top = 256
  end
end
