object DataModule2: TDataModule2
  Height = 480
  Width = 640
  object Sqlite_demoConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Connected = True
    LoginPrompt = False
    Left = 317
    Top = 94
  end
  object EmployeesTable: TFDQuery
    Active = True
    Connection = Sqlite_demoConnection
    SQL.Strings = (
      'SELECT * FROM Employees')
    Left = 445
    Top = 110
  end
end
