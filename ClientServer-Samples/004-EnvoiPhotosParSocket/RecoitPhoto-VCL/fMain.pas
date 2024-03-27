unit fMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Olf.Net.Socket.Messaging,
  SendPicturesOnANetworkWithSockets;

type
  TForm1 = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    Client: TSendPicturesOnANetworkWithSocketsClient;
    procedure ReceiveSPNSendAnImageFileMessage(Const ASender
      : TOlfSMSrvConnectedClient; Const AMessage: TSPNSendAnImageFileMessage);
    procedure ClientConnected(Const AConnectedClient: TOlfSMSrvConnectedClient);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.IOUtils,
  Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage,
  Olf.FileInMemory;

procedure TForm1.ClientConnected(const AConnectedClient
  : TOlfSMSrvConnectedClient);
var
  msg: TSPNAskForImageFilesInsteadOfFMXBitmapMessage;
begin
  msg := TSPNAskForImageFilesInsteadOfFMXBitmapMessage.Create;
  try
    AConnectedClient.SendMessage(msg);
  finally
    msg.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Client := TSendPicturesOnANetworkWithSocketsClient.Create;
  Client.onReceiveSPNSendAnImageFileMessage := ReceiveSPNSendAnImageFileMessage;
  Client.onConnected := ClientConnected;
  Client.Connect('127.0.0.1', 8080);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Client.Free;
end;

procedure TForm1.ReceiveSPNSendAnImageFileMessage(const ASender
  : TOlfSMSrvConnectedClient; const AMessage: TSPNSendAnImageFileMessage);
var
  FileName: string;
begin
  FileName := tpath.GetTempFileName + AMessage.FileExtension;
  AMessage.FileContent.SaveToFile(FileName);
  try
    Image1.Picture.LoadFromFile(FileName);
  finally
    tfile.Delete(FileName);
  end;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
