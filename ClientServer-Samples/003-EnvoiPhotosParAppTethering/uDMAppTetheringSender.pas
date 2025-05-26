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
  File last update : 2025-02-09T11:12:20.785+01:00
  Signature : db71e0939bec16e9131e08a5986f6044cc6f34bf
  ***************************************************************************
*)

unit uDMAppTetheringSender;

interface

uses
  System.SysUtils,
  System.Classes,
  IPPeerClient,
  IPPeerServer,
  System.Tether.Manager,
  System.Tether.AppProfile;

type
  TdmAppTetheringSender = class(TDataModule)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    /// <summary>
    /// Send the stream to all connected app profiles.
    /// </summary>
    /// <remarks>
    /// It sends any stream, bitmap or not, but it's better to send what is
    /// expected on the other side.
    /// </remarks>
    procedure SendABitmapStream(ABitmapStream: TStream);
  end;

var
  dmAppTetheringSender: TdmAppTetheringSender;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  uAppTetheringSettings;

{$R *.dfm}

procedure TdmAppTetheringSender.DataModuleCreate(Sender: TObject);
begin
  TetheringManager1.Text := CAppTetheringManagerGroupName;
  TetheringManager1.Password := CAppTetheringManagerPassword;
  TetheringAppProfile1.Group := CAppTetheringProfileName;
  TetheringAppProfile1.Text := CAppTetheringSenderProfileText;
  TetheringManager1.AutoConnect;
end;

procedure TdmAppTetheringSender.SendABitmapStream(ABitmapStream: TStream);
begin
  if assigned(ABitmapStream) and (ABitmapStream.Size > 0) then
  begin
    ABitmapStream.Position := 0;
    TetheringAppProfile1.Resources.FindByName('Bitmap').Value := ABitmapStream;
  end;
end;

end.
