object DMMain: TDMMain
  Height = 201
  Width = 389
  PixelsPerInch = 96
  object FDConn: TFDConnection
    Params.Strings = (
      
        'Database=D:\delphi_basic\delphi_rest_api\horse\demo_horse_api2\W' +
        'in32\Debug\EMP.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'DriverID=FB')
    LoginPrompt = False
    Left = 80
    Top = 32
  end
  object qryTemp2: TFDQuery
    Connection = FDConn2
    Left = 160
    Top = 128
  end
  object FDConn2: TFDConnection
    Params.Strings = (
      
        'Database=D:\delphi_basic\delphi_rest_api\horse\demo_horse_api2\W' +
        'in32\Debug\data.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 88
    Top = 128
  end
  object qryTemp: TFDQuery
    Connection = FDConn
    Left = 168
    Top = 32
  end
end
