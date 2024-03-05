unit SendPicturesOnANetworkWithSockets;

// ****************************************
// * Send pictures on a network with sockets
// ****************************************
// 
// A server send a picture to connected clients
// 
// ****************************************
// File generator : Socket Messaging Code Generator (v1.1)
// Website : https://smcodegenerator.olfsoftware.fr/ 
// Generation date : 05/03/2024 19:15:56
// 
// Don't do any change on this file. They will be erased by next generation !
// ****************************************

// To compile this unit you need Olf.Net.Socket.Messaging.pas from
// https://github.com/DeveloppeurPascal/Socket-Messaging-Library
//
// Direct link to the file :
// https://raw.githubusercontent.com/DeveloppeurPascal/Socket-Messaging-Library/main/src/Olf.Net.Socket.Messaging.pas

interface

uses
{$IFDEF FRAMEWORK_VCL}
  VCL.Graphics,
{$ENDIF}
{$IFDEF FRAMEWORK_FMX}
  FMX.Graphics,
{$ENDIF}
  System.Classes,
  Olf.Net.Socket.Messaging;

type
  /// <summary>
  /// Message ID 1: Send a bitmap
  /// </summary>
  TSPNSendABitmapMessage = class(TOlfSMMessage)
  private
    FBitmap: TBitmap;
    procedure SetBitmap(const Value: TBitmap);
  public
    /// <summary>
    /// Bitmap
    /// </summary>
    /// <remarks>
    /// Bitmap sent by the server to conected clients
    /// </remarks>
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    constructor Create; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    function GetNewInstance: TOlfSMMessage; override;
  end;

  TSendPicturesOnANetworkWithSocketsServer = class(TOlfSMServer)
  private
  protected
  public
    constructor Create; override;
  end;

  TSendPicturesOnANetworkWithSocketsClient = class(TOlfSMClient)
  private
  protected
    procedure onReceiveMessage1(Const ASender: TOlfSMSrvConnectedClient;
      Const AMessage: TOlfSMMessage);
  public
    onReceiveSPNSendABitmapMessage
      : TOlfSMReceivedMessageEvent<TSPNSendABitmapMessage>;
    constructor Create; override;
  end;

procedure RegisterMessagesReceivedByTheServer(Const Server: TOlfSMServer);
procedure RegisterMessagesReceivedByTheClient(Const Client: TOlfSMClient);

implementation

uses
  System.SysUtils;

{$REGION 'code from Olf.VCL.Streams and Olf.FMX.Streams for saving/loading a TBitmap in a stream with other things in it'}

procedure SaveBitmapToStream(ABitmap: TBitmap; AToStream: TStream);
// From unit Olf.FMX.Streams.pas in repository :
// https://github.com/DeveloppeurPascal/librairies
var
  ms: TMemoryStream;
  size: int64;
begin
  if not assigned(AToStream) then
    raise exception.create('Need an existing stream to save the bitmap !');

  if not assigned(ABitmap) then
  begin
    size := 0;
    AToStream.WriteData(size);
  end
  else
  begin
    ms := TMemoryStream.create;
    try
      ABitmap.SaveToStream(ms);
      size := ms.size;
      AToStream.WriteData(size);
      if (size > 0) then
      begin
        ms.Position := 0;
        AToStream.CopyFrom(ms, size);
      end;
    finally
      ms.free;
    end;
  end;
end;

function LoadBitmapFromStream(AFromStream: TStream): TBitmap;
// From unit Olf.FMX.Streams.pas in repository :
// https://github.com/DeveloppeurPascal/librairies
var
  ms: TMemoryStream;
  size: int64;
begin
  if not assigned(AFromStream) then
    raise exception.create('Need an existing stream to load the bitmap !');

  if (AFromStream.ReadData(size) <> sizeof(size)) then
    result := nil
  else if (size < 1) then
    result := nil
  else
  begin
    ms := TMemoryStream.create;
    try
      ms.CopyFrom(AFromStream, size);
      ms.Position := 0;
      result := TBitmap.create;
      result.LoadFromStream(ms);
    finally
      ms.free;
    end;
  end;
end;

{$ENDREGION}

procedure RegisterMessagesReceivedByTheServer(Const Server: TOlfSMServer);
begin
end;

procedure RegisterMessagesReceivedByTheClient(Const Client: TOlfSMClient);
begin
  Client.RegisterMessageToReceive(TSPNSendABitmapMessage.Create);
end;

{$REGION 'TSendPicturesOnANetworkWithSocketsServer'}

constructor TSendPicturesOnANetworkWithSocketsServer.Create;
begin
  inherited;
  RegisterMessagesReceivedByTheServer(self);
end;

{$ENDREGION}

{$REGION 'TSendPicturesOnANetworkWithSocketsClient'}

constructor TSendPicturesOnANetworkWithSocketsClient.Create;
begin
  inherited;
  RegisterMessagesReceivedByTheClient(self);
  SubscribeToMessage(1, onReceiveMessage1);
end;

procedure TSendPicturesOnANetworkWithSocketsClient.onReceiveMessage1(const ASender: TOlfSMSrvConnectedClient;
const AMessage: TOlfSMMessage);
var
  msg: TSPNSendABitmapMessage;
begin
  if not(AMessage is TSPNSendABitmapMessage) then
    exit;
  if not assigned(onReceiveSPNSendABitmapMessage) then
    exit;
  onReceiveSPNSendABitmapMessage(ASender, AMessage as TSPNSendABitmapMessage);
end;

{$ENDREGION}

{$REGION 'TSPNSendABitmapMessage' }

constructor TSPNSendABitmapMessage.Create;
begin
  inherited;
  MessageID := 1;
  FBitmap := nil;
end;

function TSPNSendABitmapMessage.GetNewInstance: TOlfSMMessage;
begin
  result := TSPNSendABitmapMessage.Create;
end;

procedure TSPNSendABitmapMessage.LoadFromStream(Stream: TStream);
begin
  inherited;
  FBitmap := LoadBitmapFromStream(Stream);
end;

procedure TSPNSendABitmapMessage.SaveToStream(Stream: TStream);
begin
  inherited;
  SaveBitmapToStream(FBitmap, Stream);
end;

procedure TSPNSendABitmapMessage.SetBitmap(const Value: TBitmap);
begin
  FBitmap := Value;
end;

{$ENDREGION}

end.
