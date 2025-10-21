object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 394
  Width = 605
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Connected = True
    LoginPrompt = False
    Left = 81
    Top = 42
  end
  object EmployeeTable: TFDQuery
    Connection = EmployeeConnection
    SQL.Strings = (
      'SELECT * FROM EMPLOYEES')
    Left = 217
    Top = 162
  end
  object DataSource1: TDataSource
    DataSet = EmployeeTable
    Left = 272
    Top = 64
  end
end
