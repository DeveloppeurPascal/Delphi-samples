object Form1: TForm1
  Width = 640
  Height = 480
  object WebImageControl1: TWebImageControl
    Left = 432
    Top = 0
    Width = 208
    Height = 480
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    Align = alRight
    AutoSize = True
    ChildOrder = 1
  end
  object WebDBGrid1: TWebDBGrid
    Left = 0
    Top = 0
    Width = 432
    Height = 480
    Align = alClient
    Columns = <
      item
      end
      item
      end
      item
      end
      item
      end>
    DataSource = WebDataSource1
    FixedCols = 1
    TabOrder = 0
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    ExplicitLeft = 184
    ExplicitTop = 112
    ExplicitWidth = 320
    ExplicitHeight = 120
    ColWidths = (
      24
      64
      64
      64
      64)
  end
  object WebClientConnection1: TWebClientConnection
    Active = True
    URI = 'https://delphi-books.com/api/b/lastyear.json'
    Left = 304
    Top = 224
  end
  object WebClientDataSet1: TWebClientDataSet
    Active = True
    Connection = WebClientConnection1
    Params = <>
    Left = 504
    Top = 240
  end
  object WebDataSource1: TWebDataSource
    DataSet = WebClientDataSet1
    OnDataChange = WebDataSource1DataChange
    Left = 320
    Top = 312
  end
end
