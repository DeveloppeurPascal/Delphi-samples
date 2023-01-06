program SignatureFMXDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {Form1},
  uCADSignatureFMX in 'uCADSignatureFMX.pas' {SignatureFMX: TFrame},
  u_urlOpen in '..\..\Libraries\librairies\u_urlOpen.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

