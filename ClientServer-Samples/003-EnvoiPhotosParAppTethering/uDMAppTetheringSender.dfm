object dmAppTetheringSender: TdmAppTetheringSender
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object TetheringManager1: TTetheringManager
    Text = 'TetheringManager1'
    AllowedAdapters = 'Network'
    Left = 232
    Top = 112
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = TetheringManager1
    Text = 'TetheringAppProfile1'
    Actions = <>
    Resources = <
      item
        Name = 'Bitmap'
        IsPublic = True
        ResType = Stream
      end>
    Left = 392
    Top = 112
  end
end
