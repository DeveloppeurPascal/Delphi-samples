object DataModule2: TDataModule2
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=devdatabase'
      'User_Name=devuser'
      'Server=localhost'
      'Password=devpassword'
      'DriverID=MySQL')
    ConnectedStoredUsage = [auDesignTime]
    AfterConnect = FDConnection1AfterConnect
    BeforeConnect = FDConnection1BeforeConnect
    Left = 104
    Top = 128
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorHome = 'C:\Dev\MySQL-Client\Win32\lib'
    VendorLib = '..\libmysql.dll'
    Left = 368
    Top = 64
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 160
    Top = 192
  end
end
