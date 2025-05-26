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
  File last update : 2025-02-09T11:12:20.776+01:00
  Signature : 313af155849603aa5ffa1b176255ebf289495bf3
  ***************************************************************************
*)

unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, IPPeerClient, IPPeerServer, FMX.Controls.Presentation, FMX.StdCtrls, System.Tether.Manager,
  System.Tether.AppProfile;

type
  TForm1 = class(TForm)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure TetheringAppProfile1AcceptResource(const Sender: TObject; const AProfileId: string; const AResource: TCustomRemoteItem;
      var AcceptResource: Boolean);
    procedure TetheringAppProfile1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
    procedure TetheringManager1EndAutoConnect(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  TetheringManager1.AutoConnect;
end;

procedure TForm1.TetheringAppProfile1AcceptResource(const Sender: TObject; const AProfileId: string; const AResource: TCustomRemoteItem;
  var AcceptResource: Boolean);
begin
  AcceptResource := AResource.Hint = 'elem';
end;

procedure TForm1.TetheringAppProfile1ResourceReceived(const Sender: TObject; const AResource: TRemoteResource);
begin
  if AResource.Hint = 'elem' then
    Label1.Text := AResource.Value.AsString;
end;

procedure TForm1.TetheringManager1EndAutoConnect(Sender: TObject);
begin
  if TetheringManager1.RemoteProfiles.Count > 0 then
  begin
    Label2.Text := 'connecté';
    Button1.Visible := false;
  end
  else
  begin
    Label2.Text := 'non connecté';
    Button1.Visible := false;
  end;
end;

end.
