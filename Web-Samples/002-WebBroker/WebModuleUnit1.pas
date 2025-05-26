(* C2PP
  ***************************************************************************

  Delphi Sample Projects

  Copyright 1995-2025 Patrick Prémartin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Set of projects demonstrating the features of the Delphi development
  environment, its libraries and its programming language.

  Some of the projects have been presented at conferences, on training
  courses or online coding sessions.

  The programs are up to date with the Community Edition and the commercial
  version of Delphi or RAD Studio.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://samples.developpeur-pascal.fr

  Project site :
  https://github.com/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-02-09T11:12:21.035+01:00
  Signature : 00983b952bd2b8e632155e69bbc6de2f4b1ffe13
  ***************************************************************************
*)

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
