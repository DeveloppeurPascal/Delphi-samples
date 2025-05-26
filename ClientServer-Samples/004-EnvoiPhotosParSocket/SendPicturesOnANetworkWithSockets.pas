(* C2PP
  ***************************************************************************

  Delphi Sample Projects

  Copyright 1995-2025 Patrick Prémartin under AGPL 3.0 license.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  DEALINGS IN THE SOFTWARE.

  ***************************************************************************

  Set of projects demonstrating the features of the Delphi development
  environment, its libraries and its programming language.

  Some of the projects have been presented at conferences, on training
  courses or online coding sessions.

  The programs are up to date with the Community Edition and the commercial
  version of Delphi or RAD Studio.

  ***************************************************************************

  Author(s) :
  Patrick PREMARTIN

  Site :
  https://samples.developpeur-pascal.fr

  Project site :
  https://github.com/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-02-09T11:12:20.785+01:00
  Signature : 7a845b41b539fbfae53fe04392a90561b376dbed
  ***************************************************************************
*)

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
// Generation date : 03/05/2024 20:15:00
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
  Olf.RTL.FileBuffer,
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
  /// Message ID 3: Ask for image files instead of FMX bitmap
  /// </summary>
  TSPNAskForImageFilesInsteadOfFMXBitmapMessage = class(TOlfSMMessage)
  private
  public
    constructor Create; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    function GetNewInstance: TOlfSMMessage; override;
  end;

  /// <summary>
  /// Message ID 1: Send a FireMonkey bitmap
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
    /// Bitmap (in FireMonkey format) sent by the
    /// server to conected clients
    /// </remarks>
    property Bitmap: TBitmap read FBitmap write SetBitmap;
    constructor Create; override;
    destructor Destroy; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    function GetNewInstance: TOlfSMMessage; override;
  end;

  /// <summary>
  /// Message ID 2: Send an image file
  /// </summary>
  /// <remarks>
  /// for VCL clients (because VCL bitmap can't load a FMX bitmap stream)
  /// </remarks>
  TSPNSendAnImageFileMessage = class(TOlfSMMessage)
  private
    FFileExtension: string;
    FFileContent: TOlfFileBuffer;
    procedure SetFileExtension(const Value: string);
    procedure SetFileContent(const Value: TOlfFileBuffer);
  public
    /// <summary>
    /// FileExtension
    /// </summary>
    /// <remarks>
    /// Image file extension (with the dot)
    /// </remarks>
    property FileExtension: string read FFileExtension write SetFileExtension;
    /// <summary>
    /// FileContent
    /// </summary>
    /// <remarks>
    /// Content of the file as a memory stream
    /// </remarks>
    property FileContent: TOlfFileBuffer read FFileContent write SetFileContent;
    constructor Create; override;
    destructor Destroy; override;
    procedure LoadFromStream(Stream: TStream); override;
    procedure SaveToStream(Stream: TStream); override;
    function GetNewInstance: TOlfSMMessage; override;
  end;

  TSendPicturesOnANetworkWithSocketsServer = class(TOlfSMServer)
  private
  protected
    procedure onReceiveMessage3(Const ASender: TOlfSMSrvConnectedClient;
      Const AMessage: TOlfSMMessage);
  public
    onReceiveSPNAskForImageFilesInsteadOfFMXBitmapMessage
      : TOlfSMReceivedMessageEvent<TSPNAskForImageFilesInsteadOfFMXBitmapMessage>;
    constructor Create; override;
  end;

  TSendPicturesOnANetworkWithSocketsClient = class(TOlfSMClient)
  private
  protected
    procedure onReceiveMessage1(Const ASender: TOlfSMSrvConnectedClient;
      Const AMessage: TOlfSMMessage);
    procedure onReceiveMessage2(Const ASender: TOlfSMSrvConnectedClient;
      Const AMessage: TOlfSMMessage);
  public
    onReceiveSPNSendABitmapMessage
      : TOlfSMReceivedMessageEvent<TSPNSendABitmapMessage>;
    onReceiveSPNSendAnImageFileMessage
      : TOlfSMReceivedMessageEvent<TSPNSendAnImageFileMessage>;
    constructor Create; override;
  end;

procedure RegisterMessagesReceivedByTheServer(Const Server: TOlfSMServer);
procedure RegisterMessagesReceivedByTheClient(Const Client: TOlfSMClient);

implementation

uses
  System.SysUtils;

{$REGION 'code from Olf.RTL.Streams'}

procedure SaveStringToStream(AString: string; AStream: TStream;
  AEncoding: TEncoding); overload;
// From unit Olf.RTL.Streams.pas in repository :
// https://github.com/DeveloppeurPascal/librairies
var
  StrLen: int64; // typeof(System.Classes.TStream.size)
  StrStream: TStringStream;
begin
  StrStream := TStringStream.Create(AString, AEncoding);
  try
    StrLen := StrStream.Size;
    AStream.write(StrLen, sizeof(StrLen));
    if (StrLen > 0) then
    begin
      StrStream.Position := 0;
      AStream.CopyFrom(StrStream);
    end;
  finally
    StrStream.Free;
  end;
end;

procedure SaveStringToStream(AString: string; AStream: TStream); overload;
// From unit Olf.RTL.Streams.pas in repository :
// https://github.com/DeveloppeurPascal/librairies
begin
  SaveStringToStream(AString, AStream, TEncoding.UTF8);
end;

function LoadStringFromStream(AStream: TStream; AEncoding: TEncoding)
  : string; overload;
// From unit Olf.RTL.Streams.pas in repository :
// https://github.com/DeveloppeurPascal/librairies
var
  StrLen: int64; // typeof(System.Classes.TStream.size)
  StrStream: TStringStream;
