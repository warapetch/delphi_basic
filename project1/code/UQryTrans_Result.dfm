inherited FrmQryTrans_Result: TFrmQryTrans_Result
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #3619#3634#3618#3591#3634#3609#3612#3621#3585#3634#3619#3648#3619#3637#3618#3609' ('#3649#3618#3585#3594#3633#3657#3609')'
  ClientWidth = 753
  ExplicitWidth = 769
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnlTPTop: TPanel
    Width = 753
    ExplicitWidth = 753
    inherited btnTPClose: TBitBtn
      Left = 664
      Top = 10
      ExplicitLeft = 664
      ExplicitTop = 10
    end
  end
  inherited pnlTPBottom: TPanel
    Width = 753
    ExplicitWidth = 753
  end
  object pnlToolBar: TPanel
    Left = 0
    Top = 49
    Width = 753
    Height = 41
    Align = alTop
    TabOrder = 2
    object lblCapClass: TLabel
      Left = 48
      Top = 9
      Width = 40
      Height = 17
      Caption = #3594#3633#3657#3609#3648#3619#3637#3618#3609
    end
    object cbbClass: TComboBox
      Left = 96
      Top = 6
      Width = 97
      Height = 28
      Style = csOwnerDrawVariable
      ItemHeight = 22
      TabOrder = 0
      OnCloseUp = cbbClassCloseUp
      Items.Strings = (
        #3611'1'
        #3611'2'
        #3611'3'
        #3611'4'
        #3611'5'
        #3611'6')
    end
    object btnSearch: TBitBtn
      Left = 205
      Top = 3
      Width = 75
      Height = 33
      Caption = #3649#3626#3604#3591#3586#3657#3629#3617#3641#3621
      TabOrder = 1
      OnClick = btnSearchClick
    end
    object btnReport: TBitBtn
      Left = 309
      Top = 3
      Width = 75
      Height = 33
      Caption = #3614#3636#3617#3614#3660
      TabOrder = 2
      OnClick = btnReportClick
    end
  end
  object dbgData: TDBGrid
    Left = 0
    Top = 90
    Width = 753
    Height = 310
    Align = alClient
    DataSource = dsqryData
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object dsqryData: TDataSource
    AutoEdit = False
    DataSet = qryData
    Left = 472
    Top = 256
  end
  object qryData: TFDQuery
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
      'from mas_student ms'
      '    left outer join trans_records tr'
      '         on tr.st_code = ms.st_code'
      '        and tr.st_class = ms.st_class '
      ''
      'where ms.st_class = :st_class'
      ''
      'order by ms.st_code')
    Left = 472
    Top = 184
    ParamData = <
      item
        Name = 'ST_CLASS'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryDatast_code: TStringField
      DisplayLabel = #3619#3627#3633#3626#3609#3633#3585#3648#3619#3637#3618#3609
      DisplayWidth = 10
      FieldName = 'st_code'
      Origin = 'st_code'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      FixedChar = True
      Size = 10
    end
    object qryDatast_name: TStringField
      DisplayLabel = #3594#3639#3656#3629
      DisplayWidth = 16
      FieldName = 'st_name'
      Origin = 'st_name'
      Required = True
      FixedChar = True
      Size = 30
    end
    object qryDatast_surname: TStringField
      DisplayLabel = #3609#3634#3617#3626#3585#3640#3621
      DisplayWidth = 21
      FieldName = 'st_surname'
      Origin = 'st_surname'
      Required = True
      FixedChar = True
      Size = 60
    end
    object qryDatagender_desc: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #3648#3614#3624
      DisplayWidth = 10
      FieldName = 'gender_desc'
      Origin = 'gender_desc'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryDatast_termno: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = #3648#3607#3629#3617
      FieldName = 'st_termno'
      Origin = 'st_termno'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryDatast_point: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = #3588#3632#3649#3609#3609#3626#3629#3610
      FieldName = 'st_point'
      Origin = 'st_point'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryDatast_grade: TFloatField
      AutoGenerateValue = arDefault
      DisplayLabel = #3648#3585#3619#3604
      FieldName = 'st_grade'
      Origin = 'st_grade'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryDatast_result: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = #3612#3656#3634#3609'/'#3652#3617#3656#3612#3656#3634#3609
      FieldName = 'st_result'
      Origin = 'st_result'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object qryDatast_gender: TStringField
      FieldName = 'st_gender'
      Origin = 'st_gender'
      FixedChar = True
      Size = 1
    end
    object qryDatast_class: TStringField
      FieldName = 'st_class'
      Origin = 'st_class'
      Required = True
      FixedChar = True
      Size = 2
    end
  end
  object fdbData: TfrxDBDataset
    UserName = 'data'
    CloseDataSource = False
    FieldAliases.Strings = (
      'st_code=st_code'
      'st_name=st_name'
      'st_surname=st_surname'
      'gender_desc=gender_desc'
      'st_termno=st_termno'
      'st_point=st_point'
      'st_grade=st_grade'
      'st_result=st_result'
      'st_gender=st_gender'
      'st_class=st_class')
    DataSet = qryData
    BCDToCurrency = False
    Left = 320
    Top = 240
  end
  object frxReport: TfrxReport
    Version = '6.9.15'
    DotMatrixReport = False
    EngineOptions.DoublePass = True
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.AllowPreviewEdit = False
    PreviewOptions.Buttons = [pbPrint, pbZoom, pbFind, pbNavigator, pbNoFullScreen]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44529.402944513900000000
    ReportOptions.LastChange = 44529.427793680600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 320
    Top = 176
    Datasets = <
      item
        DataSet = fdbData
        DataSetName = 'data'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 215.900000000000000000
      PaperHeight = 279.400000000000000000
      PaperSize = 1
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 105.826840000000000000
        Top = 18.897650000000000000
        Width = 740.409927000000000000
        object Memo1: TfrxMemoView
          Align = baCenter
          AllowVectorExport = True
          Left = 20.598438500000000000
          Top = 18.897650000000000000
          Width = 699.213050000000000000
          Height = 37.795300000000000000
          Font.Charset = THAI_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            #3619#3634#3618#3591#3634#3609#3612#3621#3585#3634#3619#3648#3619#3637#3618#3609' [<data."st_class">]  '#3648#3607#3629#3617' [data."st_termno"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 79.370130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = fdbData
          DataSetName = 'data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #3619#3627#3633#3626#3609#3633#3585#3648#3619#3637#3618#3609)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 124.724490000000000000
          Top = 79.370130000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataSet = fdbData
          DataSetName = 'data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #3594#3639#3656#3629)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 79.370130000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataSet = fdbData
          DataSetName = 'data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #3609#3634#3617#3626#3585#3640#3621)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 79.370130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = fdbData
          DataSetName = 'data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            #3648#3585#3619#3604)
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 102.047310000000000000
          Width = 521.575140000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 185.196970000000000000
        Width = 740.409927000000000000
        DataSet = fdbData
        DataSetName = 'data'
        RowCount = 0
        object datast_code: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'st_code'
          DataSet = fdbData
          DataSetName = 'data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[data."st_code"]')
          ParentFont = False
        end
        object datast_name: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 124.724490000000000000
          Top = 3.779530000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'st_name'
          DataSet = fdbData
          DataSetName = 'data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[data."st_name"]')
          ParentFont = False
        end
        object datast_surname: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 264.567100000000000000
          Top = 3.779530000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataField = 'st_surname'
          DataSet = fdbData
          DataSetName = 'data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[data."st_surname"]')
          ParentFont = False
        end
        object datagender_desc: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = fdbData
          DataSetName = 'data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[data."st_grade"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 336.378170000000000000
        Width = 740.409927000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Top = 2.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[<Page#>] / [<TotalPages#>]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 275.905690000000000000
        Width = 740.409927000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 11.338590000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            #3592#3635#3609#3623#3609'  [COUNT(MasterData1)] '#3588#3609)
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 3.779530000000000000
          Width = 532.913730000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
      end
    end
  end
end
