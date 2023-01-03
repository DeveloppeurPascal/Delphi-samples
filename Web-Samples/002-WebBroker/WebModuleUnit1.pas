unit WebModuleUnit1;

interface

uses System.SysUtils, System.Classes, Web.HTTPApp;

type
  TWebModule1 = class(TWebModule)
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
    procedure WebModule1WebActionItem1Action(Sender: TObject;
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
var
  i: integer;
begin
  Response.Content := '<html>' +
    '<head><title>Application Serveur Web</title></head>' +
    '<body><p>Application Serveur Web</p>';
  Response.Content := Response.Content + '<p>Méthode : ' +
    Request.Method + '</p>';
  Response.Content := Response.Content + '<p>Page : ' +
    Request.PathInfo + '</p>';
  Response.Content := Response.Content + '<p>Paramètres : ';
  for i := 0 to Request.QueryFields.Count - 1 do
    Response.Content := Response.Content + '<br />' + Request.QueryFields[i];
  Response.Content := Response.Content + '</p>';
  Response.Content := Response.Content +
    '<p>Lien 1 : <a href="?bidule=hello&truc=world">cliquez</a></p>';
  Response.Content := Response.Content +
    '<p>Lien 2 : <a href="python.php?hehe=memepasenreve">cliquez</a></p>';
  Response.Content := Response.Content + '</body>' + '</html>';
end;

procedure TWebModule1.WebModule1WebActionItem1Action(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
begin
  Response.Content := 'coucou Toto';
end;

end.
