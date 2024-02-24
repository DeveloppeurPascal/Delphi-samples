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
