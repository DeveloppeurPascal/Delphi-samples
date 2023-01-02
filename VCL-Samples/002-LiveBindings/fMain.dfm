object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    472
    242)
  PixelsPerInch = 96
  TextHeight = 13
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 29
    Width = 456
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Nombre 1'
    NumbersOnly = True
    TabOrder = 0
    Text = 'Label1'
  end
  object LabeledEdit2: TLabeledEdit
    Left = 8
    Top = 74
    Width = 456
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 46
    EditLabel.Height = 13
    EditLabel.Caption = 'Nombre 2'
    NumbersOnly = True
    TabOrder = 1
    Text = 'Label3'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 137
    Width = 472
    Height = 105
    Align = alBottom
    Caption = 'Op'#233'ration'
    Padding.Left = 10
    Padding.Top = 10
    Padding.Right = 10
    Padding.Bottom = 10
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 25
      Width = 115
      Height = 68
      Align = alLeft
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 48
    end
    object Label2: TLabel
      Left = 127
      Top = 25
      Width = 29
      Height = 68
      Align = alLeft
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 48
    end
    object Label3: TLabel
      Left = 156
      Top = 25
      Width = 115
      Height = 68
      Align = alLeft
      Caption = 'Label3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 48
    end
    object Label4: TLabel
      Left = 271
      Top = 25
      Width = 29
      Height = 68
      Align = alLeft
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 48
    end
    object Label5: TLabel
      Left = 300
      Top = 25
      Width = 115
      Height = 68
      Align = alLeft
      Caption = 'Label5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 48
    end
  end
  object BitBtn1: TBitBtn
    Left = 389
    Top = 109
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Calculer'
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333FFFFF3333333333000003333333333F777773FF333333008877700
      33333337733FFF773F33330887000777033333733F777FFF73F330880FAFAF07
      703337F37733377FF7F33080F00000F07033373733777337F73F087F00A2200F
      77037F3737333737FF7F080A0A2A220A07037F737F3333737F7F0F0F0AAAA20F
      07037F737F3333737F7F0F0A0FAA2A0A08037F737FF33373737F0F7F00FFA00F
      780373F737FFF737F3733080F00000F0803337F73377733737F330F80FAFAF08
      8033373F773337733733330F8700078803333373FF77733F733333300FFF8800
      3333333773FFFF77333333333000003333333333377777333333}
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkControlToPropertyCaption: TLinkControlToProperty
      Category = 'Liaisons rapides'
      Control = LabeledEdit1
      Track = True
      Component = Label1
      ComponentProperty = 'Caption'
    end
    object LinkControlToPropertyCaption2: TLinkControlToProperty
      Category = 'Liaisons rapides'
      Control = LabeledEdit2
      Track = True
      Component = Label3
      ComponentProperty = 'Caption'
    end
  end
end
