object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object NumberBox1: TNumberBox
    Left = 120
    Top = 96
    Width = 121
    Height = 23
    MinValue = 10.000000000000000000
    MaxValue = 20.000000000000000000
    TabOrder = 0
  end
  object Button1: TButton
    Left = 120
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
end
