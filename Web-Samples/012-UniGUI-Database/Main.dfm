object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 362
  ClientWidth = 715
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniDBNavigator1: TUniDBNavigator
    Left = 0
    Top = 0
    Width = 715
    Height = 25
    Hint = ''
    DataSource = DataModule1.DataSource1
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    ExplicitLeft = 128
    ExplicitTop = 128
    ExplicitWidth = 241
  end
  object UniDBGrid1: TUniDBGrid
    Left = 0
    Top = 25
    Width = 715
    Height = 312
    Hint = ''
    DataSource = DataModule1.DataSource1
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
  end
  object UniButton1: TUniButton
    Left = 0
    Top = 337
    Width = 715
    Height = 25
    Hint = ''
    Caption = 'Modifier'
    Anchors = [akLeft, akRight, akBottom]
    Align = alBottom
    TabOrder = 2
    OnClick = UniButton1Click
    ExplicitLeft = 389
    ExplicitTop = 209
    ExplicitWidth = 75
  end
end
