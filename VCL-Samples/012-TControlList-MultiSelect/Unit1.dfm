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
  OnCreate = FormCreate
  TextHeight = 15
  object ControlList1: TControlList
    Left = 0
    Top = 0
    Width = 628
    Height = 271
    Align = alClient
    ItemCount = 91
    ItemHeight = 40
    ItemIndex = 0
    ItemMargins.Left = 0
    ItemMargins.Top = 0
    ItemMargins.Right = 0
    ItemMargins.Bottom = 0
    ItemSelectionOptions.SelectedColorAlpha = 240
    ItemSelectionOptions.FocusedColorAlpha = 255
    ItemSelectionOptions.SelectedFontColor = clHighlightText
    ItemSelectionOptions.FocusedFontColor = clHighlightText
    ItemSelectionOptions.UseFontColorForLabels = True
    ParentColor = False
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 270
    object Label1: TLabel
      Left = 10
      Top = 12
      Width = 89
      Height = 13
      Caption = 'Alfreds Futterkiste'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object Button1: TButton
    Left = 0
    Top = 271
    Width = 628
    Height = 25
    Align = alBottom
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
    ExplicitTop = 270
    ExplicitWidth = 624
  end
  object Memo1: TMemo
    Left = 0
    Top = 296
    Width = 628
    Height = 146
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
    ExplicitTop = 295
    ExplicitWidth = 624
  end
  object Sqlite_demoConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=SQLite_Demo')
    Connected = True
    LoginPrompt = False
    Left = 487
    Top = 89
  end
  object CustomersTable: TFDQuery
    Active = True
    Connection = Sqlite_demoConnection
    SQL.Strings = (
      'SELECT * FROM Customers')
    Left = 487
    Top = 137
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = CustomersTable
    ScopeMappings = <>
    Left = 304
    Top = 224
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      GridControl = ControlList1
      Columns = <>
    end
    object LinkPropertyToFieldCaption: TLinkPropertyToField
      Category = 'Liaisons rapides'
      DataSource = BindSourceDB1
      FieldName = 'CompanyName'
      Component = Label1
      ComponentProperty = 'Caption'
    end
  end
end
