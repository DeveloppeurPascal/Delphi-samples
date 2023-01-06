object dmDBCategories: TdmDBCategories
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 470
  Width = 695
  object dbCategories: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\patrickpremartin\Documents\Embarcadero\Studio\' +
        'Projets\DelphiSamples\FireMonkey-Samples\011-MultiLevelList\src\' +
		'categories-de-dev.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    AfterConnect = dbCategoriesAfterConnect
    Left = 184
    Top = 168
  end
  object tabCategories: TFDTable
    IndexFieldNames = 'code'
    Connection = dbCategories
    TableName = 'categories'
    Left = 192
    Top = 248
    object tabCategoriescode: TFDAutoIncField
      FieldName = 'code'
      Origin = 'code'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tabCategorieslibelle: TWideMemoField
      FieldName = 'libelle'
      Origin = 'libelle'
      Required = True
      BlobType = ftWideMemo
    end
    object tabCategoriesnom_fichier_image: TWideMemoField
      FieldName = 'nom_fichier_image'
      Origin = 'nom_fichier_image'
      Required = True
      BlobType = ftWideMemo
    end
    object tabCategoriescategorie_mere_code: TIntegerField
      FieldName = 'categorie_mere_code'
      Origin = 'categorie_mere_code'
      Required = True
    end
    object tabCategoriesprix_unitaire: TFloatField
      FieldName = 'prix_unitaire'
      Origin = 'prix_unitaire'
      Required = True
    end
  end
end
