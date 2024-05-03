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
