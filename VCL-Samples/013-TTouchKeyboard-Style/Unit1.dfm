object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 261
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object TouchKeyboard1: TTouchKeyboard
    Left = 16
    Top = 16
    Width = 550
    Height = 180
    GradientEnd = clSilver
    GradientStart = clGray
    Layout = 'Standard'
  end
  object Button1: TButton
    Left = 491
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
