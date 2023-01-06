object dmDBPourAffichage: TdmDBPourAffichage
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 358
  Width = 543
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
    Left = 183
    Top = 118
  end
end
