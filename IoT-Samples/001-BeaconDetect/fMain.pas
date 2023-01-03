unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Beacon,
  System.Bluetooth, FMX.ScrollBox, FMX.Memo, System.Beacon.Components,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Beacon1: TBeacon;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Beacon1BeaconEnter(const Sender: TObject;
  const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  Memo1.Lines.Add('***** Detection *****');
  Memo1.Lines.Add(ABeacon.GUID.ToString);
  Memo1.Lines.Add('Distance : ' + ABeacon.Distance.ToString + 'm');
end;

procedure TForm1.Beacon1BeaconExit(const Sender: TObject;
  const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  Memo1.Lines.Add('***** Perte *****');
  Memo1.Lines.Add(ABeacon.GUID.ToString);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Beacon1.Enabled := true;
end;

end.
