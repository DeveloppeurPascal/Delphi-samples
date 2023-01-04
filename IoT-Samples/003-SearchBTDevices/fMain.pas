unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Bluetooth, System.Beacon, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts,
  System.Beacon.Components, System.Bluetooth.Components, FMX.TabControl,
  FMX.ScrollBox, FMX.Memo, FMX.Memo.Types;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    Bluetooth1: TBluetooth;
    BluetoothLE1: TBluetoothLE;
    Beacon1: TBeacon;
    GridPanelLayout2: TGridPanelLayout;
    Button1: TButton;
    GridPanelLayout1: TGridPanelLayout;
    Button3: TButton;
    Button4: TButton;
    GridPanelLayout3: TGridPanelLayout;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Beacon1ParseServiceData(const Sender: TObject;
      const AData: TServiceDataRawData; var BeaconInfo: TBeaconInfo;
      var Handled: Boolean);
    procedure Beacon1BeaconEnter(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure BluetoothLE1Connect(Sender: TObject);
    procedure BluetoothLE1CharacteristicRead(const Sender: TObject;
      const ACharacteristic: TBluetoothGattCharacteristic;
      AGattStatus: TBluetoothGattStatus);
    procedure BluetoothLE1CharacteristicReadRequest(const Sender: TObject;
      const ACharacteristic: TBluetoothGattCharacteristic;
      var AGattStatus: TBluetoothGattStatus);
    procedure BluetoothLE1CharacteristicSubscribed(const Sender: TObject;
      const AClientId: string;
      const ACharacteristic: TBluetoothGattCharacteristic);
    procedure BluetoothLE1CharacteristicUnSubscribed(const Sender: TObject;
      const AClientId: string;
      const ACharacteristic: TBluetoothGattCharacteristic);
    procedure BluetoothLE1CharacteristicWrite(const Sender: TObject;
      const ACharacteristic: TBluetoothGattCharacteristic;
      AGattStatus: TBluetoothGattStatus);
    procedure BluetoothLE1CharacteristicWriteRequest(const Sender: TObject;
      const ACharacteristic: TBluetoothGattCharacteristic;
      var AGattStatus: TBluetoothGattStatus; const AValue: TByteDynArray);
    procedure BluetoothLE1ConnectedDevice(const Sender: TObject;
      const ADevice: TBluetoothLEDevice);
    procedure BluetoothLE1DescriptorRead(const Sender: TObject;
      const ADescriptor: TBluetoothGattDescriptor;
      AGattStatus: TBluetoothGattStatus);
    procedure BluetoothLE1DescriptorWrite(const Sender: TObject;
      const ADescriptor: TBluetoothGattDescriptor;
      AGattStatus: TBluetoothGattStatus);
    procedure BluetoothLE1Disconnect(Sender: TObject);
    procedure BluetoothLE1DisconnectDevice(const Sender: TObject;
      const ADevice: TBluetoothLEDevice);
    procedure BluetoothLE1DiscoverLEDevice(const Sender: TObject;
      const ADevice: TBluetoothLEDevice; Rssi: Integer;
      const ScanResponse: TScanResponse);
    procedure BluetoothLE1EndDiscoverDevices(const Sender: TObject;
      const ADeviceList: TBluetoothLEDeviceList);
    procedure BluetoothLE1EndDiscoverServices(const Sender: TObject;
      const AServiceList: TBluetoothGattServiceList);
    procedure BluetoothLE1ReadRSSI(const Sender: TObject; ARssiValue: Integer;
      AGattStatus: TBluetoothGattStatus);
    procedure BluetoothLE1ReliableWriteCompleted(const Sender: TObject;
      AGattStatus: TBluetoothGattStatus);
    procedure BluetoothLE1ServiceAdded(const Sender: TObject;
      const AService: TBluetoothGattService;
      const AGattStatus: TBluetoothGattStatus);
    procedure BluetoothLE1ServicesDiscovered(const Sender: TObject;
      const AServiceList: TBluetoothGattServiceList);
    procedure Beacon1BeaconError(const Sender: TObject; AError: TBeaconError;
      const ErrorMsg: string; const ABeacon: TBeaconInfo);
    procedure Beacon1BeaconExit(const Sender: TObject; const ABeacon: IBeacon;
      const CurrentBeaconList: TBeaconList);
    procedure Beacon1BeaconProximity(const Sender: TObject;
      const ABeacon: IBeacon; Proximity: TBeaconProximity);
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
var
  i: Integer;
  ch: string;
begin
  Memo2.Lines.add(ABeacon.DeviceIdentifier + ' est proche');
  ch := '';
  for i := 0 to length(ABeacon.AdditionalData) - 1 do
  begin
    ch := ch + ABeacon.AdditionalData[i].ToHexString + ' ';
  end;
  if ch.length > 0 then
    Memo2.Lines.add('=> ' + ch);
end;

procedure TForm1.Beacon1BeaconError(const Sender: TObject; AError: TBeaconError;
  const ErrorMsg: string; const ABeacon: TBeaconInfo);
begin
memo2.Lines.Add('Beacon '+ABeacon.DeviceIdentifier);
Memo2.Lines.Add('=> '+ErrorMsg);
end;

procedure TForm1.Beacon1BeaconExit(const Sender: TObject;
  const ABeacon: IBeacon; const CurrentBeaconList: TBeaconList);
begin
Memo2.Lines.Add('Bye bye '+ABeacon.DeviceIdentifier);
end;

procedure TForm1.Beacon1BeaconProximity(const Sender: TObject;
  const ABeacon: IBeacon; Proximity: TBeaconProximity);
begin
 Memo2.Lines.add('Proximity '+abeacon.DeviceIdentifier+' : '+ord(proximity).ToString);
end;

procedure TForm1.Beacon1ParseServiceData(const Sender: TObject;
  const AData: TServiceDataRawData; var BeaconInfo: TBeaconInfo;
  var Handled: Boolean);
var
  i: Integer;
  ch: string;
begin
  Memo2.Lines.add('ServiceData ' + AData.Key.ToString + ' pour ' +
    BeaconInfo.DeviceIdentifier);
  ch := '';
  for i := 0 to length(AData.Value) - 1 do
  begin
    ch := ch + AData.Value[i].ToHexString + ' ';
  end;
  if ch.length > 0 then
    Memo2.Lines.add('=> ' + ch);
end;

procedure TForm1.BluetoothLE1CharacteristicRead(const Sender: TObject;
  const ACharacteristic: TBluetoothGattCharacteristic;
  AGattStatus: TBluetoothGattStatus);
begin
  Memo3.Lines.add('CharacteristicRead');
end;

procedure TForm1.BluetoothLE1CharacteristicReadRequest(const Sender: TObject;
  const ACharacteristic: TBluetoothGattCharacteristic;
  var AGattStatus: TBluetoothGattStatus);
begin
  Memo3.Lines.add('CharacteristicReadReuest');
end;

procedure TForm1.BluetoothLE1CharacteristicSubscribed(const Sender: TObject;
  const AClientId: string; const ACharacteristic: TBluetoothGattCharacteristic);
begin
  Memo3.Lines.add('BluetoothLE1CharacteristicSubscribed');
end;

procedure TForm1.BluetoothLE1CharacteristicUnSubscribed(const Sender: TObject;
  const AClientId: string; const ACharacteristic: TBluetoothGattCharacteristic);
begin
  Memo3.Lines.add('BluetoothLE1CharacteristicUnSubscribed');
end;

procedure TForm1.BluetoothLE1CharacteristicWrite(const Sender: TObject;
  const ACharacteristic: TBluetoothGattCharacteristic;
  AGattStatus: TBluetoothGattStatus);
begin
  Memo3.Lines.add('BluetoothLE1CharacteristicWrite');
end;

procedure TForm1.BluetoothLE1CharacteristicWriteRequest(const Sender: TObject;
  const ACharacteristic: TBluetoothGattCharacteristic;
  var AGattStatus: TBluetoothGattStatus; const AValue: TByteDynArray);
begin
  Memo3.Lines.add('BluetoothLE1CharacteristicWriteRequest');
end;

procedure TForm1.BluetoothLE1Connect(Sender: TObject);
begin
  Memo3.Lines.add('onConnect');
end;

procedure TForm1.BluetoothLE1ConnectedDevice(const Sender: TObject;
  const ADevice: TBluetoothLEDevice);
begin
  Memo3.Lines.add('BluetoothLE1ConnectedDevice');
end;

procedure TForm1.BluetoothLE1DescriptorRead(const Sender: TObject;
  const ADescriptor: TBluetoothGattDescriptor;
  AGattStatus: TBluetoothGattStatus);
begin
  Memo3.Lines.add('BluetoothLE1DescriptorRead');
end;

procedure TForm1.BluetoothLE1DescriptorWrite(const Sender: TObject;
  const ADescriptor: TBluetoothGattDescriptor;
  AGattStatus: TBluetoothGattStatus);
begin
  Memo3.Lines.add('BluetoothLE1DescriptorWrite');
end;

procedure TForm1.BluetoothLE1Disconnect(Sender: TObject);
begin
  Memo3.Lines.add('BluetoothLE1Disconnect');
end;

procedure TForm1.BluetoothLE1DisconnectDevice(const Sender: TObject;
  const ADevice: TBluetoothLEDevice);
begin
  Memo3.Lines.add('BluetoothLE1DisconnectDevice');
end;

procedure TForm1.BluetoothLE1DiscoverLEDevice(const Sender: TObject;
  const ADevice: TBluetoothLEDevice; Rssi: Integer;
  const ScanResponse: TScanResponse);
begin
  Memo3.Lines.add('BluetoothLE1DiscoverLEDevice');
end;

procedure TForm1.BluetoothLE1EndDiscoverDevices(const Sender: TObject;
  const ADeviceList: TBluetoothLEDeviceList);
begin
  Memo3.Lines.add('BluetoothLE1EndDiscoverDevices');
end;

procedure TForm1.BluetoothLE1EndDiscoverServices(const Sender: TObject;
  const AServiceList: TBluetoothGattServiceList);
begin
  Memo3.Lines.add('BluetoothLE1EndDiscoverServices');
end;

procedure TForm1.BluetoothLE1ReadRSSI(const Sender: TObject;
  ARssiValue: Integer; AGattStatus: TBluetoothGattStatus);
begin
  Memo3.Lines.add('BluetoothLE1ReadRSSI');
end;

procedure TForm1.BluetoothLE1ReliableWriteCompleted(const Sender: TObject;
  AGattStatus: TBluetoothGattStatus);
begin
  Memo3.Lines.add('BluetoothLE1ReliableWriteCompleted');
end;

procedure TForm1.BluetoothLE1ServiceAdded(const Sender: TObject;
  const AService: TBluetoothGattService;
  const AGattStatus: TBluetoothGattStatus);
begin
  Memo3.Lines.add('BluetoothLE1ServiceAdded');
end;

procedure TForm1.BluetoothLE1ServicesDiscovered(const Sender: TObject;
  const AServiceList: TBluetoothGattServiceList);
begin
  Memo3.Lines.add('BluetoothLE1ServicesDiscovered');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i, j: Integer;
begin
  Bluetooth1.Enabled := true;
  Memo1.Lines.Clear;
  for i := 0 to Bluetooth1.PairedDevices.Count - 1 do
  begin
    Memo1.Lines.add('Device : ' + Bluetooth1.PairedDevices[i].DeviceName + ' / '
      + Bluetooth1.PairedDevices[i].Address);
    for j := 0 to Bluetooth1.PairedDevices[i].LastServiceList.Count - 1 do
    begin
      Memo1.Lines.add('    => ' + Bluetooth1.PairedDevices[i]
        .LastServiceList[j].Name);
    end;
  end;
  Memo1.Lines.add('Recherche terminée.');
  Bluetooth1.Enabled:=false;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i: Integer;
begin
  BluetoothLE1.Enabled := true;
  BluetoothLE1.DiscoverDevices(2500);
  Memo1.Lines.add('Recherche terminée.');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  BluetoothLE1.Enabled := false;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Beacon1.Enabled := true;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Beacon1.Enabled := false;
end;

end.
