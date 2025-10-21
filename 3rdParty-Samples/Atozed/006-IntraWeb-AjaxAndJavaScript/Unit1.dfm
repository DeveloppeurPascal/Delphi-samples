object IWForm1: TIWForm1
  Left = 0
  Top = 0
  Width = 555
  Height = 400
  RenderInvisibleControls = False
  AllowPageAccess = True
  ConnectionMode = cmAny
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWLabel1: TIWLabel
    Left = 16
    Top = 16
    Width = 113
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Saisissez une URL'
  end
  object IWEdit1: TIWEdit
    Left = 16
    Top = 38
    Width = 297
    Height = 21
    StyleRenderOptions.RenderBorder = False
    NonEditableAsLabel = True
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    Text = 'IWEdit1'
  end
  object IWButton1: TIWButton
    Left = 16
    Top = 65
    Width = 75
    Height = 25
    Caption = 'IWButton1'
    Color = clBtnFace
    FriendlyName = 'IWButton1'
    TabOrder = 1
    OnClick = IWButton1Click
  end
  object IWURL1: TIWURL
    Left = 104
    Top = 73
    Width = 209
    Height = 17
    Alignment = taLeftJustify
    Color = clNone
    Font.Color = clNone
    Font.Size = 10
    Font.Style = [fsUnderline]
    Font.PxSize = 13
    HasTabOrder = True
    TargetOptions.AddressBar = False
    TerminateApp = False
    UseTarget = False
    FriendlyName = 'IWURL1'
    TabOrder = 2
    RawText = False
    Caption = 'IWURL1'
  end
  object IWButton2: TIWButton
    Left = 16
    Top = 174
    Width = 297
    Height = 25
    Caption = 'Developpeur Pascal'
    Color = clBtnFace
    FriendlyName = 'IWButton2'
    ScriptEvents = <
      item
        EventCode.Strings = (
          '$('#39'#IWEDIT1'#39').attr('#39'value'#39','#39'https://developpeur-pascal.fr/'#39');')
        Event = 'onClick'
      end>
    TabOrder = 3
  end
  object IWButton3: TIWButton
    Left = 16
    Top = 143
    Width = 297
    Height = 25
    Caption = 'Barnsten'
    Color = clBtnFace
    FriendlyName = 'IWButton3'
    ScriptEvents = <
      item
        EventCode.Strings = (
          '$('#39'#IWEDIT1'#39').attr('#39'value'#39','#39'https://www.barnsten.com/fr/'#39');')
        Event = 'onClick'
      end>
    TabOrder = 4
  end
  object IWButton4: TIWButton
    Left = 16
    Top = 112
    Width = 297
    Height = 25
    Caption = 'Embarcadero'
    Color = clBtnFace
    FriendlyName = 'IWButton4'
    ScriptEvents = <
      item
        EventCode.Strings = (
          '$('#39'#IWEDIT1'#39').attr('#39'value'#39','#39'https://www.embarcadero.com/'#39');')
        Event = 'onClick'
      end>
    TabOrder = 5
  end
end
