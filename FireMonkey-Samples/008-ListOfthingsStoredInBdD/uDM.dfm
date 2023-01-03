object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 408
  Width = 543
  object FDMemTable1: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 128
    Top = 168
    object FDMemTable1id: TAutoIncField
      FieldName = 'id'
    end
    object FDMemTable1libelle: TStringField
      FieldName = 'libelle'
    end
    object FDMemTable1coche: TBooleanField
      FieldName = 'coche'
    end
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 120
    Top = 224
  end
end
