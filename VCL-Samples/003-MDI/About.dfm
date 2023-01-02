object AboutBox: TAboutBox
  Left = 445
  Top = 127
  ActiveControl = OKButton
  BorderStyle = bsDialog
  Caption = 'A propos'
  ClientHeight = 218
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 281
    Height = 161
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    BevelOuter = bvLowered
    TabOrder = 0
    object ProgramIcon: TImage
      Left = 8
      Top = 8
      Width = 65
      Height = 57
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      IsControl = True
    end
    object ProductName: TLabel
      Left = 88
      Top = 16
      Width = 68
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Nom du produit'
      IsControl = True
    end
    object Version: TLabel
      Left = 88
      Top = 40
      Width = 35
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Version'
      IsControl = True
    end
    object Copyright: TLabel
      Left = 8
      Top = 80
      Width = 44
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Copyright'
      IsControl = True
    end
    object Comments: TLabel
      Left = 8
      Top = 104
      Width = 49
      Height = 13
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Commentaires'
      WordWrap = True
      IsControl = True
    end
  end
  object OKButton: TButton
    Left = 120
    Top = 178
    Width = 65
    Height = 33
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    IsControl = True
  end
end
