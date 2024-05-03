program PictureReceiver_VCL;

uses
  Vcl.Forms,
  fMain in 'fMain.pas' {Form1},
  Olf.VCL.Streams in '..\..\..\Libraries\librairies\src\Olf.VCL.Streams.pas',
  Olf.Net.Socket.Messaging in '..\..\..\Libraries\Socket-Messaging-Library\src\Olf.Net.Socket.Messaging.pas',
  SendPicturesOnANetworkWithSockets in '..\SendPicturesOnANetworkWithSockets.pas',
  Olf.RTL.FileBuffer in '..\..\..\Libraries\librairies\src\Olf.RTL.FileBuffer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
