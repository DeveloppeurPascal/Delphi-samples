object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'QR Code Generator (VCL)'
  ClientHeight = 442
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Image1: TImage
    AlignWithMargins = True
    Left = 409
    Top = 3
    Width = 376
    Height = 436
    Align = alClient
    Proportional = True
    Stretch = True
    ExplicitLeft = 272
    ExplicitTop = 192
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 400
    Height = 436
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitHeight = 435
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 417
      Width = 392
      Height = 15
      Align = alBottom
      Caption = 'Label1'
      ExplicitWidth = 34
    end
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 392
      Height = 376
      Align = alClient
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
      ExplicitHeight = 375
    end
    object Button1: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 392
      Height = 25
      Align = alTop
      Caption = 'Button1'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
