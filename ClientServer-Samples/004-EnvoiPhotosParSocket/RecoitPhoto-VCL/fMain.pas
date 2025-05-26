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
  Signature : 934b4b8e29b51a64374ad378de8a0c16faed4017
  ***************************************************************************
*)

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
  Olf.RTL.FileBuffer;

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
