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
  object Button1: TButton
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 618
    Height = 25
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
    ExplicitLeft = 280
    ExplicitTop = 232
    ExplicitWidth = 75
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 35
    Width = 628
    Height = 407
    Align = alClient
    TabOrder = 1
    OnResize = ScrollBox1Resize
    ExplicitLeft = 232
    ExplicitTop = 224
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
end
