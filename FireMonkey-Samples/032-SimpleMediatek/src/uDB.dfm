object dmDB: TdmDB
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\Dev\___samples\Delphi-samples\FireMonkey-Samples\032' +
        '-SimpleMediatek\db\dev.db'
      'LockingMode=normal'
      'DriverID=SQLite')
    ConnectedStoredUsage = [auDesignTime]
    Connected = True
    LoginPrompt = False
    AfterConnect = FDConnection1AfterConnect
    BeforeConnect = FDConnection1BeforeConnect
    Left = 304
    Top = 224
  end
  object FDScript1: TFDScript
    SQLScripts = <
      item
        Name = 'CreateDB'
        SQL.Strings = (
          'CREATE TABLE media ('
          '  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          '  titre VARCHAR(255) NULL,'
          '  gencod VARCHAR(50) NULL,'
          '  support_type_id INTEGER NOT NULL'
          ');'
          ''
          'CREATE TABLE emprunts ('
          '  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          '  date_loc DATE NULL,'
          '  heure_loc TIME NULL,'
          '  media_id INTEGER NOT NULL,'
          '  personne_id INTEGER NOT NULL,'
          '  rendu BIT NOT NULL'
          ');'
          ''
          'CREATE TABLE support_type ('
          '  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          '  libelle VARCHAR(50) NULL'
          ');'
          ''
          'CREATE TABLE personnes ('
          '  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'
          '  nom VARCHAR(50) NULL,'
          '  email VARCHAR(255) NULL,'
          '  tel VARCHAR(50) NULL'
          ');'
          ''
          'CREATE UNIQUE INDEX suptyp_par_libelle ON support_type'
          '  (libelle,id);'
          ''
          'CREATE UNIQUE INDEX emprunts_par_media ON emprunts'
          '  (media_id,date_loc,heure_loc,personne_id,id);'
          ''
          'CREATE UNIQUE INDEX emprunts_par_personne ON emprunts'
          '  (personne_id,date_loc,heure_loc,media_id,id);'
          ''
          'CREATE UNIQUE INDEX personnes_par_email ON personnes'
          '  (email,id);'
          ''
          'CREATE UNIQUE INDEX personnes_par_nom ON personnes'
          '  (nom,id);'
          ''
          'CREATE UNIQUE INDEX media_par_gencod ON media'
          '  (gencod,id);'
          ''
          'CREATE UNIQUE INDEX media_par_titre ON media'
          '  (titre,id);')
      end>
    Connection = FDConnection1
    Params = <>
    Macros = <>
    Left = 488
    Top = 184
  end
  object tabMediaType: TFDTable
    IndexName = 'suptyp_par_libelle'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'support_type'
    Left = 448
    Top = 336
  end
  object tabEmprunteurs: TFDTable
    IndexName = 'personnes_par_nom'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'personnes'
    Left = 320
    Top = 336
  end
  object tabMedia: TFDTable
    IndexName = 'media_par_titre'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'media'
    Left = 424
    Top = 120
    object tabMediaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object tabMediatitre: TStringField
      DisplayWidth = 255
      FieldName = 'titre'
      Origin = 'titre'
      Size = 255
    end
    object tabMediagencod: TStringField
      FieldName = 'gencod'
      Origin = 'gencod'
      Size = 50
    end
    object tabMediasupport_type_id: TIntegerField
      FieldName = 'support_type_id'
      Origin = 'support_type_id'
      Required = True
    end
    object tabMediaMediaTypeLibelle: TStringField
      FieldKind = fkLookup
      FieldName = 'MediaTypeLibelle'
      LookupDataSet = tabMediaType
      LookupKeyFields = 'id'
      LookupResultField = 'libelle'
      KeyFields = 'support_type_id'
      Lookup = True
    end
  end
  object tabEmprunts: TFDTable
    OnCalcFields = tabEmpruntsCalcFields
    IndexFieldNames = 'id'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'emprunts'
    Left = 528
    Top = 264
    object tabEmpruntsid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = False
    end
    object tabEmpruntsdate_loc: TDateField
      FieldName = 'date_loc'
      Origin = 'date_loc'
    end
    object tabEmpruntsheure_loc: TTimeField
      FieldName = 'heure_loc'
      Origin = 'heure_loc'
    end
    object tabEmpruntsmedia_id: TIntegerField
      FieldName = 'media_id'
      Origin = 'media_id'
      Required = True
    end
    object tabEmpruntspersonne_id: TIntegerField
      FieldName = 'personne_id'
      Origin = 'personne_id'
      Required = True
    end
    object tabEmpruntsrendu: TBooleanField
      FieldName = 'rendu'
      Origin = 'rendu'
      Required = True
    end
    object tabEmpruntsemprunteur: TStringField
      FieldKind = fkLookup
      FieldName = 'emprunteur'
      LookupDataSet = tabEmprunteurs
      LookupKeyFields = 'id'
      LookupResultField = 'nom'
      KeyFields = 'personne_id'
      Lookup = True
    end
    object tabEmpruntsmedia: TStringField
      FieldKind = fkLookup
      FieldName = 'media'
      LookupDataSet = tabMedia
      LookupKeyFields = 'id'
      LookupResultField = 'titre'
      KeyFields = 'media_id'
      Lookup = True
    end
    object tabEmpruntsestrendu: TStringField
      FieldKind = fkCalculated
      FieldName = 'estrendu'
      Calculated = True
    end
  end
end
