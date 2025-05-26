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
  File last update : 2025-02-09T11:12:20.883+01:00
  Signature : bb24bf52a374d0d3c011f2b99b7caf3064805b7f
  ***************************************************************************
*)

unit uAccueil;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Sensors,
  System.Sensors.Components;

type
  TForm1 = class(TForm)
    Button1: TButton;
    LocationSensor1: TLocationSensor;
    procedure Button1Click(Sender: TObject);
    procedure LocationSensor1LocationChanged(Sender: TObject;
      const OldLocation, NewLocation: TLocationCoord2D);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses System.Permissions, FMX.DialogService;

procedure TForm1.Button1Click(Sender: TObject);
const
  PermissionAccessFineLocation = 'android.permission.ACCESS_FINE_LOCATION';
begin
  PermissionsService.RequestPermissions([PermissionAccessFineLocation],
{$IF CompilerVersion >= 35.0}
    // after Delphi 11 Alexandria
    procedure(const APermissions: TClassicStringDynArray;
      const AGrantResults: TClassicPermissionStatusDynArray)
{$ELSE}
  // before Delphi 11 Alexandria
    procedure(const APermissions: TArray<string>;
    const AGrantResults: TArray<TPermissionStatus>)
{$ENDIF}
  begin
    if (Length(AGrantResults) = 1) and
      (AGrantResults[0] = TPermissionStatus.Granted) then
    begin
      Button1.Enabled := false;
      LocationSensor1.Active := true;
    end
    else
    begin
      LocationSensor1.Active := false;
      TDialogService.ShowMessage
        ('Fonction GPS nécessaire pour ce programme, veuillez l''autoriser.');
    end;
  end);
end;

procedure TForm1.LocationSensor1LocationChanged(Sender: TObject;
const OldLocation, NewLocation: TLocationCoord2D);
begin
  TDialogService.ShowMessage('Votre position : ' + NewLocation.Latitude.ToString
    + ',' + NewLocation.Longitude.ToString);
end;

end.
