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
  Signature : 7c55508d6511a433c74886017290a6a3793b9e5f
  ***************************************************************************
*)

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
  ImageControl1.Bitmap.Assign(AMessage.Bitmap);
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
