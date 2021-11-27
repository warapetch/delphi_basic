object DMMain: TDMMain
  OnCreate = DataModuleCreate
  Height = 201
  Width = 389
  PixelsPerInch = 96
  object FDConn: TFDConnection
    Params.Strings = (
      'Database=D:\project1\data\dbstudent.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    BeforeConnect = FDConnBeforeConnect
    Left = 136
    Top = 48
  end
end
