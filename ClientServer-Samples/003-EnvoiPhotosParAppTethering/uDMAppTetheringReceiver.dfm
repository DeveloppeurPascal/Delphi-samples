object dmAppTetheringReceiver: TdmAppTetheringReceiver
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object TetheringManager1: TTetheringManager
    Text = 'TetheringManager1'
    AllowedAdapters = 'Network'
    Left = 136
    Top = 104
  end
  object TetheringAppProfile1: TTetheringAppProfile
    Manager = TetheringManager1
    Text = 'TetheringAppProfile1'
    Actions = <>
    Resources = <
      item
        Name = 'Bitmap'
        IsPublic = True
        Kind = Mirror
        ResType = Stream
      end>
    OnAcceptResource = TetheringAppProfile1AcceptResource
    OnResourceReceived = TetheringAppProfile1ResourceReceived
    Left = 272
    Top = 96
  end
end
