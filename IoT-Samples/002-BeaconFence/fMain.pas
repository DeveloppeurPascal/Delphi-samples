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
  File last update : 2025-02-09T11:12:20.954+01:00
  Signature : dfcea9e26b80c48d08510fdd7a531e76d607fb10
  ***************************************************************************
*)

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
