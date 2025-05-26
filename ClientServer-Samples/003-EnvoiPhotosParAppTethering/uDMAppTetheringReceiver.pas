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
  Signature : 30e5762e569f27365d2ea3787be9b2bba1fa818a
  ***************************************************************************
*)

unit uDMAppTetheringReceiver;

interface

uses
  System.SysUtils,
  System.Classes,
  IPPeerClient,
  IPPeerServer,
  System.Tether.Manager,
  System.Tether.AppProfile;

type
  TReceiveBitmapStream = TProc<TStream>;

  TdmAppTetheringReceiver = class(TDataModule)
    TetheringManager1: TTetheringManager;
    TetheringAppProfile1: TTetheringAppProfile;
    procedure DataModuleCreate(Sender: TObject);
    procedure TetheringAppProfile1ResourceReceived(const Sender: TObject;
      const AResource: TRemoteResource);
    procedure TetheringAppProfile1AcceptResource(const Sender: TObject;
      const AProfileId: string; const AResource: TCustomRemoteItem;
      var AcceptResource: Boolean);
  private
    FonReceiveBitmapStream: TReceiveBitmapStream;
    procedure SetonReceiveBitmapStream(const Value: TReceiveBitmapStream);
  public
    /// <summary>
    /// Event used when a new bitmap is received.
    /// </summary>
    property onReceiveBitmapStream: TReceiveBitmapStream
      read FonReceiveBitmapStream write SetonReceiveBitmapStream;
  end;

var
  dmAppTetheringReceiver: TdmAppTetheringReceiver;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  uAppTetheringSettings;

{$R *.dfm}

procedure TdmAppTetheringReceiver.DataModuleCreate(Sender: TObject);
begin
  FonReceiveBitmapStream := nil;

  TetheringManager1.Text := CAppTetheringManagerGroupName;
  TetheringManager1.Password := CAppTetheringManagerPassword;
  TetheringAppProfile1.Group := CAppTetheringProfileName;
  TetheringAppProfile1.Text := CAppTetheringReceiverProfileText;
  TetheringManager1.AutoConnect;
end;

procedure TdmAppTetheringReceiver.SetonReceiveBitmapStream
  (const Value: TReceiveBitmapStream);
begin
  FonReceiveBitmapStream := Value;
end;

procedure TdmAppTetheringReceiver.TetheringAppProfile1AcceptResource
  (const Sender: TObject; const AProfileId: string;
  const AResource: TCustomRemoteItem; var AcceptResource: Boolean);
begin
  // optional: by default, resources declared on all sides are accepted, but depending on the type, you can filter them.
  AcceptResource := (AResource.ItemType = TTetheringRemoteItemType.Resource) and
    (AResource.Name = 'Bitmap');
end;

procedure TdmAppTetheringReceiver.TetheringAppProfile1ResourceReceived
  (const Sender: TObject; const AResource: TRemoteResource);
begin
  if (AResource.Name = 'Bitmap') and assigned(AResource.Value.AsStream) and
    assigned(FonReceiveBitmapStream) then
    FonReceiveBitmapStream(AResource.Value.AsStream);
end;

end.
