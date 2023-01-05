object frmAccueil: TfrmAccueil
  Left = 0
  Top = 0
  Caption = 'Exemple avec TVirtualImageList et TImageCollection'
  ClientHeight = 222
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 40
    Top = 136
    Width = 129
    Height = 49
    Action = actSpeedButton
    Images = VirtualImageList1
  end
  object Button1: TButton
    Left = 40
    Top = 56
    Width = 75
    Height = 25
    Action = actButton
    Images = VirtualImageList1
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 96
    Width = 75
    Height = 25
    Action = actBitBtn
    Caption = 'B&itBtn'
    Images = VirtualImageList1
    TabOrder = 1
  end
  object ActionList1: TActionList
    Images = VirtualImageList1
    Left = 400
    Top = 104
    object actQuitter: TAction
      Caption = '&Quitter'
      ImageIndex = 0
      ImageName = '198'
      OnExecute = actQuitterExecute
    end
    object actButton: TAction
      Caption = '&Button'
      ImageIndex = 1
      ImageName = '199'
      OnExecute = actButtonExecute
    end
    object actBitBtn: TAction
      Caption = 'B&itBtn'
      ImageIndex = 2
      ImageName = '200'
      OnExecute = actBitBtnExecute
    end
    object actSpeedButton: TAction
      Caption = 'Sp&eedButton'
      ImageIndex = 3
      ImageName = '201'
      OnExecute = actSpeedButtonExecute
    end
  end
  object MainMenu1: TMainMenu
    Images = VirtualImageList1
    Left = 360
    Top = 48
    object Fichier1: TMenuItem
      Caption = 'Fichier'
      object Quitter1: TMenuItem
        Action = actQuitter
      end
    end
    object Actions1: TMenuItem
      Caption = 'Actions'
      object Bouton1: TMenuItem
        Action = actButton
      end
      object BitBtn2: TMenuItem
        Action = actBitBtn
      end
      object SpeedButton2: TMenuItem
        Action = actSpeedButton
      end
    end
  end
  object VirtualImageList1: TVirtualImageList
    AutoFill = True
    DisabledGrayscale = False
    DisabledSuffix = '_Disabled'
    Images = <
      item
        CollectionIndex = 0
        CollectionName = '198'
        Disabled = False
        Name = '198'
      end
      item
        CollectionIndex = 1
        CollectionName = '199'
        Disabled = False
        Name = '199'
      end
      item
        CollectionIndex = 2
        CollectionName = '200'
        Disabled = False
        Name = '200'
      end
      item
        CollectionIndex = 3
        CollectionName = '201'
        Disabled = False
        Name = '201'
      end>
    ImageCollection = dmImages.ImageCollection1
    Left = 232
    Top = 128
  end
end
