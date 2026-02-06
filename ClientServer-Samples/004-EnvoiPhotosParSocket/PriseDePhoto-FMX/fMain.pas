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
  File last update : 2025-10-25T20:59:09.419+02:00
  Signature : 154ce7adb5f8585616b89b7b2818f0c1301ac126
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
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  SendPicturesOnANetworkWithSockets,
  Olf.Net.Socket.Messaging;

type
  TfmrMain = class(TForm)
    btnSendThisPicture: TButton;
    ImageControl1: TImageControl;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnSendThisPictureClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Serveur: TSendPicturesOnANetworkWithSocketsServer;
    procedure ClientConnected(Const AConnectedClient: TOlfSMSrvConnectedClient);
    procedure ReceiveAskForImageFilesInsteadOfFMXBitmapMessage
      (Const ASender: TOlfSMSrvConnectedClient;
      Const AMessage: TSPNAskForImageFilesInsteadOfFMXBitmapMessage);
  public
    ImageList: TStringList;
    ImageIndex: integer;
  end;

var
  fmrMain: TfmrMain;

implementation

{$R *.fmx}

uses
  System.IOUtils,
  Olf.RTL.FileBuffer;

procedure TfmrMain.btnSendThisPictureClick(Sender: TObject);
var
  msg: TSPNSendABitmapMessage;
  msgFile: TSPNSendAnImageFileMessage;
begin
  msg := TSPNSendABitmapMessage.Create;
  try
    msg.Bitmap := tbitmap.Create;
    try
      msg.Bitmap.Assign(ImageControl1.Bitmap);
      // Serveur.SendMessageToAll(msg);
      msgFile := TSPNSendAnImageFileMessage.Create;
      try
        msgFile.FileExtension := tpath.GetExtension(ImageList[ImageIndex]);
        msgFile.FileContent.LoadFromFile(ImageList[ImageIndex]);

        Serveur.ForEachConnectedClient(
          procedure(Const AConnectedClient: TOlfSMSrvConnectedClient)
          begin
            if AConnectedClient.TagBool then
              AConnectedClient.SendMessage(msg)
            else
              AConnectedClient.SendMessage(msgFile)
          end, false);
      except
      end;
    finally
      msgFile.Free;
    end;
  finally
    msg.Free;
  end;
end;

procedure TfmrMain.ClientConnected(const AConnectedClient
  : TOlfSMSrvConnectedClient);
begin
  AConnectedClient.TagBool := true; // accept FMX bitmap by default
{$IFDEF DEBUG}
  showmessage('new connected client.');
{$ENDIF}
end;

procedure TfmrMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Serveur.Free;
end;

procedure TfmrMain.FormCreate(Sender: TObject);
var
  imgs: TStringDynArray;
  Folder: string;
  i: integer;
begin
  Serveur := TSendPicturesOnANetworkWithSocketsServer.Create;
  Serveur.onClientConnected := ClientConnected;
  Serveur.onReceiveSPNAskForImageFilesInsteadOfFMXBitmapMessage :=
    ReceiveAskForImageFilesInsteadOfFMXBitmapMessage;
  Serveur.Listen('0.0.0.0', 8080);

  ImageList := TStringList.Create;
  ImageIndex := -1;

  Folder := 'C:\Users\pprem\Pictures\demos - Portraits';
  if not tdirectory.Exists(Folder) then
    Folder := tpath.GetPicturesPath;

  imgs := tdirectory.GetFiles(Folder);
  for i := 0 to length(imgs) - 1 do
    if imgs[i].tolower.EndsWith('.jpg') or imgs[i].tolower.EndsWith('.jpeg') or
      imgs[i].tolower.EndsWith('.png') then
      ImageList.Add(imgs[i]);

  if length(imgs) < 1 then
    raise Exception.Create('No pictures to show from "' + Folder +
      '" folder. Please update the program or add some JPEG, JPG, PNG files in it.');
end;

procedure TfmrMain.FormDestroy(Sender: TObject);
begin
  ImageList.Free;
end;

procedure TfmrMain.ReceiveAskForImageFilesInsteadOfFMXBitmapMessage
  (const ASender: TOlfSMSrvConnectedClient;
const AMessage: TSPNAskForImageFilesInsteadOfFMXBitmapMessage);
begin
  ASender.TagBool := false; // accept only images files
end;

procedure TfmrMain.Timer1Timer(Sender: TObject);
begin
  if ImageIndex < ImageList.Count - 1 then
  begin
    inc(ImageIndex);
    ImageControl1.LoadFromFile(ImageList[ImageIndex]);
  end
  else
    ImageIndex := -1;
end;

initialization

{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := true;
{$ENDIF}

end.
