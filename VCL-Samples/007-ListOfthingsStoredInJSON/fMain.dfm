object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 498
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object gbAjout: TGroupBox
    Left = 0
    Top = 0
    Width = 667
    Height = 200
    Align = alTop
    Caption = 'Ajout'
    TabOrder = 0
    object LabeledEdit1: TLabeledEdit
      Left = 11
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 61
      EditLabel.Height = 13
      EditLabel.Caption = 'LabeledEdit1'
      TabOrder = 0
    end
    object btnOk: TBitBtn
      Left = 11
      Top = 80
      Width = 75
      Height = 25
      Caption = '&OK'
      Kind = bkOK
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnOkClick
    end
    object btnCancel: TBitBtn
      Left = 108
      Top = 80
      Width = 75
      Height = 25
      Caption = 'A&nnuler'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnFermer2: TBitBtn
      Left = 208
      Top = 80
      Width = 75
      Height = 25
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 3
      OnClick = btnQuitterClick
    end
  end
  object gbListe: TGroupBox
    Left = 0
    Top = 200
    Width = 667
    Height = 298
    Align = alClient
    Caption = 'Liste'
    TabOrder = 1
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 663
      Height = 41
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Panel1'
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 0
      object btnQuitter: TBitBtn
        AlignWithMargins = True
        Left = 97
        Top = 7
        Width = 75
        Height = 27
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alLeft
        Kind = bkClose
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnQuitterClick
      end
      object btnAjouter: TBitBtn
        AlignWithMargins = True
        Left = 12
        Top = 7
        Width = 75
        Height = 27
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alLeft
        Caption = '&Ajouter'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333FF33333333FF333993333333300033377F3333333777333993333333
          300033F77FFF3333377739999993333333333777777F3333333F399999933333
          33003777777333333377333993333333330033377F3333333377333993333333
          3333333773333333333F333333333333330033333333F33333773333333C3333
          330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
          993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
          333333333337733333FF3333333C333330003333333733333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        TabOrder = 1
        OnClick = btnAjouterClick
      end
      object btnReload: TBitBtn
        AlignWithMargins = True
        Left = 576
        Top = 7
        Width = 75
        Height = 27
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        Align = alRight
        Caption = '&Reload'
        Kind = bkRetry
        NumGlyphs = 2
        TabOrder = 2
        OnClick = btnReloadClick
      end
    end
    object ScrollBox1: TScrollBox
      Left = 2
      Top = 56
      Width = 663
      Height = 240
      Align = alClient
      TabOrder = 1
    end
  end
end
