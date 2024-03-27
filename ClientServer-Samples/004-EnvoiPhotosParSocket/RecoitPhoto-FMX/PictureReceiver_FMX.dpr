program PictureReceiver_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {frmMain},
  SendPicturesOnANetworkWithSockets in '..\SendPicturesOnANetworkWithSockets.pas',
  Olf.Net.Socket.Messaging in '..\..\..\Libraries\Socket-Messaging-Library\src\Olf.Net.Socket.Messaging.pas',
  Olf.FMX.Streams in '..\..\..\Libraries\librairies\Olf.FMX.Streams.pas',
  Olf.FileInMemory in '..\Olf.FileInMemory.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
