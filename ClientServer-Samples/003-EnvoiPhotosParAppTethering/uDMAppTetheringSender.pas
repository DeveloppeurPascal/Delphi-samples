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
