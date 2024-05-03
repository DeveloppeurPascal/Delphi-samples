program PictureSender_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {fmrMain},
  SendPicturesOnANetworkWithSockets in '..\SendPicturesOnANetworkWithSockets.pas',
  Olf.Net.Socket.Messaging in '..\..\..\Libraries\Socket-Messaging-Library\src\Olf.Net.Socket.Messaging.pas',
  Olf.FMX.Streams in '..\..\..\Libraries\librairies\src\Olf.FMX.Streams.pas',
  Olf.RTL.FileBuffer in '..\..\..\Libraries\librairies\src\Olf.RTL.FileBuffer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmrMain, fmrMain);
  Application.Run;
end.
