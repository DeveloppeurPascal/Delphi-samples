object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 242
  ClientWidth = 472
  Caption = 'MainForm'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniLabel1: TUniLabel
    Left = 16
    Top = 16
    Width = 46
    Height = 13
    Hint = ''
    Caption = 'UniLabel1'
    TabOrder = 0
  end
  object UniEdit1: TUniEdit
    Left = 16
    Top = 43
    Width = 121
    Hint = ''
    Text = 'UniEdit1'
    TabOrder = 1
  end
  object UniBitBtn1: TUniBitBtn
    Left = 16
    Top = 84
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'UniBitBtn1'
    TabOrder = 2
    OnClick = UniBitBtn1Click
  end
end