begin
  AStream.Read(StrLen, sizeof(StrLen));
  if (StrLen > 0) then
  begin
    StrStream := TStringStream.Create('', AEncoding);
    try
      StrStream.CopyFrom(AStream, StrLen);
      result := StrStream.DataString;
    finally
      StrStream.Free;
    end;
  end
  else
    result := '';
end;

function LoadStringFromStream(AStream: TStream): string; overload;
// From unit Olf.RTL.Streams.pas in repository :
// https://github.com/DeveloppeurPascal/librairies
begin
  result := LoadStringFromStream(AStream, TEncoding.UTF8);
end;

{$ENDREGION}

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
  Server.RegisterMessageToReceive(TSPNAskForImageFilesInsteadOfFMXBitmapMessage.Create);
end;

procedure RegisterMessagesReceivedByTheClient(Const Client: TOlfSMClient);
begin
  Client.RegisterMessageToReceive(TSPNSendABitmapMessage.Create);
  Client.RegisterMessageToReceive(TSPNSendAnImageFileMessage.Create);
end;

{$REGION 'TSendPicturesOnANetworkWithSocketsServer'}

constructor TSendPicturesOnANetworkWithSocketsServer.Create;
begin
  inherited;
  RegisterMessagesReceivedByTheServer(self);
  SubscribeToMessage(3, onReceiveMessage3);
end;

procedure TSendPicturesOnANetworkWithSocketsServer.onReceiveMessage3(const ASender: TOlfSMSrvConnectedClient;
const AMessage: TOlfSMMessage);
begin
  if not(AMessage is TSPNAskForImageFilesInsteadOfFMXBitmapMessage) then
    exit;
  if not assigned(onReceiveSPNAskForImageFilesInsteadOfFMXBitmapMessage) then
    exit;
  onReceiveSPNAskForImageFilesInsteadOfFMXBitmapMessage(ASender, AMessage as TSPNAskForImageFilesInsteadOfFMXBitmapMessage);
end;

{$ENDREGION}

{$REGION 'TSendPicturesOnANetworkWithSocketsClient'}

constructor TSendPicturesOnANetworkWithSocketsClient.Create;
begin
  inherited;
  RegisterMessagesReceivedByTheClient(self);
  SubscribeToMessage(1, onReceiveMessage1);
  SubscribeToMessage(2, onReceiveMessage2);
end;

procedure TSendPicturesOnANetworkWithSocketsClient.onReceiveMessage1(const ASender: TOlfSMSrvConnectedClient;
const AMessage: TOlfSMMessage);
begin
  if not(AMessage is TSPNSendABitmapMessage) then
    exit;
  if not assigned(onReceiveSPNSendABitmapMessage) then
    exit;
  onReceiveSPNSendABitmapMessage(ASender, AMessage as TSPNSendABitmapMessage);
end;

procedure TSendPicturesOnANetworkWithSocketsClient.onReceiveMessage2(const ASender: TOlfSMSrvConnectedClient;
const AMessage: TOlfSMMessage);
begin
  if not(AMessage is TSPNSendAnImageFileMessage) then
    exit;
  if not assigned(onReceiveSPNSendAnImageFileMessage) then
    exit;
  onReceiveSPNSendAnImageFileMessage(ASender, AMessage as TSPNSendAnImageFileMessage);
end;

{$ENDREGION}

{$REGION 'TSPNAskForImageFilesInsteadOfFMXBitmapMessage' }

constructor TSPNAskForImageFilesInsteadOfFMXBitmapMessage.Create;
begin
  inherited;
  MessageID := 3;
end;

function TSPNAskForImageFilesInsteadOfFMXBitmapMessage.GetNewInstance: TOlfSMMessage;
begin
  result := TSPNAskForImageFilesInsteadOfFMXBitmapMessage.Create;
end;

procedure TSPNAskForImageFilesInsteadOfFMXBitmapMessage.LoadFromStream(Stream: TStream);
begin
  inherited;
end;

procedure TSPNAskForImageFilesInsteadOfFMXBitmapMessage.SaveToStream(Stream: TStream);
begin
  inherited;
end;

{$ENDREGION}

{$REGION 'TSPNSendABitmapMessage' }

constructor TSPNSendABitmapMessage.Create;
begin
  inherited;
  MessageID := 1;
  FBitmap := nil;
end;

destructor TSPNSendABitmapMessage.Destroy;
begin
  FBitmap.Free;
  inherited;
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

{$REGION 'TSPNSendAnImageFileMessage' }

constructor TSPNSendAnImageFileMessage.Create;
begin
  inherited;
  MessageID := 2;
  FFileExtension := '';
  FFileContent := TOlfFileBuffer.Create;
end;

destructor TSPNSendAnImageFileMessage.Destroy;
begin
  FFileContent.Free;
  inherited;
end;

function TSPNSendAnImageFileMessage.GetNewInstance: TOlfSMMessage;
begin
  result := TSPNSendAnImageFileMessage.Create;
end;

procedure TSPNSendAnImageFileMessage.LoadFromStream(Stream: TStream);
begin
  inherited;
  FFileExtension := LoadStringFromStream(Stream);
  FFileContent.LoadFromStream(Stream);
end;

procedure TSPNSendAnImageFileMessage.SaveToStream(Stream: TStream);
begin
  inherited;
  SaveStringToStream(FFileExtension, Stream);
  FFileContent.SaveToStream(Stream);
end;

procedure TSPNSendAnImageFileMessage.SetFileExtension(const Value: string);
begin
  FFileExtension := Value;
end;

procedure TSPNSendAnImageFileMessage.SetFileContent(const Value: TOlfFileBuffer);
begin
  FFileContent := Value;
end;

{$ENDREGION}

end.
