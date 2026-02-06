(* C2PP
  ***************************************************************************

  Delphi Sample Projects
  Copyright (c) 1995-2026 Patrick PREMARTIN

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
  https://codeberg.org/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-10-25T20:59:09.385+02:00
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
