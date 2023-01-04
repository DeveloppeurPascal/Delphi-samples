unit WebModuleUnit1;

interface

uses System.SysUtils, System.Classes, Web.HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := '<html>' +
    '<head><title>Application Serveur Web</title></head>' +
    '<body>Application Serveur Web';
//  Response.Content := Response.Content + '<p>URL : '+request.URL+'</p>';
  Response.Content := Response.Content + '<p>Query string : '+request.Query+'</p>';
  Response.Content := Response.Content + '<p>METHOD : '+request.Method+'</p>';
//  Response.Content := Response.Content + '<p>Cookies : '+request.Cookie+'</p>';
  Response.Content := Response.Content + '<p>Path translated : '+request.PathTranslated+'</p>';
  Response.Content := Response.Content + '</body>' + '</html>';
end;

end.
