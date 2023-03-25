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
  OnClick = Button2Click
  TextHeight = 15
  object Edit1: TEdit
    Left = 168
    Top = 112
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 168
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 168
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object StringGrid1: TStringGrid
    Tag = 18
    Left = 264
    Top = 160
    Width = 356
    Height = 265
    ColCount = 18
    FixedCols = 0
    RowCount = 10
    TabOrder = 3
    ColWidths = (
      67
      124
      64
      184
      154
      112
      112
      364
      94
      94
      64
      94
      148
      55
      64
      64
      64
      1534)
    ColAligments = (
      1
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      0
      1
      0)
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 628
    Height = 29
    Caption = 'ToolBar1'
    Images = VirtualImageList1
    TabOrder = 4
    ExplicitWidth = 624
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
      ImageName = 'Fichier 11'
      OnClick = Button1Click
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 1
      ImageName = 'Fichier 12'
      OnClick = Button2Click
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 2
      ImageName = 'Fichier 13'
    end
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = DataModule2.EmployeesTable
    ScopeMappings = <>
    Left = 304
    Top = 224
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 44
    Top = 77
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      Columns = <>
    end
  end
  object VirtualImageList1: TVirtualImageList
    AutoFill = True
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'Fichier 11'
        Name = 'Fichier 11'
      end
      item
        CollectionIndex = 1
        CollectionName = 'Fichier 12'
        Name = 'Fichier 12'
      end
      item
        CollectionIndex = 2
        CollectionName = 'Fichier 13'
        Name = 'Fichier 13'
      end
      item
        CollectionIndex = 3
        CollectionName = 'Fichier 14'
        Name = 'Fichier 14'
      end
      item
        CollectionIndex = 4
        CollectionName = 'Fichier 15'
        Name = 'Fichier 15'
      end>
    ImageCollection = DataModule4.ImageCollection1
    Left = 80
    Top = 232
  end
end
