unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Beacon, System.Bluetooth, FMX.StdCtrls, FMX.Layouts, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Memo, System.Beacon.Components, FMX.Memo.Types;

type
  TForm1 = class(TForm)
    Beacon1: TBeacon;
    Memo1: TMemo;
    GridPanelLayout1: TGridPanelLayout;
    btnStart: TButton;
    btnStop: TButton;
    procedure btnStopClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
    procedure Beacon1BeaconError(const Sender: TObject; AError: TBeaconError; const ErrorMsg: string; const ABeacon: TBeaconInfo);
    procedure Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
  private
    { Déclarations privées }
    procedure ajouter_log(ch: string);
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ajouter_log(ch: string);
begin
  Memo1.Lines.Insert(0, ch);
end;

procedure TForm1.Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
var
  Google: ieddystonebeacon;
  Apple: IiBeacon;
  Device: tbluetoothledevice;
  DeviceName: string;
begin
  ajouter_log('**********');
  ajouter_log('Distance :' + ABeacon.Distance.ToString);
  ajouter_log('RSSI: ' + ABeacon.Rssi.ToString);
  if ((ABeacon.KindofBeacon = tKindofBeacon.Eddystones) and supports(ABeacon, ieddystonebeacon, Google)) then
  begin // peut aussi se faire en utilisant QueryInterface
    Google := ABeacon as ieddystonebeacon;
    if (tKindofEddystone.URL in Google.KindofEddystones) then
      ajouter_log('URL: ' + Google.EddystoneURL.URLToString);
    if (tKindofEddystone.TLM in Google.KindofEddystones) then
    begin
      ajouter_log('TLM Voltage: ' + Google.EddystoneTLM.BattVoltageToString);
      ajouter_log('TLM PDU: ' + Google.EddystoneTLM.AdvPDUCountToString);
      ajouter_log('TLM Temp: ' + Google.EddystoneTLM.BeaconTempToString);
      ajouter_log('TLM Durée: ' + Google.EddystoneTLM.TimeSincePowerOnToString);
    end;
    if (tKindofEddystone.UID in Google.KindofEddystones) then
    begin
      ajouter_log('UID Namespace: ' + Google.EddystoneUID.NamespaceToString);
      ajouter_log('UID Instance: ' + Google.EddystoneUID.InstanceToString);
    end;
    ajouter_log('Type : Eddystone');
    ajouter_log(Google.GUID.ToString);
  end
  else if ((ABeacon.KindofBeacon = tKindofBeacon.iBeacons) and supports(ABeacon, IiBeacon, Apple)) then
  begin
    Apple := ABeacon as IiBeacon;
    ajouter_log('Type : iBeacon');
    ajouter_log(Apple.Major.ToString + ' - ' + Apple.Minor.ToString);
    ajouter_log(Apple.GUID.ToString); // UUID
  end;
  ajouter_log('MAC : ' + ABeacon.DeviceIdentifier); // MAC Address
  DeviceName := '';
  for Device in tbluetoothlemanager.Current.LastDiscoveredDevices do
    if (Device.Address = ABeacon.DeviceIdentifier) then
      DeviceName := Device.DeviceName;
  ajouter_log('BeaconEnter : ' + DeviceName);
end;

procedure TForm1.Beacon1BeaconError(const Sender: TObject; AError: TBeaconError; const ErrorMsg: string; const ABeacon: TBeaconInfo);
begin
  ajouter_log('**********');
  ajouter_log(ErrorMsg);
  ajouter_log('BeaconError:');
end;

procedure TForm1.Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
  ajouter_log('**********');
  ajouter_log(ABeacon.Major.ToString + ' - ' + ABeacon.Minor.ToString);
  ajouter_log(ABeacon.GUID.ToString);
  ajouter_log('BeaconExit :');
end;

procedure TForm1.btnStartClick(Sender: TObject);
begin
  ajouter_log('**********');
  if not Beacon1.Enabled then
    Beacon1.Enabled := true;
  Beacon1.StartScan;
  btnStart.Enabled := false;
  btnStop.Enabled := true;
  ajouter_log('Scan lancé.');
end;

procedure TForm1.btnStopClick(Sender: TObject);
begin
  ajouter_log('**********');
  Beacon1.StopScan;
  btnStart.Enabled := true;
  btnStop.Enabled := false;
  ajouter_log('Scan stoppé.');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ajouter_log('**********');
  btnStart.Enabled := true;
  btnStop.Enabled := false;
  ajouter_log('Programme lancé.');
end;

end.
