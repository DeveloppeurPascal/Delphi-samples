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
