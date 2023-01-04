unit fMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Bluetooth, System.Beacon, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  System.Beacon.Components, System.Bluetooth.Components, FMX.TabControl, FMX.ScrollBox, FMX.Memo,
  FMX.Memo.Types;

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
    Button2: TButton;
    GridPanelLayout1: TGridPanelLayout;
    Button3: TButton;
    Button4: TButton;
    GridPanelLayout3: TGridPanelLayout;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
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
var
  i, j: integer;
begin
  Bluetooth1.Enabled := true;
  Memo1.Lines.Clear;
  for i := 0 to Bluetooth1.PairedDevices.Count - 1 do
  begin
    Memo1.Lines.Add('Device : ' + Bluetooth1.PairedDevices[i].DeviceName + ' / ' + Bluetooth1.PairedDevices[i].Address);
    for j := 0 to Bluetooth1.PairedDevices[i].LastServiceList.Count - 1 do
    begin
      Memo1.Lines.Add('    => ' + Bluetooth1.PairedDevices[i].LastServiceList[j].Name);
    end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Bluetooth1.Enabled := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
var i : integer;
begin
  BluetoothLE1.Enabled := true;
  bluetoothle1.DiscoverDevices(2500);
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
