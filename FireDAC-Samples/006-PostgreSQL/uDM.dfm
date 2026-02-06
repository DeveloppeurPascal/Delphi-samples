object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=PG_Demo')
    SecurityOptions.AllowedCommandKinds = [skSelect, skSelectForLock, skSelectForUnLock]
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 224
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'employeeid'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = '"Employees"'
    Left = 312
    Top = 296
  end
end
