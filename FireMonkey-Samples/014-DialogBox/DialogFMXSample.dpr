program DialogFMXSample;

uses
  System.StartUpCopy,
  FMX.Forms,
  fFMX in 'fFMX.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
