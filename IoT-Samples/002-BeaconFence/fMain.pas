unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Beacon, System.Bluetooth, System.Beacon.Fencing.Types, System.Beacon.Fencing,
  System.Beacon.Components, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls,
  FMX.Memo.Types;

type
  TForm1 = class(TForm)
    Beacon1: TBeacon;
    BeaconMapFencing1: TBeaconMapFencing;
    Memo1: TMemo;
    Button1: TButton;
    procedure Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
    procedure Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
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

procedure TForm1.Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  Memo1.Lines.Add('Entrée : ' + ABeacon.DeviceIdentifier + ' ' + ABeacon.Distance.ToString + ' ' + length(Beacon1.BeaconList[0].AdditionalData).ToString);
  Memo1.GoToTextEnd;
end;

procedure TForm1.Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  Memo1.Lines.Add('Sortie : ' + ABeacon.DeviceIdentifier + ' ' + ABeacon.Distance.ToString);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Beacon1.Enabled := true;
end;

end.
