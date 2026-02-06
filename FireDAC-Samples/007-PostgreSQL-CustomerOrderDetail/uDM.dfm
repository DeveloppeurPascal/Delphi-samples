object DataModule3: TDataModule3
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=Embarcadero'
      'User_Name=postgres'
      'Password=root75'
      'Server=localhost'
      'DriverID=PG')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnection1AfterConnect
    Left = 216
    Top = 184
  end
  object tabCustomers: TFDTable
    ActiveStoredUsage = [auDesignTime]
    Active = True
    IndexFieldNames = 'customerid'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    UpdateOptions.EnableUpdate = False
    TableName = '"Customers"'
    Left = 360
    Top = 168
  end
end
