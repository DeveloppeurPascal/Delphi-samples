program DemoPermissionsAndroid;

uses
  System.StartUpCopy,
  FMX.Forms,
  uAccueil in 'uAccueil.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
