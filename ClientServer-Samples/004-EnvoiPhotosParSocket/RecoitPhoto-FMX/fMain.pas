unit fMain;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.StdCtrls,
  Olf.Net.Socket.Messaging,
  SendPicturesOnANetworkWithSockets;

type
  TfrmMain = class(TForm)
    ImageControl1: TImageControl;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Client: TSendPicturesOnANetworkWithSocketsClient;
    procedure ReceiveSPNSendABitmapMessage(Const ASender
      : TOlfSMSrvConnectedClient; Const AMessage: TSPNSendABitmapMessage);
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Client := TSendPicturesOnANetworkWithSocketsClient.Create;
  Client.onReceiveSPNSendABitmapMessage := ReceiveSPNSendABitmapMessage;
  Client.Connect('127.0.0.1', 8080);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  Client.Free;
end;

procedure TfrmMain.ReceiveSPNSendABitmapMessage(const ASender
  : TOlfSMSrvConnectedClient; const AMessage: TSPNSendABitmapMessage);
begin
  tthread.Synchronize(nil,
    procedure
    begin
      ImageControl1.Bitmap.Assign(AMessage.Bitmap);
    end);
  AMessage.Free;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
