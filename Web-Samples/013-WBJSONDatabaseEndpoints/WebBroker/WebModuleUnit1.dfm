object WebModule1: TWebModule1
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      MethodType = mtGet
      Name = 'getFireDAC'
      PathInfo = '/fd'
      OnAction = WebModule1getFireDACAction
    end
    item
      MethodType = mtGet
      Name = 'getWeb'
      PathInfo = '/json'
      OnAction = WebModule1getWebAction
    end>
  Height = 230
  Width = 415
end
