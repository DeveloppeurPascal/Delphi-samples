object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 520
    Top = 176
  end
  object Sqlite_demoConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Connected = True
    LoginPrompt = False
    Left = 312
    Top = 169
  end
  object CustomersTable: TFDQuery
    Active = True
    Connection = Sqlite_demoConnection
    SQL.Strings = (
      'SELECT * FROM Customers')
    Left = 304
    Top = 305
  end
end
