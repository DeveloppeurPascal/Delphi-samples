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
    procedure(const APermissions: TArray<string>;
      const AGrantResults: TArray<TPermissionStatus>)
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
