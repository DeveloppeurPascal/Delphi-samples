object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 235
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  StyleName = 'Glow'
  TextHeight = 15
  object TouchKeyboard1: TTouchKeyboard
    Left = 8
    Top = 8
    Width = 550
    Height = 180
    GradientEnd = clSilver
    GradientStart = clGray
    Layout = 'Standard'
  end
  object Button1: TButton
    Left = 488
    Top = 202
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
