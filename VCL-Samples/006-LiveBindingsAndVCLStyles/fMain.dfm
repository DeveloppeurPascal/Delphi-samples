object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 192
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 192
    Top = 46
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 192
    Top = 89
    Width = 31
    Height = 13
    Caption = 'Label3'
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Label1'
  end
  object Edit2: TEdit
    Left = 8
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Label2'
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 86
    Width = 145
    Height = 21
    TabOrder = 2
    Text = 'ComboBox1'
    OnChange = ComboBox1Change
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToPropertyCaption: TLinkControlToProperty
      Category = 'Liaisons rapides'
      Control = Edit1
      Track = True
      Component = Label1
      ComponentProperty = 'Caption'
    end
    object LinkControlToPropertyCaption2: TLinkControlToProperty
      Category = 'Liaisons rapides'
      Control = Edit2
      Track = True
      Component = Label2
      ComponentProperty = 'Caption'
    end
    object LinkFillControlToPropertyCaption: TLinkFillControlToProperty
      Category = 'Liaisons rapides'
      Track = True
      Control = ComboBox1
      Component = Label3
      ComponentProperty = 'Caption'
      AutoFill = True
      FillExpressions = <>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
  end
end
