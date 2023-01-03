object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 621
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 164
    Width = 601
    Height = 457
    Align = alClient
    DataSource = DataSource3
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PROJ_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEAM_LEADER'
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT'
        Width = 138
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 601
    Height = 44
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
    Align = alTop
    TabOrder = 1
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 44
    Width = 601
    Height = 120
    Align = alTop
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'FIRST_NAME'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LAST_NAME'
        Width = 220
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = EmployeeTable
    Left = 480
    Top = 192
  end
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    LoginPrompt = False
    Left = 415
    Top = 130
  end
  object EmployeeTable: TFDQuery
    Connection = EmployeeConnection
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE')
    Left = 415
    Top = 178
  end
  object Employee_projectTable: TFDQuery
    IndexFieldNames = 'EMP_NO'
    MasterSource = DataSource1
    MasterFields = 'EMP_NO'
    Connection = EmployeeConnection
    SQL.Strings = (
      'SELECT * FROM EMPLOYEE_PROJECT')
    Left = 459
    Top = 288
  end
  object ProjectTable: TFDQuery
    IndexFieldNames = 'PROJ_ID'
    MasterSource = DataSource2
    MasterFields = 'PROJ_ID'
    Connection = EmployeeConnection
    SQL.Strings = (
      'SELECT * FROM PROJECT')
    Left = 481
    Top = 391
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = Employee_projectTable
    Left = 384
    Top = 320
  end
  object DataSource3: TDataSource
    AutoEdit = False
    DataSet = ProjectTable
    Left = 472
    Top = 440
  end
end
