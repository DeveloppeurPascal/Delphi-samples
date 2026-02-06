(* C2PP
  ***************************************************************************

  Delphi Sample Projects
  Copyright (c) 1995-2026 Patrick PREMARTIN

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as
  published by the Free Software Foundation, either version 3 of the
  License, or (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

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
  https://codeberg.org/DeveloppeurPascal/Delphi-samples

  ***************************************************************************
  File last update : 2025-10-25T20:59:09.433+02:00
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
