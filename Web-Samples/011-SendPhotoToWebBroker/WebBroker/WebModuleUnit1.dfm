object WebModule1: TWebModule1
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end
    item
      Name = 'AddImageWebAction'
      PathInfo = '/addimage'
      OnAction = WebModule1AddImageWebActionAction
    end>
  Height = 230
  Width = 415
end
